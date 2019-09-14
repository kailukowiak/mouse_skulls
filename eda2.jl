using NIfTI
using Images
using ImageView
nil = niread("data/MouseSkulls/475.nii")
imshow(nil.raw)
##
# ni = niread("/home/kailukowiak/test.nii")

# voxel_size is impotant for scaling the .tag files.
v_size = voxel_size(nil.header)
t1 = nil.raw
imshow(ni.raw)
imshow(ni.raw[:, 200, :])

size(t1)
typeof(nil)
# ~/PythonProjects/facial_key_points/eda/data/MouseSkulls/1179.mnc
nil.header
##
ni_raw = ni.raw
ni_raw .> 200
imgg = Gray.(ni_raw)
imgg = RGB.(imgg)
##

dim_info(ni.header)

loc = round.(Int, test ./ v_size[1])
# ni.header.dim .* 0.035 ./10
guidict = imshow(ni_raw)
for i in 1:size(loc)[1]
        annotate!(guidict,
                AnnotationPoint(loc[i, 1],
                loc[i, 2],
                z = loc[i, 3],
                color = RGB(1, 0, 0),
                shape = '.'))

end

guidict = imshow(ni_raw)
idx = annotate!(guidict, AnnotationPoint(370, 158,
                z = 402,
                color = RGB(1,0,0),
                shape = '.'))

idx = annotate!(guidict,
                AnnotationPoint(loc[1, :][1],
                                loc[1, :][2],
                                z = loc[1, :][3],
                                color = RGB(1, 0, 0),
                                shape = '.'))


imgg[loc[1, :]] = colorant"red"

##


using ImageView, GtkReactive, TestImages, Colors

# Prepare the data
mri = testimage("mri")
mriseg = RGB.(mri)
mriseg[mri .> 0.5] = colorant"red"

mri .> 0.5
##


mri = testimage("mri")
mriseg = RGB.(mri)
mriseg[mri .> 0.5] = colorant"red"


push!(LOAD_PATH, "/home/kailukowiak/DataScienceProjects/")

LOAD_PATH
