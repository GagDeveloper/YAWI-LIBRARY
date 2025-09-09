-- KUNI PET SPAWNER (Cyberpunk Premium UI)
-- Full Fixed & Polished Version

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Load external Spawner
local success, Spawner = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/GagDeveloper/1/refs/heads/main/1"))()
end)
if not success then return end

-- Destroy old UI if exists
for _,v in pairs(player.PlayerGui:GetChildren()) do
    if v.Name == "KuniPetSpawnerUI" then
        v:Destroy()
    end
end

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KuniPetSpawnerUI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0,420,0,260)
mainFrame.Position = UDim2.new(0.5,-210,0.5,-130)
mainFrame.AnchorPoint = Vector2.new(0.5,0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(10,10,18)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0,14)

-- Gradient background
local bgGradientFrame = Instance.new("Frame", mainFrame)
bgGradientFrame.Size = UDim2.new(1,0,1,0)
bgGradientFrame.BackgroundTransparency = 1

local animatedGradient = Instance.new("UIGradient", bgGradientFrame)
animatedGradient.Rotation = 0
animatedGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(12,12,34)),
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(6,6,50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(12,6,30))
}

local outline = Instance.new("UIStroke", mainFrame)
outline.Thickness = 2.5
outline.Color = Color3.fromRGB(0,230,255)
outline.LineJoinMode = Enum.LineJoinMode.Round
outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Outside
outline.Transparency = 0

-- Title Bar
local titleBar = Instance.new("Frame", mainFrame)
titleBar.Size = UDim2.new(1,0,0,36)
titleBar.BackgroundColor3 = Color3.fromRGB(18,18,32)
titleBar.BorderSizePixel = 0
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0,14)

local title = Instance.new("TextLabel", titleBar)
title.Size = UDim2.new(1,-120,1,0)
title.Position = UDim2.new(0,16,0,0)
title.BackgroundTransparency = 1
title.Text = "KUNI PET SPAWNER"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(0,230,255)
title.TextXAlignment = Enum.TextXAlignment.Left

local titleGlow = Instance.new("TextLabel", titleBar)
titleGlow.Size = title.Size
titleGlow.Position = title.Position
titleGlow.BackgroundTransparency = 1
titleGlow.Text = title.Text
titleGlow.Font = title.Font
titleGlow.TextSize = title.TextSize
titleGlow.TextColor3 = Color3.fromRGB(180,0,255)
titleGlow.TextTransparency = 0.8
titleGlow.TextXAlignment = Enum.TextXAlignment.Left
titleGlow.ZIndex = 0

-- Buttons
local closeBtn = Instance.new("TextButton", titleBar)
closeBtn.Size = UDim2.new(0,36,0,26)
closeBtn.Position = UDim2.new(1,-44,0,5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255,60,90)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.BorderSizePixel = 0
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,8)

local miniBtn = Instance.new("TextButton", titleBar)
miniBtn.Size = UDim2.new(0,36,0,26)
miniBtn.Position = UDim2.new(1,-88,0,5)
miniBtn.BackgroundColor3 = Color3.fromRGB(6,80,120)
miniBtn.Text = "-"
miniBtn.Font = Enum.Font.GothamBold
miniBtn.TextSize = 16
miniBtn.TextColor3 = Color3.fromRGB(230,230,230)
miniBtn.BorderSizePixel = 0
Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(0,8)

-- Sidebar
local sidebar = Instance.new("Frame", mainFrame)
sidebar.Size = UDim2.new(0,128,1,-36)
sidebar.Position = UDim2.new(0,0,0,36)
sidebar.BackgroundColor3 = Color3.fromRGB(14,14,28)
sidebar.BorderSizePixel = 0
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0,12)

-- Tabs
local function makeTab(t,n)
    local b = Instance.new("TextButton", sidebar)
    b.Size = UDim2.new(1,-24,0,44)
    b.Position = UDim2.new(0,12,0,12 + (n-1)*56)
    b.BackgroundColor3 = Color3.fromRGB(18,18,36)
    b.BorderSizePixel = 0
    b.Font = Enum.Font.GothamBold
    b.Text = t
    b.TextSize = 14
    b.TextColor3 = Color3.fromRGB(160,200,255)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)
    local stroke = Instance.new("UIStroke", b)
    stroke.Thickness = 1
    stroke.Color = Color3.fromRGB(0,200,255)
    stroke.Transparency = 1
    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.18), {BackgroundColor3 = Color3.fromRGB(0,40,60)}):Play()
        TweenService:Create(b, TweenInfo.new(0.18), {TextColor3 = Color3.fromRGB(0,230,255)}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.18), {Transparency = 0}):Play()
    end)
    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.18), {BackgroundColor3 = Color3.fromRGB(18,18,36)}):Play()
        TweenService:Create(b, TweenInfo.new(0.18), {TextColor3 = Color3.fromRGB(160,200,255)}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.18), {Transparency = 1}):Play()
    end)
    return b
end

local tabMain = makeTab("Main",1)
local tabSettings = makeTab("Settings",2)
local tabCredits = makeTab("Credits",3)

-- Content Holder
local content = Instance.new("Frame", mainFrame)
content.Size = UDim2.new(1,-128,1,-36)
content.Position = UDim2.new(0,128,0,36)
content.BackgroundTransparency = 1

local pages = {}

-- Main Page
local mainPage = Instance.new("Frame", content)
mainPage.Size = UDim2.new(1,0,1,0)
mainPage.BackgroundTransparency = 1
pages["Main"] = mainPage

-- Helper: Label
local function makeLabel(p,t,y)
    local l = Instance.new("TextLabel", p)
    l.Size = UDim2.new(1,-24,0,18)
    l.Position = UDim2.new(0,12,0,y)
    l.BackgroundTransparency = 1
    l.Font = Enum.Font.Gotham
    l.TextSize = 12
    l.Text = t
    l.TextColor3 = Color3.fromRGB(200,220,255)
    l.TextXAlignment = Enum.TextXAlignment.Left
    return l
end

-- Helper: Input
local function makeInput(p,label,y,placeholder)
    makeLabel(p,label,y)
    local bg = Instance.new("Frame", p)
    bg.Size = UDim2.new(1,-24,0,30)
    bg.Position = UDim2.new(0,12,0,y+20)
    bg.BackgroundColor3 = Color3.fromRGB(12,12,28)
    bg.BorderSizePixel = 0
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0,8)
    local stroke = Instance.new("UIStroke", bg)
    stroke.Thickness = 1
    stroke.Color = Color3.fromRGB(0,200,255)
    stroke.Transparency = 1
    local tb = Instance.new("TextBox", bg)
    tb.Size = UDim2.new(1,-16,1,0)
    tb.Position = UDim2.new(0,8,0,0)
    tb.BackgroundTransparency = 1
    tb.PlaceholderText = placeholder or ""
    tb.Font = Enum.Font.Gotham
    tb.TextSize = 14
    tb.TextColor3 = Color3.fromRGB(220,220,255)
    tb.ClearTextOnFocus = false
    tb.FocusLost:Connect(function()
        TweenService:Create(stroke, TweenInfo.new(0.16), {Transparency = 1}):Play()
        TweenService:Create(bg, TweenInfo.new(0.16), {BackgroundColor3 = Color3.fromRGB(12,12,28)}):Play()
    end)
    tb.Focused:Connect(function()
        TweenService:Create(stroke, TweenInfo.new(0.16), {Transparency = 0}):Play()
        TweenService:Create(bg, TweenInfo.new(0.16), {BackgroundColor3 = Color3.fromRGB(0,14,28)}):Play()
    end)
    tb.MouseEnter:Connect(function()
        if not tb:IsFocused() then
            TweenService:Create(bg, TweenInfo.new(0.16), {BackgroundColor3 = Color3.fromRGB(6,6,22)}):Play()
        end
    end)
    tb.MouseLeave:Connect(function()
        if not tb:IsFocused() then
            TweenService:Create(bg, TweenInfo.new(0.16), {BackgroundColor3 = Color3.fromRGB(12,12,28)}):Play()
        end
    end)
    return tb
end

-- Inputs
local petName = makeInput(mainPage, "Pet Name", 12, "Enter Pet Name")
local petKg   = makeInput(mainPage, "Pet Weight (KG)", 64, "1")
local petAge  = makeInput(mainPage, "Pet Age", 116, "1")

-- Spawn Button
local spawnBtn = Instance.new("TextButton", mainPage)
spawnBtn.Size = UDim2.new(0.62,0,0,40)
spawnBtn.Position = UDim2.new(0.02,0,0,176)
spawnBtn.BackgroundColor3 = Color3.fromRGB(0,200,255)
spawnBtn.Text = "⚡ SPAWN PET"
spawnBtn.Font = Enum.Font.GothamBold
spawnBtn.TextSize = 15
spawnBtn.TextColor3 = Color3.fromRGB(8,8,12)
spawnBtn.BorderSizePixel = 0
Instance.new("UICorner", spawnBtn).CornerRadius = UDim.new(0,10)

local spawnStroke = Instance.new("UIStroke", spawnBtn)
spawnStroke.Thickness = 2
spawnStroke.Color = Color3.fromRGB(255,0,200)
spawnStroke.Transparency = 0.6

-- Hover + Click Animation
spawnBtn.MouseEnter:Connect(function()
    TweenService:Create(spawnBtn, TweenInfo.new(0.14), {Size = UDim2.new(0.64,0,0,42)}):Play()
end)
spawnBtn.MouseLeave:Connect(function()
    TweenService:Create(spawnBtn, TweenInfo.new(0.14), {Size = UDim2.new(0.62,0,0,40)}):Play()
end)

spawnBtn.MouseButton1Click:Connect(function()
    spawnBtn.AutoButtonColor = false
    TweenService:Create(spawnBtn, TweenInfo.new(0.08), {Size = UDim2.new(0.58,0,0,36)}):Play()
    task.delay(0.08, function()
        TweenService:Create(spawnBtn, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0.62,0,0,40)}):Play()
    end)
    local name = petName.Text
    local kg = tonumber(petKg.Text) or 1
    local age = tonumber(petAge.Text) or 1
    if name and name ~= "" then
        pcall(function()
            if typeof(Spawner) == "table" and typeof(Spawner.SpawnPet) == "function" then
                Spawner.SpawnPet(name, kg, age)
            elseif type(Spawner) == "function" then
                Spawner(name, kg, age)
            end
        end)
    end
end)

-- Settings Page
local settingsPage = Instance.new("Frame", content)
settingsPage.Size = UDim2.new(1,0,1,0)
settingsPage.BackgroundTransparency = 1
settingsPage.Visible = false
pages["Settings"] = settingsPage

local sLabel = Instance.new("TextLabel", settingsPage)
sLabel.Size = UDim2.new(1,-24,0,24)
sLabel.Position = UDim2.new(0,12,0,12)
sLabel.BackgroundTransparency = 1
sLabel.Font = Enum.Font.GothamBold
sLabel.TextSize = 14
sLabel.Text = "Settings (WIP)"
sLabel.TextColor3 = Color3.fromRGB(180,220,255)
sLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Credits Page
local creditsPage = Instance.new("Frame", content)
creditsPage.Size = UDim2.new(1,0,1,0)
creditsPage.BackgroundTransparency = 1
creditsPage.Visible = false
pages["Credits"] = creditsPage

local cLabel = Instance.new("TextLabel", creditsPage)
cLabel.Size = UDim2.new(1,-24,1,0)
cLabel.Position = UDim2.new(0,12,0,12)
cLabel.BackgroundTransparency = 1
cLabel.Font = Enum.Font.GothamBold
cLabel.TextSize = 16
cLabel.Text = "👑 Made by Kuni\nUI: Cyberpunk Premium"
cLabel.TextColor3 = Color3.fromRGB(200,160,255)
cLabel.TextWrapped = true
cLabel.TextXAlignment = Enum.TextXAlignment.Center
cLabel.TextYAlignment = Enum.TextYAlignment.Center

-- Show Page
local function showPage(n)
    for k,v in pairs(pages) do
        v.Visible = (k == n)
    end
end
tabMain.MouseButton1Click:Connect(function() showPage("Main") end)
tabSettings.MouseButton1Click:Connect(function() showPage("Settings") end)
tabCredits.MouseButton1Click:Connect(function() showPage("Credits") end)
showPage("Main")

-- Dragging
local dragging, dragInput, dragStart, startPos
titleBar.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = i.Position
        startPos = mainFrame.Position
        i.Changed:Connect(function()
            if i.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
titleBar.InputChanged:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = i
    end
end)
UserInputService.InputChanged:Connect(function(i)
    if i == dragInput and dragging then
        local delta = i.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Minimize
local minimized = false
miniBtn.MouseButton1Click:Connect(function()
    if not minimized then
        TweenService:Create(mainFrame, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(0,14,0,14),
            Size = UDim2.new(0,56,0,56)
        }):Play()
        task.delay(0.28, function()
            mainFrame.Visible = false
            local mini = Instance.new("TextButton", screenGui)
            mini.Name = "KuniMini"
            mini.Size = UDim2.new(0,56,0,56)
            mini.Position = UDim2.new(0,14,0,14)
            mini.BackgroundColor3 = Color3.fromRGB(8,8,20)
            mini.Text = "KUNI"
            mini.Font = Enum.Font.GothamBold
            mini.TextSize = 14
            mini.TextColor3 = Color3.fromRGB(0,200,255)
            Instance.new("UICorner", mini).CornerRadius = UDim.new(0,12)
            mini.MouseButton1Click:Connect(function()
                if mainFrame then
                    mainFrame.Visible = true
                    TweenService:Create(mainFrame, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Position = UDim2.new(0.5,-210,0.5,-130),
                        Size = UDim2.new(0,420,0,260)
                    }):Play()
                    mini:Destroy()
                    minimized = false
                end
            end)
        end)
        minimized = true
    end
end)

-- Close
closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.12), {Rotation = 10}):Play()
end)
closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.12), {Rotation = 0}):Play()
end)
closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(mainFrame, TweenInfo.new(0.18), {BackgroundTransparency = 1}):Play()
    task.delay(0.14, function()
        screenGui:Destroy()
    end)
end)

-- Gradient Rotation
task.spawn(function()
    while task.wait(0.03) do
        gradient.Rotation = (gradient.Rotation + 0.6) % 360
    end
end)

-- Glow Pulse
task.spawn(function()
    while task.wait(0.1) do
        TweenService:Create(outline, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Transparency = 0.2
        }):Play()
        TweenService:Create(glow, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Transparency = 0.7
        }):Play()
        task.wait(1.2)
        TweenService:Create(outline, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Transparency = 0.6
        }):Play()
        TweenService:Create(glow, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Transparency = 1
        }):Play()
        task.wait(1.2)
    end
end)

-- Floating Particles
task.spawn(function()
    while task.wait(0.6) do
        local p = Instance.new("Frame", mainFrame)
        p.Size = UDim2.new(0, math.random(2,5), 0, math.random(2,5))
        p.Position = UDim2.new(math.random(),0,1,0)
        p.BackgroundColor3 = Color3.fromRGB(0,200,255)
        p.BackgroundTransparency = 0.2
        p.BorderSizePixel = 0
        Instance.new("UICorner", p).CornerRadius = UDim.new(1,0)
        local t = TweenService:Create(p, TweenInfo.new(math.random(2,4)), {
            Position = UDim2.new(p.Position.X.Scale,0,0,0),
            BackgroundTransparency = 1
        })
        t:Play()
        t.Completed:Connect(function() p:Destroy() end)
    end
end)
