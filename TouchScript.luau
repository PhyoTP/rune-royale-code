local invisiblePart = script.Parent
local sound = workspace.Assets:FindFirstChild("Shop Theme")

invisiblePart.Touched:Connect(function(hit)
	local character = hit.Parent
	local humanoid = character:FindFirstChild("Humanoid")
	sound.Parent = character
	if humanoid then
		print("touched")
		local player = game.Players:GetPlayerFromCharacter(character)

		if sound then
			sound:Play()
		end
		local shop = game.Players:GetPlayerFromCharacter(character).PlayerGui.ShopGUI
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
		if sound then
			sound:Stop()
		end
		local shop = game.Players:GetPlayerFromCharacter(character).PlayerGui.ShopGUI
		local counter = 0
		while counter < 1 do
			shop.Frame.BackgroundTransparency = counter
			task.wait(0.01)
			counter+=0.1
		end
	end
end)
