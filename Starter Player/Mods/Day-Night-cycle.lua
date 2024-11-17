-- Services
local lighting = game:GetService("Lighting")
local tweenService = game:GetService("TweenService")

-- Objects
local settingsDir = script.Settings

function getSetting (name)
	return settingsDir and settingsDir:FindFirstChild(name) and settingsDir[name].Value
end

function tween (l, p)
	tweenService:Create(lighting, TweenInfo.new(l, Enum.EasingStyle.Linear, Enum.EasingDirection.In), p):Play()
end

function isCustomLightingAllowed ()
	
	local lFix = game:GetService("ServerScriptService"):FindFirstChild("Realism Mod"):FindFirstChild("LightingFix")
	
	if lFix then
		return not lFix.Disabled
	end
end

-- Variables
local dayDuration = (getSetting("Day duration") or 10) * 60 -- How many real-time minutes an in-game day will last
local nightDuration = (getSetting("Night duration") or 6) * 60 -- How many real-time minutes an in-game night will last

lighting.ClockTime = 6

while type(dayDuration) == "number" and type(nightDuration) == "number" do
	
	tween(dayDuration, {ClockTime = 18})
	wait(dayDuration)
	
	-- Change colors only with 'LightingFix' enabled
	if isCustomLightingAllowed() then
		tween(4, {OutdoorAmbient = Color3.fromRGB(60, 60, 60), FogColor = Color3.fromRGB(25, 25, 25), FogEnd = 250})
	end
		
	tween(nightDuration / 2, {ClockTime = 24})
	wait(nightDuration / 2)
	tween(nightDuration / 2, {ClockTime = 6})
	wait(nightDuration / 2)
	
	-- Change colors only with 'LightingFix' enabled
	if isCustomLightingAllowed() then
		tween(4, {OutdoorAmbient = Color3.fromRGB(140, 140, 140), FogColor = Color3.fromRGB(195, 195, 195), FogEnd = 750})
	end
end
