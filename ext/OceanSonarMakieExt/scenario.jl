function visual!(type::Type{<:OceanSonar.Functor}, scen::Scenario)
    visual!(type, scen.env, 0.0, scen.x)
end

visual!(scen::Scenario) = visual!(OceanCelerity, scen)