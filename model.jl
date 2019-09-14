p = "/home/kailukowiak/DataScienceProjects/mouse_skulls/src"
push!(LOAD_PATH, p)
using MRILables



f_names = glob("*_landmarks.tag", "data/MouseSkulls/")
t1 = tagparser("data/MouseSkulls/1179_landmarks.tag")

length(f_names)


t3 = VoxelArray(nil)

typeof(t3.img)
t3.xdim

fieldnames(t3)

typeof(t3)

T = typeof(t3)
for (name, typ) in zip(fieldnames(T), T.types)
    println("type of the fieldname $name is $typ")
end

typeof(t3.vsizex)
