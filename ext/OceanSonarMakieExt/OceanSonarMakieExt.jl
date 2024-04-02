module OceanSonarMakieExt

using OceanSonar
using Makie

import OceanSonar: visual!, visual
import Makie: AbstractAxis, convert_arguments

include("boundary.jl")
include("bivariate.jl")

function OceanAxis(pos::GridPosition)
    axis = Axis(pos[1, 1],
        yreversed = true,
        xlabel = "Range [m]",
        ylabel = "Depth [m]"
    )
    return axis
end

function visual(args...)
    fig = Figure()
    pos = fig[1, 1]
    OceanAxis(pos)
    visual!(pos, args...)
    return fig
end

# function visual!(pos::GridPosition, args...; kw...)
#     axis = OceanAxis(pos)
#     @info "here"
#     visual!(axis, args...; kw...)
# end

end # module OceanSonarMakieExt