local invisiblePart = script.Parent
local sound = workspace.Assets:FindFirstChild("Shop Theme")

invisiblePart.Touched:Connect(function(hit)
	local character = hit.Parent
	local humanoid = character:FindFirstChild("Humanoid")
	sound.Parent = character
	if humanoid then
		print("touched")
		local player = game.Players:GetPlayerFromCharacter(character)
		local background: Sound = player:FindFirstChild("Elementals Lobby Theme")
		if sound then
			sound:Play()
		end
		if background then
			background:Stop()
		end
		local shop = player.PlayerGui.ShopGUI
		local counter = 1
		while counter > 0 do
			shop.Frame.BackgroundTransparency = counter
			task.wait(0.01)
			counter-=0.1
		end
	end
end)

invisiblePart.TouchEnded:Connect(function(hit)
	local character = hit.Parent
	local humanoid = character:FindFirstChild("Humanoid")

	if humanoid then
		print("no longer touching")
		local player = game.Players:GetPlayerFromCharacter(character)
		local background: Sound = player:FindFirstChild("Elementals Lobby Theme")
		if sound then
			sound:Stop()
			-- can u also make it so that when u are in the shop the lobby stops
		end
		if background then
			background:Play()
		end
		local shop = player.PlayerGui.ShopGUI
		local counter = 0
		while counter < 1 do
			shop.Frame.BackgroundTransparency = counter
			task.wait(0.01)
			counter+=0.1
		end
	end
end)
