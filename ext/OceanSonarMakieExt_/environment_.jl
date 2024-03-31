function visual!(env::Environment, x_lo::Real, x_hi::Real; kw...)
    visual!(env.ati, x_lo, x_hi; kw...)
    visual!(env.bty, x_lo, x_hi; kw...)
    return current_figure()
end

get_boundary(::Type{Altimetry}, env::Environment) = env.ati
get_boundary(::Type{Bathymetry}, env::Environment) = env.bty

function visual!(type::Type{<:Boundary}, env::Environment,
    x_lo::Real = 0.0, x_hi::Real = 1e3;
    kw...
)
    @assert isconcretetype(type) "Expecting concrete type request."
    visual!(get_boundary(type, env), x_lo, x_hi)
    return current_figure()
end

function visual!(type::Type{<:Bivariate}, env::Environment,
    x_lo::Real = 0.0, x_hi::Real = 1e3;
    kw...
)
    super = supertype(type)
    @assert super ≠ Bivariate
    z_lo, z_hi = OceanSonar.depth_extrema(env, x_lo, x_hi)
    visual!(super, env.ocn, x_lo, x_hi, z_lo, z_hi; kw...)
    visual!(env, x_lo, x_hi)
    return current_figure()
end

function visual!(::Type{Boundary}, env::Environment,
    x_lo::Real = 0.0, x_hi::Real = 1e3;
    kw...
)
    visual!(env, x_lo, x_hi; kw...)
    return current_figure()
end