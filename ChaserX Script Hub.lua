local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("well543211's Script Hub", "DarkTheme")
local GeneralScripts = Window:NewTab("General Scripts")
local Scripts = GeneralScripts:NewSection("Scripts")
local ReanimationScripts = Window:NewTab("Animation Scripts")
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