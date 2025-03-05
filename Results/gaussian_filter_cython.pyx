cimport numpy as np
import numpy as np
from libc.math cimport exp

def gaussian_filter_cython(np.ndarray[np.float64_t, ndim=2] image, np.ndarray[np.float64_t, ndim=2] kernel):
    """
    Applies a 2D Gaussian filter to an image using manual convolution.

    Parameters:
    - image: 2D NumPy array (grayscale image).
    - kernel: 2D NumPy array (Gaussian kernel).

    Returns:
    - output: 2D NumPy array (filtered image).
    """

    cdef int pad_size = kernel.shape[0] // 2
    cdef int height = image.shape[0]
    cdef int width = image.shape[1]

    # Pad the image using reflection
    cdef np.ndarray[np.float64_t, ndim=2] padded_image = np.pad(image, pad_size, mode='reflect')

    # Create an empty output image
    cdef np.ndarray[np.float64_t, ndim=2] output = np.zeros_like(image)

    # Loop variables
    cdef int i, j, ki, kj
    cdef double sum_val

    # Apply the Gaussian filter using convolution
    for i in range(height):
        for j in range(width):
            sum_val = 0.0
            for ki in range(kernel.shape[0]):
                for kj in range(kernel.shape[1]):
                    sum_val += padded_image[i + ki, j + kj] * kernel[ki, kj]
            output[i, j] = sum_val

    return output

