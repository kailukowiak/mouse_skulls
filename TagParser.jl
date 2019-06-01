using DelimitedFiles
##
function tag_parser(f_name)
    f = open("eda/data/MouseSkulls/1179_landmarks.tag") do file
        read(file, String)
    end;
    f = split(f, "Points =\n ")[2]

    f = replace(f, " 0.1 1 1 \"Marker\"" => "");
    f = replace(f, ";" => "");

    f = readdlm(IOBuffer(f));
    f

end

##
test = tag_parser("eda/data/MouseSkulls/1179_landmarks.tag")
