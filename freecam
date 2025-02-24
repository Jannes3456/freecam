local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera
local freecamEnabled = false
local movementSpeed = 2
local mouse = player:GetMouse()

-- Bewegungsrichtungen
local movement = {
    Forward = 0,
    Right = 0,
    Up = 0
}

-- Funktion zum Aktivieren der Freecam
local function enableFreecam()
    if freecamEnabled then return end
    freecamEnabled = true

    -- Speichert die aktuelle Kameraposition
    local cameraStartPosition = camera.CFrame

    -- Deaktiviert die Kontrolle des Spielers
    local character = player.Character
    if character and character:FindFirstChildOfClass("Humanoid") then
        character:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
        character:FindFirstChildOfClass("Humanoid").JumpPower = 0
    end

    -- Sperrt die Maus in der Mitte
    UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    UserInputService.MouseIconEnabled = false

    -- Aktualisiert die Kamera in jedem Frame
    local connection
    connection = RunService.RenderStepped:Connect(function(deltaTime)
        if not freecamEnabled then
            connection:Disconnect()
            return
        end

        -- Mausbewegung für Kamera-Rotation
        local lookX = -UserInputService:GetMouseDelta().X * 0.2
        local lookY = -UserInputService:GetMouseDelta().Y * 0.2
        local newCFrame = camera.CFrame * CFrame.Angles(math.rad(lookY), math.rad(lookX), 0)

        -- Bewege die Kamera basierend auf Bewegungseingaben
        local moveDirection = Vector3.new(movement.Right, movement.Up, movement.Forward)
        moveDirection = newCFrame:VectorToWorldSpace(moveDirection)

        -- Setzt die neue Kameraposition
        camera.CFrame = newCFrame + moveDirection * movementSpeed * deltaTime
    end)
end

-- Funktion zum Deaktivieren der Freecam
local function disableFreecam()
    if not freecamEnabled then return end
    freecamEnabled = false

    -- Setzt die Maussteuerung zurück
    UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    UserInputService.MouseIconEnabled = true

    -- Setzt den Spieler zurück
    local character = player.Character
    if character and character:FindFirstChildOfClass("Humanoid") then
        character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
        character:FindFirstChildOfClass("Humanoid").JumpPower = 50
    end
end

-- Steuerung der Bewegungseingaben
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.C then
        if freecamEnabled then
            disableFreecam()
        else
            enableFreecam()
        end
    elseif input.KeyCode == Enum.KeyCode.W then
        movement.Forward = -1
    elseif input.KeyCode == Enum.KeyCode.S then
        movement.Forward = 1
    elseif input.KeyCode == Enum.KeyCode.A then
        movement.Right = -1
    elseif input.KeyCode == Enum.KeyCode.D then
        movement.Right = 1
    elseif input.KeyCode == Enum.KeyCode.Space then
        movement.Up = 1
    elseif input.KeyCode == Enum.KeyCode.LeftShift then
        movement.Up = -1
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.S then
        movement.Forward = 0
    elseif input.KeyCode == Enum.KeyCode.A or input.KeyCode == Enum.KeyCode.D then
        movement.Right = 0
    elseif input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.LeftShift then
        movement.Up = 0
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Freecam",
    Text = "Drücke C, um Freecam zu aktivieren/deaktivieren!",
    Duration = 3
})
