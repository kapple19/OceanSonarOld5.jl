export get

# TODO: automate

get(med::Medium, ::Type{<:Celerity}) = med.cel
get(med::Medium, ::Type{<:Density}) = med.den

get(env::Environment, ::Type{<:Altimetry}) = env.ati
get(env::Environment, ::Type{<:Bathymetry}) = env.bty
get(env::Environment, ::Type{<:OceanCelerity}) = get(env.ocn, Celerity)
get(env::Environment, ::Type{<:OceanDensity}) = get(env.ocn, Density)

get(scen::Scenario, ::Type{<:Altimetry}) = get(scen.env, Altimetry)
get(scen::Scenario, ::Type{<:Bathymetry}) = get(scen.env, Bathymetry)
get(scen::Scenario, ::Type{<:OceanCelerity}) = get(scen.env, OceanCelerity)
get(scen::Scenario, ::Type{<:OceanDensity}) = get(scen.env, OceanDensity)

get(prop::Propagation, ::Type{<:Altimetry}) = get(prop.scen, Altimetry)
get(prop::Propagation, ::Type{<:Bathymetry}) = get(prop.scen, Bathymetry)
get(prop::Propagation, ::Type{<:OceanCelerity}) = get(prop.scen, OceanCelerity)
get(prop::Propagation, ::Type{<:OceanDensity}) = get(prop.scen, OceanDensity)