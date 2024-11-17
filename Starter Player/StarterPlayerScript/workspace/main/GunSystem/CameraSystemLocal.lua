--put into starter char scripts--

config = { -- Camera settings
	sensitivity = 0.5, -- How fast the Camera moves
	snap = math.rad(75), -- Vertical rotation limit
	offx = script:WaitForChild("xoffset").Value, -- x offset
	offy = 2.25, -- y offset
	zoom = 20, -- z offset
	mousezoom = 8,
}
local Head = script.Parent:WaitForChild("Head")
local Mode = 1
torso = script.Parent:WaitForChild("HumanoidRootPart")
Camera = game.Workspace.CurrentCamera
Camera.CameraType = "Custom"
local Player = game.Players.LocalPlayer
local ToolEquipped = false
local TweenService = game:GetService("TweenService")
local Character = script.Parent
local root = Character:WaitForChild("HumanoidRootPart")
local v = (Character.Head.Position - Camera.CFrame.Position)
local CameraPos = "Right"
local Humanoid = Character:WaitForChild("Humanoid")
local PlayerSpeed
local WalkAnimation = Humanoid:LoadAnimation(script.Backwards)

local tweenInfo = TweenInfo.new(
	1, -- Time
	Enum.EasingStyle.Elastic, -- EasingStyle
	Enum.EasingDirection.Out, -- EasingDirection
	0, -- RepeatCount (when less than zero the tween will loop indefinitely)
	false, -- Reverses (tween will reverse once reaching it's goal)
	0 -- DelayTime
)

local UIS = game:GetService("UserInputService")
local Aiming = false

local x = 0
local y = 0

function mouseMove(name, state, inputObject)
	x = x + (-inputObject.Delta.x*config.sensitivity/100)
	y = y + (-inputObject.Delta.y*config.sensitivity/100)
	
	if (y > config.snap) then
		y = config.snap
	elseif (y < -config.snap) then
		y = -config.snap
	end
end

game:GetService("ContextActionService"):BindActionToInputTypes("MouseMove", mouseMove, false, Enum.UserInputType.MouseMovement)

game:GetService("RunService").RenderStepped:Connect(function()
	config.offx = script:WaitForChild("xoffset").Value
	config.zoom = script:WaitForChild("zoom").Value
	config.mousezoom = script:WaitForChild("mousezoom").Value
	Camera.CFrame = CFrame.new(torso.Position) * CFrame.Angles(0, x, 0) * CFrame.Angles(y, 0, 0) -- Rotate around player
	if Aiming == false then
		config.sensitivity = 0.5
		local tweenInfo = TweenInfo.new(
			1, -- Time
			Enum.EasingStyle.Elastic, -- EasingStyle
			Enum.EasingDirection.Out, -- EasingDirection
			0, -- RepeatCount (when less than zero the tween will loop indefinitely)
			false, -- Reverses (tween will reverse once reaching it's goal)
			0 -- DelayTime
		)
		local tween = TweenService:Create(script.zoom, tweenInfo, {Value = config.mousezoom})
		tween:Play()
		Camera.CFrame = Camera.CFrame * CFrame.new(config.offx, config.offy, config.mousezoom) -- Apply offsets
	elseif Aiming == true then
		config.sensitivity = 0.25
		local tweenInfo = TweenInfo.new(
			1, -- Time
			Enum.EasingStyle.Elastic, -- EasingStyle
			Enum.EasingDirection.Out, -- EasingDirection
			0, -- RepeatCount (when less than zero the tween will loop indefinitely)
			false, -- Reverses (tween will reverse once reaching it's goal)
			0 -- DelayTime
		)
		local tween = TweenService:Create(script.zoom, tweenInfo, {Value = 3.5})
		tween:Play()
		Camera.CFrame = Camera.CFrame * CFrame.new(config.offx, config.offy, config.zoom)
	end
	v = (Character.HumanoidRootPart.Position - Camera.CFrame.Position)
	
	local CameraPosition = workspace.CurrentCamera.CFrame.Position - Vector3.new(0,0,2)
	local Ray = Ray.new(CameraPosition, Character.Head.Position - CameraPosition)
	local Hit, Position, Normal = workspace:FindPartOnRay(Ray)
	if Hit and not Hit.Parent:FindFirstChild("Humanoid") and not Hit.Parent:IsDescendantOf(Character) then
		print(Hit.Name)
		if script.mousezoom.Value >= 2 then
			script.mousezoom.Value = script.mousezoom.Value - 1
		end
	end
	
	local CharacterParts = game.Players.LocalPlayer.Character:GetChildren()
	for i = 1, #CharacterParts do
		if CharacterParts[i].ClassName == "Tool" and CharacterParts[i]:FindFirstChild("Settings") then
			ToolEquipped = true
		else
			ToolEquipped = false
		end
	end
	local tweenInfo = TweenInfo.new(
		1, -- Time
		Enum.EasingStyle.Elastic, -- EasingStyle
		Enum.EasingDirection.Out, -- EasingDirection
		0, -- RepeatCount (when less than zero the tween will loop indefinitely)
		false, -- Reverses (tween will reverse once reaching it's goal)
		0 -- DelayTime
	)
	if ToolEquipped == true and Aiming == true then
		Mode = 1
		if CameraPos == "Right" then
			local tween = TweenService:Create(script.xoffset, tweenInfo, {Value = 2.5})
			tween:Play()
		elseif CameraPos == "Left" then
			local tween = TweenService:Create(script.xoffset, tweenInfo, {Value = -2.5})
			tween:Play()
		end
		UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
		local camLv = Camera.CFrame.lookVector
  		local camRotation = math.atan2(-camLv.X, -camLv.Z)
		Character.Humanoid.AutoRotate = false
		local tweenInfo = TweenInfo.new(
			0.01, -- Time
			Enum.EasingStyle.Sine, -- EasingStyle
			Enum.EasingDirection.Out, -- EasingDirection
			0, -- RepeatCount (when less than zero the tween will loop indefinitely)
			false, -- Reverses (tween will reverse once reaching it's goal)
			0 -- DelayTime
		)
		local tween = TweenService:Create(root, tweenInfo, {CFrame = CFrame.new(root.Position) * CFrame.Angles(0, camRotation, 0)})
		tween:Play()
	elseif ToolEquipped == true and Aiming == false then
		Mode = 2
		local tween = TweenService:Create(script.xoffset, tweenInfo, {Value = 0})
		tween:Play()
		UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
		local camLv = Camera.CFrame.lookVector
  		local camRotation = math.atan2(-camLv.X, -camLv.Z)
		Character.Humanoid.AutoRotate = true
	elseif ToolEquipped == false and Aiming == false then
		Mode = 2
		local tween = TweenService:Create(script.xoffset, tweenInfo, {Value = 0})
		tween:Play()
		Character.Humanoid.AutoRotate = true
	end
end)
local Mouse = game.Players.LocalPlayer:GetMouse()
Mouse.WheelForward:Connect(function(Player)
	if script.mousezoom.Value >= 7 and Aiming == true then
		local tweenInfo = TweenInfo.new(
			0.05, -- Time
			Enum.EasingStyle.Sine, -- EasingStyle
			Enum.EasingDirection.Out, -- EasingDirection
			0, -- RepeatCount (when less than zero the tween will loop indefinitely)
			false, -- Reverses (tween will reverse once reaching it's goal)
			0 -- DelayTime
		)
		local tween = TweenService:Create(script.zoom, tweenInfo, {Value = script.zoom.Value - 2})
		tween:Play()
	elseif script.mousezoom.Value >= 7 and Aiming == false then
		local tweenInfo = TweenInfo.new(
			0.05, -- Time
			Enum.EasingStyle.Sine, -- EasingStyle
			Enum.EasingDirection.Out, -- EasingDirection
			0, -- RepeatCount (when less than zero the tween will loop indefinitely)
			false, -- Reverses (tween will reverse once reaching it's goal)
			0 -- DelayTime
		)
		local tween = TweenService:Create(script.mousezoom, tweenInfo, {Value = script.mousezoom.Value - 2})
		tween:Play()
	end
end)
Mouse.WheelBackward:Connect(function(Player)
	if script.mousezoom.Value <= 16 and Aiming == true then
		local tweenInfo = TweenInfo.new(
			0.05, -- Time
			Enum.EasingStyle.Sine, -- EasingStyle
			Enum.EasingDirection.Out, -- EasingDirection
			0, -- RepeatCount (when less than zero the tween will loop indefinitely)
			false, -- Reverses (tween will reverse once reaching it's goal)
			0 -- DelayTime
		)
		local tween = TweenService:Create(script.zoom, tweenInfo, {Value = script.zoom.Value + 2})
		tween:Play()
	elseif script.mousezoom.Value <= 16 and Aiming == false then
		local tweenInfo = TweenInfo.new(
			0.05, -- Time
			Enum.EasingStyle.Sine, -- EasingStyle
			Enum.EasingDirection.Out, -- EasingDirection
			0, -- RepeatCount (when less than zero the tween will loop indefinitely)
			false, -- Reverses (tween will reverse once reaching it's goal)
			0 -- DelayTime
		)
		local tween = TweenService:Create(script.mousezoom, tweenInfo, {Value = script.mousezoom.Value + 2})
		tween:Play()
	end
end)

UIS.InputBegan:Connect(function(inputKey, gameProccessed)
	if not gameProccessed then
		if inputKey.KeyCode == Enum.KeyCode.T and CameraPos == "Right" then
			CameraPos = "Left"
		elseif inputKey.KeyCode == Enum.KeyCode.T and CameraPos == "Left" then
			CameraPos = "Right"
		end
	end
end)

Humanoid.Running:Connect(function(Speed)
	if Speed < 1 or ToolEquipped == false then
		WalkAnimation:Stop()
	end
	PlayerSpeed = Speed
end)

UIS.InputBegan:Connect(function(Key, GameProccessed)
	if not GameProccessed then
		if Key.KeyCode == Enum.KeyCode.S and ToolEquipped == true and Aiming == true then
			WalkAnimation:Play()
		elseif Key.KeyCode == Enum.KeyCode.W and ToolEquipped == true then
			WalkAnimation:Stop()
		end
	end
end)

script.ChangeCamera.Event:Connect(function(Action, Recoil)
	if Action == "Aim" then
		script.AimUp:Play()
		Aiming = true
	elseif Action == "UnAim" then
		script.AimDown:Play()
		Aiming = false
	elseif Action == "Fire" then
		local tweenInfo = TweenInfo.new(
			.05, -- Time
			Enum.EasingStyle.Linear, -- EasingStyle
			Enum.EasingDirection.Out, -- EasingDirection
			5, -- RepeatCount (when less than zero the tween will loop indefinitely)
			false, -- Reverses (tween will reverse once reaching it's goal)
			0 -- DelayTime
		)
		local tween = TweenService:Create(workspace.CurrentCamera, tweenInfo, {CFrame = workspace.CurrentCamera.CFrame * CFrame.Angles(Recoil, 0, 0)})
	end
end)

local DebounceTime = 5
local Spotting = false
local Mouse = Player:GetMouse()

UIS.InputBegan:Connect(function(inputKey, gameProccessed)
	if not gameProccessed then
		if inputKey.KeyCode == Enum.KeyCode.Q and Spotting == false and Aiming == true then
			Spotting = true
			game.ReplicatedStorage.RE_Spot:FireServer(Mouse.Hit.Position)
			wait(DebounceTime)
			Spotting = false
		end
	end
end)

game.ReplicatedStorage.RE_Spot.OnClientEvent:Connect(function(Position)
	local Part = Instance.new("Part", workspace)
	Part.Size = Vector3.new(0.05, 0.05, 0.05)
	Part.Position = Position
	Part.Anchored = true
	Part.Transparency = 1
	Part.CanCollide = false
	local Indicator = game:GetService("ReplicatedStorage").IndicatorUI:Clone()
	Indicator.Parent = Part
	wait(5)
	Part:Destroy()
end)

Character.Humanoid.Died:Connect(function()
	local tween = TweenService:Create(script.xoffset, tweenInfo, {Value = 0})
	tween:Play()
	UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
	local camLv = Camera.CFrame.lookVector
  	local camRotation = math.atan2(-camLv.X, -camLv.Z)
	Character.Humanoid.AutoRotate = true
end)
