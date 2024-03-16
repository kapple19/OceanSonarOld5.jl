export visual!
export visual
export altimetryplot!
export altimetryplot

"""
```
visual(args...; kw...)
```
Mutating version of `visual` requiring the same arguments.

See `visual`.
"""
function visual! end

"""
```
visual(args...; kw...)
```

* `args[1]` is an appropriate `OcnSon` subtype instance.
* `args[2:end]` contains auxiliary information.
* `kw...` is passed to the plotting backend.

In addition to calling the backend plotting method,
`visual` performs the following:

* Flips the y-axis positive-downwards.
* Layers additional plots according to information provided.

See the docstring for the specific `OcnSon` subtype instance for specific usages.
"""
function visual end

function altimetryplot! end
function altimetryplot end

function bathymetryplot! end
function bathymetryplot end

function celerityplot! end
function celerityplot end