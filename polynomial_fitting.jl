module PolynomialFitting

export generate_polynomial_data, fit_polynomial, plot_polynomial, test_polynomial

using LsqFit, CairoMakie

function generate_polynomial_data(x::Vector{Float64}, coefficients::Vector{Float64}; noise_level::Float64=0.0)
    y = zeros(Float64, length(x))
    for (i, c) in enumerate(coefficients)
        y .+= c .* x .^ (i - 1)  # Polynomial equation: c0 + c1*x + c2*x^2 ...
    end
    y .+= noise_level * randn(length(y))  # Add Gaussian noise
    return x, y
end


# Polynomial model for curve fitting
polynomial_model(x, p) = sum(p[i] .* x.^(i-1) for i in 1:length(p))

# Fit the polynomial model to data
function fit_polynomial(x::Vector{Float64}, y::Vector{Float64}, degree::Int)
    p0 = ones(degree + 1)  # Initial guess
    fit = curve_fit(polynomial_model, x, y, p0)
    return fit
end

# Plot data and the fitted polynomial curve
function plot_polynomial(x::Vector{Float64}, y::Vector{Float64}, fit_params::Vector{Float64})
    fitted_y = polynomial_model(x, fit_params)
    fig = Figure()
    ax = Axis(fig[1, 1], title="Polynomial Curve Fitting", xlabel="x", ylabel="y")
    scatter!(ax, x, y, label="Data", color=:green)
    lines!(ax, x, fitted_y, label="Fitted Polynomial", color=:orange)
    axislegend(ax)
    display(fig)
end

# Test Polynomial Curve Fitting
"""
test_polynomial()

Tests the polynomial curve fitting function by generating synthetic data 
and checking the accuracy of the fitted parameters.
"""
function test_polynomial()
    echo("Running Polynomial Fitting Test...\n")
    x = collect(range(-3, 3, length=100))
    coefficients = [1.0, -2.0, 3.0]  # True polynomial: y = 1 - 2x + 3x^2
    _, y = generate_polynomial_data(x, coefficients, noise_level=0.1)

    # Fit polynomial of degree 2
    fit = fit_polynomial(x, y, degree=2)
    echo("Fitted Polynomial Parameters: ", fit.param, "\n")
    
    # Compare fitted parameters with true coefficients
    @assert isapprox(fit.param[1], 1.0, atol=0.5) "First coefficient does not match"
    @assert isapprox(fit.param[2], -2.0, atol=0.5) "Second coefficient does not match"
    @assert isapprox(fit.param[3], 3.0, atol=0.5) "Third coefficient does not match"
    echo("Test Passed: Polynomial fitting parameters are accurate!\n")
end

end # module PolynomialFitting
 