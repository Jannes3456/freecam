local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer

-- Warte, bis der Character geladen ist
player.CharacterAdded:Wait()
local character = player.Character
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Funktion zum Teleportieren
local function teleportDown()
    if humanoidRootPart then
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -10, 0)
    end
end

-- Event für das Drücken der "U"-Taste
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.U then
        teleportDown()
    end
end)
