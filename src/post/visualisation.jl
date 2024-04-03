export visual!
export visual
export boundaryplot!
export boundaryplot
export bivariateplot!
export bivariateplot

"""
```
visual(args...; kw...)
```
Mutating version of `visual` requiring the same arguments.

See `@doc visual`.
"""
function visual! end

"""
```
visual(args...; kw...)
```

Passes information to the plotting backend
(which is itself `Plots.jl` or a backend of `Makie.jl`)
and returns a plot object for the associated backend.

* `args[1]` is an appropriate `OcnSon` subtype instance.
* `args[2:end]` contains auxiliary information.
* `kw...` is passed to the plotting backend.

In addition to calling the backend plotting method,
`visual` performs the following:

* Flips the y-axis positive-downwards.
* Plots the boundaries if such information is available (`Environment` and upward).
* Adds a colorbar if 2D data (`<:Bivariate`) is plotted.

For this reason, `visual` is not composable by design,
since the data it receives _is_ designed to be composable.

See the docstring for the specific `OcnSon` subtype instance for specific usages.

The handling of the output is different for different backends
since different backends have different implementations for plot objects.
See the relevant backend's documentation on plots/figure handling.

The arguments passed to `visual` are backend-independent.
The keyword arguments passed to `visual` are backend-aware.
Behaviour and features may be different between backends.
"""
function visual end

colour(ocnson::OcnSon) = ocnson |> typeof |> colour

function boundaryplot! end
function boundaryplot end

# colour(::Type{Altimetry}) = :blue
# colour(::Type{Bathymetry}) = :brown
colour(::Type{<:Boundary}) = :gray

function bivariateplot! end
function bivariateplot end

colour(::Type{<:Celerity}) = :Blues
colour(::Type{<:Bivariate}) = :jet
colour(::Type{<:Propagation}) = :jet

function rayplot! end
function rayplot end

colour(::Type{<:Beam}) = :black
colour(::Type{<:AbstractVector{<:Beam}}) = colour(Beam)
colour(beams::AbstractVector{<:Beam}) = beams |> typeof |> colour

default_arc_points(beam::Beam) = [
    range(0, beam.s_max, 301); beam.s_srf; beam.s_bot; beam.s_hrz
] |> uniquesort!

function propagationplot! end
function propagationplot end

create_ranges(x1::Real, x2::Real, Nx::Integer) = range(x1, x2, Nx)
create_ranges(scen::Scenario, Nx::Integer) = create_ranges(0.0, scen.x, Nx)
create_ranges(prop::Propagation) = prop.x

create_depths(z1::Real, z2::Real, Nz::Integer) = range(z1, z2, Nz)
create_depths(env::Environment, Nz::Integer) = create_depths(depth_extrema(env)..., Nz)
create_depths(scen::Scenario, Nz::Integer) = create_depths(scen.env, Nz)
create_depths(prop::Propagation) = prop.z