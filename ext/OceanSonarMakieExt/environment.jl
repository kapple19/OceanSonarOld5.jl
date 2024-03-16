function visual!(env::Environment, x_lo::Real, x_hi::Real)
    visual!(env.ati, x_lo, x_hi)
    visual!(env.bty, x_lo, x_hi)
end