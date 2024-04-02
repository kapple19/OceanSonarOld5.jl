function convert_arguments(plot::GridBased,
    biv::Bivariate,
    x::AbstractVector{<:Real},
    z::AbstractVector{<:Real}
)
    b = [biv(x̂, ẑ) for x̂ in x, ẑ in z]
    convert_arguments(plot, x, z, b)
end

function visual!(pos::GridPosition,
    biv::Bivariate,
    x::AbstractVector{<:Real},
    z::AbstractVector{<:Real}
)
    plot = heatmap!(pos[1, 1], biv, x, z,
        colormap = OceanSonar.colourmap(biv)
    )
    axis = current_axis()
    Colorbar(pos[1, 2], plot,
        label = string(biv) |> OceanSonar.decamelize |> OceanSonar.spacecase |> OceanSonar.titlecase
    )
    return axis
end

function visual!(pos::GridPosition,
    type::Type{<:Bivariate},
    med::Medium,
    x::AbstractVector{<:Real},
    z::AbstractVector{<:Real}
)
    return visual!(pos, get(med, type), x, z)
end

get_medium(env::Environment, ::Type{<:OceanCelerity}) = env.ocn
get_medium(env::Environment, ::Type{<:OceanDensity}) = env.ocn

function visual!(pos::GridPosition,
    type::Type{<:Bivariate},
    env::Environment,
    x::AbstractVector{<:Real},
    z::AbstractVector{<:Real}
)
    axis = visual!(pos, type, get_medium(env, type), x, z)
    visual!(pos, Boundary, env, x)
    return axis
end

function visual!(pos::GridPosition,
    type::Type{<:Bivariate},
    scen::Scenario,
    Nx::Real,
    Nz::Real
)
    x = range(0.0, scen.x, Nx)
    z = range(depth_extrema(scen)..., Nz)
    axis = visual!(pos, type, scen.env, x, z)
    axis.title = modeltitle(scen)
    return axis
end

function visual!(pos::GridPosition,
    type::Type{<:Bivariate},
    prop::Propagation,
    Nx::Real,
    Nz::Real
)
    return visual!(pos, type, prop.scen, Nx, Nz)
end
