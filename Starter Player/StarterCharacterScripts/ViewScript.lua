game.Players.PlayerAdded:Connect(function(Player)
	Player.CharacterAdded:Connect(function(Char)
		wait(0.1)
		for _, v in pairs(Char:GetChildren()) do
			if v:IsA("BasePart") then
				v.Massless = true
			end
		end
	end)
end)

--VIEWMODEL
local Player = game.Players.LocalPlayer
local Character = script.Parent
local Humanoid = Character.Humanoid
local HRP = Character.HumanoidRootPart
local Camera = workspace.CurrentCamera

local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local TS = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SpringModule = require(ReplicatedStorage.SpringModule)

local Viewmodel = game.ReplicatedStorage.viewmodel:Clone()
Viewmodel.Parent = Camera

local Gunmodel = ReplicatedStorage.viewmodel.UMP45:Clone()
Gunmodel.Parent = Viewmodel

local Joint = Instance.new("Motor6D")
Joint.Part0 = Viewmodel.Main
Joint.part1 = Gunmodel.Handle
Joint.Parent = Gunmodel.Handle
Joint.C1 = CFrame.new(0, .2, .2)

local Animations = {
	Idle = Viewmodel.AnimationController.Animator:LoadAnimation(ReplicatedStorage.amms.Idle),
	Reload = Viewmodel.AnimationController.Animator:LoadAnimation(ReplicatedStorage.amms.Reloading),
	ADSidle = Viewmodel.AnimationController.Animator:LoadAnimation(ReplicatedStorage.amms.ADSidle),
}

Animations.Idle:Play()

local MouseSway = SpringModule.new(Vector3.new())
MouseSway.Speed = 20
MouseSway.Damper = .5

local MovementSway = SpringModule.new(Vector3.new())
MovementSway.Speed = 20
MovementSway.Damper = .4

local aiming = false
local reloading = false

local function GetBobbing(Addition, Speed, Modifier)
	return math.sin(time()* Addition * Speed) * Modifier
end

UIS.InputBegan:Connect(function(Input, GPE)
	if Input.UserInputType ==Enum.UserInputType.MouseButton2 then
		aiming = true
		Animations.Idle:Stop()
		Animations.ADSidle:Play()
	end
end)

UIS.InputEnded:Connect(function(Input, GPE)
	if Input.UserInputType ==Enum.UserInputType.MouseButton2 then
		aiming = false
		Animations.ADSidle:Stop()
		Animations.Idle:Play()
	end
end)

UIS.InputBegan:Connect(function(object, g)
	if object.UserInputType == Enum.KeyCode.R then
		if reloading == false then
			reloading = true
			Animations.Idle:Stop()
			Animations.ADSidle:Stop()
			Animations.Reload:Play()
			
			wait(3.5)
			reloading = false
		end
	end
end)

RS:BindToRenderStep("Viewmodel", 301, function(DT)
	local MouseDelta = UIS:GetMouseDelta()
	MouseSway.Velocity += (Vector3.new(MouseDelta.X / 450,MouseDelta.Y / 450))
	
	local MovementSwayAmount = Vector3.new(GetBobbing(10,1,.2), GetBobbing(5,1,.2), GetBobbing(5,1,.2))
	MovementSway.Velocity += ((MovementSwayAmount / 25) * DT * 60 * HRP.AssemblyLinearVelocity.Magnitude)

	
	Viewmodel:PivotTo(
		Camera.CFrame * CFrame.new(MovementSway.Position.X / 2,MovementSway.Position.Y / 2,0)
		* CFrame.Angles(0,-MouseSway.Position.x,MouseSway.Position.Y)
		* CFrame.Angles(0,MovementSway.Position.Y,MovementSway.Position.X)
	)
end)
