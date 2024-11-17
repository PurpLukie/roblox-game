local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage.Remotes.Divisions["Sacred Troopers"]

local IsEspionage = Remotes.InDivision:InvokeServer()
if not IsEspionage then return end
local Equipped = false

function onKeyPress(InputObject, GameProcessedEvent)
	if GameProcessedEvent then return end
	if InputObject.KeyCode == Enum.KeyCode.Q then
		Equipped = not Equipped
		Remotes.Translucent:FireServer(not Equipped)
	end
end
 
game:GetService("UserInputService").InputBegan:connect(onKeyPress)
