module MRILabels
export tagparser, VoxelArray, Labels
using DelimitedFiles
using NIfTI


"""
    tagparser(fname)

Function strips .tag file and retmodule MRILabels
export tag_parser
export tagparser, VoxelArray, Labels
using DelimitedFiles
using NIfTI
##urns unlabled arrays
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
mutable struct Labels
    xtag::Array{Float64,1}
    ytag::Array{Float64,1}
    ztag::Array{Float64,1}
    function Labels(m::Array{Float64,2})
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


mutable struct VoxelLabels
    Labels::Labels
    VoxelArray::VoxelArray
    xlab::Int64
    ylab::Int64
    zlab::Int64
    """
        VoxelLabels(Labels::Labels, VoxelArray::VoxelArray)

    Combines `Labels` and VoxelArray` together and generates the voxel position
    for the Labels
    """
    function VoxelLabels(Labels::Labels, VoxelArray::VoxelArray)
        xlab = floor.(VoxelArray.vsizex .* Lables.xtag)
        ylab = floor.(VoxelArray.vsizey .* Lables.ytag)
        zlab = floor.(VoxelArray.vsizez .* Lables.ztag)
        new(Labels, VoxelArray, xlab, ylab, zlab)
    end # function
end


"""
    scaler!(voxLabels::VoxelArray, targetdim::Array{Int,1})

An inplace version of scaler()
"""
function scaler!(VoxelArray::VoxelLabels, targetdim::Array{Int,1})
    # TODO Add asertion

    println(targetdim)
end # function


"""
    scaler(voxLabels::VoxelArray, targetdim::Array{Int,1})

documentation
"""
function scaler(VoxelArray::VoxelLabels, targetdim::Array{Int,1})
    @assert size(targetdim) == (3,) "Targtdim must be three dimensions"
    all_even_assertion(targtdim)
    println(targetdim)
end # function

end  # module TarParser+{{}}

    @assert size(targetdim) == (3,) "targtdim must be three Dimensions"
    println(targetdim)
end # function

"""
    all_even_assertion(vector::Array{Int64,1})

verifies that all dims are even (internal fuction)
"""
function all_even_assertion(vector::Array{Int64,1})
    countdim = 1
    for i in vector
        @assert iseven(i) "$i, the $countdim element is not even"
        countdim += 1
    end
end # function


end  # module TarParser+{{}}
