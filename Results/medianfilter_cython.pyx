cimport numpy as np
import numpy as np
from libc.stdlib cimport qsort

# Function to compare elements (needed for qsort)
cdef int compare(const void *a, const void *b) noexcept nogil:
    return (<np.uint8_t*>a)[0] - (<np.uint8_t*>b)[0]

def median_filter(np.ndarray[np.uint8_t, ndim=2] image, int size):
    cdef int pad = size // 2
    cdef int height = image.shape[0]
    cdef int width = image.shape[1]

    # Create an empty output array
    cdef np.ndarray[np.uint8_t, ndim=2] output = np.empty_like(image)

    cdef int i, j, ki, kj
    cdef np.uint8_t[:] neighbors = np.empty(size * size, dtype=np.uint8)

    # Apply the median filter
    for i in range(pad, height - pad):
        for j in range(pad, width - pad):
            # Fill the neighbors array
            for ki in range(size):
                for kj in range(size):
                    neighbors[ki * size + kj] = image[i + ki - pad, j + kj - pad]

            # Sort using qsort (more efficient than np.sort)
            qsort(&neighbors[0], size * size, sizeof(np.uint8_t), compare)

            # Assign the median value
            output[i, j] = neighbors[size * size // 2]

    return output
