using BoxCox
using CairoMakie
using MixedModels
using MixedModelsMakie

using MixedModels: dataset

fm1 = fit(MixedModel,
          @formula(reaction ~ 1 + days + (1 + days|subj)),
          dataset(:sleepstudy))

bc1 = fit(BoxCoxTransformation, fm1)

fm2 = fit(MixedModel,
          @formula(1000 / reaction ~ 1 + days + (1 + days|subj)),
          dataset(:sleepstudy))
