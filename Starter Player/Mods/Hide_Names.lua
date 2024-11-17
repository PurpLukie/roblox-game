-- Services
local playerService = game:GetService("Players")

playerService.PlayerAdded:Connect(function (plr)
	plr.CharacterAdded:Connect(function (char) 
		local humanoid = char:WaitForChild("Humanoid")
		humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	end)
end)
