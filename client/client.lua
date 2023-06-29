local QBCore = exports['qb-core']:GetCoreObject()

local overInUse = false -- DO NOT CHANGE THIS

-- Functions
local function hasItems(items)
    for _, v in pairs(items) do
        if not QBCore.Functions.HasItem(v) then
            return true
        end
    end
    return false
end

function QBCore.Functions.Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel) --not sure what this is here for unless youre trying to create a global progressbar
    exports['progressbar']:Progress({
        name = name:lower(),
        duration = duration,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        controlDisables = disableControls,
        animation = animation,
        prop = prop,
        propTwo = propTwo,
    }, function(cancelled)
        if not cancelled then
            if onFinish then
                onFinish()
            end
        else
            if onCancel then
                onCancel()
            end
        end
    end)
end

-- Targets
-- Duty
exports['qb-target']:AddBoxZone('sz-pizzajob:duty', vector3(804.41, -760.53, 31.27), 0.4, 0.4, {
    name = 'sz-pizzajob:duty',
    heading = 2,
    debugPoly = Config.Debug,
    minZ = 31.02,
    maxZ = 31.42,
}, {
    options = {
        {
            num = 1,
            type = 'server',
            event = 'QBCore:ToggleDuty',
            icon = 'fas fa-laptop',
            label = 'Duty',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1.2,
})

-- Boss Menu
exports['qb-target']:AddBoxZone('sz-pizzajob:bossmenu', vector3(794.97, -767.02, 31.27), 0.2, 0.4, {
    name = 'sz-pizzajob:bossmenu',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 31.22,
    maxZ = 31.57,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'qb-bossmenu:client:OpenMenu',
            icon = 'fas fa-computer',
            label = 'Management',
            job = {['pizzathis'] = 4, 5},
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Make Fries
exports['qb-target']:AddBoxZone('sz-pizzajob:makefries', vector3(808.35, -761.21, 26.78), 0.6, 0.7, {
    name = 'sz-pizzajob:makefries',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 0.6,
    maxZ = 0.7,
}, {
    options = {
        {
            num = 1,
            type = 'server',
            event = '',
            icon = 'fas fa-utensils',
            label = 'Make Fries',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Fridge
exports['qb-target']:AddBoxZone('sz-pizzajob:openfridge', vector3(805.93, -761.68, 26.78), 1.4, 0.2, {
    name = 'sz-pizzajob:openfridge',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 26.08,
    maxZ = 28.08,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:OpenFridge',
            icon = 'fas fa-snowflake',
            label = 'Open Fridge',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Staff Fridge
exports['qb-target']:AddBoxZone('sz-pizzajob:staff_fridge', vector3(799.77, -758.79, 31.27), 0.8, 0.8, {
    name = 'sz-pizzajob:staff_fridge',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 30.17,
    maxZ = 32.17,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:OpenStaffFridge',
            icon = 'fas fa-snowflake',
            label = 'Open Fridge',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})


-- Make Dough
exports['qb-target']:AddBoxZone('sz-pizzajob:makedough', vector3(805.99, -757.23, 26.78), 1.0, 0.8, {
    name = 'sz-pizzajob:makedough',
    heading = 41,
    debugPoly = Config.Debug,
    minZ = 25.78,
    maxZ = 27.33,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:makedough',
            icon = 'fas fa-power-off',
            label = 'Make Dough',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Prepare Pizza
exports['qb-target']:AddBoxZone('sz-pizzajob:makepizzabase', vector3(807.64, -756.87, 26.78), 0.6, 1.9, {
    name = 'sz-pizzajob:makepizzabase',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 26.43,
    maxZ = 26.78,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:makepizzabasemenu',
            icon = 'fas fa-pizza-slice',
            label = 'Make Pizza Base',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Make Fries
exports['qb-target']:AddBoxZone('sz-pizzajob:makefries', vector3(808.35, -761.19, 26.78), 0.7, 0.6, {
    name = 'sz-pizzajob:makefries',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 26.58,
    maxZ = 26.78,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:makefries',
            icon = 'fas fa-utensils',
            label = 'Make Fries',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Wash Hands
exports['qb-target']:AddBoxZone('sz-pizzajob:washhands', vector3(809.49, -765.18, 26.78), 0.5, 0.7, {
    name = 'sz-pizzajob:washhands',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 26.68,
    maxZ = 26.83,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:washhands',
            icon = 'fas fa-hands-bubbles',
            label = 'Wash Hands',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Wash Hands Staff
exports['qb-target']:AddBoxZone('sz-pizzajob:washhandsstaff', vector3(801.67, -758.72, 31.27), 0.45, 0.6, {
    name = 'sz-pizzajob:washhandsstaff',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 31.12,
    maxZ = 31.32,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:washhands',
            icon = 'fas fa-hands-bubbles',
            label = 'Wash Hands',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Oven
exports['qb-target']:AddBoxZone('sz-pizzajob:useoven', vector3(814.0, -752.91, 26.78), 1.6, 0.8, { 
    name = 'sz-pizzajob:useoven',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 26.98,
    maxZ = 27.68,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:ovenmenu',
            icon = 'fas fa-fire',
            label = 'Use Oven',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Toppings
exports['qb-target']:AddBoxZone('sz-pizzajob:toppings', vector3(812.28, -755.54, 26.78), 0.55, 0.85, {
    name = 'sz-pizzajob:toppings',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 26.73,
    maxZ = 26.98,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:toppingsmenu',
            icon = 'fas fa-hand-holding',
            label = 'Pizza Toppings',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Make Pizza
exports['qb-target']:AddBoxZone('sz-pizzajob:makepizza', vector3(811.42, -754.56, 26.78), 0.4, 0.4, {
    name = 'sz-pizzajob:makepizza',
    heading = 1,
    debugPoly = Config.Debug,
    minZ = 26.68,
    maxZ = 26.88,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:makepizza',
            icon = 'fas fa-pizza-slice',
            label = 'Prepare Pizza',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Events
-- Make Dough
RegisterNetEvent('sz-pizzajob:client:makedough', function()
    local Player = QBCore.Functions.GetPlayerData()
    local jobDuty = Player.job.onduty
    if not jobDuty then
        QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
    else
        exports['qb-menu']:openMenu({
            {
                header = 'Dough Mixer',
                icon = 'fas fa-cloud',
                isMenuHeader = true,
            },
            {
                header = 'Make Dough',
                txt = 'Butter x1, Flour x1, Milk x1, Salt x1',
                icon = 'fas fa-cloud',
                disabled = hasItems({'butter', 'flour', 'milk', 'salt'}),
                params = {
                    isServer = true,
                    event = 'sz-pizzajob:server:makedough',
                    args = {
                        returnItem = 'dough',
                    }
                }
            }
        })
    end
end)

-- Make Fries
RegisterNetEvent('sz-pizzajob:client:makefries', function()
    local Player = QBCore.Functions.GetPlayerData()
    local jobDuty = Player.job.onduty
    if not jobDuty then
        QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
    else
        exports['qb-menu']:openMenu({
            {
                header = 'Make Fries',
                icon = 'fas fa-utensils',
                isMenuHeader = true,
            },
            {
                header = 'Make Fries',
                txt = 'potato x1',
                icon = 'fas fa-utensils',
                disabled = hasItems({'potato'}),
                params = {
                    isServer = true,
                    event = '',
                    args = {
                        returnItem = 'fries'
                    }
                }
            }
        })
    end
end)

-- Make Pizza Base
RegisterNetEvent('sz-pizzajob:client:makepizzabasemenu', function()
    local Player = QBCore.Functions.GetPlayerData()
    local jobDuty = Player.job.onduty
    if not jobDuty then
        QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
    else
        exports['qb-menu']:openMenu({
            {
                header = 'Make Pizza Base',
                icon = 'fas fa-pizza-slice',
                isMenuHeader = true,
            },
            {
                header = 'Make Pizza Base',
                txt = 'Dough x1, Tomato Sauce x1',
                icon = 'fas fa-pizza-slice',
                disabled = hasItems({'dough', 'tomatosauce'}),
                params = {
                    event = 'sz-pizzajob:client:makepizzabase',
                    args = {
                        returnItem = 'pizzabase',
                    }
                }
            }
        })
    end
end)

RegisterNetEvent('sz-pizzajob:client:washhands', function()
    QBCore.Functions.Progressbar('wash_hands', 'Washing Hands', math.random(3000, 6000), false, true, {
        TriggerEvent('animations:client:EmoteCommandStart', {'cleanhands'}),
        disableMovement = true,
        disableMouse = false, 
        disableCombat = true
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end, function ()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sz-pizzajob:client:eat', function(item, label, duration, amount, emote)
    QBCore.Functions.Progressbar(item, label, duration, false, true, {
        TriggerEvent('animations:client:EmoteCommandStart', {emote}),
        disableMovement = false,
        disableMouse = false, 
        disableCombat = false
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sz-pizzajob:server:removeitem', item, 1)
        TriggerServerEvent('sz-pizzajob:server:addHunger', 40)
    end, function ()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sz-pizzajob:client:OpenFridge', function()
    local Player = QBCore.Functions.GetPlayerData()
    local jobDuty = Player.job.onduty
    if not jobDuty then
        QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
    else
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "FridgeItems", Config.FridgeItems)
    end
end)

RegisterNetEvent('sz-pizzajob:client:OpenStaffFridge', function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "StaffFridgeItems", Config.StaffFridgeItems)
end)

RegisterNetEvent('sz-pizzajob:client:makepizzabase', function()
    QBCore.Functions.Progressbar('make_base', 'Making Pizza Base', 10000, false, true, {
        TriggerEvent('animations:client:EmoteCommandStart', {'cpr2'}),
        disableMovement = true,
        disableMouse = false, 
        disableCombat = true
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sz-pizzajob:server:removeitem', 'tomatosauce', 1)
        TriggerServerEvent('sz-pizzajob:server:removeitem', 'dough', 1)
        TriggerServerEvent('sz-pizzajob:server:givepizzabase', 'pizzabase', 1)
    end, function ()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sz-pizzajob:client:toppingsmenu', function()
    local Player = QBCore.Functions.GetPlayerData()
    local jobDuty = Player.job.onduty
    if not jobDuty then
        QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
    else
        exports['qb-menu']:openMenu({
            {
                header = 'Pizza Toppings',
                icon = 'fas fa-pizza-slice',
                isMenuHeader = true,
            },
            {
                header = 'Grated Cheese',
                icon = 'fas fa-hand-holding',
                params = {
                    isServer = true,
                    event = 'sz-pizzajob:server:givetopping',
                    args = {
                        returnItem = 'gratedcheese',
                        amount = 1
                    }
                }
            },
            {
                header = 'Sliced Pepperoni',
                icon = 'fas fa-hand-holding',
                params = {
                    isServer = true,
                    event = 'sz-pizzajob:server:givetopping',
                    args = {
                        returnItem = 'slicedpepperoni',
                        amount = 1
                    }
                }
            },
            {
                header = 'Sliced Meat',
                icon = 'fas fa-hand-holding',
                params = {
                    isServer = true,
                    event = 'sz-pizzajob:server:givetopping',
                    args = {
                        returnItem = 'slicedmeat',
                        amount = 1
                    }
                }
            },
            {
                header = 'Sliced Onions',
                icon = 'fas fa-hand-holding',
                params = {
                    isServer = true,
                    event = 'sz-pizzajob:server:givetopping',
                    args = {
                        returnItem = 'slicedonions',
                        amount = 1
                    }
                }
            }
        })
    end
end)

RegisterNetEvent('sz-pizzajob:client:makepizza', function()
    local Player = QBCore.Functions.GetPlayerData()
    local jobDuty = Player.job.onduty
    if not jobDuty then
        QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
    else
        exports['qb-menu']:openMenu({
            {
                header = 'Choose Pizza',
                icon = 'fas fa-pizza-slice',
                isMenuHeader = true,
            },
            {
                header = 'Pepperoni Pizza',
                txt = 'Pizza Base x1, Grated Cheese x1, Sliced Pepperoni x1',
                icon = 'fas fa-pizza-slice',
                disabled = hasItems({'pizzabase', 'gratedcheese', 'slicedpepperoni'}),
                params = {
                    event = 'sz-pizzajob:client:givepizza',
                    args = {
                        returnItem = 'uncookedpepperonipizza',
                        name = 'Pepperoni Pizza',
                        amount = 1
                    }
                }
            }
        })
    end
end)

RegisterNetEvent('sz-pizzajob:client:givepizza', function(args)
    QBCore.Functions.Progressbar(args.returnItem, 'Preparing ' .. args.name, math.random(5000, 10000), false, true, {
        TriggerEvent('animations:client:EmoteCommandStart', {'cpr2'}),
        disableMovement = true,
        disableMouse = false, 
        disableCombat = true
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sz-pizzajob:server:givepizza', args)
    end, function ()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sz-pizzajob:client:ovenmenu', function()
    local Player = QBCore.Functions.GetPlayerData()
    local jobDuty = Player.job.onduty
    if not jobDuty then
        QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
    else
        exports['qb-menu']:openMenu({
            {
                header = 'Oven',
                icon = 'fas fa-fire',
                isMenuHeader = true,
            },
            {
                header = 'Pepperoni Pizza',
                txt = 'Uncooked Pepperoni Pizza x1',
                icon = 'fas fa-pizza-slice',
                disabled = hasItems({'uncookedpepperonipizza'}),
                params = {
                    event = 'sz-pizzajob:client:useoven',
                    args = {
                        item = 'uncookedpepperonipizza',
                        returnItem = 'pepperonipizza',
                        amount = 1
                    }
                }
            }
        })
    end
end)

RegisterNetEvent('sz-pizzajob:client:useoven', function(args)
    if overInUse then
        QBCore.Functions.Notify('You have already got pizza cooking', 'error', 3000)
    else
        overInUse = true
        TriggerServerEvent('sz-pizzajob:server:removeitem', args.item, 1)
        QBCore.Functions.Notify('Cooking Pizza', 'primary', 3000)
        Wait(Config.OvenWaitTime * 1000)
        QBCore.Functions.Notify('Pizza is ready!', 'success', 3000)
        TriggerServerEvent('sz-pizzajob:server:useoven', args)
        overInUse = false
    end
end)