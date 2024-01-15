--────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
--─██████████████─████████████████───██████████████─██████──██████─██████████████────██████████████─██████████████─████████████████───██████████─██████████████─██████████████─██████████████─
--─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
--─██░░██████████─██░░████████░░██───██░░██████░░██─██░░██──██░░██─██░░██████████────██░░██████████─██░░██████████─██░░████████░░██───████░░████─██░░██████░░██─██████░░██████─██░░██████████─
--─██░░██─────────██░░██────██░░██───██░░██──██░░██─██░░██──██░░██─██░░██────────────██░░██─────────██░░██─────────██░░██────██░░██─────██░░██───██░░██──██░░██─────██░░██─────██░░██─────────
--─██░░██─────────██░░████████░░██───██░░██──██░░██─██░░██──██░░██─██░░██████████────██░░██████████─██░░██─────────██░░████████░░██─────██░░██───██░░██████░░██─────██░░██─────██░░██████████─
--─██░░██──██████─██░░░░░░░░░░░░██───██░░██──██░░██─██░░██──██░░██─██░░░░░░░░░░██────██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░░░██─────██░░██───██░░░░░░░░░░██─────██░░██─────██░░░░░░░░░░██─
--─██░░██──██░░██─██░░██████░░████───██░░██──██░░██─██░░██──██░░██─██░░██████████────██████████░░██─██░░██─────────██░░██████░░████─────██░░██───██░░██████████─────██░░██─────██████████░░██─
--─██░░██──██░░██─██░░██──██░░██─────██░░██──██░░██─██░░░░██░░░░██─██░░██────────────────────██░░██─██░░██─────────██░░██──██░░██───────██░░██───██░░██─────────────██░░██─────────────██░░██─
--─██░░██████░░██─██░░██──██░░██████─██░░██████░░██─████░░░░░░████─██░░██████████────██████████░░██─██░░██████████─██░░██──██░░██████─████░░████─██░░██─────────────██░░██─────██████████░░██─
--─██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░░░░░░░░░██───████░░████───██░░░░░░░░░░██────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░░░░░██─██░░██─────────────██░░██─────██░░░░░░░░░░██─
--─██████████████─██████──██████████─██████████████─────██████─────██████████████────██████████████─██████████████─██████──██████████─██████████─██████─────────────██████─────██████████████─
--────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

-- ▀█▀ █░█ ▄▀█ █▄░█ █▄▀ █▀   █▀▀ █▀█ █▀█   █▀▄ █▀█ █░█░█ █▄░█ █░░ █▀█ ▄▀█ █▀▄ █ █▄░█ █▀▀
-- ░█░ █▀█ █▀█ █░▀█ █░█ ▄█   █▀░ █▄█ █▀▄   █▄▀ █▄█ ▀▄▀▄▀ █░▀█ █▄▄ █▄█ █▀█ █▄▀ █ █░▀█ █▄█

local zapoceo = false
local vocka = getujRandomItem(Config.VockiceItemi)
local koldovan = false
local vreme = Config.CooldownTime * 1000
local vremeO = vreme / 1000

Citizen.CreateThread(function()
    for i, v in pairs(Config.Blipovi) do
        local blip = AddBlipForCoord(v.Kordinate.x, v.Kordinate.y, v.Kordinate.z)

        SetBlipSprite(blip, v.Ikonica)

        if v.Boja ~= nil then
            SetBlipColour(blip, v.Boja)
        end

        SetBlipDisplay(blip, v.Pokazuj)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.Ime) -- Stavi ime blipu
        EndTextCommandSetBlipName(blip)


        local display = v.Pokazuj

        SetBlipDisplay(blip, display)
    end
end)

Citizen.CreateThread(function ()
    --- # NPCS
    for k,v in pairs(Config.Npcs) do
        RequestModel(GetHashKey(v.hashpeda))
        while not HasModelLoaded(GetHashKey(v.hashpeda)) do
          Wait(1)
        end
        PostaviPeda = CreatePed(4, v.hashpeda, vector3(v.pedkorde.x, v.pedkorde.y, v.pedkorde.z -1) , v.pedkorde.w, false, true)
        TaskStartScenarioInPlace(PostaviPeda, "WORLD_HUMAN_CLIPBOARD", 0, true)
        FreezeEntityPosition(PostaviPeda, true) 
        SetEntityInvincible(PostaviPeda, true)
        SetBlockingOfNonTemporaryEvents(PostaviPeda, true)

        exports.qtarget:AddBoxZone("ped", vector3(v.pedkorde.x, v.pedkorde.y, v.pedkorde.z -1), 1, 1, {
            name="ped",
            heading=v.pedkorde.w,
            debugPoly=false,
            minZ=v.pedkorde.z -1,
            maxZ=v.pedkorde.z +2,
            }, {
              options = {
                {
                  action = function ()
                    TriggerEvent('GS_FruitFarmer:libMenu')
                  end,
                  icon = v.icon,
                  label = TranslateCap('farmernpctext'),
                },
              },
              distance = 3.5
          })
    end
    
    -----------------------------------
    --- # Drva // Woods
    for k,v in pairs(Config.Targets) do
        exports.qtarget:AddBoxZone("drvo", vector3(v.korde.x, v.korde.y, v.korde.z -1), 1, 1, {
            name="drvo",
            heading=v.korde.w,
            debugPoly=false,
            minZ=v.korde.z -1,
            maxZ=v.korde.z +2,
            }, {
              options = {
                {
                  action = function ()
                    if not koldovan then
                        local uspeo = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 0.5}, 'easy'}, {'1', '2', '3', '4'})
                        if uspeo then
                            progressbar(TranslateCap('picking'),v.PickingTime * 1000,v.PickingDict,v.PickingClip,'')
                            TriggerServerEvent('GS_FruitFarmer:uv', vocka)
                            if Config.UseCooldown then
                                koldovan = true
                                Wait(vreme)
                                koldovan = false
                            end
                        else
                            obavesti(TranslateCap('failed'),TranslateCap('failedesc'),'inform','top',2000)
                        end
                    else
                        obavesti(TranslateCap('cooldown'),TranslateCap('cooldowndesc')..vremeO..TranslateCap('seconds'),'inform','top',4000)
                    end
                  end,
                  icon = 'fas fa-tree',
                  label = TranslateCap('woodtext'),
                  canInteract = function ()
                    if zapoceo then
                        return true
                    else
                        return false
                    end
                  end
                },
              },
              distance = 3.5
          })
    end
end)

Citizen.CreateThread(function ()
    for k,v in pairs(Config.Npcs2) do
        RequestModel(GetHashKey(v.hashpeda))
          while not HasModelLoaded(GetHashKey(v.hashpeda)) do
            Wait(1)
          end
          PostaviPeda = CreatePed(4, v.hashpeda, vector3(v.kordepeda.x, v.kordepeda.y, v.kordepeda.z -1) , v.kordepeda.w, false, true)
          TaskStartScenarioInPlace(PostaviPeda, "WORLD_HUMAN_CLIPBOARD", 0, true)
          FreezeEntityPosition(PostaviPeda, true) 
          SetEntityInvincible(PostaviPeda, true)
          SetBlockingOfNonTemporaryEvents(PostaviPeda, true)
  
          exports.qtarget:AddBoxZone("ped", vector3(v.kordepeda.x, v.kordepeda.y, v.kordepeda.z -1), 1, 1, {
              name="ped",
              heading=v.kordepeda.w,
              debugPoly=false,
              minZ=v.kordepeda.z -1,
              maxZ=v.kordepeda.z +2,
              }, {
                options = {
                  {
                    action = function ()
                      TriggerEvent('GS_FruitFarmer:sellLibMenu')
                    end,
                    icon = v.icon,
                    label = TranslateCap('farmernpctext2'),
                  },
                },
                distance = 3.5
            })
    end
end)

-- # MENU
RegisterNetEvent('GS_FruitFarmer:libMenu', function()
    lib.registerContext({
      id = 'jobmenu',
      title = TranslateCap('dutytitle'),
      options = {
        {
          title = TranslateCap('leaveduty'),
          description = TranslateCap('leavedutyd'),
          icon = 'fa-solid fa-xmark',
          onSelect = function ()
            zapoceo = false
          end,
          disabled = not zapoceo
        },
        {
          title = TranslateCap('joindutytitle'),
          description = '',
          icon = 'fa-solid fa-check',
          onSelect = function ()
            zapoceo = true
            obavesti(TranslateCap('joineduty'),TranslateCap('gocollect'),'success','top',2000)
          end,
          disabled = zapoceo,
        },
      }
    })
    lib.showContext('jobmenu')
end)

RegisterNetEvent('GS_FruitFarmer:sellLibMenu', function()
    lib.registerContext({
        id = 'buyermenu',
        title = TranslateCap('buyer'),
        options = {
        {
            title = TranslateCap('selltitle'),
            description = TranslateCap('selltdesc'),
            icon = 'fas fa-money-bill',
            onSelect = function ()
                local input = lib.inputDialog(TranslateCap('buyer'), {
                    {type = 'number', label = TranslateCap('sellitemt'), description = TranslateCap('itemnumbers'), icon = 'hashtag', required = true},
                })

                if not input then return end

                if input[1] == 1 then
                    local stvar = Config.VockiceItemi[2]
                    local cena = Config.Cene[2]
                    ESX.TriggerServerCallback('GS_FruitFarmer:proveriItem', function (jes)
                        if jes then
                            progressbar(TranslateCap('buyerthinking'),5000,'"misshair_shop@hair_dressers','keeper_base','')
                            TriggerServerEvent('GS_FruitFarmer:pv', stvar, cena)
                        else
                            obavesti(TranslateCap('error'),TranslateCap('noitem'),'error','top',2000)
                        end
                    end, stvar)
                elseif input[1] == 2 then
                    local stvar2 = Config.VockiceItemi[1]
                    local cena2 = Config.Cene[1]
                    ESX.TriggerServerCallback('GS_FruitFarmer:proveriItem', function (jes)
                        if jes then
                            progressbar(TranslateCap('buyerthinking'),5000,'"misshair_shop@hair_dressers','keeper_base','')
                            TriggerServerEvent('GS_FruitFarmer:pv', stvar2, cena2)
                        else
                            obavesti(TranslateCap('error'),TranslateCap('noitem'),'error','top',2000)
                        end
                    end, stvar2)
                end
            end,
        },
        }
    })
    lib.showContext('buyermenu')
end)