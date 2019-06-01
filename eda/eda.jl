## Load libraries and nibabel
using PyCall
using Images
using ImageView
using CUDAnative
using CuArrays
## Added
# ENV["PYTHON"] = "/home/kailukowiak/anaconda3/bin/python"
# Useful code for setting the right python directory
nib = pyimport("nibabel")
## Load images
img = nib.load("eda/data/MouseSkulls/475.mnc")

data = img.get_data()

## Show random slices
slice1 = data[300, :, :]

# (slice1)

imshow(slice1)

imshow(data)

img2 = nib.load("eda/data/MouseSkulls/711_2_6.mnc")
data2 = img2.get_data()

imshow(data2)

imshow(data2[:, :, 225])

"""
takes `img::Aray` as an input and displays 3 images
for each orientation.
"""
function image_viewer(img::Array)
    shape = size(img)
    lng = Int(round(shape[1]/2))
    wdth = Int(round(shape[2]/2))
    hght = Int(round(shape[3]/2))
    imshow(img[lng, :, :])
    imshow(img[:, wdth, :])
    imshow(img[:, :, hght])

end

image_viewer(data)

lng = Int(round(size(data)[1]/2))

function test(data)
    shape = size(data)
    lng = Int(round(shape[1]/2))
    imshow(data[lng, :, :])
end
test(data)
