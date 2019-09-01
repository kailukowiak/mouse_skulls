
p = "/home/kailukowiak/DataScienceProjects/mouse_skulls/src"
push!(LOAD_PATH, p)
using MRILables
using Glob


f_names = glob("*_landmarks.tag", "data/MouseSkulls/")
t1 = tagparser("data/MouseSkulls/1179_landmarks.tag")

length(f_names)
