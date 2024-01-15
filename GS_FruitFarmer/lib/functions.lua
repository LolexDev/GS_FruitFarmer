function progressbar(message, time,dict,clip,scenario)
    lib.progressCircle({
        duration = time,
        position = 'bottom',
        label = message,
        useWhileDead = false,
        canCancel = false,
        disable = {
          move = true,
          combat = true,
          mouse = false,
          car = true,
        },
        anim = {
          dict = dict,
          clip = clip,
          scenario = scenario
        }
      })
end

function obavesti(naslov,deskripcija,type,pozicija,vreme)
    lib.notify({
        title = naslov,
        description = deskripcija,
        type = type,
        position = pozicija,
        duration = vreme,
    })
end

function getujRandomItem(tabela)
  local nasumicanIndex = math.random(1, #tabela)
  return tabela[nasumicanIndex]
end
