using Test
include("polynomial_fitting.jl")
using .PolynomialFitting

<<<<<<< HEAD
@testset "Polynomial Fitting Tests" begin
    test_polynomial()  # Run the test_polynomial function
end
 
=======
@testset "Custom Polynomial Fitting Tests" begin
    x = [-1.0, 0.0, 1.0, 2.0]
    y = [1.0, -1.0, 2.0, 7.0]
    degree = 2
    coefficients = custom_fit_polynomial(x, y, degree)

    @test isapprox(coefficients, [1.0, -2.0, 3.0], atol=1e-2)
end
>>>>>>> a7c456f (Updated custom polynomial fitting function and implemented professor's feedback)
