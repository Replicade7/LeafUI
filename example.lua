local Leaf = loadstring(game:HttpGet("https://raw.githubusercontent.com/Replicade7/LeafUI/refs/heads/main/main.lua"))()

local Window = Leaf:CreateWindow({
    Name = "Lucky Leaf",
    LogoID = "115881046708353",
    Folder = "LeafFolder",
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

-- Config System

MiscTab:Section({ Title = "Config" })

local configsFilePath = "Workspace/LeafUI/LeafFolder/config/leaf_configs.json"

local function ensureFolderExists(path)
    local parts = {}
    for part in path:gmatch("[^/]+") do
        table.insert(parts, part)
    end
    local currentPath = ""
    for i = 1, #parts - 1 do
        if i > 1 then
            currentPath = currentPath .. "/"
        end
        currentPath = currentPath .. parts[i]
        if not isfolder(currentPath) then
            makefolder(currentPath)
        end
    end
end

local function loadConfigs()
    ensureFolderExists(configsFilePath)
    local success, content = pcall(readfile, configsFilePath)
    if success then
        return game:GetService("HttpService"):JSONDecode(content)
    else
        return {}
    end
end

local function saveConfigs(configsList)
    ensureFolderExists(configsFilePath)
    pcall(writefile, configsFilePath, game:GetService("HttpService"):JSONEncode(configsList))
end

local configs = loadConfigs()
local configNames = {}
for name, _ in pairs(configs) do
    table.insert(configNames, name)
end
if #configNames == 0 then
    configNames = {"Classic config"}
    configs["Classic config"] = {}
end
local currentConfigName = ""

local configsDropdown = MiscTab:CreateDropdown({
    Name = "Configs",
    Options = configNames,
    CurrentOption = configNames[1],
    Callback = function(option) end
})

MiscTab:DeButton({
    Title = "Delete Config",
    Callback = function()
        local currentOption = configsDropdown.GetCurrentOption()
        if currentOption then
            configs[currentOption] = nil
            local newConfigNames = {}
            for name, _ in pairs(configs) do
                table.insert(newConfigNames, name)
            end
            if #newConfigNames == 0 then
                newConfigNames = {"Classic config"}
                configs["Classic config"] = {}
            end
            configsDropdown:UpdateOptions(newConfigNames)
            saveConfigs(configs)
        end
    end
})

MiscTab:Input({
    Title = "Name",
    Callback = function(text)
        currentConfigName = text
    end
})

MiscTab:DeButton({
    Title = "Save Config",
    Callback = function()
        if currentConfigName ~= "" and currentConfigName:gsub("%s+", "") ~= "" then
            local Window = Leaf.CurrentWindow
            local configData = {}
            for key, element in pairs(Window.elements) do
                configData[key] = element.GetValue()
            end
            configs[currentConfigName] = configData
            local configNames = {}
            for name, _ in pairs(configs) do
                table.insert(configNames, name)
            end
            configsDropdown:UpdateOptions(configNames)
            saveConfigs(configs)
        end
    end
})

MiscTab:DeButton({
    Title = "Load Config",
    Callback = function()
        local currentOption = configsDropdown.GetCurrentOption()
        if currentOption and configs[currentOption] then
            local Window = Leaf.CurrentWindow
            local configData = configs[currentOption]
            for key, value in pairs(configData) do
                if Window.elements[key] then
                    Window.elements[key].SetValue(value)
                end
            end
        end
    end
})

MiscTab:CreateColorPicker({
    Name = "Menu Color",
    Color = Leaf.MenuColorValue.Value,
    Callback = function(color)
        Leaf.MenuColorValue.Value = color
    end
})
