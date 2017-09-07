# Info
ver = "0.1.0";
author = "Axect";
page = "https://github.com/Axect/RGE_Solver";
# Function Session
include("src/Functions.jl")

# --------------------------------------------------------------
# Script Session
run(`clear`)

println("-------------------------------")
println("  RGE Solver  ")
println("  ver $ver   ")
println("  author $author  ")
println("  page $page  ")
println("-------------------------------")
println()
println("__________  ___________________")
println("\\______   \\/  _____/\\_   _____/")
println(" |       _/   \\  ___ |    __)_")
println(" |    |   \\    \\_\\  \\|        \\")
println(" |____|_  /\\______  /_______  /")
println("        \\/        \\/        \\/ ")
println()
println("Input parameters: ")
println("ex) 170.85 50 1 2 3")

mt_int, mt_float, xi, Choice = Input()
mt = mt_int + round(mt_float/100, 2)

println("Input parameter : $(mt_int).$(mt_float) $(xi)")
println("Loading...")
println()

using Plots, DataFrames, LaTeXStrings

println("-------------------------------")
println("  Check the environment..  ")
println("-------------------------------")
println()
CheckFolder("Data")
CheckFolder("Fig")
println()
println("-------------------------------")
println("  Import...  ")
println("-------------------------------")

include("src/pbh.jl");

println()
println("Import Complete!")
println()
println("-------------------------------")
println("  Running...  ")
println("-------------------------------")
println()

Data = ExtractGauge(mt, Float64(xi));
println("Running Complete!")

println()
println("-------------------------------")
println("  Plotting...  ")
println("-------------------------------")
println()

gr(size=(1000, 600), dpi=300)
t = Data[:t]

if "1" in Choice
    t = Data[:t]
    λ = Data[:λ]
    pl1 = plot(t, λ, title="Lambda", label="lH")
    savefig(pl1, "Fig/Lambda_$(mt_int)_$(mt_float)_$(xi).svg")
    run(`inkscape -z Fig/Lambda_$(mt_int)_$(mt_float)_$(xi).svg -e Fig/Lambda_$(mt_int)_$(mt_float)_$(xi).png -d 600`)
end

if "2" in Choice
    yt = Data[:yt]
    g1 = Data[:g1]
    g2 = Data[:g2]
    g3 = Data[:g3]
    pl2 = plot(t, yt, title="Gauge Plots", label="yt")
    plot!(t, g1, label="g1")
    plot!(t, g2, label="g2")
    plot!(t, g3, label="g3")
    savefig(pl2, "Fig/Gauge_$(mt_int)_$(mt_float)_$(xi).svg")
    run(`inkscape -z Fig/Gauge_$(mt_int)_$(mt_float)_$(xi).svg -e Fig/Gauge_$(mt_int)_$(mt_float)_$(xi).png -d 600`)
end

if "3" in Choice
    G = Data[:G]
    pl3 = plot(t, G, title="Gauge Plots", label="G(t)")
    savefig(pl3, "Fig/G_$(mt_int)_$(mt_float)_$(xi).svg")
    run(`inkscape -z Fig/G_$(mt_int)_$(mt_float)_$(xi).svg -e Fig/G_$(mt_int)_$(mt_float)_$(xi).png -d 600`)
end

println("Plot complete!")

println("Convert complete!")
