local TweenService = game:GetService("TweenService")
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Decal = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_5 = Instance.new("TextLabel")
local Join = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local No = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local UICorner_3 = Instance.new("UICorner")
local UICorner_4 = Instance.new("UICorner")
local CloseButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.35, 0, 0.30, 0)
Frame.Size = UDim2.new(0.3, 0, 0.4, 0)


Decal.Name = "BackgroundDecal"
Decal.Size = UDim2.new(1, 0, 1, 0)
Decal.Position = UDim2.new(0, 0, 0, 0)
Decal.Image = "rbxassetid://14546883954"
Decal.BackgroundTransparency = 1
Decal.Parent = Frame


local DecalCorner = Instance.new("UICorner")
DecalCorner.CornerRadius = UDim.new(0, 10)
DecalCorner.Parent = Decal

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0872274116, 0, 0, 0)
TextLabel.Size = UDim2.new(0.850467265, 0, 0.142045453, 0)
TextLabel.Font = Enum.Font.RobotoMono
TextLabel.Text = "Hello Player"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 1.000
TextLabel.TextWrapped = true
TextLabel.BackgroundTransparency = 1

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0, 0.142045453, 0)
TextLabel_2.Size = UDim2.new(1, 0, 0.142045453, 0)
TextLabel_2.Font = Enum.Font.RobotoMono
TextLabel_2.Text = "Join Cogworks!!1 "
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 10
TextLabel_2.TextWrapped = true
TextLabel_2.BackgroundTransparency = 0.2

TextLabel_3.Parent = Frame
TextLabel_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0, 0, 0.284090906, 0)
TextLabel_3.Size = UDim2.new(1, 0, 0.142045453, 0)
TextLabel_3.Font = Enum.Font.RobotoMono
TextLabel_3.Text = "(It still loads if you dont 🤷‍♀️)"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 10
TextLabel_3.TextWrapped = true
TextLabel_3.BackgroundTransparency = 0.2

TextLabel_5.Parent = Frame
TextLabel_5.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(0, 0, 0.60, 0)
TextLabel_5.Size = UDim2.new(1, 0, 0.15, 0)
TextLabel_5.Font = Enum.Font.Roboto
TextLabel_5.Text = "Made by @Nikowo on github but if you're seeing this I prob leaked the script :3"
TextLabel_5.TextColor3 = Color3.fromRGB(59, 0, 255)
TextLabel_5.TextScaled = true
TextLabel_5.TextSize = 1
TextLabel_5.TextWrapped = true
TextLabel_5.BackgroundTransparency = 0.1


CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0.1, 0, 0.12, 0)
CloseButton.Position = UDim2.new(0.9, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.Cartoon
CloseButton.TextSize = 24
CloseButton.TextWrapped = true
CloseButton.Parent = Frame

UICorner_4.CornerRadius = UDim.new(0, 10) -- This gives a nice rounded corner
UICorner_4.Parent = CloseButton


local function closeUI()
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local goal = {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}
    local tween = TweenService:Create(Frame, tweenInfo, goal)
    
    tween:Play()
    tween.Completed:Connect(function()
        ScreenGui:Destroy()
    end)
end

local function CloseButtonScript()
    local script = Instance.new('LocalScript', CloseButton)


    script.Parent.MouseButton1Click:Connect(function()
        closeUI()
    end)
end
coroutine.wrap(CloseButtonScript)()


Join.Name = "Join"
Join.Parent = Frame
Join.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Join.BorderColor3 = Color3.fromRGB(0, 0, 0)
Join.BorderSizePixel = 0
Join.Position = UDim2.new(0, 0, 0.86, 0)
Join.Size = UDim2.new(0.48, 0, 0.11, 0)
Join.Font = Enum.Font.RobotoCondensed
Join.Text = "Copy server Link"
Join.TextColor3 = Color3.fromRGB(255, 255, 255)
Join.TextScaled = true
Join.TextSize = 14.000
Join.TextWrapped = true

UICorner.Parent = Join

No.Name = "No"
No.Parent = Frame
No.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
No.BorderColor3 = Color3.fromRGB(0, 0, 0)
No.BorderSizePixel = 0
No.Position = UDim2.new(0.52, 0, 0.86, 0)
No.Size = UDim2.new(0.48, 0, 0.11, 0)
No.Font = Enum.Font.RobotoCondensed
No.Text = "Continue Using script"
No.TextColor3 = Color3.fromRGB(255, 255, 255)
No.TextScaled = true
No.TextSize = 14.000
No.TextWrapped = true

UICorner_2.Parent = No

UICorner_3.Parent = Frame


-- Scripts:

local function VQZGU_fake_script() -- TextLabel.LocalScript 
	local script = Instance.new('LocalScript', TextLabel)

	local player = game.Players.LocalPlayer
	local textbox = script.Parent
	textbox.Text = "Hello "..player.DisplayName
end
coroutine.wrap(VQZGU_fake_script)()
local function CEYZO_fake_script() -- Join.LocalScript 
	local script = Instance.new('LocalScript', Join)

	script.Parent.MouseButton1Click:Connect(function()
		setclipboard("https://discord.gg/DheuzTxBBh")
	end)
end
coroutine.wrap(CEYZO_fake_script)()
local function YTZH_fake_script() -- Join.LocalScript 
	local script = Instance.new('LocalScript', Join)

	script.Parent.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://pastebin.com/raw/k7hR9e8S"))()
	end)
end
coroutine.wrap(YTZH_fake_script)()
local function TCMAS_fake_script() -- Join.LocalScript 
	local script = Instance.new('LocalScript', Join)

	script.Parent.MouseButton1Click:Connect(function()
		wait(0.5)
		closeUI()
	end)
end
coroutine.wrap(TCMAS_fake_script)()
local function UXPUVQZ_fake_script() -- No.LocalScript 
	local script = Instance.new('LocalScript', No)

	script.Parent.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://pastebin.com/raw/k7hR9e8S"))()
	end)
end
coroutine.wrap(UXPUVQZ_fake_script)()
local function HQXZNVV_fake_script() -- No.LocalScript 
	local script = Instance.new('LocalScript', No)

	script.Parent.MouseButton1Click:Connect(function()
		wait(0.5)
		closeUI()
	end)
end
coroutine.wrap(HQXZNVV_fake_script)()
local function CBNBHDU_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	script.Parent.Active = true
	script.Parent.Draggable = true
end
coroutine.wrap(CBNBHDU_fake_script)()