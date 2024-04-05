-- Toplama
local muztoplama = Config.MuzToplama

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, muztoplama.x, muztoplama.y, muztoplama.z, true)
        if distance < 30 then
            sleep = 1
            DrawMarker(2, muztoplama.x, muztoplama.y, muztoplama.z - 1.5 + 1, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MarkerBoyutu, Config.MarkerBoyutu, Config.MarkerBoyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 5 then
                sleep = 1
                    DrawText3D(muztoplama.x, muztoplama.y, muztoplama.z, '[E] Muz Topla')
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("progressbar:client:progress", {
                            name = "muz",
                            duration = 5000,
                            label = "Muz Topluyorsun",
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                                anim = "idle_c",
                                flags = 49,
                            },
                        }, function(status)
                            if not status then
                                TriggerServerEvent("cqwermuztoplama")
                            end
                        end)
                    end
            end
        end
        Citizen.Wait(sleep)
    end
end)

-- İşleme
local muzisleme = Config.MuzIsleme

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, muzisleme.x, muzisleme.y, muzisleme.z, true)
        if distance < 4 then
            sleep = 1
            DrawMarker(2, muzisleme.x, muzisleme.y, muzisleme.z - 1.5 + 1, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MarkerBoyutu, Config.MarkerBoyutu, Config.MarkerBoyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 2 then
                sleep = 1
                    DrawText3D(muzisleme.x, muzisleme.y, muzisleme.z, '[E] Muz İşle')
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("progressbar:client:progress", {
                            name = "muz",
                            duration = 5000,
                            label = "Muz İşliyorsun",
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                                anim = "idle_c",
                                flags = 49,
                            },
                        }, function(status)
                            if not status then
                                TriggerServerEvent("cqwermuzisleme")
                            end
                        end)
                    end
            end
        end
        Citizen.Wait(sleep)
    end
end)

--Satış
local muzsatis = Config.MuzSatis

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, muzsatis.x, muzsatis.y, muzsatis.z, true)
        if distance < 4 then
            sleep = 1
            DrawMarker(2, muzsatis.x, muzsatis.y, muzsatis.z - 1.5 + 1, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MarkerBoyutu, Config.MarkerBoyutu, Config.MarkerBoyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 1 then
                sleep = 1
                    DrawText3D(muzsatis.x, muzsatis.y, muzsatis.z, '[E] Muzlu Pasta Sat')
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("progressbar:client:progress", {
                            name = "muz",
                            duration = 5000,
                            label = "Muzlu Pasta Satıyorsun",
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                                anim = "idle_c",
                                flags = 49,
                            },
                        }, function(status)
                            if not status then
                                TriggerServerEvent("cqwermuzlupastasat")
                            end
                        end)
                    end
            end
        end
        Citizen.Wait(sleep)
    end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end

if Config.BlipAc then
    CreateThread(function()
        local blip = AddBlipForCoord(Config.MuzToplamaBlip.x, Config.MuzToplamaBlip.y, Config.MuzToplamaBlip.z)
        SetBlipSprite(blip, 233)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.MuzToplamaBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.MuzIslemeBlip.x, Config.MuzIslemeBlip.y, Config.MuzIslemeBlip.z)
        SetBlipSprite(blip, 233)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.MuzIslemeBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.MuzSatisBlip.x, Config.MuzSatisBlip.y, Config.MuzSatisBlip.z)
        SetBlipSprite(blip, 233)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.MuzSatisBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
end