--body
local player = game.Players.LocalPlayer
local char = player.Character
local RunService = game:GetService("RunService")

--camera
local RNS = game:GetService("RunService")
local PS = game:GetService("Players")

local player = PS.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local HRP = char:WaitForChild("HumanoidRootPart")
local head = char:WaitForChild("Head")

hum.CameraOffset = Vector3.new(0,0,0)

local sprinting = false
local crawling = false
local crouching = false
--first person
local camera = workspace.CurrentCamera
local c = player.Character
local head = game.Players.LocalPlayer.Character:WaitForChild("Head")
local function IsFirstPerson()
	return (head.CFrame.p - camera.CFrame.p).Magnitude < 1
end

--first person
game:GetService("RunService").RenderStepped:connect(function()
	if c and IsFirstPerson() then
		c["Left Leg"].LocalTransparencyModifier = 0
		c["Left Arm"].LocalTransparencyModifier = 0
		c["Right Leg"].LocalTransparencyModifier = 0 
		c["Right Arm"].LocalTransparencyModifier = 0
		c["Torso"].LocalTransparencyModifier = 0
		local human = c:WaitForChild("Humanoid")

		if crouching == true then
			local headPosition = c.Head.Position
			hum.CameraOffset = Vector3.new(0, -1.5, -1)
		else
			hum.CameraOffset = Vector3.new(0, 0, -1)
		end
		if sprinting == true then
			hum.CameraOffset = Vector3.new(0,0,-1.5)
		else
			hum.CameraOffset = Vector3.new(0,0,-1)
		end
	else if sprinting == false then
			hum.CameraOffset = Vector3.new(0,0,0)
		end
	end
end)

--third person
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

camera.Changed:Connect(function(property)
	if property == "CameraMode" then
		if camera.CameraMode == Enum.CameraMode.Classic then
			hum.CameraOffset = Vector3.new(0,0,0)
		end
	end
end)
--Movement
for i, v in pairs(char:GetChildren()) do
	if v:IsA("BasePart") and v.Name ~= "Head" then

		v:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function()
			v.LocalTransparencyModifier = v.Transparency
		end)

		v.LocalTransparencyModifier = v.Transparency

	end
end

--Stances
local player = {}
local input = {}
local animation = {}

local players = game:GetService("Players")
local runservice = game:GetService("RunService")
local userinput = game:GetService("UserInputService")

do -- player
	local PLAYER = players.LocalPlayer

	players = setmetatable({}, {__index = function(k)
		return rawget(player, k) or PLAYER:FindFirstChild(tostring(k))
	end})

	local function onCharacter(character)
		wait()
		player.character = character
		player.mouse = PLAYER:GetMouse()
		player.backpack = PLAYER:WaitForChild("Backpack")
		player.humanoid = player.character:WaitForChild("Humanoid")		
		player.torso = player.character:WaitForChild("Torso")
		player.alive = true

		repeat wait() until player.humanoid.Parent == player.character and player.character:IsDescendantOf(game)
		animation.crouch = player.humanoid:LoadAnimation(script:WaitForChild("crouch"))
		animation.crawl = player.humanoid:LoadAnimation(script:WaitForChild("crawl"))
		animation.sprint = player.humanoid:LoadAnimation(script:WaitForChild("sprint"))
		input.stance = "stand"
		local onDied onDied = player.humanoid.Died:connect(function()
			player.alive = false
			onDied:disconnect()
			if animation.crouch then
				animation.crouch:Stop(.2)
			end
		end)
	end
	if PLAYER.Character then
		onCharacter(PLAYER.Character)
	end
	PLAYER.CharacterAdded:connect(onCharacter)
end

do -- input
	input.stance = "stand"
	local default_right = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
	local default_left = CFrame.new(-1, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
	runservice.RenderStepped:connect(function()
		if animation.crouch then
			if animation.crouch.IsPlaying then
				animation.crouch:AdjustSpeed(Vector3.new(player.torso.Velocity.x, 0, player.torso.Velocity.z).magnitude/10)
			end
		end
	end)

	runservice.RenderStepped:connect(function()
		if animation.crawl then
			if animation.crawl.IsPlaying then
				animation.crawl:AdjustSpeed(Vector3.new(player.torso.Velocity.x, 0, player.torso.Velocity.z).magnitude/10)
			end
		end
	end)

	userinput.TextBoxFocused:connect(function()
		if sprinting then
			sprinting = false
			animation.sprint:Stop(.2)
			player.humanoid.WalkSpeed = 16

			if crouching == true then
				player.humanoid.WalkSpeed = 16 * 0.4
				sprinting = false
				animation.sprint:Stop(.2)
			end
		end
	end)

	userinput.InputBegan:connect(function(object, g)
		if not g then
			if object.UserInputType == Enum.UserInputType.Keyboard then
				local key = object.KeyCode
				if key == Enum.KeyCode.C then
					if input.stance == "crawl" then
						animation.crouch:Stop(.2)
						animation.sprint:Stop(.2)
						player.humanoid.HipHeight = 0
						player.humanoid.WalkSpeed = 16
						animation.crawl:Stop(.2)
						input.stance = "stand"
						crawling = false
					else
						input.stance = "crawl"
						player.humanoid.HipHeight = -0
						player.humanoid.WalkSpeed = 16 * 0.4
						animation.crawl:Play(.2)
						animation.crouch:Stop(.2)
						crawling = true
						sprinting = false
						animation.sprint:Stop(.2)
					end

					if key == Enum.KeyCode.LeftControl then
						crawling = false
						crouching = true
						animation.crawl:Stop(.2)
						input.stance = "crouch"
					end

					if key == Enum.KeyCode.LeftShift then
						if crawling == true then
							sprinting = false
							animation.sprint:Stop(.2)
						end
					end
				end
			end
		end
	end)	

	userinput.InputBegan:connect(function(object, g)
		if not g then
			if object.UserInputType == Enum.UserInputType.Keyboard then
				local key = object.KeyCode
				if key == Enum.KeyCode.LeftControl then
					if input.stance == "crouch" then
						player.humanoid.HipHeight = 0
						player.humanoid.WalkSpeed = 16
						animation.crouch:Stop(.2)
						animation.crawl:Stop(.2)
						input.stance = "stand"
						crouching = false
					else
						input.stance = "crouch"
						player.humanoid.HipHeight = -0
						player.humanoid.WalkSpeed = 16 * 0.6
						animation.crouch:Play(.2)
						crouching = true
					end

					if key == Enum.KeyCode.C then
						crouching = false
						input.stance = "crawl"
						crawling = true
						animation.crouch:Stop(.2)
					end
				end
			end
		end
	end)
end

local functionId = nil

userinput.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		if crawling == true or crouching == true then
			sprinting = false
			animation.sprint:Stop(.2)
		else if crawling == false and crouching == false then
				if hum.MoveDirection.magnitude > 0 then
					sprinting = true
					animation.sprint:Play(.2)
					player.humanoid.WalkSpeed = 24
				else if hum.MoveDirection.magnitude == 0 then
						sprinting = false
						animation.sprint:Stop(.2)
						player.humanoid.WalkSpeed = 16
					end
				end
			else
				sprinting = false
				animation.sprint:Stop(.2)
				player.humanoid.WalkSpeed = 16
			end
		end
	end
end)

userinput.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		if sprinting == true then
			sprinting = false
			animation.sprint:Stop(.2)
			player.humanoid.WalkSpeed = 16
			hum.CameraOffset = Vector3.new(0,0,0)
		end

		if player.Character:FindFirstChildOfClass("Tool") then
			hum.CameraOffset = Vector3.new(0,0,-1)
		else
			hum.CameraOffset = Vector3.new(0,0,0)
		end

		if c and IsFirstPerson() then
			hum.CameraOffset = Vector3.new(0,0,-1)
		else
			hum.CameraOffset = Vector3.new(0,0,0)
		end
	end
end)
