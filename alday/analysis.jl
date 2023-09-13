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

fm3 = fit(MixedModel,
          @formula(rt_raw ~ 1 + spkr * prec * load + 
                            (1 + prec | item) + 
                            (1 | subj)),
          dataset(:kb07))

bc3 = fit(BoxCoxTransformation, fm3)
boxcoxplot(bc3; conf_level=0.95)
