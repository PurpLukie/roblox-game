--[[
	Originally written by TsarMac
	Modified by foodman54
	Rewritten (:soulless:) by GizmoTjaz
]]

-- Services
local runService = game:GetService("RunService")
local playerService = game:GetService("Players")

-- Variables
local headHorFactor = 1
local headVerFactor = .6
local bodyHorFactor = .5
local bodyVerFactor = .4
local updateSpeed = .5 / 2

local plr = playerService.LocalPlayer
local cam = workspace.CurrentCamera
local mouse = plr:GetMouse()

local char = plr.Character or plr.CharacterAdded:wait()
local hum = char:WaitForChild("Humanoid")
local isR6 = hum.RigType == Enum.HumanoidRigType.R6
local head = char.Head
local root = char.HumanoidRootPart
local torso = isR6 and char.Torso or char.UpperTorso
local neck = isR6 and torso.Neck or head.Neck
local waist = not isR6 and torso.Waist

local neckC0 = neck.C0
local waistC0 = not isR6 and waist.C0

neck.MaxVelocity = 1/3

runService.RenderStepped:Connect(function ()

	-- Check if every required body part exists and whether the CurrentCamera's CameraSubject is the Humanoid
	if torso and head and ((isR6 and neck) or (neck and waist)) and cam.CameraSubject == hum then

		local camCF = cam.CFrame
		local headCF = head.CFrame

		local torsoLV = torso.CFrame.lookVector

		local dist = (headCF.p - camCF.p).magnitude
		local diff = headCF.Y - camCF.Y

		local asinDiffDist = math.asin(diff / dist)
		local whateverThisDoes = ((headCF.p - camCF.p).Unit:Cross(torsoLV)).Y

		if isR6 then
			neck.C0 = neck.C0:lerp(neckC0 * CFrame.Angles(-1 * asinDiffDist * headVerFactor, 0, -1 * whateverThisDoes * headHorFactor), updateSpeed)
		else
			neck.C0 = neck.C0:lerp(neckC0 * CFrame.Angles(asinDiffDist * headVerFactor, -1 * whateverThisDoes * headHorFactor, 0), updateSpeed)
			waist.C0 = waist.C0:lerp(waistC0 * CFrame.Angles(asinDiffDist * bodyVerFactor, -1 * whateverThisDoes * bodyHorFactor, 0), updateSpeed)
		end

	end
end)
