-- Objects
local settingsDir = script.Settings

function getSetting (name)
	return settingsDir and settingsDir:FindFirstChild(name) and settingsDir[name].Value
end

-- Variables
local damageHeight = getSetting("Damaging height") or 14 -- The height at which the player will start getting damaged at
local lethalHeight = getSetting("Lethal height") or 26 -- The height at which the player will get killed

game:GetService("Players").PlayerAdded:Connect(function (plr)
	plr.CharacterAdded:Connect(function (char)
		
		local root = char:WaitForChild("HumanoidRootPart")
		local humanoid = char:WaitForChild("Humanoid")
		
		if humanoid and root then
			
			local headHeight
			
			wait(3) -- Prevent the player from dying on spawn
			humanoid.FreeFalling:Connect(function (state)
				if state then
					headHeight = root.Position.Y
				elseif not state and headHeight ~= nil then
					pcall(function ()
						
						local fell = headHeight - root.Position.Y
						
						if fell >= lethalHeight then
							humanoid.Health = 0
						elseif fell >= damageHeight then
							humanoid.Health = humanoid.Health - math.floor(fell)
						end
					end)
				end
			end)
		end
	end)
end)
