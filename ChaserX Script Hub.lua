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
ReanimationScriptSection:NewButton("Drone Animation (Not FE)", "Something with a drone.", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/k5eWfDYa", true))()
end)
local PlayerTab = Window:NewTab("Player")
local PlayerSettings = PlayerTab:NewSection("PlayerSettings")
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