local PingRemote = script.Parent.Handler.GetPing

PingRemote.OnServerEvent:Connect(function(Player)
	PingRemote:FireClient(Player)
end)
