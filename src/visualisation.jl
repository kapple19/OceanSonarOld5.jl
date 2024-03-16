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

function boundaryplot! end
function boundaryplot end

boundary_colour(::Altimetry) = :purple
boundary_colour(::Bathymetry) = :brown

function bivariateplot! end
function bivariateplot end

colourmap(::Celerity) = :Blues
colourmap(::Bivariate) = :jet