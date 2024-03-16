import OceanSonar: bathymetryplot!, bathymetryplot

@recipe(BathymetryPlot) do scene
    Theme()
end

function bathymetryplot_!(
    plot::Plot,
    bty::Bathymetry,
    x_lo::Real,
    x_hi::Real
)
    x = range(x_lo, x_hi, 301)
    _, z_hi = OceanSonar.depth_extrema(bty, x_lo, x_hi)
    z_lower = bty.(x)
    z_upper = z_hi
    band!(plot,
        x, z_lower, z_upper,
        color = :blue,
        axis = (yreversed = true,)
    )
    return plot
end

function bathymetryplot_!(
    plot::Plot, env::Environment, x_lo::Real, x_hi::Real
)
    bathymetryplot_!(plot, env.bty, x_lo, x_hi)
end

function bathymetryplot_!(plot::Plot, scen::Scenario)
    x_lo = 0.0
    x_hi = scen.x
    bathymetryplot_!(plot, scen.env, x_lo, x_hi)
end

bathymetryplot_!(::Plot, args...) = error(
    "No method matching desired signature for", args, ".\n",
    "Try one of these:\n",
    methods(bathymetryplot_!)
)

function Makie.plot!(plot::BathymetryPlot)
    get_plot_arguments(plot) |> splat(bathymetryplot_!)
end

function visual!(bty::Bathymetry, args...; kw...)
    ax = current_axis()
    ax.yreversed = true
    bathymetryplot!(bty, args...; kw...)
end