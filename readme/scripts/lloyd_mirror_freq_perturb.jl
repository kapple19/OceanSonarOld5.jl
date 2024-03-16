using OceanSonar
using Plots

model = "Lloyd Mirror"

function run_prop(f)
    scen = Scenario(model)
    scen.f = f
    return Propagation("Trace", scen)
end

# scens = [get_scen(f) for f in series125(5e3)]
# props = [Propagation("Trace", scen) for scen in scens]
props = [run_prop(f) for f in series125(5e3)]
clims = extrema([prop.PL for prop in props] |> splat(vcat))
plots = [
    plot(prop,
        title = string(prop.scen.f, " Hz"),
        titlefontsize = 9,
        clims = clims,
        xticks = [],
        yticks = []
    )
    for prop in props
]

# TODO:
# * Add shared colourbar.
# * Normalise subplot sizes.
plot(plots..., plot_title = model, plot_titlefontsize = 12)