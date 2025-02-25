local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")

-- Event erstellen, um das Löschen mit dem Server zu synchronisieren
local deleteFloorEvent = replicatedStorage:FindFirstChild("DeleteFloorEvent")

if not deleteFloorEvent then
    deleteFloorEvent = Instance.new("RemoteEvent")
    deleteFloorEvent.Name = "DeleteFloorEvent"
    deleteFloorEvent.Parent = replicatedStorage
end

-- Funktion zum Senden des Events an den Server
local function deleteFloor()
    deleteFloorEvent:FireServer()
end

-- Event für das Drücken der "U"-Taste
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.U then
        deleteFloor()
    end
end)
