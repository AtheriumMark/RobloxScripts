local Players = game:service("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local MaxDist = 50
local Gui = Instance.new("ScreenGui", game.CoreGui)  Gui.IgnoreGuiInset = true
local Frame = Instance.new("Frame", Gui)
Frame.Size = UDim2.fromOffset(MaxDist * 2, MaxDist * 2)
Frame.AnchorPoint =  Vector2.new(0.5, 0.5)
Frame.Position = UDim2.fromScale(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(153, 0, 0)
Frame.BackgroundTransparency = 0.5
Instance.new("UICorner", Frame).CornerRadius = UDim.new(1, 0)


function GetNearest()
	for Index, Player in pairs(Players:GetPlayers()) do
		local Vector = workspace.CurrentCamera:WorldToScreenPoint(Player.Character:GetPrimaryPartCFrame().p)
		local Dist = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Vector.X, Vector.Y)).Magnitude
		if Dist <= MaxDist and Player.Name ~= LocalPlayer.Name and Player:IsFriendsWith(LocalPlayer.UserID) then
			return Player.Character:GetPrimaryPartCFrame().p
		end
	end
	
	return CFrame.new(0, 0, 0)
end



workspace.CurrentCamera.trash.ChildAdded:Connect(function(Knife)
	Knife.CFrame = CFrame.new(GetNearest())
end)


