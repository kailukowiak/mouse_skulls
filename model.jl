p = "/home/kailukowiak/DataScienceProjects/mouse_skulls/src"
push!(LOAD_PATH, p)
using MRILables



f_names = readdir("data/MouseSkulls/")

match("*.nii", f_names)

f_names[1] |> typeof
"asome othe string 1234" |> typeof
match(r"^[*]+.nii", f_names[2])

match.(r"*.nii", f_names[1])

f_names = glob("*_landmarks.tag", "data/MouseSkulls/")
t1 = tagparser("data/MouseSkulls/1179_landmarks.tag")



t3 = VoxelArray(nil)

typeof(t3.img)
t3.xdim

typeof(t3)

T = typeof(t3)
for (name, typ) in zip(fieldnames(T), T.types)
    println("type of the fieldname $name is $typ")
end

typeof(t3.vsizex)

t3.vsizex

test_dim = [500, 540, 800]



M = zeros(Int64, test_dim[1], test_dim[2], test_dim[3])

size(M) ./ 2 .-1

padarray(nil.raw)

A = ones(Int64, 15, 7)

padarray(A, Fill(0, (4,1), (4,4)))

test1 = imresize(nil.raw, 50, 50, 50)

imshow!(test1)

typeof(nil.raw)

typeof(test1)

imshow(test1)
