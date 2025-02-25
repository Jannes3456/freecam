local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")

-- Funktion zum Ausblenden aller Objekte
local function hideEverything()
    for _, obj in pairs(workspace:GetChildren()) do
        if not obj:IsA("Terrain") then -- Terrain bleibt sichtbar
            obj.LocalTransparencyModifier = 1 -- Macht es für dich unsichtbar
            if obj:IsA("BasePart") then
                obj.CanCollide = false -- Du kannst nicht mehr darauf laufen
            end
        end
    end
end

-- Wenn "U" gedrückt wird, verschwinden die Objekte nur für dich
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.U then
        hideEverything()
    end
end)
