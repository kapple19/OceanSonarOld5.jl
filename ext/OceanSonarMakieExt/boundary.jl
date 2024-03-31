import OceanSonar: boundaryplot!, boundaryplot

@info "Defining boundary recipes."

function convert_arguments(plot_type::PointBased, bnd::Boundary, x::AbstractVector{<:Real})
    return convert_arguments(plot_type, x, x .|> bnd)
end

function convert_arguments(plot_type::Type{<:Band}, ati::Altimetry, x::AbstractVector{<:Real})
    x_lo, x_hi = extrema(x)
    z_lo, _ = OceanSonar.depth_extrema(ati, x_lo, x_hi)
    z_hi = x .|> ati
    return convert_arguments(plot_type, x, z_lo, z_hi)
end

function convert_arguments(plot_type::Type{<:Band}, bty::Boundary, x::AbstractVector{<:Real})
    x_lo, x_hi = extrema(x)
    _, z_hi = OceanSonar.depth_extrema(bty, x_lo, x_hi)
    z_lo = bty.(x)
    return convert_arguments(plot_type, x, z_lo, z_hi)
end

function visual!(axis::Makie.AbstractAxis, bnd::Boundary, x::AbstractVector{<:Real})
    axis.yreversed = true
    plot = band!(axis, bnd, x)
    return Makie.AxisPlot(axis, plot)
end