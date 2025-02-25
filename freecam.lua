local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Warte, bis der Character geladen ist
character:WaitForChild("HumanoidRootPart")

-- Teleportiere den Spieler 10 Studs nach unten
character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, -10, 0)
