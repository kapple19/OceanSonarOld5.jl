import OceanSonar: altimetryplot!, altimetryplot

@recipe(AltimetryPlot) do scene
    Theme()
end

function altimetryplot_!(
    plot::Plot,
    ati::Altimetry,
    x_lo::Real,
    x_hi::Real
)
    x = range(x_lo, x_hi, 301)
    z_lo, _ = OceanSonar.depth_extrema(ati, x_lo, x_hi)
    z_lower = z_lo
    z_upper = ati.(x)
    band!(plot,
        x, z_lower, z_upper,
        color = :blue,
        axis = (yreversed = true,)
    )
    return plot
end

function altimetryplot_!(
    plot::Plot, env::Environment, x_lo::Real, x_hi::Real
)
    altimetryplot_!(plot, env.ati, x_lo, x_hi)
end

function altimetryplot_!(plot::Plot, scen::Scenario)
    x_lo = 0.0
    x_hi = scen.x
    altimetryplot_!(plot, scen.env, x_lo, x_hi)
end

altimetryplot_!(::Plot, args...) = error(
    "No method matching desired signature for", args, ".\n",
    "Try one of these:\n",
    methods(altimetryplot_!)
)

function Makie.plot!(plot::AltimetryPlot)
    get_plot_arguments(plot) |> splat(altimetryplot_!)
end

function visual!(ati::Altimetry, args...; kw...)
    ax = current_axis()
    ax.yreversed = true
    altimetryplot!(ati, args...; kw...)
end