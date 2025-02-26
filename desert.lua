local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Obsessed Hub",
   Icon = 0,
   LoadingTitle = "Script Desert Detectors",
   LoadingSubtitle = "by obsessed hub",
   Theme = "AmberGlow",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = false
   },
   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

Rayfield:Notify({
    Title = "Script loaded",
    Content = "Script loaded successfully",
    Duration = 5,
    Image = "rewind",
})

local Main = Window:CreateTab("Main", "apple")

local Section = Main:CreateSection("Main section")

local Toggle = Main:CreateToggle({
    Name = "Treasure Esp",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        local lootFolder = workspace:FindFirstChild("Loot")
        
        if lootFolder then
            if Value then
                local highlight = Instance.new("Highlight")
                
                highlight.Parent = lootFolder
                
                highlight.OutlineColor = Color3.new(255, 2551, 255)
            else
                for _, child in ipairs(lootFolder:GetChildren()) do
                    if child:IsA("Highlight") then
                        child:Destroy()
                    end
                end
            end
        end
    end,
})

local Slider = Main:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 200},
    Increment = 1,
    Suffix = "speed",
    CurrentValue = 16,
    Flag = "Slider1",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.WalkSpeed = Value
        end
    end,
})

local Button = Main:CreateButton({
    Name = "Buy Legendary Charm Crates",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("Purchase_Legendary_Crate"):FireServer(1)
    end,
 })

local Button = Main:CreateButton({
   Name = "Sell All",
   Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("Sell_Inventory"):FireServer()
   end,
})

local Tp = Window:CreateTab("Teleport", 4483362458)
local Section = Tp:CreateSection("Teleport section")

local Button = Tp:CreateButton({
    Name = "Teleport to Best Shovel & Detectors",
    Callback = function()
        local player = game.Players.LocalPlayer  
        local character = player.Character or player.CharacterAdded:Wait()  
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")  
        
        if humanoidRootPart then
            Rayfield:Notify({
                Title = "Teleporting",
                Content = "Teleporting to Best Shovel & Detectors...",
                Duration = 2,
            })
            humanoidRootPart.CFrame = CFrame.new(943.32959, 76.7005463, -938.976562)
            Rayfield:Notify({
                Title = "Success",
                Content = "Successfully teleported!",
                Duration = 2,
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Failed to teleport - HumanoidRootPart not found",
                Duration = 2,
            })
        end  
    end,
})

local Button = Tp:CreateButton({
    Name = "Teleport to spawn",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(157.353745, 78.4643173, 126.947205)
        end  
    end,
 })

local UI = Window:CreateTab("UI", 4483362458)
local Section = UI:CreateSection("UI")
local Button = UI:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
    end,
 })