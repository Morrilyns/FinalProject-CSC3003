module CurveFitting

<<<<<<< HEAD
export generate_data, gaussian_model, fit_curve, plot_fit

using LsqFit, CairoMakie

# Generate noisy data for curve fitting
function generate_data(x::Vector{Float64}; a=1.0, μ=0.0, σ=1.0, noise_level=0.1)
    y = a .* exp.(-(x .- μ).^2 ./ (2 * σ^2))
    noisy_y = y .+ noise_level .* randn(length(y))
    return x, noisy_y
end

# Gaussian model for curve fitting
gaussian_model(x, p) = p[1] .* exp.(-((x .- p[2]).^2) ./ (2 .* p[3]^2))

# Fit Gaussian model to data
function fit_curve(x::Vector{Float64}, y::Vector{Float64}, p0::Vector{Float64})
    fit = curve_fit(gaussian_model, x, y, p0)
    return fit
end

# Plot data and the fitted curve
function plot_fit(x::Vector{Float64}, y::Vector{Float64}, fit_params::Vector{Float64})
    fitted_y = gaussian_model(x, fit_params)
    fig = Figure()
    ax = Axis(fig[1, 1], title="Gaussian Curve Fitting", xlabel="x", ylabel="y")
    scatter!(ax, x, y, label="Data", color=:blue)
    lines!(ax, x, fitted_y, label="Fitted Curve", color=:red)
    axislegend(ax)
    display(fig)
end

end # module CurveFitting
 
=======
export generate_data, custom_fit_gaussian, plot_fit

using CairoMakie

# Generate noisy Gaussian data
"""
    generate_data(x::Vector{Float64}; a::Float64, μ::Float64, σ::Float64, noise_level::Float64) -> (x, y)

Generates Gaussian data with optional noise.  
`a`: Amplitude, `μ`: Mean, `σ`: Standard deviation, `noise_level`: Controls noise magnitude.
"""
function generate_data(x::Vector{Float64}; a::Float64, μ::Float64, σ::Float64, noise_level::Float64=0.0)
    y = a .* exp.(-((x .- μ).^2) ./ (2 * σ^2)) .+ noise_level .* randn(length(x))
    return x, y
end

# Custom Gaussian Curve Fitting
"""
    custom_fit_gaussian(x::Vector{Float64}, y::Vector{Float64}) -> (parameters, error)

Fits a Gaussian curve manually using least squares approximation.  
Returns the approximate parameters `[a, μ, σ]` and the error.
"""
function custom_fit_gaussian(x::Vector{Float64}, y::Vector{Float64})
    a = maximum(y)                   # Initial guess: amplitude
    μ = sum(x .* y) / sum(y)         # Estimate the mean
    σ = sqrt(sum((x .- μ).^2 .* y) / sum(y))  # Estimate the standard deviation

    # Calculate residual error
    model = a .* exp.(-((x .- μ).^2) ./ (2 * σ^2))
    residuals = y .- model
    error = sum(residuals.^2)
    return [a, μ, σ], error
end

# Plot Gaussian Curve Fit
"""
    plot_fit(x::Vector{Float64}, y::Vector{Float64}, params::Vector{Float64})

Plots the original data points and the fitted Gaussian curve.
"""
function plot_fit(x::Vector{Float64}, y::Vector{Float64}, params::Vector{Float64})
    a, μ, σ = params
    fitted_y = a .* exp.(-((x .- μ).^2) ./ (2 * σ^2))

    fig = Figure()
    ax = Axis(fig[1, 1], title="Gaussian Curve Fitting", xlabel="x", ylabel="y")
    scatter!(x, y, label="Data", color=:blue)
    lines!(x, fitted_y, label="Fitted Curve", color=:red)
    axislegend()
    display(fig)
end

end
>>>>>>> a7c456f (Updated custom polynomial fitting function and implemented professor's feedback)
