export Environment

"""
TODO.
"""
@kwdef mutable struct Environment <: Container
    model::Val = Val(Symbol())

    atm::Atmosphere = Atmosphere()
    ocn::Ocean = Ocean()
    sbd::Seabed = Seabed()

    ati::Altimetry = Altimetry()
    bty::Bathymetry = Bathymetry()
end

Environment(model::Val{:lloyd_mirror}) = Environment(
    model = model,
    ocn = Ocean(:homogeneous),
    sbd = Seabed(:jensen_clay),
    bty = Bathymetry(:half_kilometre)
)

Environment(model::Val{:munk_profile}) = Environment(
    model = model,
    ocn = Ocean(:munk_profile),
    sbd = Seabed(:jensen_clay),
    bty = Bathymetry(:deep)
)

Environment(model::Val{:index_squared_profile}) = Environment(
    model = model,
    ocn = Ocean(:index_squared_profile),
    sbd = Seabed(:jensen_clay),
    bty = Bathymetry(:mesopelagic)
)

Environment(model::Val{:parabolic_bathymetry}) = Environment(
    model = model,
    ocn = Ocean(:homogeneous),
    sbd = Seabed(:jensen_basalt),
    bty = Bathymetry(:parabolic)
)

Environment(model::Val{:linearised_convergence_zones}) = Environment(
    model = model,
    ocn = Ocean(:linearised_convergence_zones),
    sbd = Seabed(:jensen_basalt),
    bty = Bathymetry(:deep)
)

Environment(model::Val{:norwegian_sea}) = Environment(
    model = model,
    ocn = Ocean(:norwegian_sea),
    sbd = Seabed(:jensen_basalt),
    bty = Bathymetry(:four_kilometers)
)

@parse_models Environment