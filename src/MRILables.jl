module MRILables
export tagparser, VoxelArray, Lables
using DelimitedFiles
using NIfTI
##

"""
    tagparser(fname)

Function strips .tag file and returns unlabled arrays
"""
function tagparser(fname)
    f = open(fname) do file
        read(file, String)
    end;
    f = split(f, "Points =\n ")[2]
    f = replace(f, " 0.1 1 1 \"Marker\"" => "");
    f = replace(f, ";" => "");
    f = readdlm(IOBuffer(f));
    return f

end

##
# nil = niread("data/MouseSkulls/bh_cc_bh0098_skull.nii")
# imshow(nil.raw)
mutable struct Lables
    xtag
    ytag
    ztag
    function Lables(m::Array{Float64,2})
        xtag = m[:, 1]
        ytag = m[:, 2]
        ztag = m[:, 3]
        new(xtag, ytag, ztag)
    end # Function
end # struct


mutable struct VoxelArray
    vsizex::Float64
    vsizey::Float64
    vsizez::Float64
    img::Array{Float32,3}
    xdim::Int64
    ydim::Int64
    zdim::Int64
    function VoxelArray(nil::NIVolume)
        vsize = voxel_size(nil.header)
        vsizex = vsize[1]
        vsizey = vsize[2]
        vsizez = vsize[3]
        img = nil.raw
        xdim = size(img)[1]
        ydim = size(img)[2]
        zdim = size(img)[3]
        new(vsizex, vsizey, vsizez, img, xdim, ydim, zdim)
    end # function
end # struct


mutable struct VoxelLables
    Lables::Lables
    VoxArray::VoxelArray
end


"""
    Scaler!(voxlables::VoxelArray, targetdim::Array{Int,1})

documentation
"""
function Scaler!(voxlables::VoxelArray, targetdim::Array{Int,1})
    @assert(VoxelArray.)
    println(targetdim)
end # function

Scaler!(t3, [1, 3, 4])

end  # module TarParser+{{}}

[t3.xdim, t3.ydim, t3.zdim] .== [1, 3, 4]
