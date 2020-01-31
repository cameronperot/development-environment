using Pkg

pkgs = [
	"IJulia",
	"Plots",
	"PyPlot",
	"PyCall",
	"LaTeXStrings",
	"DataFrames",
	"CSV",
	"BenchmarkTools",
	"DistributedArrays",
	"LsqFit",
	"JLD",
	"ProfileView",
	"Revise",
	"HDF5"
]

for pkg in pkgs
	Pkg.add(pkg)
end

ENV["JUPYTER"] = "/opt/miniconda3/envs/jupyter/bin/jupyter"
ENV["PYTHON"]  = "/opt/miniconda3/envs/jupyter/bin/python"
Pkg.build("IJulia")
Pkg.build("PyCall")
