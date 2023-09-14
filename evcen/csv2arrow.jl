using Arrow
using CSV
using DataFrames

# @__DIR__ is a special macro that returns the path of the file
# that the code is executed from (which may be different than the 
# working director)
csv_path = joinpath(@__DIR__, "data", "evcen_smlp23.csv")

# read in the data and convert it to a dataframe
df = CSV.read(csv_path, DataFrame)

# do stuff ....

# write out the dataframe as an Arrow table
arrow_path = joinpath(@__DIR__, "data", "evcen_smlp23.arrow")
Arrow.write(arrow_path, df)
