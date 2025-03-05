cimport numpy as np
import numpy as np
from libc.math cimport sqrt

def apply_sobel_cython(np.ndarray[np.uint8_t, ndim=2] gray):
    cdef int height = gray.shape[0]
    cdef int width = gray.shape[1]
    cdef np.ndarray[np.int16_t, ndim=2] gradient_x = np.zeros((height, width), dtype=np.int16)
    cdef np.ndarray[np.int16_t, ndim=2] gradient_y = np.zeros((height, width), dtype=np.int16)
    cdef np.ndarray[np.uint8_t, ndim=2] gradient = np.zeros((height, width), dtype=np.uint8)

    cdef int i, j
    for i in range(1, height - 1):
        for j in range(1, width - 1):
            gradient_x[i, j] = (
                -1 * gray[i - 1, j - 1] + 1 * gray[i - 1, j + 1]
                -2 * gray[i, j - 1] + 2 * gray[i, j + 1]
                -1 * gray[i + 1, j - 1] + 1 * gray[i + 1, j + 1]
            )

            gradient_y[i, j] = (
                -1 * gray[i - 1, j - 1] - 2 * gray[i - 1, j] - 1 * gray[i - 1, j + 1]
                +1 * gray[i + 1, j - 1] + 2 * gray[i + 1, j] + 1 * gray[i + 1, j + 1]
            )

            gradient[i, j] = min(255, int(sqrt(gradient_x[i, j]**2 + gradient_y[i, j]**2)))

    return gradient
