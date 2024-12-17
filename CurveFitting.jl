module CurveFitting

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
 