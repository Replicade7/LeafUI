local Leaf = loadstring(game:HttpGet("https://raw.githubusercontent.com/Replicade7/LeafUI/refs/heads/main/main.lua"))()

local Window = Leaf:CreateWindow({
    Name = "Lucky Leaf",
    LogoID = "115881046708353",
    Color = {182, 255, 128}
})

local VisualTab = Window:CreateTab({
    Image = "rbxassetid://6031079158",
    Opened = true
})

local PlayerTab = Window:CreateTab({
    Image = "rbxassetid://6034287594",
    Opened = false
})

local MiscTab = Window:CreateTab({
    Image = "rbxassetid://6031104650",
    Opened = false
})

local ViewBox = "2D"
local ESP_Color = Color3.new(1, 1, 1)

VisualTab:Section({ Title = "ESP" })

VisualTab:Button({
    Title = "Enabled",
    Active = 3,
    Callback = function()
        print("Player Submitted!")
    end
})

VisualTab:CreateColorPicker({
    Name = "ESP Color",
    Color = ESP_Color,
    Callback = function(color)
        ESP_Color = color
    end
})

VisualTab:CreateDropdown({
    Name = "View Box",
    Options = {"2D", "3D", "Corner"},
    CurrentOption = ViewBox,
    Callback = function(option)
        ViewBox = option
    end
})

VisualTab:DeButton({
    Title = "Submit",
    Callback = function()
        print("Visual Submitted!")
    end
})

PlayerTab:Button({
    Title = "Player Action",
    Active = 3,
    Callback = function()
        print("Player Submitted!")
    end
})

MiscTab:Button({
    Title = "Misc Action",
    Active = 3,
    Callback = function()
        print("Misc Submitted!")
    end
})

MiscTab:Input({
    Title = "Name",
    Callback = function(text)
        fileNameInput = text
    end
})

MiscTab:CreateColorPicker({
    Name = "Menu Color",
    Color = Leaf.MenuColorValue.Value,
    Callback = function(color)
        Leaf.MenuColorValue.Value = color
    end
})

VisualTab:Toggle({
    Title = "Sceleton",
    Default = false,
    Callback = function(state)
        SceletonEnabled = state
    end
})

VisualTab:Slider({
    Title = "Thickness",
    Value = {
        Min = 0,
        Max = 10,
        Increment = 1,
        Default = 5,
    },
    Callback = function(value)
        Thickness_Sceleton = value
    end
})
