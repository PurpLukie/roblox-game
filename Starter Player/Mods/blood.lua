-- Services
local playerService = game:GetService("Players")
local debris = game:GetService("Debris")
local tweenService = game:GetService("TweenService")

-- Objects
local folder
local settingsDir = script.Settings

function getSetting (name)
	return settingsDir and settingsDir:FindFirstChild(name) and settingsDir[name].Value
end

-- Variables
local poolSizeMultiplier = getSetting("Pool size multiplier") or 1

playerService.PlayerAdded:Connect(function (plr)
	
	if not workspace:FindFirstChild("Blood") then
		folder = Instance.new("Folder", workspace)
		folder.Name = "Blood"
	end
	
	local charFolder = Instance.new("Folder", folder)
	charFolder.Name = plr.Name
	
	plr.CharacterAdded:Connect(function (char)	
		
		local humanoid = char:WaitForChild("Humanoid")
		
		humanoid.Died:Connect(function ()
			pcall(function ()
				
				local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso") or nil
				local root = char:FindFirstChild("HumanoidRootPart") or nil
				local base
				
				local function bloodPool (part, limbCenter)
					
					local pool = Instance.new("Part", charFolder)
					pool.CanCollide = false
					pool.BrickColor = BrickColor.new("Crimson")
					pool.Material = Enum.Material.Sand
					pool.Transparency = .2
					pool.CastShadow = false
					pool.Shape = "Cylinder"
					pool.Anchored = true
					
					pool.Size = Vector3.new(.1, 0, 0)		
					pool.CFrame = part.CFrame	
					
					if limbCenter then
						pool.CFrame = CFrame.new(torso.Position.X + math.random(-4, 4), base.Position.Y - (base.Size.Y / 2) + math.random(0, .2), torso.Position.Z + math.random(-4, 4)) 
					else
						pool.CFrame = CFrame.new(torso.Position.X + math.random(-4, 4), base.Position.Y + (base.Size.Y / 2), torso.Position.Z + math.random(-4, 4)) 
					end
					
					pool.Orientation = Vector3.new(0, 0, 90)
					tweenService:Create(pool, TweenInfo.new(math.random(.4, 4), Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = Vector3.new(.1, math.random(3, 7) * poolSizeMultiplier, math.random(3, 7) *poolSizeMultiplier)}):Play()
					
					debris:AddItem(pool, 9)
				end
			
				if char.Humanoid.RigType == Enum.HumanoidRigType.R6 then
					wait(.2)
					if not char:FindFirstChild("Head") and workspace:FindFirstChild(plr.Name .. "-2") then
						char = workspace[plr.Name .. "-2"]
					end
				end
					
				repeat wait() until math.floor(torso.Velocity.Magnitude) == 0
				local baseBlacklist = char:GetChildren()
				
				pcall(function ()
					for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
						if plr.Character then
							for _,v in pairs(plr.Character:GetChildren()) do
								if v:IsA("BasePart") then
									table.insert(baseBlacklist, v)
								elseif v:IsA("Accoutrement") then
									table.insert(baseBlacklist, v:FindFirstChildWhichIsA("BasePart"))
								elseif v:IsA("Tool") and v:FindFirstChild("Handle") then
									table.insert(baseBlacklist, v.Handle)
								end
							end
						end
						if workspace:FindFirstChild(plr.Name .. "-2") then
							for _,p in pairs(workspace[plr.Name .. "-2"]:GetChildren()) do
								if p:IsA("BasePart") then
									table.insert(baseBlacklist, p)
								elseif p:IsA("Accoutrement") then
									table.insert(baseBlacklist, p:FindFirstChildWhichIsA("BasePart"))
								end
							end
						end
					end
				end)
				
				if type(baseBlacklist) == "table" then	
					
					local limbCenter = false
					base = workspace:FindPartsInRegion3WithIgnoreList(Region3.new(torso.Position - torso.Size * 2, torso.Position + torso.Size * 2), baseBlacklist, 1)[1]
								
					if not base then
						if char:FindFirstChild("Left Leg") then
							base = char["Left Leg"]
							limbCenter = true
						elseif char:FindFirstChild("LeftFoot") then
							base = char["LeftFoot"]
							limbCenter = true
						end
					end
					
					if base then
						for _,limb in pairs(char:GetChildren()) do
							if limb:IsA("BasePart") and limb.Name ~= "HumanoidRootPart" then
								bloodPool(limb, limbCenter)
							end
						end
					end
				end
			end)
		end)
	end)
end)

playerService.PlayerRemoving:Connect(function (plr)
	if folder:FindFirstChild(plr.Name) then
		folder[plr.Name]:Destroy()
	end
end)
