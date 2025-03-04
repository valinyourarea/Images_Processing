# Images_processing

Evaluation Activity 2 - Images Processing

## Description

This repository contains implementations of median filters for image processing, using different approaches:

- Pure Python (basic implementation)

- NumPy and SciPy (optimization with Python libraries)

- Cython (accelerated implementation in Cython)

## Requirements
Before running the scripts, make sure you have the following dependencies installed. You can install them with:
```bash
pip install -r requirements.txt
```

Make sure you have Python 3 installed and the following libraries:

- Jupyter Notebook
- numpy
- matplotlib
- opencv-python
- Pillow
  
## Core dependencies:

- numpy

- scipy

- opencv-python

- cython

## Installation

1. Clone this repository:
```bash
git clone https://github.com/tu_usuario/Images_processing.git
cd Images_processing
```
2. Install the required dependencies:
```bash
pip install -r requirements.txt
```
3. Run Jupyter Notebook:
To open the Jupyter Notebook interface, run the following command in the terminal:
```bash
jupyter notebook
```
This will open Jupyter in your browser. From there, you can navigate to the Images_processing.ipynb file and run the cells to execute the image processing scripts.

## Usage
Once inside the notebook, you can select the specific approach you want to use (Pure Python, NumPy/SciPy, or Cython) by running the respective cells.
- Pure Python: A basic implementation of the median filter without optimizations.
- NumPy and SciPy: Optimized implementation using Python libraries for faster computation.
- Cython: Accelerated implementation with Cython for even better performance.

You can test the implementation by uploading your own images or using the sample images provided in the repository.

## Notes
- If you encounter issues installing the dependencies, ensure you're using a virtual environment to avoid conflicts.
- Make sure you have the appropriate compiler for Cython if you want to use the Cython implementation.
- For additional performance improvements, you may experiment with different image sizes and filter parameters.

