local tab_str = "   "
local max_depth = 3
function print_struct(struct, depth)
    if depth == nil then depth = 0 end
    if depth > max_depth then 
        print(struct) 
        return false
    end
    local names = gm.struct_get_names(struct)
    local arg = nil
    local current_tab_str = string.rep(tab_str, depth)
    local line_start = nil
    for j=1, #names do 
        arg = struct[names[j]]
        line_start = current_tab_str.. j .. " - " .. names[j]
        if tostring(arg):match("CInstance") then
            print(line_start .. arg.object_name .. " ( instance )")
        elseif tostring(arg):match("sol%.std::span<RValue %*,%-1>") ~= nil then
            print(line_start .. " ( array of size " .. #arg .. " )")
            print_array(arg, depth + 1)
        elseif gm.typeof(arg) == "struct" then 
            print(line_start .. " struct :")
            print_struct(arg, depth + 1)
        else
            print(line_start .. " = " .. tostring(arg) ..  " ( " .. tostring(gm.typeof(arg)) .. " )")
        end
        
        if gm.typeof(arg) == "Struct" then 
            print_struct(arg, depth)
        end
    end
end

function print_array(array, depth)
    if #array < 1 then print("empty array") end
    if depth == nil then depth = 0 end
    if depth > max_depth then 
        print(struct) 
        return false
    end
    local arg = nil
    local current_tab_str = string.rep(tab_str, depth)
    local line_start = nil
    for i=1, #array do 
        line_start = current_tab_str .. "[" ..i.."] = "
        arg = array[i].value
        if tostring(arg):match("CInstance") then
            print(line_start .. arg.object_name .. "instance")
        elseif tostring(arg):match("sol%.std::span<RValue %*,%-1>") ~= nil then
            print(line_start .. " array of size " .. #arg)
            print_array(arg, depth + 1)
        elseif gm.typeof(arg) == "struct" then 
            print(line_start .. "struct :")
            print_struct(arg, depth + 1)
        else
            print(line_start ..  tostring(arg) .. " ( " .. tostring(gm.typeof(arg)) .. " )")
        end
    end
end
