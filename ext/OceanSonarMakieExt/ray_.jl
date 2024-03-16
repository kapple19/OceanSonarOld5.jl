import OceanSonar: rayplot!, rayplot

@recipe(RayPlot) do scene
    Theme()
end

function rayplot_!(plot::Plot, beam::OceanSonar.Beam,
    s = OceanSonar.default_arc_points(beam)
)
    lines!(plot,
        beam.x.(s), beam.z.(s),
        color = :black,
        axis = (yreversed = true,) # doesn't work in low-level Makie processing
    )
    return plot
end

function Makie.plot!(plot::RayPlot)
    get_plot_arguments(plot) |> splat(rayplot_!)
end

visual!(beam::Beam, args...; kw...) = rayplot!(beam, args...; kw...)

function visual!(beams::Vector{Beam}, args...; kw...)
    plots = Makie.AbstractPlot[]
    for beam in beams
        plot = rayplot!(beam, args...; kw...)
        push!(plots, plot)
    end
    return plots
end