##
using NIfTI
using Images
using ImageView
##
ni = niread("/home/kailukowiak/test.nii")

# voxel_size is impotant for scaling the .tag files.
voxel_size(ni.header)

imshow(ni.raw)


ni.header

ni.raw

imshow(ni.raw[:, 200, :])

# ~/PythonProjects/facial_key_points/eda/data/MouseSkulls/1179.mnc

dim_info(ni.header)

ni.header.dim .* 0.035 ./10
