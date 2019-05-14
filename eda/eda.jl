using PyCall
using Images
# ENV["PYTHON"] = "/home/kailukowiak/anaconda3/bin/python"
# Useful code for setting the right python directory
nib = pyimport("nibabel")

img = nib.load("data/MouseSkulls/475.mnc")

data = img.get_data()

slice1 = data[300, :, :]
(slice1)

# (slice1)

using TestImages, Images,
using ImageView
imshow(slice1)

imshow(data)

img2 = nib.load("data/MouseSkulls/711_2_6.mnc")
data2 = img2.get_data()

imshow(data2)

imshow(data2[:, :, 225])
