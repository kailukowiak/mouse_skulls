import matplotlib.pyplot as plt
import nibabel as nib
from mpl_toolkits.mplot3d import axes3d, Axes3D #<-- Note the capitalization!

img = nib.load('MouseSkulls/475.mnc')

data = img.get_data()


data.mean()

img_data = img.get_fdata()


def show_slices(slices):
    """Function to show image slices"""
    fig, axes = plt.subplot(1, len(slices), 1)
    i=0
    for  slice in slices:
        axes[i].imshow(slice.T, cmap="gray", origin="lower")
        i+=1

slice_0 = img_data[350, :, :]
slice_1 = img_data[:, 200, :]
slice_2 = img_data[:, :, 225]
show_slices([slice_0, slice_1, slice_2])
plt.suptitle("Center slices for EPI image")  # doctest: +SKIP


plt.imshow(slice_1)
plt.show()


fig = plt.figure()
ax = plt.axes(projection='3d')
plt.show()


ax = plt.gca(projection='3d')


plt.imshow(img_data, )
