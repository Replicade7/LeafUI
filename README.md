# LeafUI Release Version 2.5 ✨  
**A lightweight, modern UI library for Roblox Executors**  

---

## 🌿 Core Components  

### **Window Creation**  
```lua
local Leaf = loadstring(game:HttpGet("https://raw.githubusercontent.com/Replicade7/LeafUI/refs/heads/main/main.lua"))()

local Window = Leaf:CreateWindow({
    Name = "Your UI Name",
    LogoID = "115881046708353",  -- Image ID
    Color = {183, 255, 128}  -- RGB values
})
```

### **Tabs System**  
```lua
local MainTab = Window:CreateTab({
    Image = "rbxassetid://6031079158",  -- Tab icon
    Opened = true  -- Default open state
})
```

### **SubTabs System**  
```lua
local SettingsSubTab = MainTab:CreateSubTab({ 
    Name = "Silent", 
    Opened = true
})

SettingsSubTab:Button({
    Title = "Enable Feature",
    Active = 3,
    Callback = function()
        print("Button clicked!")
    end
})
```

### **Sections**  
Organize content within tabs  
```lua
MainTab:Section({ Title = "ESP Settings" })
```

---

## 🎛 UI Components  

### **Buttons**  
```lua
MainTab:Button({
    Title = "Enable Feature",
    Active = 3,
    Callback = function()
        print("Button clicked!")
    end
})
```

### **Debounce Buttons**  
```lua
MainTab:DeButton({
    Title = "Save Settings",
    Callback = function()
        print("Action with debounce!")
    end
})
```

### **Toggles**  
```lua
MainTab:Toggle({
    Title = "Enable ESP",
    Default = false,
    Callback = function(state)
        print("Toggle state:", state)
    end
})
```

### **Sliders**  
```lua
MainTab:Slider({
    Title = "Smoothness",
    Value = {
        Min = 0,
        Max = 10,
        Increment = 1,
        Default = 5
    },
    Callback = function(value)
        print("Slider value:", value)
    end
})
```

### **Color Pickers**  
```lua
local myColor = Color3.new(1, 1, 1)

MainTab:CreateColorPicker({
    Name = "ESP Color",
    Color = myColor,
    Callback = function(color)
        myColor = color
        print("Color changed!")
    end
})
```

### **Dropdowns**  
```lua
local selectedPart = "Head"

MainTab:CreateDropdown({
    Name = "Aim Part",
    Options = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"},
    CurrentOption = selectedPart,
    Callback = function(option)
        selectedPart = option
        print("Selected:", option)
    end
})
```

### **Input**  
```lua
MainTab:Input({
    Title = "Name",
    Callback = function(text)
        fileNameInput = text
    end
})
```
