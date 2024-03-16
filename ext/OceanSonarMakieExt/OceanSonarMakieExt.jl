module OceanSonarMakieExt

using OceanSonar
using Makie

import OceanSonar: visual!, visual

function get_plot_arguments(plot::Plot)
    N = 0
    while true
        try
            N += 1
            plot[N].val
        catch
            N -= 1
            break
        end
    end
    idxs = 1:N
    return plot, (plot[n].val for n in idxs)...
end

function visual(args...; kw...)
    fig = Figure()
    ax = Axis(fig[1, 1])
    plot = visual!(args...; kw...)
    return Makie.FigureAxisPlot(fig, ax, plot)
end

include("boundary.jl")
include("bivariate.jl")
include("medium.jl")
include("environment.jl")

end