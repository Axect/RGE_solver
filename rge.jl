# Info
ver = "0.1.0";
author = "Axect";
page = "https://github.com/Axect/RGE_Solver";

# Function Session
function CheckFolder(folder::String)
    Dir = readdir()
    if folder in Dir
        println("$(folder) exists.")
    else
        println("Make folder")
        mkdir("$(folder)")
        CheckFolder("$(folder)")
    end
end

function Input()
    Choose = split(readline(STDIN))
    if length(Choose) > 5
        error("Over arguments")
    end
    mt = parse(Float64, Choose[1])
    mt_int = Int(floor(mt))
    mt_float = Int(round(mt - floor(mt), 2) * 100) # Only for 1E-02
    xi = parse(Int, Choose[2])
    Choice = Choose[3:end]
    return mt_int, mt_float, xi, Choice
end


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

println("Input parameter : $(mt_int).$(mt_float) $(xi)")
println("Loading...")
println()

using Plots

println("-------------------------------")
println("  Check the environment..  ")
println("-------------------------------")
println()
CheckFolder("Data")
CheckFolder("Fig")
println()
println("-------------------------------")
println("  Build...  ")
println("-------------------------------")

run(`go build src/cmd/rge.go`)

println()
println("Build Complete!")
println()
println("-------------------------------")
println("  Running...  ")
println("-------------------------------")
println()

run(`./rge`)

println()
println("-------------------------------")
println("  Plotting...  ")
println("-------------------------------")
println()

gr(size=(1000,600), dpi=300)
Dat = readcsv("Data/rge.csv");
value = Dat[:];
plot(Dat, title="RGE")
savefig("Fig/rge.svg")
println("Plot complete!")
println()
println("-------------------------------")
println("  Converting...  ")
println("-------------------------------")
println()

run(`inkscape -z Fig/rge.svg -e Fig/rge.png -d 600`)
println("Convert complete!")
