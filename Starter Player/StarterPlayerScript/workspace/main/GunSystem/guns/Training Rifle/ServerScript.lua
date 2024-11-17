local EventsFolder = script.Parent:WaitForChild("EventsFolder")
local MainPart = script.Parent:WaitForChild("Handle")
local Handle = MainPart:WaitForChild("Handle")
local Muzzle = MainPart:WaitForChild("Muzzle")
local Settings = require(script.Parent:WaitForChild("Settings"))

EventsFolder.Equip.OnServerEvent:Connect(function(Player, EquippedStatus)
	if Settings.EquipSound == true then
		Handle.Equip_SND:Play()
	end
end)

EventsFolder.InflictTarget.OnServerEvent:Connect(function(PlayerWhoShot, Humanoid, BodyPart, HitPosition)
	if Settings.TeamKilling == true then
		if PlayerWhoShot.TeamColor ~= game.Teams[BodyPart.Parent.Name].TeamColor then
			if BodyPart.Name == "Head" then
			Humanoid:TakeDamage(Settings.Damage * Settings.HeadShotMultiplyer)
			else
				Humanoid:TakeDamage(Settings.Damage)
			end
			if Settings.BloodEffect == true then
				local BloodClone = script.Blood:Clone()
				BloodClone.Parent = BodyPart
				wait(1)
				BloodClone:Destroy()
			end
		end
	elseif Settings.TeamKilling == false then
		if BodyPart.Name == "Head" then
			Humanoid:TakeDamage(Settings.Damage * Settings.HeadShotMultiplyer)
		else
			Humanoid:TakeDamage(Settings.Damage)
		end
		if Settings.BloodEffect == true then
			local BloodClone = script.Blood:Clone()
			BloodClone.Parent = BodyPart
			wait(1)
			BloodClone:Destroy()
		end
	end
end)

EventsFolder.Fire.OnServerEvent:Connect(function(Player, BulletHitLocation)
	Muzzle.MuzzleFlash.Enabled = true
	Handle.Fire_SND:Play()
	if Settings.BoltBack == true then
		script.Parent.BoltPart.Transparency = 1
		script.Parent.BoltBackPart.Transparency = 0
	end
	if Settings.MuzzleFlare == true then
		Muzzle.MuzzleFlare.Enabled = true
	end
	if Settings.BulletHitSounds == true then
		local Part = Instance.new("Part", workspace)
		Part.Name = "BulletHitLocation"
		Part.Position = BulletHitLocation
		Part.Size = Vector3.new(0.1,0.1,0.1)
		Part.Transparency = 1
		local RandomSoundChance = math.random(1,4)
		Handle["BulletHit" .. RandomSoundChance]:Clone().Parent = Part
		Part["BulletHit" .. RandomSoundChance].PlayOnRemove = true
		Part:Destroy()
	end
	wait(.1)
	Muzzle.MuzzleFlare.Enabled = false
	script.Parent.BoltPart.Transparency = 0
	script.Parent.BoltBackPart.Transparency = 1
	Muzzle.MuzzleFlash.Enabled = false
end)

EventsFolder.GunAction.OnServerEvent:Connect(function(Player, Status, Type)
	if Type == "Flashlight" then
		if Status == "Activate" then
			Handle.Flashlight_SND:Play()
			script.Parent.FlashLightPart.Beam.Enabled = true
			script.Parent.FlashLightPart.SpotLight.Enabled = true
		elseif Status == "De-Activate" then
			Handle.Flashlight_SND:Play()
			script.Parent.FlashLightPart.Beam.Enabled = false
			script.Parent.FlashLightPart.SpotLight.Enabled = false
		end
	elseif Type == "Silencer" then
		if Status == "Activate" then
			
		elseif Status == "De-Activate" then
			
		end
	end
end)

EventsFolder.Reload.OnServerEvent:Connect(function()
	Handle.Reload_SND:Play()
	if Settings.RemoveMagOnReload == true then
		local CloneMag = script.Parent.Mag:Clone()
		CloneMag.Parent = workspace
		CloneMag.CanCollide = true
		CloneMag.Anchored = false
		CloneMag.Position = script.Parent.Mag.Position - Vector3.new(0,1,0)
		CloneMag.qCFrameWeldThingy:Destroy()
		wait(20)
		CloneMag:Destroy()
	end
end)
