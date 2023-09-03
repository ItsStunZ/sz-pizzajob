# sz-pizzajob

Pizza job for fhe Gabz Pizzeria MLO (QBCore) https://www.gabzv.com

# Preview

https://youtu.be/O1gYaq_yZTw

# Dependencies

qb-target https://github.com/qbcore-framework/qb-target

qb-menu https://github.com/qbcore-framework/qb-menu

jim-payments https://github.com/jimathy/jim-payments

rpemotes https://github.com/qbcore-framework/rpemotes

# Installation

Drag and drop sz-pizzajob into your resources folder. Ensure it in your cfg after [qb]
Should look something like this.

```
ensure qb-core
ensure [qb]
ensure [standalone]
ensure [voice]
ensure [defaultmaps]
ensure [clothing]

-- Other scripts go here if you want
ensure sz-pizzajob
```

Drag all images from assets/images into your inventory resource

Add this to qb-core/shared/items.lua

```
-- sz-pizzajob
["pizzaslice"]=        {["name"] = "pizzaslice",		["label"] = "Pizzaslice",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pizzaslice.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Freshly made by Pizza This"},
["butter"]=        {["name"] = "butter",		["label"] = "Butter",	["weight"] = 1000, ["type"] = "item",  ["image"] = "butter.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Butter"},
["flour"]=        {["name"] = "flour",		["label"] = "Flour",	["weight"] = 1000, ["type"] = "item",  ["image"] = "flour.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Flour"},
["milk"]=        {["name"] = "milk",		["label"] = "Milk",	["weight"] = 1000, ["type"] = "item",  ["image"] = "milk.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Milk"},
["salt"]=        {["name"] = "salt",		["label"] = "Salt",	["weight"] = 1000, ["type"] = "item",  ["image"] = "salt.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Salt"},
["dough"]=        {["name"] = "dough",		["label"] = "Dough",	["weight"] = 1000, ["type"] = "item",  ["image"] = "dough.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Dough"},
["pizzabase"]=        {["name"] = "pizzabase",		["label"] = "Pizza Base",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pizzabase.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Pizza Base"},
["tomatosauce"]=        {["name"] = "tomatosauce",		["label"] = "Tomato Sauce",	["weight"] = 1000, ["type"] = "item",  ["image"] = "tomatosauce.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Tomato Sauce"},
["slicedpepperoni"]=        {["name"] = "slicedpepperoni",		["label"] = "Sliced Pepperoni",	["weight"] = 1000, ["type"] = "item",  ["image"] = "slicedpepperoni.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Sliced Pepperoni"},
["slicedonions"]=        {["name"] = "slicedonions",		["label"] = "Sliced Onions",	["weight"] = 1000, ["type"] = "item",  ["image"] = "slicedonion.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Sliced Onion"},
["slicedmeat"]=        {["name"] = "slicedmeat",		["label"] = "Sliced Meat",	["weight"] = 1000, ["type"] = "item",  ["image"] = "slicedmeat.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Sliced Meat"},
["gratedcheese"]=        {["name"] = "gratedcheese",		["label"] = "Grated Cheese",	["weight"] = 1000, ["type"] = "item",  ["image"] = "gratedcheese.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Grated Cheese"},
["pepperonipizza"]=        {["name"] = "pepperonipizza",		["label"] = "Pepperoni Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pepperonipizza.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Pepperoni Pizza"},
["uncookedpepperonipizza"]=        {["name"] = "uncookedpepperonipizza",		["label"] = "Uncooked Pepperoni Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "uncookedpepperonipizza.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Uncooked Pepperoni Pizza"},
["pepperonipizzaslice"]=        {["name"] = "pepperonipizzaslice",		["label"] = "Pepperoni Pizza Slice",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pepperonipizzaslice.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Pepperoni Pizza Slice"},
["pizzabox"]=        {["name"] = "pizzabox",		["label"] = "Pizza Box",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pizzabox.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Smell that?"},
["pepperonipizzabox"]=        {["name"] = "pepperonipizzabox",		["label"] = "Pepperoni Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pizzabox.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Smell that?"},
["cheesepizzabox"]=        {["name"] = "cheesepizzabox",		["label"] = "Cheese Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pizzabox.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Smell that?"},
["uncookedcheesepizza"]=        {["name"] = "uncookedcheesepizza",		["label"] = "Uncooked Cheese Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "uncookedcheesepizza.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Uncooked Cheese Pizza"},
["cheesepizzaslice"]=        {["name"] = "cheesepizzaslice",		["label"] = "Cheese Pizza Slice",	["weight"] = 1000, ["type"] = "item",  ["image"] = "cheesepizzaslice.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Cheese Pizza Slice"},
["cheesepizza"]=        {["name"] = "cheesepizza",		["label"] = "Cheese Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "cheesepizza.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Smell that?"},
["jalapenoandpepperonipizza"]=        {["name"] = "jalapenoandpepperonipizza",		["label"] = "Jalapeno & Pepperoni Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "jalapenoandpepperonipizza.png",      ["unique"] = false,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Jalapeno & Pepperoni Pizza"},
["jalapenoandpepperonipizzaslice"]=        {["name"] = "jalapenoandpepperonipizzaslice",		["label"] = "Jalapeno & Pepperoni Pizza Slice",	["weight"] = 1000, ["type"] = "item",  ["image"] = "jalapenoandpepperonipizzaslice.png",      ["unique"] = false,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Jalapeno & Pepperoni Pizza Slice"},
["uncookedjalapenoandpepperonipizza"]=        {["name"] = "uncookedjalapenoandpepperonipizza",		["label"] = "Uncooked Jalapeno & Pepperoni Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "uncookedjalapenoandpepperonipizza.png",      ["unique"] = false,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Jalapeno & Pepperoni Pizza"},
["jalapenoandpepperonipizzabox"]=        {["name"] = "jalapenoandpepperonipizzabox",		["label"] = "Jalapeno & Pepperoni Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pizzabox.png",      ["unique"] = false,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Smell that?"},
["slicedjalapenos"]=        {["name"] = "slicedjalapenos",		["label"] = "Sliced Jalapenos",	["weight"] = 1000, ["type"] = "item",  ["image"] = "slicedjalapenos.png",      ["unique"] = false,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Sliced Jalapenos"},
```

Add this to you [qb]/qb-core/shared/jobs

```
    ['pizzathis'] = {
	label = 'PizzaThis',
	defaultDuty = false,
	offDutyPay = false,
	grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 50
            },
			['1'] = {
                name = 'Junior Pizza Maker',
                payment = 75
            },
			['2'] = {
                name = 'Senior Pizza Maker',
                payment = 100
            },
			['3'] = {
                name = 'Shift Supervisor',
                payment = 125
            },
			['4'] = {
                name = 'Assistant Manager',
				isboss = true,
                payment = 150
            },
            ['5'] = {
                name = 'Owner',
				isboss = true,
                payment = 200
            },
        },
    },
```

Make sure all dependencies are installed otherwise this script will not run

# Credit

oosayeroo - For helping with custom items

https://oosayeroo-scripts.tebex.io/

https://github.com/oosayeroo

# Support

Just made a discord server for any support for my future scripts
https://discord.gg/tPrpmEwnCt
