if game.Players.LocalPlayer.UserId == 1 then
	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
	local Window = Library.CreateLib("well543211's Script Hub", "DarkTheme")
	local GameTab = Window:NewTab("Blacklist")
	local GameSection = GameTab:NewSection("You have been blacklisted!")
else
	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
	local Window = Library.CreateLib("well543211's Script Hub", "DarkTheme")
	local GeneralScripts = Window:NewTab("General Scripts")
	local Scripts = GeneralScripts:NewSection("Scripts")
	local ReanimationScripts = Window:NewTab("Animation Scripts")
	local ExecuterTab = Window:NewTab("Executer")
	local ReanimationScriptSection = ReanimationScripts:NewSection("Scripts")
	Scripts:NewButton("Fates ESP & Aimbot", "Cool ESP.", function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/fatesc/fates-esp/main/main.lua'))()
	end)
	Scripts:NewButton("Reviz Admin", "Admin that is good for any game usually.", function()
		loadstring(game:HttpGet("https://pastebin.com/raw/Caniwq2N", true))()
	end)
	Scripts:NewButton("Infinite Yield", "Admin that is OP.", function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end)
	Scripts:NewButton("Load Roblox Hacked Client 11", "Operating System for roblox hacking.", function()
		if true then
			local loadtext = "ChaseClient is waiting on the script to load"
			
			local dmnwait = Instance.new("ScreenGui")
			local main = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local text = Instance.new("TextLabel")
			dmnwait.Name = "dmnwait"
			if syn and syn.protect_gui then
				syn.protect_gui(dmnwait)
			end
			dmnwait.Parent = game:GetService("CoreGui")
			dmnwait.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			main.Name = "main"
			main.Parent = dmnwait
			main.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			main.BorderSizePixel = 0
			main.Position = UDim2.new(0.0145833492, 0, 0.442075998, 0)
			main.Size = UDim2.new(0.313540131, 0, 0.0416698456, 0)
			UICorner.Parent = main
			text.Name = "text"
			text.Parent = main
			text.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			text.BackgroundTransparency = 1.000
			text.BorderSizePixel = 0
			text.Position = UDim2.new(0.0413247831, 0, 0.319999844, 0)
			text.Size = UDim2.new(0.941625595, 0, 0.398774952, 0)
			text.Font = Enum.Font.GothamBold
			text.Text = loadtext
			text.TextColor3 = Color3.fromRGB(225, 225, 225)
			text.TextScaled = true
			text.TextSize = 14.000
			text.TextWrapped = true
			text.TextXAlignment = Enum.TextXAlignment.Left
			AutoExecute = true
			wait(0.5)
			text.Text = loadtext
			wait(5)
		text.Text = "ChaseClient is connecting to servers..."
		wait(10)
		text.Text = "ChaseClient is activating Hacked Roblox Client 11..."
		wait(5)
		text.Text = "ChaseClient is updating Hacked Roblox Client 11..."
		wait(3)
		text.Text = "ChaseClient is booting Hacked Roblox Client 11..."
		wait(5)
		text.Text = "Welcome, "..game.Players.LocalPlayer.Name.."!"
		wait(7)
			dmnwait:Destroy()
			repeat wait() until game:IsLoaded() 
		end
		wait(5)
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexsoftworks/DomainX/main/source'),true))()
	end)
	ReanimationScriptSection:NewButton("Drone Animation (Not FE)", "Something with a drone.", function()
		loadstring(game:HttpGet("https://pastebin.com/raw/k5eWfDYa", true))()
	end)
	ReanimationScriptSection:NewButton("Energize GUI", "Great trolling animation pack!", function()
		loadstring(game:HttpGet('https://pastebin.com/raw/0MLPL32'))
	end)
	local PlayerTab = Window:NewTab("Player")
	local PlayerSettings = PlayerTab:NewSection("Player Settings")
	PlayerSettings:NewSlider("Speed", "Your walk speed.", 64, 0, function(a)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = a
	end)
	PlayerSettings:NewSlider("Jump Power", "Your jump power.", 100, 0, function(a)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = a
	end)
	PlayerSettings:NewToggle("Sit", "If you are sitting or not.", function(a)
		game.Players.LocalPlayer.Character.Humanoid.Sit = a
	end)
	local ExecuterControls = ExecuterTab:NewSection("Loadstring Executer")
	ExecuterControls:NewTextBox("Loadstring", "One line only. Make sure you press enter before you press execute!", function(txt)
		getgenv().Script = txt
	end)
	ExecuterControls:NewButton("Execute", "Runs the script.", function()
		loadstring(getgenv().Script)()
	end)
	if game.PlaceId == 6447798030 then
		local FunkyFridayTab = Window:NewTab("Funky Friday")
		local FunkyFridaySection = FunkyFridayTab:NewSection("Scripts")
		FunkyFridaySection:NewButton("Funky Friday Autoplayer", "Good autoplayer for Funky Friday.", function()
			loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/wally-rblx/funky-friday-autoplay/main/main.lua"))()
		end)
	end
	if game.PlaceId == 7772810845 then
		local GameTab = Window:NewTab("The Presentation Experience")
		local GameSection = GameTab:NewSection("Scripts")
		GameSection:NewButton("Stand Up", "Makes you walk forever.", function()
			game.Players.LocalPlayer.Character.Sit:Destroy()
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = 40
		end)
	end
	if game.PlaceId == 6284583030 then
		local GameTab = Window:NewTab("Pet Simulator X")
		local GameSection = GameTab:NewSection("Scripts")
		GameSection:NewButton("Petsi X", "An OP autofarm for Pet Simulator X.", function()
			loadstring(game:GetObjects("rbxassetid://8194485654")[1].Source)("Petsi-X")
		end)
		GameSection:NewButton("Mini GUI", "OP script, all in one.", function()
			loadstring(game:HttpGet('https://pastebin.com/raw/fttSzNs8'))()
		end)
	end
	if game.PlaceId == 5780309044 then
		local GameTab = Window:NewTab("Stands Awakening")
		local GameSection = GameTab:NewSection("Scripts")
		GameSection:NewButton("Stands Awakening Killer", "An OP script for Stands Awakening.", function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/tonumber/roblox-scripts/main/abdm/abdmfuckerv3.lua'))()
		end)
	end
	if game.PlaceId == 6872274481 then
		local GameTab = Window:NewTab("Bedwars")
		local GameSection = GameTab:NewSection("Scripts")
		GameSection:NewButton("Vape V4", "An OP script for Bedwars.", function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua'))()
		end)
	end
end
-- haha this line does not affect this code