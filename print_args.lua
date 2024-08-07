local tab_str = "   "
local max_depth = 3
function print_struct(struct, depth)
    if depth > max_depth then 
        print(struct) 
        return false
    end
    depth = depth + 1
    local names = gm.struct_get_names(struct)
    local arg = nil
    local current_tab_str = string.rep(tab_str, depth)
    for j=1, #names do 
        arg = struct[names[j]]
        if tostring(arg):match("CInstance") then
            print(current_tab_str .. j .. " " .. names[j] .. arg.object_name .. " ( instance )")
        elseif gm.typeof(arg) == "struct" then 
            print(current_tab_str .. j .. " " .. names[j] .. " struct :")
            print_struct(arg, depth)
        else
            print(current_tab_str .. j .. " " .. names[j] .. " = " .. tostring(arg) ..  " ( " .. tostring(gm.typeof(arg)) .. " )")
        end
        
        if gm.typeof(arg) == "Struct" then 
            print_struct(arg, depth)
        end
    end
end

function print_args(args)
    if #args < 1 then print("empty args") end
    local arg = nil
    for i=1, #args do 
        arg = args[i].value
        if tostring(arg):match("CInstance") then
            print(i .. " - " .. arg.object_name .. " instance")
        elseif gm.typeof(arg) == "struct" then 
            print(i .. " struct :")
            print_struct(arg, 0)
        
        else
            print(i .. " - " .. " = " .. tostring(arg) .. " ( " .. tostring(gm.typeof(arg)) .. " )")
        end
    end
end
