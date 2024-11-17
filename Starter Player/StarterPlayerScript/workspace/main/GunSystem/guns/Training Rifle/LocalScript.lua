local PlayerService = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Player = PlayerService.LocalPlayer
wait(2)
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local Settings = require(script.Parent:WaitForChild("Settings"))
local EventsFolder = script.Parent:WaitForChild("EventsFolder")
local AnimationsFolder = script.Parent:WaitForChild("AnimationsFolder")
local Mouse = Player:GetMouse()
--ANIMATIONS
local Idle_Anim = Humanoid:LoadAnimation(AnimationsFolder:WaitForChild("Idle_Anim"))
local Aim_Anim = Humanoid:LoadAnimation(AnimationsFolder:WaitForChild("Aim_Anim"))
local Reload_Anim = Humanoid:LoadAnimation(AnimationsFolder:WaitForChild("Reload_Anim"))
local Fire_Anim = Humanoid:LoadAnimation(AnimationsFolder:WaitForChild("Fire_Anim"))
local Equip_Anim = Humanoid:LoadAnimation(AnimationsFolder:WaitForChild("Equip_Anim"))
if Settings.EquipAnimation == false then
	Equip_Anim = Humanoid:LoadAnimation(AnimationsFolder:WaitForChild("Idle_Anim"))
end

--BOOL VALUES
local Aiming = false
local Reloading = false
local FlashlightOn = false
local SilencerOn = false
local FireDebounce = false
local Equipped = false
local Mouse1Down = false

--REMOTE EVENTS
local Fire_RE = EventsFolder:WaitForChild("Fire")
local Reload_RE = EventsFolder:WaitForChild("Reload")
local GunAction_RE = EventsFolder:WaitForChild("GunAction")
local Equip_RE = EventsFolder:WaitForChild("Equip")
local InflictTarget_BE = EventsFolder:WaitForChild("InflictTarget")
local HitPart_RE = EventsFolder:WaitForChild("HitPart")

--FUNCTIONS
function Equip()
	UserInputService.MouseIconEnabled = false
	Mouse.Icon = Settings.GunCursor
	Equip_RE:FireServer()
	if Settings.EquipAnimation == true then
		wait(Equip_Anim.Length)
		if Character:FindFirstChild(script.Parent.Name) then
			Equipped = true
			Idle_Anim:Play()
		else
			Equipped = false
			Equip_Anim:Stop()
		end
	elseif Settings.EquipAnimation == false then
		Equipped = true
		Idle_Anim:Play()
	end
end

function Reload()
	Character.CameraSystemLocal.ChangeCamera:Fire("UnAim")
	local TweenInformation = TweenInfo.new(
		.25, -- Time
		Enum.EasingStyle.Linear, -- EasingStyle
		Enum.EasingDirection.Out, -- EasingDirection
		0, -- RepeatCount (when less than zero the tween will loop indefinitely)
		false, -- Reverses (tween will reverse once reaching it's goal)
		0 -- DelayTime
	)
	local TweenCameraFOV = TweenService:Create(workspace.CurrentCamera, TweenInformation, {FieldOfView = 70})
	TweenCameraFOV:Play()
	Reload_RE:FireServer()
	Idle_Anim:Stop()
	Aim_Anim:Stop()
	Aiming = false
	Reloading = true
	Reload_Anim:Play()
	wait(Settings.ReloadTime)
	if Equipped == true then
		Idle_Anim:Play()
		Settings.CurrentAmmo = Settings.MaxAmmo
	end
	Reloading = false
end

function Fire_Semi()
	if Mouse1Down == true and Reloading == false and Settings.CurrentAmmo > 0 and FireDebounce == false then
		FireDebounce = true
		Fire_Anim:Play()
		Character.CameraSystemLocal.ChangeCamera:Fire("Fire", Settings.Recoil)
		Settings.CurrentAmmo = Settings.CurrentAmmo - 1
		local ray = Ray.new(script.Parent.Handle.Muzzle.WorldPosition, (Mouse.Hit.p - script.Parent.Handle.Muzzle.WorldPosition).unit * Settings.MaxBulletDistance)
		local part, position = workspace:FindPartOnRay(ray, Player.Character, false, true)
 		Fire_RE:FireServer(position)
		local Beam = Instance.new("Part", workspace)
		Beam.FormFactor = "Custom"
		Beam.Transparency = 1
		Beam.Anchored = true
		Beam.Locked = true
		Beam.CanCollide = false
		Beam.Name = "Bullet"
 
		local Distance = (script.Parent.Handle.Muzzle.WorldPosition - position).magnitude
		Beam.Size = Vector3.new(0.05, 0.05, Distance)
		Beam.CFrame = CFrame.new(script.Parent.Handle.Muzzle.WorldPosition, position) * CFrame.new(0, 0, -Distance / 2)
 
		game:GetService("Debris"):AddItem(Beam, 0.05)
		if part then
			local DetectedHumanoid = part.Parent:FindFirstChild("Humanoid")
			if not DetectedHumanoid then
				DetectedHumanoid = part.Parent.Parent:FindFirstChild("Humanoid")
			end
			if DetectedHumanoid then
				InflictTarget_BE:FireServer(DetectedHumanoid, part, position)
			end
		end
		wait(Settings.FireRate)
		FireDebounce = false
	end
end

function Fire_Auto()
	while Mouse1Down == true and Reloading == false and Settings.CurrentAmmo > 0 and FireDebounce == false and Aiming == true do
		FireDebounce = true
		Fire_Anim:Play()
		Character.CameraSystemLocal.ChangeCamera:Fire("Fire", Settings.Recoil)
		Settings.CurrentAmmo = Settings.CurrentAmmo - 1
		local ray = Ray.new(script.Parent.Handle.Muzzle.WorldPosition, (Mouse.Hit.p - script.Parent.Handle.Muzzle.WorldPosition).unit * Settings.MaxBulletDistance)
		local part, position = workspace:FindPartOnRay(ray, Player.Character, false, true)
 		Fire_RE:FireServer(position)
		local Beam = Instance.new("Part", workspace)
		Beam.FormFactor = "Custom"
		Beam.Transparency = 1
		Beam.Anchored = true
		Beam.Locked = true
		Beam.CanCollide = false
		Beam.Name = "Bullet"
 
		local Distance = (script.Parent.Handle.Muzzle.WorldPosition - position).magnitude
		Beam.Size = Vector3.new(0.05, 0.05, Distance)
		Beam.CFrame = CFrame.new(script.Parent.Handle.Muzzle.WorldPosition, position) * CFrame.new(0, 0, -Distance / 2)
 
		game:GetService("Debris"):AddItem(Beam, 0.05)
		if part then
			local DetectedHumanoid = part.Parent:FindFirstChild("Humanoid")
			if not DetectedHumanoid then
				DetectedHumanoid = part.Parent.Parent:FindFirstChild("Humanoid")
			end
			if DetectedHumanoid then
				InflictTarget_BE:FireServer(DetectedHumanoid, part, position)
			elseif not DetectedHumanoid then
				
			end
		end
		wait(Settings.FireRate)
		FireDebounce = false
	end
end

function Fire_Burst()
	if Mouse1Down == true and Reloading == false and Settings.CurrentAmmo > Settings.BurstFireAmount and FireDebounce == false then
		for i = 1, Settings.BurstFireAmount do
			FireDebounce = true
			Fire_Anim:Play()
			Character.CameraSystemLocal.ChangeCamera:Fire("Fire", Settings.Recoil)
			Settings.CurrentAmmo = Settings.CurrentAmmo - 1
			local ray = Ray.new(script.Parent.Handle.Muzzle.WorldPosition, (Mouse.Hit.p - script.Parent.Handle.Muzzle.WorldPosition).unit * Settings.MaxBulletDistance)
			local part, position = workspace:FindPartOnRay(ray, Player.Character, false, true)
 			Fire_RE:FireServer(position)
			local Beam = Instance.new("Part", workspace)
			Beam.FormFactor = "Custom"
			Beam.Transparency = 1
			Beam.Anchored = true
			Beam.Locked = true
			Beam.CanCollide = false
			Beam.Name = "Bullet"
 
			local Distance = (script.Parent.Handle.Muzzle.WorldPosition - position).magnitude
			Beam.Size = Vector3.new(0.05, 0.05, Distance)
			Beam.CFrame = CFrame.new(script.Parent.Handle.Muzzle.WorldPosition, position) * CFrame.new(0, 0, -Distance / 2)
 
			game:GetService("Debris"):AddItem(Beam, 0.05)
			if part then
				local DetectedHumanoid = part.Parent:FindFirstChild("Humanoid")
				if not DetectedHumanoid then
					DetectedHumanoid = part.Parent.Parent:FindFirstChild("Humanoid")
				end
				if DetectedHumanoid then
					InflictTarget_BE:FireServer(DetectedHumanoid, part, position)
				end
			end
			wait(Settings.BurstFireRate)
		end
		wait(Settings.FireRate)
		FireDebounce = false
	end
end

function Aim()
	UserInputService.MouseIconEnabled = true
	Character.CameraSystemLocal.ChangeCamera:Fire("Aim")
	Aiming = true
	Aim_Anim:Play()
	Idle_Anim:Stop()
	local TweenInformation = TweenInfo.new(
		Settings.AimSpeed, -- Time
		Enum.EasingStyle.Linear, -- EasingStyle
		Enum.EasingDirection.Out, -- EasingDirection
		0, -- RepeatCount (when less than zero the tween will loop indefinitely)
		false, -- Reverses (tween will reverse once reaching it's goal)
		0 -- DelayTime
	)
	local TweenCameraFOV = TweenService:Create(workspace.CurrentCamera, TweenInformation, {FieldOfView = Settings.AimingFOV})
	TweenCameraFOV:Play()
	Character.TorsoMovement.Disabled = false
end

function UnAim()
	UserInputService.MouseIconEnabled = false
	Character.CameraSystemLocal.ChangeCamera:Fire("UnAim")
	Aiming = false
	Idle_Anim:Play()
	Aim_Anim:Stop()
	local TweenInformation = TweenInfo.new(
		Settings.AimSpeed, -- Time
		Enum.EasingStyle.Linear, -- EasingStyle
		Enum.EasingDirection.Out, -- EasingDirection
		0, -- RepeatCount (when less than zero the tween will loop indefinitely)
		false, -- Reverses (tween will reverse once reaching it's goal)
		0 -- DelayTime
	)
	local TweenCameraFOV = TweenService:Create(workspace.CurrentCamera, TweenInformation, {FieldOfView = 70})
	TweenCameraFOV:Play()
	Character.TorsoMovement.Disabled = true
	wait()
	local TweenInformation = TweenInfo.new(
		0.25, -- Time
		Enum.EasingStyle.Sine, -- EasingStyle
		Enum.EasingDirection.Out, -- EasingDirection
		0, -- RepeatCount (when less than zero the tween will loop indefinitely)
		false, -- Reverses (tween will reverse once reaching it's goal)
		0 -- DelayTime
	)
	local TweenWaist = TweenService:Create(Character.UpperTorso.Waist, TweenInformation, {C0 = CFrame.new(0,0.2,0)})
	TweenWaist:Play()
end

--EVENTS
UserInputService.InputBegan:Connect(function(inputKey, gameProccessed)
	if not gameProccessed and Equipped == true then
		if inputKey.KeyCode == Settings.FlashlightKeyBind and Settings.FlashLight == true and FlashlightOn == false then
			FlashlightOn = true
			GunAction_RE:FireServer("Activate", "Flashlight")
		elseif inputKey.KeyCode == Settings.FlashlightKeyBind and Settings.FlashLight == true and FlashlightOn == true then
			FlashlightOn = false
			GunAction_RE:FireServer("De-Activate", "Flashlight")
		elseif inputKey.UserInputType == Enum.UserInputType.MouseButton1 and Reloading == false and Aiming == true then
			Mouse1Down = true
			if Settings.FireType == "Semi" then
				Fire_Semi()
			elseif Settings.FireType == "Auto" then
				Fire_Auto()
			elseif Settings.FireType == "Burst" then
				Fire_Burst()
			end
		elseif inputKey.KeyCode == Enum.KeyCode.R and Reloading == false and Equipped == true and Settings.CurrentAmmo < Settings.MaxAmmo then
			Reload()
		elseif inputKey.UserInputType == Enum.UserInputType.MouseButton2 and Reloading == false and Aiming == false and Equipped == true then
			Aim()
		end
	end
end)

UserInputService.InputEnded:Connect(function(inputKey, gameProccessed)
	if not gameProccessed then
		if inputKey.UserInputType == Enum.UserInputType.MouseButton1 then
			Mouse1Down = false
		elseif inputKey.UserInputType == Enum.UserInputType.MouseButton2 and Equipped == true and Reloading == false then
			UnAim()
		end
	end
end)

script.Parent.Equipped:Connect(function()
	Equip()
end)

script.Parent.Unequipped:Connect(function()
	Character.CameraSystemLocal.ChangeCamera:Fire("UnAim")
	Equipped = false
	Reloading = false
	Mouse1Down = false
	Aiming = false
	FireDebounce = false
	Equip_Anim:Stop()
	Reload_Anim:Stop()
	Idle_Anim:Stop()
	Aim_Anim:Stop()
	Fire_Anim:Stop()
	UserInputService.MouseIconEnabled = true
	Mouse.Icon = ""
	local TweenInformation = TweenInfo.new(
		0.25, -- Time
		Enum.EasingStyle.Linear, -- EasingStyle
		Enum.EasingDirection.Out, -- EasingDirection
		0, -- RepeatCount (when less than zero the tween will loop indefinitely)
		false, -- Reverses (tween will reverse once reaching it's goal)
		0 -- DelayTime
	)
	local TweenCameraFOV = TweenService:Create(workspace.CurrentCamera, TweenInformation, {FieldOfView = 70})
	TweenCameraFOV:Play()
end)
