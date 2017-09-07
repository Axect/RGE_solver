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
