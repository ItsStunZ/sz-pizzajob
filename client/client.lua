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

local blip = AddBlipForCoord(805.11, -751.4)
SetBlipSprite(blip, 267)
SetBlipDisplay(blip, 6)
SetBlipScale(blip, 0.7)
SetBlipColour(blip, 1)
SetBlipAsShortRange(blip, true)
BeginTextCommandSetBlipName('STRING')
AddTextComponentString('PizzaThis')
EndTextCommandSetBlipName(blip)

-- I know this being here isn't necessary but I remove it and it causes errors. I look more into this soon
function QBCore.Functions.Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    exports['progressbar']:Progress({
        name = label:lower(),
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

local function paymentMenu()
    local dialog = exports['qb-input']:ShowInput({
        header = 'Create Reciept',
        submitText = 'Submit',
        inputs = {
            {
                text = 'ID',
                name = 'id',
                type = 'number',
                isRequire = true,
            },
            {
                text = 'Amount',
                name = 'amount',
                type = 'number',
            },
            {
                text = 'Bill Type',
                name = 'billtype',
                type = 'radio',
                options = {
                    { value = 'cash', text = 'Cash' },
                    { value = 'bank', text = 'Bank' }
                },
            },
        },
    })

    if dialog ~= nil then
        TriggerServerEvent('sz-pizzajob:server:payment', {
            id = tonumber(dialog.id),
            amount = tonumber(dialog.amount),
            billtype = dialog.billtype
        })
    end
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

-- Box Pizza
exports['qb-target']:AddBoxZone('sz-pizzajob:boxpizza', vector3(811.27, -753.67, 26.78), 3.2, 1, {
    name = 'sz-pizzajob:boxpizza',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 22.63,
    maxZ = 26.63,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:boxpizzamenu',
            icon = 'fas fa-box',
            label = 'Box Pizza',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Make Wine
exports['qb-target']:AddBoxZone('sz-pizzajob:makewine', vector3(813.99, -749.35, 26.78), 0.9, 0.4, {
    name = 'sz-pizzajob:makewine',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 26.93,
    maxZ = 27.53,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:makewine',
            icon = 'fas fa-wine-glass',
            label = 'Pour PizzaThis Special Wine',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1.3,
})

-- Cupboard
exports['qb-target']:AddBoxZone('sz-pizzajob:cupboard', vector3(806.04, -764.87, 26.78), 1.4, 0.2, {
    name = 'sz-pizzajob:cupboard',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 25.68,
    maxZ = 28.08,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:OpenCupboard',
            icon = 'fas fa-door-open',
            label = 'Open Cupboard',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Cold Drinks
exports['qb-target']:AddBoxZone('sz-pizzajob:colddrinks', vector3(811.48, -765.2, 26.78), 0.75, 0.5, {
    name = 'sz-pizzajob:cuboard',
    heading = 359,
    debugPoly = Config.Debug,
    minZ = 26.53,
    maxZ = 27.23,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:OpenColdDrink',
            icon = 'fas fa-snowflake',
            label = 'Cold Drinks',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1.5,
})

-- Till 1
exports['qb-target']:AddBoxZone('sz-pizzajob:till1', vector3(811.3, -751.99, 26.78), 0.55, 0.3, {
    name = 'sz-pizzajob:till1',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 26.63,
    maxZ = 27.03,
}, {
    options = {
        {
            icon = 'fas fa-credit-card',
            label = 'Charge Customer',
            action = function()
                local Player = QBCore.Functions.GetPlayerData()
                local jobDuty = Player.job.onduty
                if not jobDuty then
                    QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
                    return
                end
                if Config.Payment == 'jim' then
                    TriggerEvent('jim-payments:client:Charge')
                elseif Config.Payment == 'qb' then
                    paymentMenu()
                end 
            end,
            job = 'pizzathis',
            img = nil,
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1.5,
})

-- Till 2
exports['qb-target']:AddBoxZone('sz-pizzajob:till2', vector3(811.29, -750.66, 26.78), 0.55, 0.3, {
    name = 'sz-pizzajob:till2',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 26.63,
    maxZ = 27.03,
}, {
    options = {
        {
            icon = 'fas fa-credit-card',
            label = 'Charge Customer',
            action = function()
                local Player = QBCore.Functions.GetPlayerData()
                local jobDuty = Player.job.onduty
                if not jobDuty then
                    QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
                    return
                end
                if Config.Payment == 'jim' then
                    TriggerEvent('jim-payments:client:Charge')
                elseif Config.Payment == 'qb' then
                    paymentMenu()
                end 
            end,
            job = 'pizzathis',
            img = nil,
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1.5,
})

-- Tray
exports['qb-target']:AddBoxZone('sz-pizzajob:tray', vector3(810.86, -752.29, 26.78), 1.8, 0.4, {
    name = 'sz-pizzajob:tray',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 26.98,
    maxZ = 27.18,
}, {
    options = {
        {
            num = 1,
            icon = 'fas fa-hand-holding',
            label = 'Tray',
            action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
                if IsPedAPlayer(entity) then return false end -- This will return false if the entity interacted with is a player and otherwise returns true
                TriggerEvent("inventory:client:SetCurrentStash", "PizzaThis")
                TriggerServerEvent("inventory:server:OpenInventory", "stash", "PizzaThis", {maxweight = 1000000, slots = 50})
              end,
              canInteract = function(entity, distance, data) -- This will check if you can interact with it, this won't show up if it returns false, this is OPTIONAL
                if IsPedAPlayer(entity) then return false end -- This will return false if the entity interacted with is a player and otherwise returns true
                return true
              end,
              drawColor = {255, 255, 255, 255}, 
              successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1.3
})

-- Storage
exports['qb-target']:AddBoxZone('sz-pizzajob:storage', vector3(802.74, -757.04, 26.78), 0.2, 3.8, {
    name = 'sz-pizzajob:storage',
    heading = 359,
    debugPoly = Config.Debug,
    minZ = 25.78,
    maxZ = 27.88,
}, {
    options = {
        {
            num = 1,
            icon = 'fas fa-box',
            label = 'Storage',
            action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
                if IsPedAPlayer(entity) then return false end -- This will return false if the entity interacted with is a player and otherwise returns true
                TriggerEvent("inventory:client:SetCurrentStash", "PizzaThisStorage")
                TriggerServerEvent("inventory:server:OpenInventory", "stash", "PizzaThisStorage", {maxweight = 1000000, slots = 100})
              end,
              canInteract = function(entity, distance, data) -- This will check if you can interact with it, this won't show up if it returns false, this is OPTIONAL
                if IsPedAPlayer(entity) then return false end -- This will return false if the entity interacted with is a player and otherwise returns true
                return true
              end,
              job = 'pizzathis',
              drawColor = {255, 255, 255, 255}, 
              successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1.3
})

-- Outfits
exports['qb-target']:AddBoxZone('sz-pizzajob:outfits', vector3(812.83, -762.73, 31.27), 0.8, 2.0, {
    name = 'sz-pizzajob:outfits',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 30.27,
    maxZ = 32.27,
}, {
    options = {
        {
            type = 'client',
            event = 'qb-clothing:client:openOutfitMenu',
            icon = 'fas fa-shirt',
            label = 'Outfits',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 2
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

RegisterNetEvent('sz-pizzajob:client:makewine', function()
    local Player = QBCore.Functions.GetPlayerData()
    local jobDuty = Player.job.onduty
    if not jobDuty then
        QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
    else
        local args = {
            returnItems = {'wine'}
        }
        QBCore.Functions.Progressbar('make_wine', 'Pouring Wine...', math.random(3000, 5000), false, true, {
            TriggerEvent('animations:client:EmoteCommandStart', {'handshake'}),
            disableMovement = true,
            disableMouse = false, 
            disableCombat = true
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent('sz-pizzajob:server:giveitem', args)
        end, function ()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)

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
                header = 'Pizza Base',
                txt = 'Dough x1, Tomato Sauce x1',
                icon = 'fas fa-pizza-slice',
                disabled = hasItems({'dough', 'tomatosauce'}),
                params = {
                    event = 'sz-pizzajob:client:makepizzabase',
                    args = {
                        returnItems = {'pizzabase'},
                        removeItems = {'tomatosauce', 'dough'},
                        amount = 1
                    }
                }
            }
        })
    end
end)

RegisterNetEvent('sz-pizzajob:client:makepizzabase', function(args)
    QBCore.Functions.Progressbar('make_base', 'Making Pizza Base', 10000, false, true, {
        TriggerEvent('animations:client:EmoteCommandStart', {'cpr2'}),
        disableMovement = true,
        disableMouse = false, 
        disableCombat = true
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sz-pizzajob:server:removeitem', args)
        TriggerServerEvent('sz-pizzajob:server:giveitem', args)
    end, function ()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
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

RegisterNetEvent('sz-pizzajob:client:eat', function(item, label, duration, newHunger, newThirst, emote)
    QBCore.Functions.Progressbar(item, label, duration, false, true, {
        TriggerEvent('animations:client:EmoteCommandStart', {emote}),
        disableMovement = false,
        disableMouse = false, 
        disableCombat = false
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sz-pizzajob:server:removeeatitem', item, 1)
        TriggerServerEvent('sz-pizzajob:server:addMetaData', newHunger, newThirst)
    end, function ()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sz-pizzajob:client:drink', function(item, label, duration, newHunger, newThirst, emote)
    QBCore.Functions.Progressbar(item, label, duration, false, true, {
        TriggerEvent('animations:client:EmoteCommandStart', {emote}),
        disableMovement = false,
        disableMouse = false, 
        disableCombat = false
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sz-pizzajob:server:removeeatitem', item, 1)
        TriggerServerEvent('sz-pizzajob:server:addMetaData', newHunger, newThirst)
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

RegisterNetEvent('sz-pizzajob:client:OpenCupboard', function()
    local Player = QBCore.Functions.GetPlayerData()
    local jobDuty = Player.job.onduty
    if not jobDuty then
        QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
    else
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "CuboardItems", Config.CupboardItems)
    end
end)

RegisterNetEvent('sz-pizzajob:client:OpenColdDrink', function()
    local Player = QBCore.Functions.GetPlayerData()
    local jobDuty = Player.job.onduty
    if not jobDuty then
        QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
    else
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "ColdDrinks", Config.ColdDrinks)
    end
end)

RegisterNetEvent('sz-pizzajob:client:OpenStaffFridge', function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "StaffFridgeItems", Config.StaffFridgeItems)
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
                    event = 'sz-pizzajob:server:giveitem',
                    args = {
                        returnItems = {'gratedcheese'},
                        amount = 1
                    }
                }
            },
            {
                header = 'Sliced Pepperoni',
                icon = 'fas fa-hand-holding',
                params = {
                    isServer = true,
                    event = 'sz-pizzajob:server:giveitem',
                    args = {
                        returnItems = {'slicedpepperoni'},
                        amount = 1
                    }
                }
            },
            {
                header = 'Sliced Jalapenos',
                icon = 'fas fa-hand-holding',
                params = {
                    isServer = true,
                    event = 'sz-pizzajob:server:giveitem',
                    args = {
                        returnItems = {'slicedjalapenos'},
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
                        returnItems = {'uncookedpepperonipizza'},
                        label = 'Pepperoni Pizza',
                        removeItems = {'pizzabase', 'gratedcheese', 'slicedpepperoni'},
                        amount = 1
                    }
                }
            },
            {
                header = 'Cheese Pizza',
                txt = 'Pizza Base x1, Grated Cheese x1',
                icon = 'fas fa-pizza-slice',
                disabled = hasItems({'pizzabase', 'gratedcheese'}),
                params = {
                    event = 'sz-pizzajob:client:givepizza',
                    args = {
                        returnItems = {'uncookedcheesepizza'},
                        label = 'Cheese Pizza',
                        removeItems = {'pizzabase', 'gratedcheese'},
                        amount = 1
                    }
                }
            },
            {
                header = 'Jalapeno & Pepperoni Pizza',
                txt = 'Pizza Base x1, Grated Cheese x1, Pepperoni x1, Sliced Jalapenos x1',
                icon = 'fas fa-pizza-slice',
                disabled = hasItems({'pizzabase', 'gratedcheese', 'slicedpepperoni', 'slicedjalapenos'}),
                params = {
                    event = 'sz-pizzajob:client:givepizza',
                    args = {
                        returnItems = {'uncookedjalapenoandpepperonipizza'},
                        label = 'Cheese Pizza',
                        removeItems = {'pizzabase', 'gratedcheese', 'slicedpepperoni', 'slicedjalapenos'},
                        amount = 1
                    }
                }
            }
        })
    end
end)

RegisterNetEvent('sz-pizzajob:client:givepizza', function(args)
    QBCore.Functions.Progressbar('preparingpizza', 'Preparing ' .. args.label, math.random(5000, 10000), false, true, {
        TriggerEvent('animations:client:EmoteCommandStart', {'cpr2'}),
        disableMovement = true,
        disableMouse = false, 
        disableCombat = true
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sz-pizzajob:server:removeitem', args)
        TriggerServerEvent('sz-pizzajob:server:giveitem', args)
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
                        returnItems = {'pepperonipizza'},
                        removeItems = {'uncookedpepperonipizza'},
                        amount = 1
                    }
                }
            },
            {
                header = 'Cheese Pizza',
                txt = 'Uncooked Cheese Pizza x1',
                icon = 'fas fa-pizza-slice',
                disabled = hasItems({'uncookedcheesepizza'}),
                params = {
                    event = 'sz-pizzajob:client:useoven',
                    args = {
                        returnItems = {'cheesepizza'},
                        removeItems = {'uncookedcheesepizza'},
                        amount = 1
                    }
                }
            },
            {
                header = 'Jalapeno & Pepperoni Pizza',
                txt = 'Uncooked Jalapeno & Pepperoni Pizza x1',
                icon = 'fas fa-pizza-slice',
                disabled = hasItems({'uncookedjalapenoandpepperonipizza'}),
                params = {
                    event = 'sz-pizzajob:client:useoven',
                    args = {
                        returnItems = {'jalapenoandpepperonipizza'},
                        removeItems = {'uncookedjalapenoandpepperonipizza'},
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
        TriggerEvent('animations:client:EmoteCommandStart', {'handshake'})
        Wait(2000)
        TriggerEvent('animations:client:EmoteCommandStart', {'c'})
        TriggerServerEvent('sz-pizzajob:server:removeitem', args)
        QBCore.Functions.Notify('Cooking Pizza', 'primary', 3000)
        Wait(Config.OvenWaitTime * 1000)
        QBCore.Functions.Notify('Pizza is ready!', 'success', 3000)
        TriggerServerEvent('sz-pizzajob:server:giveitem', args)
        overInUse = false
    end
end)

RegisterNetEvent('sz-pizzajob:client:boxpizzamenu', function(args)
    local Player = QBCore.Functions.GetPlayerData()
    local jobDuty = Player.job.onduty
    if not jobDuty then
        QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
    else
        exports['qb-menu']:openMenu({
            {
                header = 'Box Pizza',
                icon = 'fas fa-box',
                isMenuHeader = true,
            },
            {
                header = 'Pepperoni Pizza',
                txt = 'Pepperoni Pizza x1',
                icon = 'fas fa-pizza-slice',
                disabled = hasItems({'pepperonipizza'}),
                params = {
                    event = 'sz-pizzajob:client:boxpizza',
                    args = {
                        removeItems = {'pepperonipizza'},
                        returnItems = {'pepperonipizzabox'},
                        label = 'Pepperoni Pizza',
                        amount = 1
                    }
                }
            },
            {
                header = 'Cheese Pizza',
                txt = 'Cheese Pizza x1',
                icon = 'fas fa-pizza-slice',
                disabled = hasItems({'cheesepizza'}),
                params = {
                    event = 'sz-pizzajob:client:boxpizza',
                    args = {
                        removeItems = {'cheesepizza'},
                        returnItems = {'cheesepizzabox'},
                        label = 'Cheese Pizza',
                        amount = 1
                    }
                }
            },
            {
                header = 'Jalapeno & Pepperoni Pizza',
                txt = 'Jalapeno & Pepperoni Pizza x1',
                icon = 'fas fa-pizza-slice',
                disabled = hasItems({'jalapenoandpepperonipizza'}),
                params = {
                    event = 'sz-pizzajob:client:boxpizza',
                    args = {
                        removeItems = {'jalapenoandpepperonipizza'},
                        returnItems = {'jalapenoandpepperonipizzabox'},
                        label = 'Jalapeno & Pepperoni Pizza',
                        amount = 1
                    }
                }
            }
        })
    end
end)

RegisterNetEvent('sz-pizzajob:client:boxpizza', function(args)
    QBCore.Functions.Progressbar(args.returnItem, 'Collecting Pizza Box', 5000, false, true, {
        TriggerEvent('animations:client:EmoteCommandStart', {'inspect'}),
        disableMovement = true,
        disableMouse = false, 
        disableCombat = true
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {'carrypizza'})
        Wait(500)
        TriggerEvent('animations:client:EmoteCommandStart', {'c'})
        QBCore.Functions.Progressbar(args.returnItem, 'Boxing ' .. args.label, 4000, false, true, {
            TriggerEvent('animations:client:EmoteCommandStart', {'pull'}),
            disableMovement = true,
            disableMouse = false, 
            disableCombat = true
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {'carrypizza'})
            Wait(500)
            TriggerEvent('animations:client:EmoteCommandStart', {'c'})
            TriggerServerEvent('sz-pizzajob:server:giveitem', args)
            TriggerServerEvent('sz-pizzajob:server:removeitem', args)
        end, function ()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end, function ()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sz-pizzajob:client:confirmationRecipt', function(data)
    local dialog = exports['qb-input']:ShowInput({
        header = 'Confirmation Recipt',
        submitText = 'Confirm',
        inputs = {
            {
                text = 'Confirmation Recipt For $' .. data.amount,
                name = 'confirmation',
                type = 'radio',
                options = {
                    { value = 'confirm', text = 'Confirm' },
                    { value = 'deny', text = 'Deny' }
                }
            }
        },
    })

    if dialog ~= nil then
        for k, v in pairs(dialog) do
            if v == 'confirm' then
                TriggerServerEvent('sz-pizzajob:server:removeMoney', {
                    amount = data.amount,
                    billtype = data.billtype
                })
                TriggerServerEvent('sz-pizzajob:server:notify', { src = data.employeeSource, text = 'Payment Accepted!', type = 'success', length =  5000 })
                return
            elseif v == 'deny' then
                TriggerServerEvent('sz-pizzajob:server:notify',  { src = data.employeeSource, text = 'Payment Denied!', type = 'error', length = 5000 })
                return
            end
        end
    end
end)