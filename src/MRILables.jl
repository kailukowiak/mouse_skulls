module MRILables
export tag_parser
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
nil = niread("data/MouseSkulls/bh_cc_bh0098_skull.nii")
imshow(nil.raw)

##

end  # module TarParser+{{}}
