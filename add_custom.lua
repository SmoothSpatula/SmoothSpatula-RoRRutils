local custom_init = false

gm.pre_script_hook(gm.constants.__input_system_tick, function()

    -- Initialize custom stuff

    if not custom_init then
        custom_init = true
        --[[
        diff_id = gm.difficulty_create("klehrik", "deluge")   -- namespace, identifier
        local class_diff = gm.variable_global_get("class_difficulty")[diff_id + 1]
        local values = {
            "Not Deluge",       -- Name
            "For those who have conquered Monsoon.\nYou will be washed away in a flood of pain.\n\n<c_stack>Director credits     + 50%\nEnemy move speed    + 25%\nAll healing            - 50%",  -- Description
            diff_icon,      -- Sprite ID
            diff_icon2x,    -- Sprite Loadout ID
            7554098,        -- Primary Color
            diff_sfx,    -- Sound ID
            0.16,           -- diff_scale; Affects enemy stat scaling (health and damage)
                            --     0.06 (Drizzle), 0.12 (Rainstorm), 0.16 (Monsoon)
            3.0,            -- general_scale; Affects timer and chest price scaling
                            --     The text update and bell sound only update/play at the start of every minute
                            --     1.0 (Drizzle), 2.0 (Rainstorm), 3.0 (Monsoon)
            1.7 * (1 + point_scaling),  -- point_scale; Affects point scaling, with the increase at any minute being 2.0 + (this * minutesElapsed)
                            --                 e.g., with Monsoon's 1.7, at 5 minutes, the director gets 2.0 + (1.7 * 5) = 10.5 points per second
                            --                 1.0 (Drizzle), 1.0 (Rainstorm), 1.7 (Monsoon)
            true,           -- Either "is monsoon or higher" or "allow blight spawns"
            true            -- Whichever one the bool above isn't
        }
        for i = 2, 12 do gm.array_set(class_diff, i, values[i - 1]) end
        ]]--       

        surv_id = gm.survivor_create("SmoothSpatula", "survivor_test")
        local class_surv = gm.variable_global_get("class_survivor")[surv_id + 1]

        local surv_values = {
            --"1", -- namespace
            --"2", -- name
            "3", -- display name 
            "4", -- display name uppercase (shows in the menu)
            "5", -- description
            "6", -- end quote
            "7",
            "8",
            "9",
            "10",
            --"11", --crash
            --"12",
            --"13"
        }
        for i = 2, #surv_values+1 do gm.array_set(class_surv, i, surv_values[i - 1]) end

        -------- Survivor Testing -----------

        local survivor = gm.variable_global_get("class_survivor")[1]
        print("1 "..survivor[1])
        print("2 "..survivor[2])
        print("3 "..survivor[3])
        print("4 "..survivor[4]) 
        print("5 "..survivor[5])
        print("6 "..survivor[6])
        print(survivor[7].type) -- 0
        print(survivor[8].type) -- 0 
        print(survivor[9].type) -- 0
        print(survivor[10].type) -- 0
        print(survivor[11].type) -- 0
        print(survivor[12].type) -- 5
        print(survivor[13].type) -- 5

        -------- Artifact Testing -----------

        


        arti_id = gm.artifact_create("SmoothSpatula", "artifact_test")
        local class_arti = gm.variable_global_get("class_artifact")[arti_id +1]

        local arti_values = {
            --"1", -- namespace
            --"2", -- name
            "3", -- display name
            "4", -- pickup name
            "5", -- description
            "4", -- display sprite
            -- these are the values for the first 3 indexes
            --"7", --[1229, 1233, 1236] number change for every artifact
            --"8", --[1609, 1610, 1613] number change for every artifact
            --"9"  --[1010, 1011, 1012] number increase by 1 for every artifact
        }

        local artifact = gm.variable_global_get("class_artifact")[1]

        print("1 "..artifact[1])
        print("2 "..artifact[2])
        print("3 "..artifact[3])
        print("4 "..artifact[4])
        print("5 "..artifact[5])
        print("6 "..artifact[6]) 
        print("7 "..artifact[7]) 
        print("8 "..artifact[8]) 

        for i = 2, #arti_values+1 do gm.array_set(class_arti, i, arti_values[i-1]) end
  end
end)
