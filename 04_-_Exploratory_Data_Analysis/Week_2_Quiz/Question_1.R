# Under the lattice graphics system, what do the primary plotting functions like xyplot() and bwplot() return?

library(nlme)
library(lattice)
result <- xyplot(weight ~ Time | Diet, BodyWeight)
class(result)
