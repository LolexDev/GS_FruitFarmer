Config = {}

Config.Locale = 'en' -- Jezik // Language
Config.ItemCount = math.random(3) -- Koliko ce dobiti vockica kad uberu // How much will they get fruits/items when they pick it
Config.UseCooldown = true -- Da li zelite da imaju cooldown? // Use cooldown?
Config.CooldownTime = 10 -- U sekundama // In seconds

Config.Blipovi = { -- Blips
    {
        Ime = "Vocar", -- Ime blipa // Name of blip // Fruiter
        Velicina = 1, -- Velicina blipa // Size of blip
        Boja = 2, -- Boja blipa // Color of blip (https://docs.fivem.net/docs/game-references/blips/)
        Ikonica = 280, -- Blip sprite // Blip sprite (https://docs.fivem.net/docs/game-references/blips/)
        Kordinate = vector3(2352.5325, 4743.8237, 34.3808), -- Kordinate blipa // Coords of blip
        Pokazuj = 2, -- Display
    },
    {
        Ime = "Kupac Voca", -- Ime blipa // Name of blip // Fruit Buyer
        Velicina = 1, -- Velicina blipa // Size of blip
        Boja = 2, -- Boja blipa // Color of blip (https://docs.fivem.net/docs/game-references/blips/)
        Ikonica = 280, -- Blip sprite // Blip sprite (https://docs.fivem.net/docs/game-references/blips/)
        Kordinate = vector3(2434.4604, 5011.5161, 46.8286), -- Kordinate blipa // Coords of blip
        Pokazuj = 2, -- Display
    },
}

Config.VockiceItemi = { -- Koje voce/iteme ce dobijati // What fruits/items will they get
    'jabuka', -- Apple
    'narandza', -- Orange
    -- Dodajte jos ako zelite // Add more if u want
}

Config.Targets = { -- Drva // Trees
    {
        korde = vector4(2364.6272, 4730.1216, 34.1842, 209.8809), -- Kordinate drveta // Coords of tree
        PickingTime = 5, -- U sekundama // In seconds
        PickingClip = 'base', -- Animation clip
        PickingDict = 'amb@prop_human_movie_bulb@base', -- Animation dict
    },
    {
        korde = vector4(2374.2729, 4735.2993, 33.7345, 250.7420), -- Kordinate drveta // Coords of tree
        PickingTime = 5, -- U sekundama // In seconds
        PickingClip = 'base', -- Animation clip
        PickingDict = 'amb@prop_human_movie_bulb@base', -- Animation dict
    },
    {
        korde = vector4(2366.4734, 4716.2188, 34.3182, 219.9684), -- Kordinate drveta // Coords of tree
        PickingTime = 5, -- U sekundama // In seconds
        PickingClip = 'base', -- Animation clip
        PickingDict = 'amb@prop_human_movie_bulb@base', -- Animation dict
    },
    {
        korde = vector4(2359.6858, 4723.6196, 34.5409, 59.3428), -- Kordinate drveta // Coords of tree
        PickingTime = 5, -- U sekundama // In seconds
        PickingClip = 'base', -- Animation clip
        PickingDict = 'amb@prop_human_movie_bulb@base', -- Animation dict
    },
    {
        korde = vector4(2386.4456, 4736.0630, 33.2528, 274.4651), -- Kordinate drveta // Coords of tree
        PickingTime = 5, -- U sekundama // In seconds
        PickingClip = 'base', -- Animation clip
        PickingDict = 'amb@prop_human_movie_bulb@base', -- Animation dict
    },

    -- Dodajte jos ako je potrebno kao sto sam ja // Add more if you need but do it the way how i did
}

Config.Npcs = {
    {
        -- # Sef // Boss
        icon = 'fas fa-user', -- Ikonica // Icon (https://fontawesome.com/icons)
        hashpeda = 'a_m_m_farmer_01', -- Hash of ped (https://docs.fivem.net/docs/game-references/ped-models/)
        pedkorde = vector4(2352.5325, 4743.8237, 34.3808, 307.7117), -- Kordinate peda // Coords of ped
        -- Ovaj npc je sef kod kojeg zapocinjes i zavrsavas posao // This npc is boss where u start and finish the job
    },
}

Config.Npcs2 = {
    {
        -- # Prodaja // Sell
        icon = 'fas fa-user', -- Ikonica // Icon (https://fontawesome.com/icons)
        hashpeda = 'a_m_m_farmer_01', -- Hash of ped (https://docs.fivem.net/docs/game-references/ped-models/)
        kordepeda = vector4(2434.4604, 5011.5161, 46.8286, 324.2901), -- Kordinate peda // Coords of ped
    }
}

Config.Cene = { -- Prices
    5, -- Jabuka // Apple
    10, -- Narandza // Orange
}