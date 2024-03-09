# Replicating Literature Tracing Results

```@example
using OceanSonar
using Plots

scen = Scenario("Munk Profile")

c0 = scen.env.ocn.cel(0, scen.z)
z_srf = scen.env.ati(0)
z_bot = scen.env.bty(0)
c_srf = scen.env.ocn.cel(0, z_srf)
c_bot = scen.env.ocn.cel(0, z_bot - 250)
min_angle = -critical_angle(c0, c_srf)
max_angle = critical_angle(c0, c_bot)
angles = range(min_angle, max_angle, 31)

beams = Beams("Gaussian", scen, angles = angles)

fig = visual(beams)
plot!(ylim = (z_srf, z_bot))

savefig(fig, "jensen_etal_fig_3_32.svg")
```

Figure 3.32 of Jensen, et al (2011).

![jensen_etal_fig_3_32.svg](jensen_etal_fig_3_32.svg)
