module OceanSonarMakieExt

using OceanSonar
using Makie

import OceanSonar: visual!, visual
import Makie: convert_arguments

include("boundary.jl")

function visual(args...; kw...)
    fig = Figure()
    axis = Axis(fig[1, 1])
    _, plot = visual!(axis, args...; kw...)
    return Makie.FigureAxisPlot(fig, axis, plot)
end

end # module OceanSonarMakieExt