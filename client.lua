ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local whitelisted_identifier = { -- Should work with any license
    "steam:PLAYER_STEAM",
}

RegisterCommand('playasped', function()
    ESX.TriggerServerCallback('play_as_ped:getData', function(data)
        if data.group == "user" then -- Only mod, admin, superadmin
            local elements = {
                {label = 'Boar',           value = 1, ped = "a_c_boar"},
                {label = 'Cat',           value = 2, ped = "a_c_cat_01"},
                {label = 'Chickenhawk',           value = 3, ped = "a_c_chickenhawk"},
                {label = 'Chimp',           value = 4, ped = "a_c_chimp"},
                {label = 'Chop',           value = 5, ped = "a_c_chop"},
                {label = 'Cormorant',           value = 6, ped = "a_c_cormorant"},
                {label = 'Cow',           value = 7, ped = "a_c_cow"},
                {label = 'Coyote',           value = 8, ped = "a_c_coyote"},
                {label = 'Crow',           value = 9, ped = "a_c_crow"},
                {label = 'Deer',           value = 10, ped = "a_c_deer"},
                {label = 'Dolphin',           value = 11, ped = "a_c_dolphin"},
                {label = 'Fish',           value = 12, ped = "a_c_fish"},
                {label = 'Hen',           value = 13, ped = "a_c_hen"},
                {label = 'Humpback',           value = 14, ped = "a_c_humpback"},
                {label = 'Husky',           value = 15, ped = "a_c_husky"},
                {label = 'Killer Whale',           value = 16, ped = "a_c_killerwhale"},
                {label = 'Mountian Lion',           value = 17, ped = "a_c_mtlion"},
                {label = 'Pig',           value = 18, ped = "a_c_pig"},
                {label = 'Pigeon',           value = 19, ped = "a_c_pigeon"},
                {label = 'Poodle',           value = 20, ped = "a_c_poodle"},
                {label = 'Pug',           value = 21, ped = "a_c_pug"},
                {label = 'Rabbit',           value = 21, ped = "a_c_rabbit_01"},
                {label = 'Rat',           value = 21, ped = "a_c_rat"},
                {label = 'Retriever',           value = 21, ped = "a_c_retriever"},
                {label = 'rhesus',           value = 21, ped = "a_c_rhesus"},
                {label = 'Rottweiler',           value = 21, ped = "a_c_rottweiler"},
                {label = 'Seagull',           value = 21, ped = "a_c_seagull"},
                {label = 'Sharkhammer',           value = 21, ped = "a_c_sharkhammer"},
                {label = 'Sharktiger',           value = 21, ped = "a_c_sharktiger"},
                {label = 'Shepherd',           value = 21, ped = "a_c_shepherd"},
                {label = 'Stingray',           value = 21, ped = "a_c_stingray"},
                {label = 'Westy',           value = 21, ped = "a_c_westy"},
            }
            
            ESX.UI.Menu.CloseAll()
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ped_menu',
            {
                title    = 'Choose an animal',
                align    = 'top-left',
                elements = elements
            }, function(data, menu)
                for i=1, #elements do
                    if data.current.value == i then
                        if data.current.ped == "human" then
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                                local isMale = skin.sex == 0
        
                                if isMale then 
                                    RequestModel("mp_m_freemode_01")
        
                                    while not HasModelLoaded("mp_m_freemode_01") do
                                        Citizen.Wait(0)
                                    end
                
                                    SetPlayerModel(PlayerId(), GetHashKey("mp_m_freemode_01"))
                                else
                                    RequestModel("mp_f_freemode_01")
        
                                    while not HasModelLoaded("mp_f_freemode_01") do
                                        Citizen.Wait(0)
                                    end
                
                                    SetPlayerModel(PlayerId(), GetHashKey("mp_f_freemode_01"))
                                end
        
                                TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
                                    TriggerEvent('skinchanger:loadSkin', skin)
                                    TriggerEvent('esx:restoreLoadout')
                                end)
                            end)      
                        else
                            RequestModel(data.current.ped)
        
                            while not HasModelLoaded(data.current.ped) do
                                print("Requesting")
                                Citizen.Wait(0)
                            end

                            print("Setted")
                            SetPlayerModel(PlayerId(), GetHashKey(data.current.ped))
                        end
                    end
                end
            end, function(data, menu)
                menu.close()
            end)
        else
            for i=1, #whitelisted_identifier do
                if whitelisted_identifier[i] == data.identifier then
                    local elements = {
                        {label = 'Boar',           value = 1, ped = "a_c_boar"},
                        {label = 'Cat',           value = 2, ped = "a_c_cat_01"},
                        {label = 'Chickenhawk',           value = 3, ped = "a_c_chickenhawk"},
                        {label = 'Chimp',           value = 4, ped = "a_c_chimp"},
                        {label = 'Chop',           value = 5, ped = "a_c_chop"},
                        {label = 'Cormorant',           value = 6, ped = "a_c_cormorant"},
                        {label = 'Cow',           value = 7, ped = "a_c_cow"},
                        {label = 'Coyote',           value = 8, ped = "a_c_coyote"},
                        {label = 'Crow',           value = 9, ped = "a_c_crow"},
                        {label = 'Deer',           value = 10, ped = "a_c_deer"},
                        {label = 'Dolphin',           value = 11, ped = "a_c_dolphin"},
                        {label = 'Fish',           value = 12, ped = "a_c_fish"},
                        {label = 'Hen',           value = 13, ped = "a_c_hen"},
                        {label = 'Humpback',           value = 14, ped = "a_c_humpback"},
                        {label = 'Husky',           value = 15, ped = "a_c_husky"},
                        {label = 'Killer Whale',           value = 16, ped = "a_c_killerwhale"},
                        {label = 'Mountian Lion',           value = 17, ped = "a_c_mtlion"},
                        {label = 'Pig',           value = 18, ped = "a_c_pig"},
                        {label = 'Pigeon',           value = 19, ped = "a_c_pigeon"},
                        {label = 'Poodle',           value = 20, ped = "a_c_poodle"},
                        {label = 'Pug',           value = 21, ped = "a_c_pug"},
                        {label = 'Rabbit',           value = 21, ped = "a_c_rabbit_01"},
                        {label = 'Rat',           value = 21, ped = "a_c_rat"},
                        {label = 'Retriever',           value = 21, ped = "a_c_retriever"},
                        {label = 'rhesus',           value = 21, ped = "a_c_rhesus"},
                        {label = 'Rottweiler',           value = 21, ped = "a_c_rottweiler"},
                        {label = 'Seagull',           value = 21, ped = "a_c_seagull"},
                        {label = 'Sharkhammer',           value = 21, ped = "a_c_sharkhammer"},
                        {label = 'Sharktiger',           value = 21, ped = "a_c_sharktiger"},
                        {label = 'Shepherd',           value = 21, ped = "a_c_shepherd"},
                        {label = 'Stingray',           value = 21, ped = "a_c_stingray"},
                        {label = 'Westy',           value = 21, ped = "a_c_westy"},
                    }
                    
                    ESX.UI.Menu.CloseAll()
                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ped_menu',
                    {
                        title    = 'Choose an Animal',
                        align    = 'top-left',
                        elements = elements
                    }, function(data, menu)
                        for i=1, #elements do
                            if data.current.value == i then
                                if data.current.ped == "human" then
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                                        local isMale = skin.sex == 0
                
                                        if isMale then 
                                            RequestModel("mp_m_freemode_01")
                
                                            while not HasModelLoaded("mp_m_freemode_01") do
                                                Citizen.Wait(0)
                                            end
                        
                                            SetPlayerModel(PlayerPedId(), "mp_m_freemode_01")
                                        else
                                            RequestModel("mp_f_freemode_01")
                
                                            while not HasModelLoaded("mp_f_freemode_01") do
                                                Citizen.Wait(0)
                                            end
                        
                                            SetPlayerModel(PlayerPedId(), "mp_f_freemode_01")
                                        end
                
                                        TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
                                            TriggerEvent('skinchanger:loadSkin', skin)
                                            TriggerEvent('esx:restoreLoadout')
                                        end)
                                    end)      
                                else
                                    RequestModel(data.current.ped)
                
                                    while not HasModelLoaded(data.current.ped) do
                                        Citizen.Wait(0)
                                    end
                
                                    SetPlayerModel(PlayerPedId(), data.current.ped)
                                end
                            end
                        end
                    end, function(data, menu)
                        menu.close()
                    end)
                end
            end
        end
    end)
end)
