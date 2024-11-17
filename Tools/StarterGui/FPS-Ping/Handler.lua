local RunService = game:GetService("RunService")
local PingRemote = script.GetPing

local FPSCounter = script.Parent.Holder.FPS
local PingCounter = script.Parent.Holder.Ping

local Colors = {
	Good = Color3.fromRGB(0, 255, 0),
	Normal = Color3.fromRGB(255, 255, 0),
	Bad = Color3.fromRGB(255, 0, 0)
}

function GetPing()
	local Send = tick()
	local Ping = nil

	PingRemote:FireServer()

	local Receive; Receive = PingRemote.OnClientEvent:Connect(function()
		Ping = tick() - Send 
	end)

	wait(1)

	Receive:Disconnect()

	return Ping or 999
end

RunService.RenderStepped:Connect(function(TimeBetween)
	local FPS = math.floor(1 / TimeBetween)

	local RunService = game:GetService("RunService")
	local FPS = 0

	RunService.RenderStepped:Connect(function()
		FPS += 1
	end)

	while wait(1) do
		FPSCounter.Text = tostring(FPS)
		FPS = 0
	end
end)


local PingThread = coroutine.wrap(function()
	while wait() do
		local Ping = tonumber(string.format("%.3f", GetPing() * 1000))
		PingCounter.Text = (math.floor(Ping)).." ms"

		if Ping <= 100 then
			PingCounter.TextColor3 = Colors.Good

		elseif Ping > 199  then
			PingCounter.TextColor3 = Colors.Normal

		elseif Ping > 900 then
			PingCounter.TextColor3 = Colors.Normal

		end
	end
end)

PingThread()
