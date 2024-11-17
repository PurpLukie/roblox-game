game.Players.PlayerAdded:Connect(function(Plr)
	Plr.CharacterAppearanceLoaded:Connect(function(Chr)
		for _,child in pairs(Chr:GetChildren()) do
			if child:IsA("CharacterMesh") then
				child:Destroy()
			end
		end
	end)
end)
