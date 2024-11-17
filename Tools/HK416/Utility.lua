repeat wait() until game.Players.LocalPlayer.Character
local rs = game:GetService('RunService').RenderStepped
local cam = workspace.CurrentCamera
local player = game.Players.LocalPlayer
local char = player.Character
_G.tweeningFov = false

local Utilities = {}

--[[Utilities.tweenFoV = function(FOV,step)
	coroutine.resume(coroutine.create(function()
   		local fv0 = cam.FieldOfView
    	for i = 0,90,step do
        	local r = ((math.sin(math.rad(i))+1)/2)
        	cam.FieldOfView = (Vector3.new(fv0,0,0):Lerp(Vector3.new(FOV,0,0),r).X)
        	rs:wait()
    	end
	end))
end]]--

Utilities.tweenFoV = function(goal, frames)
	if not _G.tweeningFov then
		coroutine.resume(coroutine.create(function()
			SFn = SFn and SFn + 1 or 0 
			local SFn_S = SFn
			for i = 1, frames do
				if SFn ~= SFn_S then break end
					cam.FieldOfView = cam.FieldOfView + (goal - cam.FieldOfView) * (i / frames)
					game:GetService("RunService").RenderStepped:wait()
					--_G.tweeningFov = true
				end
			--_G.tweeningFov = false
		end))
	end
end

Utilities.tweenRoll = function(Roll,step)
	coroutine.resume(coroutine.create(function()
   		local r0 = cam:GetRoll()
    	for i = -90,90,step do
        	local r = ((math.sin(math.rad(i))+1)/2)
        	cam:SetRoll(Vector3.new(r0,0,0):Lerp(Vector3.new(Roll,0,0),r).X)
        	rs:wait()
    	end
	end))
end

Utilities.Fade = function(target, goal, frames, IsGui)
	coroutine.resume(coroutine.create(function()
		for i = 1, frames do
			if IsGui == true then
				target.TextTransparency = target.TextTransparency + (goal - target.TextTransparency) * (i / frames)
				rs:wait()
			elseif IsGui == false then
				target.Size = target.Size + (goal - target.Size) * (i / frames)
				rs:wait()
			end
		end
	end))
end

Utilities.FixCam = function()
	cam.CameraSubject = player.Character.Humanoid
	cam.CameraType = "Custom"
	player.Character.Humanoid.WalkSpeed = 16
end

Utilities.SpawnCam = function(Target)
	cam.CameraType = "Attach"
	cam.CameraSubject = Target
	wait(.05)
	cam.CoordinateFrame = Target.CFrame
	cam.CameraType = "Scriptable"
	player.Character.Humanoid.WalkSpeed = 0
end

Utilities.tweenCam = function(CO, t)
 coroutine.resume(coroutine.create(function()
  COn = COn and COn + 1 or 0 local COn_S = COn
  for i = 1, t do
   if COn ~= COn_S then break end
   char.Humanoid.CameraOffset = char.Humanoid.CameraOffset + (CO - char.Humanoid.CameraOffset) * (i / t)
   rs:wait()
  end
 end))
end

Utilities.TweenJoint = function(Joint, newC0, newC1, Alpha, Duration)
	spawn(function()
		local newCode = math.random(-1e9, 1e9) --This creates a random code between -1000000000 and 1000000000
		local tweenIndicator = nil
		if (not Joint:findFirstChild("tweenCode")) then --If the joint isn't being tweened, then
			tweenIndicator = Instance.new("IntValue")
			tweenIndicator.Name = "tweenCode"
			tweenIndicator.Value = newCode
			tweenIndicator.Parent = Joint
		else
			tweenIndicator = Joint.tweenCode
			tweenIndicator.Value = newCode --If the joint is already being tweened, this will change the code, and the tween loop will stop
		end
		if Duration <= 0 then --If the duration is less than or equal to 0 then there's no need for a tweening loop
			if newC0 then Joint.C0 = newC0 end
			if newC1 then Joint.C1 = newC1 end
		else
			local Increment = 1.5 / Duration --Calculate the increment here so it doesn't need to be calculated in the loop
			local startC0 = Joint.C0
			local startC1 = Joint.C1
			local X = 0
			while true do
				rs:wait() --This makes the for loop step every 1/60th of a second
				local newX = X + Increment
				X = (newX > 90 and 90 or newX) --Makes sure the X never goes above 90
				if tweenIndicator.Value ~= newCode then break end --This makes sure that another tween wasn't called on the same joint
				if newC0 then Joint.C0 = startC0:lerp(newC0, Alpha(X)) end
				if newC1 then Joint.C1 = startC1:lerp(newC1, Alpha(X)) end
				if X == 90 then break end --If the tweening is done...
			end
		end
		if tweenIndicator.Value == newCode then --If this tween functions was the last one called on a joint then it will remove the code
			tweenIndicator:Destroy()
		end
	end)	
end

Utilities.Weld = function(p1, p2, c0)
	local w = Instance.new("Motor6D", p1)
	w.Part0 = p1
	w.Part1 = p2
	w.Name = p1.Name
	w.C0 = c0 or p1.CFrame:inverse() * p2.CFrame
	return w
end

return Utilities
