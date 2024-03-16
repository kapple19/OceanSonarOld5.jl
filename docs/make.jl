using OceanSonar
using Documenter

pages = [
    "Ocean Sonar" => "index.md"
    "Generic" => [
        "Usage" => "generic/usage.md"
        "Implementation" => "generic/implementation.md"
        "Modelling" => "generic/modelling.md"
        "Public API" => "generic/public.md"
        "Developers" => "generic/developers.md"
        "Interpolation" => "generic/interpolation.md"
    ]
    "Oceanography" => [
        "Introduction" => "oceanography/intro.md"
        "Boundary" => [
            "Introduction" => "oceanography/boundary/intro.md"
            "Altimetry" => "oceanography/boundary/altimetry.md"
            "Bathymetry" => "oceanography/boundary/bathymetry.md"
        ]
        "Celerity" => [
            "Introduction" => "oceanography/celerity/intro.md"
            "Atmosphere" => "oceanography/celerity/atmosphere.md"
            "Ocean" => "oceanography/celerity/ocean.md"
            "Seabed" => "oceanography/celerity/seabed.md"
            "Seabed Shear" => "oceanography/celerity/shear.md"
        ]
        "Density" => [
            "Introduction" => "oceanography/density/intro.md"
            "Atmosphere" => "oceanography/density/atmosphere.md"
            "Ocean" => "oceanography/density/ocean.md"
            "Seabed" => "oceanography/density/seabed.md"
        ]
        "Attenuation" => [
            "Introduction" => "oceanography/attenuation/intro.md"
            "Atmosphere" => "oceanography/attenuation/atmosphere.md"
            "Ocean" => "oceanography/attenuation/ocean.md"
            "Seabed" => "oceanography/attenuation/seabed.md"
            "Seabed Shear" => "oceanography/attenuation/shear.md"
        ]
        "Medium" => [
            "Introduction" => "oceanography/medium/intro.md"
            "Atmosphere" => "oceanography/medium/atmosphere.md"
            "Ocean" => "oceanography/medium/ocean.md"
            "Seabed" => "oceanography/medium/seabed.md"
        ]
        "Environment" => "oceanography/environment.md"
    ]
    "Acoustics" => [
        "Introduction" => "acoustics/intro.md"
        "Scenario" => "acoustics/scenario.md"
        "Reflection" => [
            "Introduction" => "acoustics/reflection/intro.md"
            "Surface" => "acoustics/reflection/surface.md"
            "Bottom" => "acoustics/reflection/bottom.md"
        ]
        "Propagation" => [
            "Introduction" => "acoustics/propagation/intro.md"
            "Tracing" => [
                "Introduction" => "acoustics/propagation/tracing/intro.md"
                "Rays" => "acoustics/propagation/tracing/ray.md"
                "Beams" => "acoustics/propagation/tracing/beam.md"
                "Grid" => "acoustics/propagation/tracing/grid.md"
                "Replication" => "acoustics/propagation/tracing/replication.md"
            ]
            "Parabolic" => [
                "Introduction" => "acoustics/propagation/parabolic/root.md"
                "Marchers" => "acoustics/propagation/parabolic/marchers.md"
            ]
        ]
    ]
    "Sonar" => [
        "Introduction" => "sonar/intro.md"
    ]
    "Detection" => [
        "Introduction" => "detection/intro.md"
        "Threshold" => "detection/threshold.md"
        "Transition" => "detection/transition.md"
    ]
]

macros = Dict(
    raw"\rmd" => raw"\mathrm{d}",
    raw"\rmE" => raw"\mathrm{E}",
    raw"\rmPr" => raw"\mathrm{Pr}",
    raw"\SNR" => raw"\mathrm{SNR}",
    raw"\DT" => raw"\mathrm{DT}",
    raw"\SE" => raw"\mathrm{SE}",
    raw"\SNR" => raw"\mathrm{SNR}",
    raw"\calE" => raw"\mathcal{E}",
    raw"\calN" => raw"\mathcal{N}",
    raw"\wrt" => raw"\mathrm{ w.r.t. }",
    raw"\STD" => raw"\mathrm{STD}",
    raw"\Var" => raw"\mathrm{Var}",
    raw"\Rice" => raw"\mathrm{Rice}"
)

# doesn't work
# mathengine = MathJax3(
#     Dict(
#         :delimiters => [
#             Dict(:left => raw"$",   :right => raw"$",   display => false),
#             Dict(:left => raw"$$",  :right => raw"$$",  display => true),
#             Dict(:left => raw"\[",  :right => raw"\]",  display => true),
#         ],
#         :loader => Dict("load" => ["[tex]/physics"]),
#         :tex => Dict(
#             "inlineMath" => [["\$","\$"], ["\\(","\\)"]],
#             "tags" => "ams",
#             "packages" => ["base", "ams", "autoload", "physics"],
#         ),
#         :macros => macros
#     )
# )

mathengine = Documenter.KaTeX(
    Dict(
        :delimiters => [
            Dict(:left => raw"$",   :right => raw"$",   display => false),
            Dict(:left => raw"$$",  :right => raw"$$",  display => true),
            Dict(:left => raw"\[",  :right => raw"\]",  display => true),
        ],
        :macros => macros,
    )
)

DocMeta.setdocmeta!(OceanSonar, :DocTestSetup, :(using OceanSonar); recursive=true)

makedocs(;
    sitename="OceanSonar.jl",
    modules=[OceanSonar],
    authors="Aaron Kaw <aaronjkaw@gmail.com> and contributors",
    format = Documenter.HTML(;
        canonical="https://kapple19.github.io/OceanSonar.jl",
        edit_link = :commit,
        collapselevel = 1,
        assets = String[],
        mathengine = mathengine
    ),
    pages = pages,
)

deploydocs(;
    repo="github.com/kapple19/OceanSonar.jl",
    devbranch="main",
)
