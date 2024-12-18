## **Polynomial and Gaussian Curve Fitting**
### **Final Project - CSC 3003: Scientific Computing**
**Morrilyn Savice**

---

### **Project Overview**
This project focuses on **polynomial curve fitting** and **Gaussian curve fitting** using Julia. The goal was to generate synthetic noisy data, fit curves to the data, and evaluate the accuracy and performance of the fitting methods. I implemented custom curve-fitting functions alongside standard tools to demonstrate a deeper understanding of numerical methods.

---

### **Key Features**
1. **Polynomial Curve Fitting**  
   - Implemented my own custom polynomial fitting function using **QR decomposition** and least squares solving instead of relying solely on `LsqFit`.  
   - Generated synthetic noisy polynomial data for testing.  

2. **Gaussian Curve Fitting**  
   - Fitted Gaussian curves to noisy data using both my own custom implementation and `LsqFit` for comparison.  
   - Visualized the generated and fitted curves to analyze the results.

3. **Performance Benchmarking**  
   - Used `BenchmarkTools` to measure and optimize the performance of both polynomial and Gaussian fitting methods.

4. **Data Visualization**  
   - Plotted the results using `CairoMakie` to show the original data and the fitted curves. The plots make it easy to visually validate the results.

---

### **Project Files**
Here’s a breakdown of the files in the repository:

| **File Name**          | **Description**                                                                 |
|------------------------|-------------------------------------------------------------------------------|
| `CurveFitting.jl`      | Custom module implementing Gaussian curve fitting with my own functions.      |
| `polynomial_fitting.jl`| Custom module implementing polynomial curve fitting using QR decomposition.   |
| `project_final.ipynb`  | Main Jupyter Notebook showcasing the complete project: data generation, curve fitting, and visualizations. |
| `test_curvefitting.jl` | Test cases for the Gaussian curve fitting implementation.                    |
| `test_polynomial.jl`   | Test cases for the polynomial curve fitting implementation.                  |

---

### **How to Run the Project**
1. **Setup the Environment**  
   Ensure you have Julia installed. Install the required packages if you haven’t already:

   ```julia
   using Pkg
   Pkg.add(["LsqFit", "CairoMakie", "BenchmarkTools", "LinearAlgebra"])


**Clone the repository**:

git clone https://github.com/Morrilyns/FinalProject-CSC3003.git
cd FinalProject-CSC3003

**Run the Code**
Open project_final.ipynb in Jupyter Notebook (IJulia) or VS Code. Run the cells in sequence to:

-Generate synthetic data.
-Fit curves using custom functions and LsqFit.
-Benchmark and plot the results.

**Test the Code**
To run the test cases for curve fitting, execute the following in Julia’s REPL:
include("test_curvefitting.jl")
include("test_polynomial.jl")

### **Key Results**

Gaussian Curve Fitting

Generated noisy Gaussian data with specified parameters.
Fitted the Gaussian curve and compared results with the ground truth.
Polynomial Curve Fitting

Used my custom polynomial fitting function based on QR decomposition for greater control.
Compared and visualized the polynomial fit to the noisy data.
Performance

Benchmarked the performance of the fitting methods.
Custom polynomial and Gaussian fitting implementations performed effectively.

### **What I Learned**

-Implementing my own curve fitting methods gave me a deeper understanding of least squares problems and QR decomposition.
-Benchmarking with BenchmarkTools helped me identify bottlenecks and improve code efficiency.
-Data visualization using CairoMakie provided a clear way to validate the fitted curves.

Thank you for checking it out!
