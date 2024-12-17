using Test
include("CurveFitting.jl")
include("polynomial_fitting.jl")
using .CurveFitting
using .PolynomialFitting

# Test Gaussian curve fitting
@testset "Gaussian Curve Fitting Tests" begin
    x = collect(range(-5, 5, length=100))
    _, y = generate_data(x; a=2.0, μ=0.0, σ=1.5, noise_level=0.1)
    fit = fit_curve(x, y, [1.0, 0.0, 1.0])
    @test fit.param[1] ≈ 2.0 atol=0.5
    @test fit.param[2] ≈ 0.0 atol=0.5
    @test fit.param[3] ≈ 1.5 atol=0.5
end

# Test Polynomial curve fitting
@testset "Polynomial Curve Fitting Tests" begin
    x = collect(range(-3, 3, length=100))
    coefficients = [1.0, -2.0, 3.0]
    _, y = generate_polynomial_data(x, coefficients, noise_level=0.1)
    fit = fit_polynomial(x, y, degree=2)
    @test fit.param[1] ≈ 1.0 atol=0.5
    @test fit.param[2] ≈ -2.0 atol=0.5
    @test fit.param[3] ≈ 3.0 atol=0.5
end
 