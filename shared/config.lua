Config = {}

Config.Debug = false

Config.MixerWaitTime = 30 -- How long it takes till the mixer has finished mixing -- Time in seconds 
Config.OvenWaitTime = 40 -- How long it takes till the oven has finished cooking -- Time in seconds

Config.Payment = 'qb' -- If your using jim-payments then change this to 'jim'

Config.FridgeItems = {
    label = 'Fridge',
    slots = 20,
    items = {
        [1] = {name = 'butter', price = 0, amount = 50, info = {}, type = 'item', slot = 1},
        [2] = {name = 'milk', price = 0, amount = 50, info = {}, type = 'item', slot = 2},
        [3] = {name = 'tomatosauce', price = 0, amount = 50, info = {}, type = 'item', slot = 3}
        -- add more here
    }
}

Config.StaffFridgeItems = {
    label = 'Fridge',
    slots = 20,
    items = {
        [1] = {name = 'water_bottle', price = 0, amount = 50, info = {}, type = 'item', slot = 1},
        [2] = {name = 'tosti', price = 0, amount = 50, info = {}, type = 'item', slot = 2},
        [3] = {name = 'kurkakola', price = 0, amount = 50, info = {}, type = 'item', slot = 3}
        -- add more here
    }
}

Config.CupboardItems = {
    label = 'Cupboard',
    slots = 20,
    items = {
        [1] = {name = 'salt', price = 0, amount = 50, info = {}, type = 'item', slot = 1},
        [2] = {name = 'flour', price = 0, amount = 50, info = {}, type = 'item', slot = 2}
        -- add more here
    }
}

Config.ColdDrinks = {
    label = 'Cold Drinks',
    slots = 20,
    items = {
        [1] = {name = 'kurkakola', price = 0, amount = 50, info = {}, type = 'item', slot = 1}
        -- add more here
    }
}