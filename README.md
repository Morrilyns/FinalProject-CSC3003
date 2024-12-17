# **Polynomial and Gaussian Curve Fitting**

**Final Project for CSC 3003 - Scientific Computing**
**Author**: Morrilyn Savice

### **Overview**

This project focuses on curve fitting techniques using Julia, specifically polynomial fitting and Gaussian curve fitting. It explores how data can be modeled with mathematical curves 
and demonstrates the use of modules, test cases, and optimization for performance.Gaussian Curve Fitting - Modeling data using a Gaussian function.

The project includes:

**Gaussian Curve Fitting** - Modeling data using a Gaussian function.
**Polynomial Curve Fitting** - Fitting a polynomial curve to noisy data.
**Benchmarking** - Analyzing the performance of the curve fitting algorithms.
**Visualization** - Generating plots to visualize the fitted curves alongside the data points.

### **Files in the Project**

**CurveFitting.jl**: Module for Gaussian curve fitting, including functions for generating data, fitting the curve, and plotting results.
**polynomial_fitting**.jl: Module for polynomial curve fitting. Contains functions to generate noisy polynomial data, fit polynomials of different degrees, and visualize results.
**project_final.ipynb**: Main Jupyter notebook that brings everything together. It loads the modules, runs the Gaussian and polynomial curve fitting examples, and benchmarks their performance.
**test_curvefitting.jl**: Test file for Gaussian curve fitting to ensure the functions work as expected.
**test_polynomial.jl**: Test file for polynomial curve fitting to verify the correctness of the module.

### **How to Run the Project**

**Clone the repository**:

git clone https://github.com/Morrilyns/FinalProject-CSC3003.git
cd FinalProject-CSC3003

**Open the Jupyter notebook** (project_final.ipynb) in VS Code or JupyterLab.
Make sure you have Julia installed and set up with the following packages:
**LsqFit** (for curve fitting)
**CairoMakie** (for plotting)
**BenchmarkTools** (for benchmarking)

**Install them using**:

using Pkg
Pkg.add(["LsqFit", "CairoMakie", "BenchmarkTools"])

**Run the notebook cell by cell to see**:

-Data generation for Gaussian and polynomial curves.
-Curve fitting examples.
-Benchmarking results.

**Test the modules**:

Run the test files to verify the functionality. For example:
julia test_curvefitting.jl
julia test_polynomial.jl

### **Results**
The project generates the following:

-Plots for Gaussian and polynomial curve fitting.
-Fitted parameters for each curve.
-Benchmarking times to evaluate the performance of the fitting functions.
These results highlight the accuracy of curve fitting techniques and demonstrate how Julia can handle scientific computing efficiently.

### **Final Notes**

This project follows all requirements for the final assignment, including the use of modules, extensive test cases, benchmarking, and visualizations.

Thank you for checking it out!
