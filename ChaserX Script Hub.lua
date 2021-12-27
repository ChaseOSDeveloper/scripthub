local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("ChaserX Script Hub", "DarkTheme")
local GunGames = Window:NewTab("General Gun Games")
local GeneralScripts = Window:NewTab("Universal Scripts")
local PlayerSettings = Window:NewTab("Player")
local Section = GeneralScripts:NewSection("Scripts")
GeneralScripts:NewButton("Fates ESP", "The ultamite universal ESP.", function()
	if (Activated) then
		return
	end
	
	local game = game
	if (not game.IsLoaded(game)) then
		local Loaded = game.Loaded
		Loaded.Wait(Loaded);
	end
	
	local Drawing = Drawing or loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/fatesc/Roblox-Drawing-Lib/main/main.lua"))();
	
	local GetService = game.GetService
	local Services = setmetatable({
		RunService = GetService(game, "RunService"),
		Players = GetService(game, "Players"),
		UserInputService = GetService(game, "UserInputService"),
		Workspace = GetService(game, "Workspace"),
		HttpService = GetService(game, "HttpService")
	}, {
		__index = function(self, Property)
			local NoError, Service = pcall(GetService, game, Property);
			if (NoError) then
				self[Property] = Service
				return Service
			end
		end
	})
	
	local GetPlayers = Services.Players.GetPlayers
	local JSONEncode, JSONDecode, GenerateGUID = 
		Services.HttpService.JSONEncode, 
		Services.HttpService.JSONDecode,
		Services.HttpService.GenerateGUID
	
	local GetPropertyChangedSignal, Changed = 
		game.GetPropertyChangedSignal,
		game.Changed
	
	local GetChildren, GetDescendants = game.GetChildren, game.GetDescendants
	local IsA = game.IsA
	local FindFirstChild, FindFirstChildWhichIsA, WaitForChild = 
		game.FindFirstChild,
		game.FindFirstChildWhichIsA,
		game.WaitForChild
	
	local Tfind, sort, concat, pack, unpack;
	do
		local table = table
		Tfind, sort, concat, pack, unpack = 
			table.find, 
			table.sort,
			table.concat,
			table.pack,
			table.unpack
	end
	
	local lower, Sfind, split, sub, format, len, match, gmatch, gsub, byte;
	do
		local string = string
		lower, Sfind, split, sub, format, len, match, gmatch, gsub, byte = 
			string.lower,
			string.find,
			string.split, 
			string.sub,
			string.format,
			string.len,
			string.match,
			string.gmatch,
			string.gsub,
			string.byte
	end
	
	local random, floor, round, abs, atan, cos, sin, rad;
	do
		local math = math
		random, floor, round, abs, atan, cos, sin, rad, clamp = 
			math.random,
			math.floor,
			math.round,
			math.abs,
			math.atan,
			math.cos,
			math.sin,
			math.rad,
			math.clamp
	end
	
	local Instancenew = Instance.new
	local Vector3new = Vector3.new
	local Vector2new = Vector2.new
	local UDim2new = UDim2.new
	local UDimnew = UDim.new
	local CFramenew = CFrame.new
	local BrickColornew = BrickColor.new
	local Drawingnew = Drawing.new
	local Color3new = Color3.new
	local Color3fromRGB = Color3.fromRGB
	local Color3fromHSV = Color3.fromHSV
	local ToHSV = Color3new().ToHSV
	
	local Camera = Services.Workspace.CurrentCamera
	local WorldToViewportPoint = Camera.WorldToViewportPoint
	local GetPartsObscuringTarget = Camera.GetPartsObscuringTarget
	
	local LocalPlayer = Services.Players.LocalPlayer
	local Mouse = LocalPlayer and LocalPlayer.GetMouse(LocalPlayer);
	
	local Destroy, Clone = game.Destroy, game.Clone
	
	local Connection = game.Loaded
	local CWait = Connection.Wait
	local CConnect = Connection.Connect
	
	local Disconnect;
	do
		local CalledConnection = CConnect(Connection, function() end);
		Disconnect = CalledConnection.Disconnect
	end
	
	local GetCharacter = GetCharacter or function(Plr)
		if (Plr) then
			return Plr.Character or false
		end
	end
	
	local hookfunction, getconnections;
	do
		local GEnv = getgenv();
	
		local newcclosure = newcclosure or function(f)
			return f
		end
	
		hookfunction = GEnv.hookfunction or function(func, newfunc, applycclosure)
			if (replaceclosure) then
				replaceclosure(func, newfunc);
				return func
			end
			func = applycclosure and newcclosure or newfunc
			return func
		end
	
		local CachedConnections = setmetatable({}, {
			__mode = "v"
		});
		getconnections = function(Connection, FromCache)
			local getconnections = GEnv.getconnections
			if (not getconnections) then
				return {}
			end
			
			local CachedConnection;
			for i, v in next, CachedConnections do
				if (i == Connection) then
					CachedConnection = v
					break;
				end
			end
			if (CachedConnection and FromCache) then
				return CachedConnection
			end
	
			local Connections = GEnv.getconnections(Connection);
			CachedConnections[Connection] = Connections
			return Connections
		end
	end
	
	local Connections = {}
	local AddConnection = function(...)
		local ConnectionsToAdd = {...}
		for i = 1, #ConnectionsToAdd do
			Connections[#Connections + 1] = ConnectionsToAdd[i]
		end
		return ...
	end
	
	local getrawmetatable = getrawmetatable or function()
		return setmetatable({}, {});
	end
	
	local getnamecallmethod = getnamecallmethod or function()
		return ""
	end
	
	local checkcaller = checkcaller or function()
		return false
	end
	
	local getgc = getgc or function()
		return {}
	end
	
	local hookmetamethod = hookmetamethod or function(metatable, metamethod, func)
		setreadonly(metatable, false);
		Old = hookfunction(metatable[metamethod], func, true);
		setreadonly(metatable, true);
		return Old
	end
	
	local GetAllParents = function(Instance_)
		if (typeof(Instance_) == 'Instance') then
			local Parents = {}
			local Current = Instance_
			repeat
				local Parent = Current.Parent
				Parents[#Parents + 1] = Parent
				Current = Parent
			until not Current
			return Parents
		end
		return {}
	end
	
	local filter = function(tbl, ret)
		if (type(tbl) == 'table') then
			local new = {}
			for i, v in next, tbl do
				if (ret(i, v)) then
					new[#new + 1] = v
				end
			end
			return new
		end
	end
	
	local CThread;
	do
		local wrap = coroutine.wrap
		CThread = function(Func, ...)
			if (type(Func) ~= 'function') then
				return nil
			end
			local Varag = ...
			return function()
				local Success, Ret = pcall(wrap(Func, Varag));
				if (Success) then
					return Ret
				end
				if (Debug) then
					warn("[FA Error]: " .. debug.traceback(Ret));
				end
			end
		end
	end
	
	local ISPF, PF_Network, PF_Client, GetBodyParts, GunTbl, Trajectory
	if (game.PlaceId == 292439477) then
		ISPF = true
		for i, v in next, getgc(true) do
			if (type(v) == "table") then
				if (rawget(v, "send")) then
					PF_Network = v
				end
				if (rawget(v, "getbodyparts")) then
					GetBodyParts = rawget(v, "getbodyparts");
				end
				if (rawget(v, "setsprintdisable")) then
					GunTbl = v
				end
				if (rawget(v, "setsway")) then
					PF_Client = v
				end
			elseif (type(v) == "function") then
				local funcinfo = debug.getinfo(v);
				if (funcinfo.name == "trajectory") then
					Trajectory = v
				end
			end
			if (GunTbl and GetBodyParts and PF_Network and Trajectory and PF_Client) then
				break
			end
		end
		GetCharacter = function(Plr)
			if (Plr == LocalPlayer or not Plr) then
				return LocalPlayer.Character
			end
			local Char = GetBodyParts(Plr);
			if (type(Char) == "table") then
				if (rawget(Char, "rootpart")) then
					Plr.Character = rawget(Char, "rootpart").Parent
				end
			end
			return Plr and Plr.Character or nil
		end
	end
	local ISBB, BB_Network, Projectiles
	if (game.PlaceId == 3233893879) then
		ISBB = true
		local Script = LocalPlayer.PlayerScripts.FriendlyNameScript
		for i, v in next, getgc(true) do
			if (type(v) == "table") then
				local Projectiles_ = rawget(v, "Projectiles"); 
				if (rawget(v, "Characters")) then
					BB_Network = v
				end
				if (Projectiles_ and type(Projectiles_) == "table") then
					Projectiles = v.Projectiles
				end
			end
			if (BB_Network and Projectiles) then
				break;
			end
		end
		GetCharacter = function(Plr)
			if (Plr == LocalPlayer or not Plr) then
				return LocalPlayer.Character
			end
			local Char = BB_Network.Characters.GetCharacter(BB_Network.Characters, Plr);
			if (Char and Char.Body) then
				Plr.Character = Char.Body
			end
			return Plr and Plr.Character or nil
		end
		local function BB_GetTeamColor(rgb)
			return Color3new(math.min(rgb.r * 1.3, 1), math.min(rgb.g * 1.3, 1), math.min(rgb.b * 1.3, 1));
		end
		local BB_Teams = BB_Network.Teams
		for i, v in next, GetPlayers(Players) do
			local Team = BB_Teams.GetPlayerTeam(BB_Teams, v);
			v.TeamColor = BrickColornew(BB_GetTeamColor(BB_Teams.Colors[Team]));
		end
		BB_Teams.TeamChanged.Connect(BB_Teams.TeamChanged, function(Plr, Team)
			Plr.TeamColor = BrickColornew(BB_GetTeamColor(BB_Teams.Colors[Team]));
		end)
	end
	local ISCB = game.PlaceId == 301549746
	
	local SilentAimingPlayer = nil
	local SilentAimHitChance = 100
	local AimBone = "Head"
	local Wallbang = true
	
	local Methods = {
		"FindFirstChild",
		"FindFirstChildWhichIsA",
		"FindFirstChildOfClass",
		"IsA"
	}
	
	local ProtectedInstances = {}
	local ProtectInstance = function(Instance_)
		if (not Tfind(ProtectedInstances, Instance_)) then
			ProtectedInstances[#ProtectedInstances + 1] = Instance_
		end
	end
	
	local mt = getrawmetatable(game);
	local OldMetaMethods = {}
	setreadonly(mt, false);
	for i, v in next, mt do
		OldMetaMethods[i] = v
	end
	local MetaMethodHooks = {}
	
	local ControlModule;
	CThread(function()
		ypcall(function()
			ControlModule = FindFirstChild(WaitForChild(WaitForChild(LocalPlayer, "PlayerScripts", 9e9), "PlayerModule", 9e9), "ControlModule")
		end)
	end)()
	
	MetaMethodHooks.Namecall = function(...)
		local __Namecall = OldMetaMethods.__namecall
		local Method = gsub(getnamecallmethod(), "%z.*", "");
		local Args = {...}
		local self = Args[1]
		if (checkcaller()) then
			return __Namecall(...);
		end
		local CallingScript = getcallingscript and getcallingscript();
	
		if (not ISPF and self == Services.Workspace and Method == "FindPartOnRay" and SilentAimingPlayer and CallingScript ~= ControlModule) then
			local Char = GetCharacter(SilentAimingPlayer);
			local Chance = random(1, 100) < SilentAimHitChance
			if (Char and Char[AimBone] and Chance) then  
				local Viewable = not next(GetPartsObscuringTarget(Camera, {Camera.CFrame.Position, Char[AimBone].Position}, {LocalPlayer.Character, Char}));
				if (Viewable or Wallbang) then
					return Char[AimBone], Char[AimBone].Position + (Vector3new(random(1, 10), random(1, 10), random(1, 10)) / 10), Vector3new(0, 1, 0), Char[AimBone].Material
				end
			end
		end
	
		if (not ISPF and self == Services.Workspace and Method == "FindPartOnRayWithIgnoreList" and SilentAimingPlayer and CallingScript ~= ControlModule) then
			local Char = GetCharacter(SilentAimingPlayer);
			local Chance = random(1, 100) < SilentAimHitChance
			
			if (Char and Char[AimBone] and Chance) then
				local Viewable = not next(GetPartsObscuringTarget(Camera, {Camera.CFrame.Position, Char[AimBone].Position}, {LocalPlayer.Character, Char}));
				if (Viewable or Wallbang) then
					if (not ISCB) then
						return Char[AimBone], Char[AimBone].Position + (Vector3new(random(1, 10), random(1, 10), random(1, 10)) / 10), Vector3new(0, 1, 0), Char[AimBone].Material
					end
					Args[2] = Ray.new(Args[1].Origin, (Char[AimBone].Position - Args[2].Origin));
					return __Namecall(unpack(Args));
				end
			end
		end
	
		local Protected = Tfind(ProtectedInstances, self);
	
		if (Protected) then
			if (Tfind(Methods, Method)) then
				return Method == "IsA" and false or nil
			end
		end
	
		if (Method == "GetChildren" or Method == "GetDescendants") then
			return filter(__Namecall(...), function(i, v)
				return not Tfind(ProtectedInstances, v);
			end)
		end
	
		if (Method == "GetFocusedTextBox") then
			if (Tfind(ProtectedInstances, __Namecall(...))) then
				return nil
			end
		end
	
		return __Namecall(...);
	end
	
	MetaMethodHooks.Index = function(...)
		local __Index = OldMetaMethods.__index
	
		local Instance_, Index = ...
	
		if (checkcaller()) then
			if (Index == "HumanoidRootPart" and ISBB) then
				return __Index(Instance_, "Chest")
			end
			return __Index(Instance_, Index);
		end
	
		local SanitisedIndex = Index
		if (typeof(Instance_) == 'Instance' and type(Index) == 'string') then
			SanitisedIndex = gsub(sub(Index, 0, 100), "%z.*", "");
		end
	
		local CallingScript = getcallingscript and getcallingscript();
	
		if (Instance_ == Mouse and SilentAimingPlayer and CallingScript ~= ControlModule) then
			local Char = GetCharacter(SilentAimingPlayer);
			local Chance = random(1, 100) < SilentAimHitChance
			if (Char and Char[AimBone] and Chance) then
				local ViewportPoint = WorldToViewportPoint(Camera, Char[AimBone].Position);
				local Viewable = not next(GetPartsObscuringTarget(Camera, {Camera.CFrame.Position, Char[AimBone].Position}, {LocalPlayer.Character, Char}));
				if (lower(SanitisedIndex) == "target") then
					if (Viewable or Wallbang) then
						return Char[AimBone]
					end
				elseif (lower(SanitisedIndex) == "hit" and (Viewable or Wallbang)) then
					if (Viewable or Wallbang) then
						return Char[AimBone].CFrame * CFramenew(random(1, 10) / 10, random(1, 10) / 10, random(1, 10) / 10);
					end
				elseif (lower(SanitisedIndex) == "x" and (Viewable or Wallbang)) then
					return ViewportPoint.X + (random(1, 10) / 10);
				elseif (SanitisedIndex == "y" and (Viewable or Wallbang)) then
					return ViewportPoint.Y + (random(1, 10) / 10);
				end
			end
		end
	
		if (Tfind(ProtectedInstances, __Index(...))) then
			return nil
		end
	
		return __Index(...);
	end
	
	MetaMethodHooks.NewIndex = function(...)
		local __NewIndex = OldMetaMethods.__newindex
		local Instance_, Index, Value = ...
		if (checkcaller()) then
			if (Index == "Parent") then
				local ProtectedInstance = Tfind(ProtectedInstances, Instance_)
				if (ProtectedInstance) then
					local Parents = GetAllParents(Value);
					for i, v in next, getconnections(Parents[1].ChildAdded, true) do
						v.Disable(v);
					end
					for i = 1, #Parents do
						local Parent = Parents[i]
						for i2, v in next, getconnections(Parent.DescendantAdded, true) do
							v.Disable(v);
						end
					end
					local Ret = __NewIndex(...);
					for i = 1, #Parents do
						local Parent = Parents[i]
						for i2, v in next, getconnections(Parent.DescendantAdded, true) do
							v.Enable(v);
						end
					end
					for i, v in next, getconnections(Parents[1].ChildAdded, true) do
						v.Enable(v);
					end
					return Ret
				end
			end
		end
		return __NewIndex(...);
	end
	
	OldMetaMethods.__namecall = hookmetamethod(game, "__namecall", MetaMethodHooks.Namecall);
	OldMetaMethods.__index = hookmetamethod(game, "__index", MetaMethodHooks.Index);
	OldMetaMethods.__newindex = hookmetamethod(game, "__newindex", MetaMethodHooks.NewIndex);
	
	local OldFindFirstChild
	OldFindFirstChild = hookfunction(FindFirstChild, newcclosure(function(...)
		if (checkcaller()) then
			local Args = {...}
			if (Args[2] == "HumanoidRootPart" and ISBB) then
				Args[2] = "Chest"
				return OldFindFirstChild(unpack(Args));
			end
		end
		return OldFindFirstChild(...);
	end));
	
	local OldGetChildren
	OldGetChildren = hookfunction(game.GetChildren, newcclosure(function(...)
		if (not checkcaller()) then
			local Children = OldGetChildren(...);
			return filter(Children, function(i, v)
				return not Tfind(ProtectedInstances, v);
			end)
		end
		return OldGetChildren(...);
	end));
	
	local OldGetDescendants
	OldGetDescendants = hookfunction(game.GetDescendants, newcclosure(function(...)
		if (not checkcaller()) then
			local Descendants = OldGetDescendants(...);
			return filter(Descendants, function(i, v)
				return not Tfind(ProtectedInstances, v);
			end)
		end
		return OldGetDescendants(...);
	end));
	
	local OldFindPartOnRay
	OldFindPartOnRay = hookfunction(Workspace.FindPartOnRay, newcclosure(function(...)
		if (not ISPF and SilentAimingPlayer) then
			local Char = GetCharacter(SilentAimingPlayer);
			local Chance = math.random(1, 100) < SilentAimHitChance
			if (Char and Char[AimBone] and Chance) then
				local Viewable = not next(GetPartsObscuringTarget(Camera, {Camera.CFrame.Position, Char[AimBone].Position}, {LocalPlayer.Character, Char}));
				if (Viewable or Wallbang) then
					return Char[AimBone], Char[AimBone].Position + (Vector3new(math.random(1, 10), math.random(1, 10), math.random(1, 10)) / 10), Vector3new(0, 1, 0), Char[AimBone].Material
				end
			end
		end
		return OldFindPartOnRay(...);
	end))
	
	local OldFindPartOnRayWithIgnoreList
	OldFindPartOnRayWithIgnoreList = hookfunction(Workspace.FindPartOnRayWithIgnoreList, newcclosure(function(...)
		if (not ISPF and SilentAimingPlayer) then
			local Args = {...}
			local Char = GetCharacter(SilentAimingPlayer);
			local Chance = math.random(1, 100) < SilentAimHitChance
			if (Char and Char[AimBone] and Chance) then
				local Viewable = not next(GetPartsObscuringTarget(Camera, {Camera.CFrame.Position, Char[AimBone].Position}, {LocalPlayer.Character, Char}));
				if (Viewable or Wallbang) then
					if (not ISCB) then
						return Char[AimBone], Char[AimBone].Position + (Vector3new(math.random(1, 10), math.random(1, 10), math.random(1, 10)) / 10), Vector3new(0, 1, 0), Char[AimBone].Material
					end
					Args[1] = Ray.new(Args[1].Origin, (Char[AimBone].Position - Args[1].Origin));
					return OldFindPartOnRayWithIgnoreList(unpack(Args));
				end
			end
		end
		return OldFindPartOnRayWithIgnoreList(...);
	end));
	
	if (ISPF and PF_Network and PF_Network.send) then
		local OldSend = PF_Network.send
		PF_Network.send = function(...)
			local Args = {...}
			local Type = Args[2]
			if (Type == "newbullets") then
				local Char
				if (SilentAimingPlayer) then
					Char = GetCharacter(SilentAimingPlayer);
				end
				local Chance = math.random(1, 100) < SilentAimHitChance
				local Viewable = not next(GetPartsObscuringTarget(Camera, {Camera.CFrame.Position, Char[AimBone].Position}, {LocalPlayer.Character, Char}));
				if (Char and Char[AimBone] and Chance and (Viewable or Wallbang)) then
					local AimPos = Char[AimBone].Position + (Vector3new(math.random(1, 10), math.random(1, 10), math.random(1, 10)) / 10);
					Args[3].bullets[1][1] = Trajectory(PF_Client.basecframe * Vector3new(0, 0, 1), Vector3new(0, -Workspace.Gravity, 0), AimPos, GunTbl.currentgun.data.bulletspeed);
		  
					OldSend(Args[1], "newbullets", Args[3], Args[4]);
					OldSend(Args[1], "bullethit", SilentAimingPlayer, AimPos, GetCharacter(SilentAimingPlayer).Head, Args[3].bullets[1][2]);
					return
				end
			end
			return OldSend(...);
		end
	end
	
	if (ISBB and Projectiles and Projectiles.InitProjectile) then
		local OldInitProjectile = Projectiles.InitProjectile
		Projectiles.InitProjectile = function(...)
			local Args = {...}
			local Char
			if (SilentAimingPlayer) then
				Char = GetCharacter(SilentAimingPlayer);
				local Chance = math.random(1, 100) < SilentAimHitChance
				local Viewable = not next(GetPartsObscuringTarget(Camera, {Camera.CFrame.Position, Char[AimBone].Position}, {LocalPlayer.Character, Char}));
				if (Char and Char[AimBone] and Chance and (Viewable or Wallbang)) then
					Args[3] = Char[AimBone].Position - Args[4]
					return OldInitProjectile(unpack(Args));
				end
			end
			return OldInitProjectile(...);
		end
	end
	
	
	local Window
	
	local Load = function()
		local Succ, Settings = pcall(JSONDecode, Services.HttpService, readfile("fates-esp.json"));
		if (type(Settings) ~= 'table') then
			delfile("fates-esp.json");
			return nil
		end
		local NewSettings = {}
		for i, v in next, Settings do
			NewSettings[i] = v
			if (type(v) == "table") then
				for i2, v2 in next, v do
					if (type(v2) == "table") then
						if (#v2 == 3) --[[Color3]] then
							NewSettings[i][i2] = Color3fromHSV(v2[1], v2[2], v2[3]);
						elseif (#v2 == 4) --[[UDim2]] then
							NewSettings[i][i2] = UDim2new(UDimnew(v2[1], v2[2]), UDimnew(v2[3], v2[4]));
						end
					else
						NewSettings[i][i2] = v2
					end
				end
			end
		end
		return NewSettings
	end
	
	local Settings = isfile("fates-esp.json") and Load() or {
		TracerOptions = {
			Enabled = true,
			To = "Head",
			From = "Bottom",
			Thickness = 1.6,
			Transparency = .7,
		};
		EspOptions = {
			Enabled = true,
			TeamColors = true,
			Names = true,
			Health = true,
			Distance = false,
			Thickness = 1.5,
			Transparency = .9,
			Size = 16,
			Color = Color3fromRGB(20, 226, 207),
			OutlineColor = Color3new(),
			Team = "All",
			BoxEsp = false,
			RenderDistance = 7000
		};
		AimbotOptions = {
			Enabled = true,
			SilentAim = false,
			ShowFov = false,
			FovThickness = 1,
			FovTransparency = 1,
			FovSize = 150,
			FovColor = Color3fromRGB(20, 226, 207),
			Snaplines = false,
			ThirdPerson = false,
			FirstPerson = false,
			ClosestCharacter = false,
			ClosestCursor = true,
			Team = "All",
		};
		UIOptions = {
			Position = UDim2new(0.5, -200, 0.5, -139);
		}
	}
	local TracerOptions, EspOptions, AimbotOptions, UIOptions = Settings.TracerOptions, Settings.EspOptions, Settings.AimbotOptions, Settings.UIOptions
	
	
	local Debounce = 0
	local Save = function()
		if ((tick() - Debounce) >= 1.5) then
			local NewSettings = {}
			for i, v in next, Settings do
				NewSettings[i] = v
			end
			for i, v in next, NewSettings do
				for i2, v2 in next, v do
					if (typeof(v2) == "Color3") then
						local H, S, V = ToHSV(v2);
						NewSettings[i][i2] = {H, S, V}
					elseif (typeof(v2) == "UDim2") then
						local Pos = Window.GetPosition();
						NewSettings[i][i2] = {Pos.X.Scale, Pos.X.Offset, Pos.Y.Scale, Pos.Y.Offset}
					end
				end
			end
			writefile("fates-esp.json", JSONEncode(Services.HttpService, NewSettings));
			Settings = Load();
			TracerOptions, EspOptions, AimbotOptions, UIOptions = Settings.TracerOptions, Settings.EspOptions, Settings.AimbotOptions, Settings.UIOptions
			Debounce = tick();
		end
	end
	
	local GetPart = function(Part, Char)
		if (not Char) then
			return false
		end
		if (FindFirstChild(Char, Part)) then
			return Part
		end
		if (Part == "Torso") then
			return "UpperTorso"
		elseif (Part == "Right Arm") then
			return "RightUpperArm"
		elseif (Part == "Left Arm") then
			return "LeftUpperArm"
		elseif (Part == "Right Leg") then
			Part = "RightLowerLeg"
		elseif (Part == "Left Leg") then
			return "LeftLowerLeg"
		end
		return Part
	end
	
	local GetVector2 = function(Char, To)
		if (Char) then
			To = FindFirstChild(Char, GetPart(To, Char) or AimBone);
			if (To) then
				return WorldToViewportPoint(Camera, To.Position);
			end
		end
		return false
	end
	
	local GetHumanoid = function(Char)
		if (Char) then
			local Humanoid = FindFirstChildWhichIsA(Char, "Humanoid");
			return Humanoid or false
		end
		return false
	end
	
	local GetMagnitude = function(Char)
		if (Char) then
			local Part = FindFirstChild(Char, "HumanoidRootPart") or FindFirstChild(Char, "Chest");
			local LPChar = GetCharacter(LocalPlayer);
			if (LPChar and Part) then
				local HumanoidRootPart = FindFirstChild(LPChar, "HumanoidRootPart") or FindFirstChild(LPChar, "Chest");
				if (HumanoidRootPart) then
					return (Part.Position - HumanoidRootPart.Position).Magnitude
				end
			end
		end
		return math.huge
	end
	
	local Drawings = {}
	local MainUI
	local KillScript = function()
		for i = 1, #Connections do
			Disconnect(Connections[i]);
		end
		if (MainUI) then
			Destroy(MainUI);
		end
		for Player, PlayerDrawings in next, Drawings do
			for i, Drawing in next, PlayerDrawings do
				Drawing.Visible = false
				Drawing.Remove(Drawing);
			end
		end
		setreadonly(mt, false);
		mt = OldMetaMethods
		setreadonly(mt, true);
		getgenv().Activated = nil
	end
	
	local AddDrawing = function(Plr)
		if (not Plr.Character) then
			CWait(Plr.CharacterAdded);
		end
		local Tracer = Drawingnew("Line");
		local Text = Drawingnew("Text");
		local Box = Drawingnew("Quad");
		local Tuple = GetVector2(Plr.Character, TracerOptions.To);
		Drawings[Plr] = {}
		if (Tuple) then
			Tracer.To = Vector2new(Tuple.X, Tuple.Y);
			Text.Position = Vector2new(Tuple.X, Tuple.Y) + Vector2new(0, -100, 0);
		end
	
		Tracer.From = Vector2new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y);
		Tracer.Color = EspOptions.Color
		Tracer.Thickness = TracerOptions.Thickness
		Tracer.Transparency = TracerOptions.Transparency
		Tracer.Visible = TracerOptions.Enabled
		Drawings[Plr].Tracer = Tracer
	
		local From, ViewportSize = TracerOptions.From, Camera.ViewportSize
		Tracer.From = From == "Top" and Vector2new(ViewportSize.X / 2, ViewportSize.Y - ViewportSize.Y) or From == "Bottom" and Vector2new(ViewportSize.X / 2, ViewportSize.Y) or From == "Left" and Vector2new(ViewportSize.X - ViewportSize.X, ViewportSize.Y / 2) or From == "Right" and Vector2new(ViewportSize.X, ViewportSize.Y / 2);
	
		Text.Color = EspOptions.Color
		Text.OutlineColor = EspOptions.OutlineColor
		Text.Size = EspOptions.Size
		Text.Transparency = EspOptions.Transparency
		Text.Center = true
		Text.Outline = true
		Text.Visible = EspOptions.Enabled
		Drawings[Plr].Text = Text
	
		Box.PointA = Vector2new();
		Box.PointB = Vector2new();
		Box.PointC = Vector2new();
		Box.PointD = Vector2new();
		Box.Thickness = EspOptions.Thickness
		Box.Transparency = EspOptions.Transparency
		Box.Filled = false
		Box.Color = EspOptions.Color
		Box.Visible = EspOptions.Enabled    
		Drawings[Plr].Box = Box
	end
	local RemoveDrawing = function(Plr)
		local PlrDrawings = Drawings[Plr]
		if (PlrDrawings) then
			for i, Drawing_ in next, PlrDrawings do
				if (Drawing_.Remove) then
					Drawing_.Remove(Drawing_);
				end
			end
			Drawings[Plr] = nil
		end
	end
	
	for i, v in next, GetPlayers(Services.Players) do
		if (v ~= LocalPlayer) then
			AddDrawing(v);
		end
	end
	AddConnection(CConnect(Services.Players.PlayerAdded, AddDrawing));
	AddConnection(CConnect(Services.Players.PlayerRemoving, RemoveDrawing));
	
	if (AimbotOptions.Enabled) then
		Drawings["SilentAim"] = {}
		local Circle = Drawingnew("Circle");
		Circle.Color = AimbotOptions.FovColor
		Circle.Thickness = AimbotOptions.FovThickness
		Circle.Transparency = AimbotOptions.FovTransparency
		Circle.Filled = false
		Circle.Radius = AimbotOptions.FovSize or 150
		Circle.Position = Vector2new(Mouse.X, Mouse.Y + 36);
		Circle.Visible = AimbotOptions.ShowFov
		Drawings.SilentAim.Fov = Circle
	
		local Snaplines = Drawingnew("Line");
		Snaplines.From = Vector2new(Mouse.X, Mouse.Y + 36);  
		Snaplines.Color = AimbotOptions.FovColor
		Snaplines.Thickness = .1
		Snaplines.Transparency = 1
		Snaplines.Visible = AimbotOptions.Snaplines
		Drawings.SilentAim.Snaplines = Snaplines
	end
	
	local SilentAim = Drawings["SilentAim"]
	
	local Circle, Snaplines = SilentAim.Fov, SilentAim.Snaplines
	
	
	local Render = AddConnection(CConnect(Services.RunService.RenderStepped, function()
		local TargetCursor = nil
		local TargetCharacter = nil
		local TargetAimbone = nil
		local TargetTuple = nil
		local TargetViewable = false
		local Vector2Distance = math.huge
		local Vector3Distance = math.huge
		
		local MouseVector = Vector2new(Mouse.X, Mouse.Y + 36);
	
		Circle.Position = MouseVector
		Snaplines.From = MouseVector
		Snaplines.Visible = false
		
		for i, v in next, Drawings do
			if (not i) then
				continue
			end
			if (i == LocalPlayer or not v.Tracer and not v.Box and not v.Text) then
				continue
			end
			local Char = GetCharacter(i);
			if (not Char) then
				v.Tracer.Visible = false
				v.Text.Visible = false
				v.Box.Visible = false
				continue
			end
	
			local TTeam, LTeam = i.Team, LocalPlayer.Team
	
			if (EspOptions.Team == "All") then
				
			elseif (EspOptions.Team == "Allies" and TTeam ~= LTeam) then
				v.Tracer.Visible = false
				v.Text.Visible = false
				v.Box.Visible = false
				continue
			elseif (EspOptions.Team == "Enemies" and TTeam == LTeam) then
				v.Tracer.Visible = false
				v.Text.Visible = false
				v.Box.Visible = false
				continue
			end
	
			local TracerTuple, TracerVisible = GetVector2(Char, TracerOptions.To);
			local TextTuple, TextVisible = GetVector2(Char, "Head");
			if (TracerTuple and TracerVisible and TracerOptions.Enabled) then
				v.Tracer.Visible = true
				v.Tracer.To = Vector2new(TracerTuple.X, TracerTuple.Y);
				if (EspOptions.TeamColors) then
					v.Tracer.Color = BrickColornew(tostring(i.TeamColor)).Color
				end
			else
				v.Tracer.Visible = false
			end
			if (TextTuple and TextVisible) then
				v.Text.Visible = true
				local Magnitude, Humanoid = GetMagnitude(Char), GetHumanoid(Char) or {Health=0,MaxHealth=0}
				if (Magnitude >= EspOptions.RenderDistance and not (ISBB or ISPF or ISCB)) then
					v.Text.Visible = false
					v.Box.Visible = false
					v.Tracer.Visible = false
					continue
				end
				v.Text.Position = Vector2new(TextTuple.X, TextTuple.Y - 40);
				v.Text.Text = format(("%s\n%s %s"), EspOptions.Names and i.Name or "", EspOptions.Distance and format("[%s]", (math.floor(Magnitude or math.huge))) or "", EspOptions.Health and format("[%s/%s]", math.floor(Humanoid.Health), math.floor(Humanoid.MaxHealth)) or "");
				if (EspOptions.TeamColors) then
					local Color = BrickColornew(tostring(i.TeamColor)).Color
					v.Text.Color = Color
					v.Box.Color = Color
				end
	
				if (EspOptions.BoxEsp) then
					local Parts = {}
					for i2, Part in next, GetChildren(Char) do
						if (IsA(Part, "BasePart")) then
							local ViewportPos = WorldToViewportPoint(Camera, Part.Position);
							Parts[Part] = Vector2new(ViewportPos.X, ViewportPos.Y);
						end
					end
	
					local Top, Bottom, Left, Right
					local Distance = math.huge
					local Closest = nil
					for i2, Pos in next, Parts do
						local Mag = (Pos - Vector2new(TextTuple.X, 0)).Magnitude;
						if (Mag <= Distance) then
							Closest = Pos
							Distance = Mag
						end
					end
					Top = Closest
					Closest = nil
					Distance = math.huge
					for i2, Pos in next, Parts do
						local Mag = (Pos - Vector2new(TextTuple.X, Camera.ViewportSize.Y)).Magnitude;
						if (Mag <= Distance) then
							Closest = Pos
							Distance = Mag
						end
					end
					Bottom = Closest
					Closest = nil
					Distance = math.huge
					for i2, Pos in next, Parts do
						local Mag = (Pos - Vector2new(0, TextTuple.Y)).Magnitude;
						if (Mag <= Distance) then
							Closest = Pos
							Distance = Mag
						end
					end
					Left = Closest
					Closest = nil
					Distance = math.huge
					for i2, Pos in next, Parts do
						local Mag = (Pos - Vector2new(Camera.ViewportSize.X, TextTuple.Y)).Magnitude;
						if (Mag <= Distance) then
							Closest = Pos
							Distance = Mag
						end
					end
					Right = Closest
					Closest = nil
					Distance = math.huge
		
					v.Box.PointA = Vector2new(Right.X, Top.Y);
					v.Box.PointB = Vector2new(Left.X, Top.Y);
					v.Box.PointC = Vector2new(Left.X, Bottom.Y);
					v.Box.PointD = Vector2new(Right.X, Bottom.Y);
					v.Box.Visible = true
				end
			else
				v.Text.Visible = false
				v.Box.Visible = false
			end
	
			if (AimbotOptions.Team == "All") then
		
			elseif (AimbotOptions.Team == "Allies" and i.Team ~= LocalPlayer.Team) then
				continue
			elseif (AimbotOptions.Team == "Enemies" and i.Team == LocalPlayer.Team) then
				continue
			end
			
			local Part = GetPart(AimBone, Char);
			if (Char and FindFirstChild(Char, "HumanoidRootPart") and FindFirstChild(Char, Part)) then
				local Tuple, Viewable = Camera.WorldToViewportPoint(Camera, Char[AimBone].Position);
				local Vector2Magnitude = (MouseVector - Vector2new(Tuple.X, Tuple.Y)).Magnitude
				local Vector3Magnitide = GetMagnitude(Char);
	
				if (Viewable and Vector2Magnitude <= Vector2Distance and Vector2Magnitude <= AimbotOptions.FovSize) then
					TargetCursor = i
					TargetAimbone = AimbotOptions.ClosestCursor and Char[AimBone] or TargetAimbone
					TargetTuple = AimbotOptions.ClosestCursor and Tuple or TargetTuple
					TargetViewable = AimbotOptions.ClosestCursor and Viewable or TargetViewable
					Vector2Distance = Vector2Magnitude
					
					if (AimbotOptions.Snaplines) then
						Snaplines.Visible = true
						Snaplines.To = Vector2new(Tuple.X, Tuple.Y);
					else
						Snaplines.Visible = false
					end
				end
				if (Vector3Magnitide <= Vector3Distance) then
					TargetCharacter = i
					TargetAimbone = AimbotOptions.ClosestCharacter and Char[AimBone] or TargetAimbone
					TargetTuple = AimbotOptions.ClosestCharacter and Tuple or TargetTuple
					TargetViewable = AimbotOptions.ClosestCharacter and Viewable or TargetViewable
					Vector3Distance = Vector3Magnitide
				end
			end
		end
	
		if (AimbotOptions.SilentAim) then
			SilentAimingPlayer = AimbotOptions.ClosestCursor and TargetCursor or AimbotOptions.ClosestCharacter and TargetCharacter or TargetCursor
		end
		if (TargetViewable and AimbotOptions.FirstPerson and TargetAimbone) then
			Camera.CoordinateFrame = CFramenew(Camera.CoordinateFrame.p, TargetAimbone.Position);
		end
		if (TargetViewable and AimbotOptions.ThirdPerson and TargetTuple and mousemoveabs) then
			mousemoveabs(TargetTuple.X, TargetTuple.Y);
		end
	end))
	
	
	local UIElements = Services.InsertService:LoadLocalAsset("rbxassetid://6945229203");
	local GuiObjects = UIElements.GuiObjects
	local UILibrary = {}
	local Utils = {}
	
	local Colors = {
		PageTextPressed = Color3fromRGB(200, 200, 200);
		PageBackgroundPressed = Color3fromRGB(15, 15, 15);
		PageBorderPressed = Color3fromRGB(20, 20, 20);
		PageTextHover = Color3fromRGB(175, 175, 175);
		PageBackgroundHover = Color3fromRGB(16, 16, 16);
		PageTextIdle = Color3fromRGB(150, 150, 150);
		PageBackgroundIdle = Color3fromRGB(18, 18, 18);
		PageBorderIdle = Color3fromRGB(18, 18, 18);
		ElementBackground = Color3fromRGB(25, 25, 25);
	}
	
	
	local Debounce = function(Func)
		local Debounce_ = false
		return function(...)
			if (not Debounce_) then
				Debounce_ = true
				Func(...);
				Debounce_ = false
			end
		end
	end
	
	local function RandomString(Length)
		local String = ""
		for _ = 1, Length do
			String = String .. char(random(65, 122))
		end
		return String
	end
	
	local Guis = {}
	local ParentGui = function(Gui, Parent)
		Gui.Name = sub(gsub(GenerateGUID(Services.HttpService, false), '-', ''), 1, random(25, 30))
		Gui.DisplayOrder = 69420
		Gui.ResetOnSpawn = false
		ProtectInstance(Gui);
		Gui.Parent = Parent or Services.CoreGui
		Guis[#Guis + 1] = Gui
		return Gui
	end
	
	local Utils = {}
	
	Utils.SmoothScroll = function(content, SmoothingFactor) -- by Elttob
		content.ScrollingEnabled = false
	
		local input = Clone(content);
		
		input.ClearAllChildren(input);
		input.BackgroundTransparency = 1
		input.ScrollBarImageTransparency = 1
		input.ZIndex = content.ZIndex + 1
		input.Name = "_smoothinputframe"
		input.ScrollingEnabled = true
		input.Parent = content.Parent
	
		local function syncProperty(prop)
			AddConnection(CConnect(GetPropertyChangedSignal(content, prop), function()
				if prop == "ZIndex" then
					input[prop] = content[prop] + 1
				else
					input[prop] = content[prop]
				end
			end));
		end
	
		syncProperty "CanvasSize"
		syncProperty "Position"
		syncProperty "Rotation"
		syncProperty "ScrollingDirection"
		syncProperty "ScrollBarThickness"
		syncProperty "BorderSizePixel"
		syncProperty "ElasticBehavior"
		syncProperty "SizeConstraint"
		syncProperty "ZIndex"
		syncProperty "BorderColor3"
		syncProperty "Size"
		syncProperty "AnchorPoint"
		syncProperty "Visible"
	
		local smoothConnection = AddConnection(CConnect(Services.RunService.RenderStepped, function()
			local a = content.CanvasPosition
			local b = input.CanvasPosition
			local c = SmoothingFactor
			local d = (b - a) * c + a
			
			content.CanvasPosition = d
		end));
	
		AddConnection(CConnect(content.AncestryChanged, function()
			if content.Parent == nil then
				Destroy(input);
				Disconnect(smoothConnection);
			end
		end));
	end
	
	do
		local TweenService = Services.TweenService
		Utils.Tween = function(Object, Style, Direction, Time, Goal)
			local TInfo = TweenInfo.new(Time, Enum.EasingStyle[Style], Enum.EasingDirection[Direction])
			local Tween = TweenService.Create(TweenService, Object, TInfo, Goal)
			Tween.Play(Tween);   
			return Tween
		end
	end
	
	Utils.MultColor3 = function(Color, Delta)
		return Color3new(clamp(Color.R * Delta, 0, 1), clamp(Color.G * Delta, 0, 1), clamp(Color.B * Delta, 0, 1))
	end
	
	Utils.Draggable = function(UI, DragUi)
		local DragSpeed = 0
		local StartPos
		local DragToggle, DragInput, DragStart
	
		if not DragUi then
			DragUi = UI
		end
		
		local function UpdateInput(Input)
			local Delta = Input.Position - DragStart
			local Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y);
	
			Utils.Tween(UI, "Linear", "Out", .25, {
				Position = Position
			});
		end
		local CoreGui = Services.CoreGui
		local UserInputService = Services.UserInputService
	
		AddConnection(CConnect(UI.InputBegan, function(Input)
			if ((Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) and not UserInputService.GetFocusedTextBox(UserInputService)) then
				DragToggle = true
				DragStart = Input.Position
				StartPos = UI.Position
	
				local Objects = CoreGui.GetGuiObjectsAtPosition(CoreGui, DragStart.X, DragStart.Y);
	
				AddConnection(CConnect(Input.Changed, function()
					if (Input.UserInputState == Enum.UserInputState.End) then
						DragToggle = false
					end
				end));
			end
		end));
	
		AddConnection(CConnect(UI.InputChanged, function(Input)
			if (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
				DragInput = Input
			end
		end));
	
		AddConnection(CConnect(UserInputService.InputChanged, function(Input)
			if (Input == DragInput and DragToggle) then
				UpdateInput(Input);
			end
		end));
	end
	
	Utils.Click = function(Object, Goal)
		local Hover = {
			[Goal] = Utils.MultColor3(Object[Goal], 0.9);
		}
	
		local Press = {
			[Goal] = Utils.MultColor3(Object[Goal], 1.2);
		}
	
		local Origin = {
			[Goal] = Object[Goal]
		}
	
		AddConnection(CConnect(Object.MouseEnter, function()
			Utils.Tween(Object, "Quad", "Out", .25, Hover);
		end))
	
		AddConnection(CConnect(Object.MouseLeave, function()
			Utils.Tween(Object, "Quad", "Out", .25, Origin);
		end));
	
		AddConnection(CConnect(Object.MouseButton1Down, function()
			Utils.Tween(Object, "Quad", "Out", .3, Press);
		end));
	
		AddConnection(CConnect(Object.MouseButton1Up, function()
			Utils.Tween(Object, "Quad", "Out", .4, Hover);
		end));
	end
	
	Utils.Hover = function(Object, Goal)
		local Hover = {
			[Goal] = Utils.MultColor3(Object[Goal], 0.9);
		}
	
		local Origin = {
			[Goal] = Object[Goal]
		}
	
		AddConnection(CConnect(Object.MouseEnter, function()
			Utils.Tween(Object, "Sine", "Out", .5, Hover);
		end));
	
		AddConnection(CConnect(Object.MouseLeave, function()
			Utils.Tween(Object, "Sine", "Out", .5, Origin);
		end));
	end
	
	Utils.Blink = function(Object, Goal, Color1, Color2, Time)
		local Normal = {
			[Goal] = Color1
		}
	
		local Blink = {
			[Goal] = Color2
		}
		
		CThread(function()
			local T1 = Utils.Tween(Object, "Quad", "Out", Time, Blink).Completed
			T1.Wait(T1);
			local T2 = Utils.Tween(Object, "Quad", "Out", Time, Normal);
		end)()
	end
	
	Utils.TweenTrans = function(Object, Transparency)
		local Properties = {
			TextBox = "TextTransparency",
			TextLabel = "TextTransparency",
			TextButton = "TextTransparency",
			ImageButton = "ImageTransparency",
			ImageLabel = "ImageTransparency"
		}
	
		local Descendants = GetDescendants(Object);
		for i = 1, #Descendants do
			local Instance_ = Descendants[i]
			if (IsA(Instance_, "GuiObject")) then
				for Class, Property in next, Properties do
					if (IsA(Instance_, Class) and Instance_[Property] ~= 1) then
						Utils.Tween(Instance_, "Quad", "Out", .5, {
							[Property] = Transparency
						});
						break
					end
				end
				if Instance_.Name == "Overlay" and Transparency == 0 then -- check for overlay
					Utils.Tween(Object, "Quad", "Out", .5, {
						BackgroundTransparency = .5
					});
				elseif (Instance_.BackgroundTransparency ~= 1) then
					Utils.Tween(Instance_, "Quad", "Out", .5, {
						BackgroundTransparency = Transparency
					});
				end
			end
		end
	
		return Utils.Tween(Object, "Quad", "Out", .5, {
			BackgroundTransparency = Transparency
		});
	end
	
	Utils.Intro = function(Object)
		local Frame = Instancenew("Frame")
		local UICorner = Instancenew("UICorner")
		local CornerRadius = Object:FindFirstChild("UICorner") and Object.UICorner.CornerRadius or UDim.new(0, 0)
	
		Frame.Name = "IntroFrame"
		Frame.ZIndex = 1000
		Frame.Size = UDim2.fromOffset(Object.AbsoluteSize.X, Object.AbsoluteSize.Y)
		Frame.AnchorPoint = Vector2.new(.5, .5)
		Frame.Position = UDim2.new(Object.Position.X.Scale, Object.Position.X.Offset + (Object.AbsoluteSize.X / 2), Object.Position.Y.Scale, Object.Position.Y.Offset + (Object.AbsoluteSize.Y / 2))
		Frame.BackgroundColor3 = Object.BackgroundColor3
		Frame.BorderSizePixel = 0
	
		UICorner.CornerRadius = CornerRadius
		UICorner.Parent = Frame
	
		Frame.Parent = Object.Parent
	
		if (Object.Visible) then
			Frame.BackgroundTransparency = 1
	
			local Tween = Utils.Tween(Frame, "Quad", "Out", .25, {
				BackgroundTransparency = 0
			});
	
			CWait(Tween.Completed);
			Object.Visible = false
	
			local Tween = Utils.Tween(Frame, "Quad", "Out", .25, {
				Size = UDim2.fromOffset(0, 0);
			});
	
			Utils.Tween(UICorner, "Quad", "Out", .25, {
				CornerRadius = UDimnew(1, 0);
			});
	
			CWait(Tween.Completed);
			Destroy(Frame);
		else
			Frame.Visible = true
			Frame.Size = UDim2.fromOffset(0, 0)
			UICorner.CornerRadius = UDimnew(1, 0)
	
			local Tween = Utils.Tween(Frame, "Quad", "Out", .25, {
				Size = UDim2.fromOffset(Object.AbsoluteSize.X, Object.AbsoluteSize.Y);
			});
	
			Utils.Tween(UICorner, "Quad", "Out", .25, {
				CornerRadius = CornerRadius
			});
	
			CWait(Tween.Completed);
			Object.Visible = true
	
			local Tween = Utils.Tween(Frame, "Quad", "Out", .25, {
				BackgroundTransparency = 1
			});
	
			CWait(Tween.Completed);
			Destroy(Frame);
		end
	end
	
	Utils.MakeGradient = function(ColorTable)
		local Table = {}
		for Time, Color in pairs(ColorTable) do
			Table[#Table + 1] = ColorSequenceKeypoint.new(Time - 1, Color)
		end
		return ColorSequence.new(Table)
	end
	
	UILibrary.__index = UILibrary
	
	UILibrary.new = function(ColorTheme)
		assert(typeof(ColorTheme) == "Color3", "[UI] ColorTheme must be a Color3.");
	
		local NewUI = {}
		local UI = Instancenew("ScreenGui");
		setmetatable(NewUI, UILibrary)
		ParentGui(UI);
		MainUI = UI
		NewUI.UI = UI
		NewUI.ColorTheme = ColorTheme
		return NewUI
	end
	
	function UILibrary:LoadWindow(Title, Size)
		local Window = Clone(GuiObjects.Load.Window);
		local Main = Window.Main
		local Overlay = Main.Overlay
		local OverlayMain = Overlay.Main
		local ColorPicker = OverlayMain.ColorPicker
		local Settings = OverlayMain.Settings
		local ClosePicker = OverlayMain.Close
		local ColorCanvas = ColorPicker.ColorCanvas
		local ColorSlider = ColorPicker.ColorSlider
		local ColorGradient = ColorCanvas.ColorGradient
		local DarkGradient = ColorGradient.DarkGradient
		local CanvasBar = ColorGradient.Bar
		local RainbowGradient = ColorSlider.RainbowGradient
		local SliderBar = RainbowGradient.Bar
		local CanvasHitbox = ColorCanvas.Hitbox
		local SliderHitbox = ColorSlider.Hitbox
		local ColorPreview = Settings.ColorPreview
		local ColorOptions = Settings.Options
		local RedTextBox = ColorOptions.Red.TextBox
		local BlueTextBox = ColorOptions.Blue.TextBox
		local GreenTextBox = ColorOptions.Green.TextBox
		local RainbowToggle = ColorOptions.Rainbow
		Utils.Click(OverlayMain.Close, "BackgroundColor3");
		
		Window.Size = Size
		Window.Position = UDim2new(0.5, -Size.X.Offset / 2, 0.5, -Size.Y.Offset / 2);
		Window.Main.Title.Text = Title
		Window.Parent = self.UI
		
		Utils.Draggable(Window);
	
		local Idle = false
		local LeftWindow = false
		local Timer = tick();
		AddConnection(CConnect(Window.MouseEnter, function()
			LeftWindow = false
			if Idle then
				Idle = false
				Utils.TweenTrans(Window, 0)
			end
		end));
		AddConnection(CConnect(Window.MouseLeave, function()
			LeftWindow = true
			Timer = tick();
		end))
		
		AddConnection(CConnect(Services.RunService.RenderStepped, function()
			if LeftWindow then
				local Time = tick() - Timer
				if Time >= 3 and not Idle then
					Utils.TweenTrans(Window, .75);
					Idle = true
				end
			end
		end));
		
		
		local WindowLibrary = {}
		local PageCount = 0
		local SelectedPage
		
		WindowLibrary.GetPosition = function()
			return Window.Position
		end
		WindowLibrary.SetPosition = function(NewPos)
			Window.Position = NewPos
		end
	
		function WindowLibrary.NewPage(Title)
			local Page = Clone(GuiObjects.New.Page);
			local TextButton = Clone(GuiObjects.New.TextButton);
	
			if (PageCount == 0) then
				TextButton.TextColor3 = Colors.PageTextPressed
				TextButton.BackgroundColor3 = Colors.PageBackgroundPressed
				TextButton.BorderColor3 = Colors.PageBorderPressed
				SelectedPage = Page
			end
			
			AddConnection(CConnect(TextButton.MouseEnter, function()
				if (SelectedPage.Name ~= TextButton.Name) then
					Utils.Tween(TextButton, "Quad", "Out", .25, {
						TextColor3 = Colors.PageTextHover;
						BackgroundColor3 = Colors.PageBackgroundHover;
						BorderColor3 = Colors.PageBorderHover;
					});
				end
			end));
			
			AddConnection(CConnect(TextButton.MouseLeave, function()
				if (SelectedPage.Name ~= TextButton.Name) then
					Utils.Tween(TextButton, "Quad", "Out", .25, {
						TextColor3 = Colors.PageTextIdle;
						BackgroundColor3 = Colors.PageBackgroundIdle;
						BorderColor3 = Colors.PageBackgroundIdle;
					});
				end
			end));
			
			AddConnection(CConnect(TextButton.MouseButton1Down, function()
				if (SelectedPage.Name ~= TextButton.Name) then
					Utils.Tween(TextButton, "Quad", "Out", .25, {
						TextColor3 = Colors.PageTextPressed;
					});
				end
			end));
			
			AddConnection(CConnect(TextButton.MouseButton1Click, function()
				if (SelectedPage.Name ~= TextButton.Name) then
					Utils.Tween(TextButton, "Quad", "Out", .25, {
						TextColor3 = Colors.PageTextPressed;
						BackgroundColor3 = Colors.PageBackgroundPressed;
						BorderColor3 = Colors.PageBorderPressed;
					});
					
					Utils.Tween(Window.Main.Selection[SelectedPage.Name], "Quad", "Out", .25, {
						TextColor3 = Colors.PageTextIdle;
						BackgroundColor3 = Colors.PageBackgroundIdle;
						BorderColor3 = Colors.PageBackgroundIdle;
					});
					
					SelectedPage = Page
					Window.Main.Container.UIPageLayout:JumpTo(SelectedPage)
				end
			end));
	
			
			Page.Name = Title
			TextButton.Name = Title
			TextButton.Text = Title
			
			Page.Parent = Window.Main.Container
			TextButton.Parent = Window.Main.Selection
			
			PageCount = PageCount + 1
			
			local PageLibrary = {}
			
			function PageLibrary.NewSection(Title)
				local Section = GuiObjects.Section.Container:Clone()
				local SectionOptions = Section.Options
				local SectionUIListLayout = Section.Options.UIListLayout
	
				-- Utils.SmoothScroll(Section.Options, .14)
				Section.Title.Text = Title
				Section.Parent = Page.Selection
				
				AddConnection(CConnect(GetPropertyChangedSignal(SectionUIListLayout, "AbsoluteContentSize"), function()
					SectionOptions.CanvasSize = UDim2.fromOffset(0, SectionUIListLayout.AbsoluteContentSize.Y + 5)
				end))
				
				local ElementLibrary = {}
				
				
				local function ToggleFunction(Container, Enabled, Callback) -- fpr color picker
					local Switch = Container.Switch
					local Hitbox = Container.Hitbox
					Container.BackgroundColor3 = self.ColorTheme
					
					if (not Enabled) then
						Switch.Position = UDim2.fromOffset(2, 2);
						Container.BackgroundColor3 = Colors.ElementBackground
					end
					
					AddConnection(CConnect(Hitbox.MouseButton1Click, function()
						Enabled = not Enabled
						
						Utils.Tween(Switch, "Quad", "Out", .25, {
							Position = Enabled and UDim2.new(1, -18, 0, 2) or UDim2.fromOffset(2, 2)
						});
						Utils.Tween(Container, "Quad", "Out", .25, {
							BackgroundColor3 = Enabled and self.ColorTheme or Colors.ElementBackground
						});
						
						Callback(Enabled);
					end));
				end
				
				
				function ElementLibrary.Toggle(Title, Enabled, Callback)
					local Toggle = Clone(GuiObjects.Elements.Toggle);
					local Container = Toggle.Container
					ToggleFunction(Container, Enabled, Callback);
					
					Toggle.Title.Text = Title
					Toggle.Parent = Section.Options
				end
				
				
				function ElementLibrary.Slider(Title, Args, Callback)
					local Slider = Clone(GuiObjects.Elements.Slider);
					local Container = Slider.Container
					local ContainerSliderBar = Container.SliderBar
					local BarFrame = ContainerSliderBar.BarFrame
					local Bar = BarFrame.Bar
					local Label = Bar.Label
					local Hitbox = Container.Hitbox
					
					Bar.BackgroundColor3 = self.ColorTheme
					Bar.Size = UDim2.fromScale(Args.Default / Args.Max, 1);
					Label.Text = tostring(Args.Default);
					Label.BackgroundTransparency = 1
					Label.TextTransparency = 1
					Container.Min.Text = tostring(Args.Min);
					Container.Max.Text = tostring(Args.Max);
					Slider.Title.Text = Title
									
					local Moving = false
					
					local function Update()
						local RightBound = BarFrame.AbsoluteSize.X
						local Position = clamp(Mouse.X - BarFrame.AbsolutePosition.X, 0, RightBound);
						local Value = Args.Min + (Args.Max - Args.Min) * (Position / RightBound) -- get difference then add min value, lol lerp
						
						Value = Value - (Value % Args.Step);
						Callback(Value);
						
						local Precent = Value / Args.Max
						local Size = UDim2.fromScale(Precent, 1);
						local Tween = Utils.Tween(Bar, "Linear", "Out", .05, {
							Size = Size
						});
						
						Label.Text = Value
						CWait(Tween.Completed);
					end
				
					AddConnection(CConnect(Hitbox.MouseButton1Down, function()
						Moving = true
						
						Utils.Tween(Label, "Quad", "Out", .25, {
							BackgroundTransparency = 0;
							TextTransparency = 0;
						});
						
						Update();
					end))
					
					AddConnection(CConnect(Services.UserInputService.InputEnded, function(Input)
						if (Input.UserInputType == Enum.UserInputType.MouseButton1 and Moving) then
							Moving = false
							
							Utils.Tween(Label, "Quad", "Out", .25, {
								BackgroundTransparency = 1;
								TextTransparency = 1;
							});
						end
					end));
					
					AddConnection(CConnect(Mouse.Move, Debounce(function()
						if Moving then
							Update()
						end
					end)))
					
					Slider.Parent = Section.Options
				end
				
				function ElementLibrary.ColorPicker(Title, DefaultColor, Callback)
					local SelectColor = Clone(GuiObjects.Elements.SelectColor);
					local CurrentColor = DefaultColor
					local Button = SelectColor.Button
								   
					local H, S, V = DefaultColor.ToHSV(DefaultColor);
					local Opened = false
					local Rainbow = false
					
					local function UpdateText()
						RedTextBox.PlaceholderText = tostring(floor(CurrentColor.R * 255));
						GreenTextBox.PlaceholderText = tostring(floor(CurrentColor.G * 255));
						BlueTextBox.PlaceholderText = tostring(floor(CurrentColor.B * 255));
					end
					
					local function UpdateColor()
						H, S, V = CurrentColor.ToHSV(CurrentColor);
						
						SliderBar.Position = UDim2new(0, 0, H, 2);
						CanvasBar.Position = UDim2new(S, 2, 1 - V, 2);
						ColorGradient.UIGradient.Color = Utils.MakeGradient({
							[1] = Color3new(1, 1, 1);
							[2] = Color3fromHSV(H, 1, 1);
						});
						
						ColorPreview.BackgroundColor3 = CurrentColor
						UpdateText();
					end
	
					local function UpdateHue(Hue)
						SliderBar.Position = UDim2.new(0, 0, Hue, 2)
						ColorGradient.UIGradient.Color = Utils.MakeGradient({
							[1] = Color3.new(1, 1, 1);
							[2] = Color3.fromHSV(Hue, 1, 1);
						})
						
						ColorPreview.BackgroundColor3 = CurrentColor
						UpdateText();
					end
					
					local function ColorSliderInit()
						local Moving = false
						
						local function Update()
							if Opened and not Rainbow then
								local LowerBound = SliderHitbox.AbsoluteSize.Y
								local Position = math.clamp(Mouse.Y - SliderHitbox.AbsolutePosition.Y, 0, LowerBound);
								local Value = Position / LowerBound
								
								H = Value
								CurrentColor = Color3.fromHSV(H, S, V);
								ColorPreview.BackgroundColor3 = CurrentColor
								ColorGradient.UIGradient.Color = Utils.MakeGradient({
									[1] = Color3.new(1, 1, 1);
									[2] = Color3.fromHSV(H, 1, 1);
								});
								
								UpdateText();
								
								local Position = UDim2.new(0, 0, Value, 2)
								local Tween = Utils.Tween(SliderBar, "Linear", "Out", .05, {
									Position = Position
								});
								
								Callback(CurrentColor)
								CWait(Tween.Completed);
							end
						end
					
						AddConnection(CConnect(SliderHitbox.MouseButton1Down, function()
							Moving = true
							Update()
						end))
						
						AddConnection(CConnect(Services.UserInputService.InputEnded, function(Input)
							if (Input.UserInputType == Enum.UserInputType.MouseButton1 and Moving) then
								Moving = false
							end
						end))
						
						AddConnection(CConnect(Mouse.Move, Debounce(function()
							if Moving then
								Update()
							end
						end)))
					end
					local function ColorCanvasInit()
						local Moving = false
						
						local function Update()
							if Opened then
								local LowerBound = CanvasHitbox.AbsoluteSize.Y
								local YPosition = clamp(Mouse.Y - CanvasHitbox.AbsolutePosition.Y, 0, LowerBound)
								local YValue = YPosition / LowerBound
								local RightBound = CanvasHitbox.AbsoluteSize.X
								local XPosition = clamp(Mouse.X - CanvasHitbox.AbsolutePosition.X, 0, RightBound)
								local XValue = XPosition / RightBound
								
								S = XValue
								V = 1 - YValue
								
								CurrentColor = Color3.fromHSV(H, S, V);
								ColorPreview.BackgroundColor3 = CurrentColor
								UpdateText();
								
								local Position = UDim2.new(XValue, 2, YValue, 2);
								local Tween = Utils.Tween(CanvasBar, "Linear", "Out", .05, {
									Position = Position
								});
								Callback(CurrentColor);
								CWait(Tween.Completed);
							end
						end
					
						AddConnection(CConnect(CanvasHitbox.MouseButton1Down, function()
							Moving = true
							Update();
						end));
						
						AddConnection(CConnect(Services.UserInputService.InputEnded, function(Input)
							if Input.UserInputType == Enum.UserInputType.MouseButton1 and Moving then
								Moving = false
							end
						end));
						
						AddConnection(CConnect(Mouse.Move, Debounce(function()
							if Moving then
								Update();
							end
						end)));
					end
					
					ColorSliderInit();
					ColorCanvasInit();
					
					AddConnection(CConnect(Button.MouseButton1Click, function()
						if not Opened then
							Opened = true
							UpdateColor()
							RainbowToggle.Container.Switch.Position = Rainbow and UDim2.new(1, -18, 0, 2) or UDim2.fromOffset(2, 2)
							RainbowToggle.Container.BackgroundColor3 = Rainbow and self.ColorTheme or Colors.ElementBackground
							Overlay.Visible = true
							OverlayMain.Visible = false
							Utils.Intro(OverlayMain)
						end
					end))
					
					AddConnection(CConnect(ClosePicker.MouseButton1Click, Debounce(function()
						Button.BackgroundColor3 = CurrentColor
						Utils.Intro(OverlayMain)
						Overlay.Visible = false
						Opened = false
					end)))
					
					AddConnection(CConnect(RedTextBox.FocusLost, function()
						if Opened then
							local Number = tonumber(RedTextBox.Text)
							if Number then
								Number = clamp(floor(Number), 0, 255);
								CurrentColor = Color3new(Number / 255, CurrentColor.G, CurrentColor.B);
								UpdateColor();
								RedTextBox.PlaceholderText = tostring(Number);
								Callback(CurrentColor);
							end
							RedTextBox.Text = ""
						end
					end))
					
					AddConnection(CConnect(GreenTextBox.FocusLost, function()
						if Opened then
							local Number = tonumber(GreenTextBox.Text)
							if Number then
								Number = clamp(floor(Number), 0, 255);
								CurrentColor = Color3new(CurrentColor.R, Number / 255, CurrentColor.B);
								UpdateColor();
								GreenTextBox.PlaceholderText = tostring(Number);
								Callback(CurrentColor);
							end
							GreenTextBox.Text = ""
						end
					end))
					
					AddConnection(CConnect(BlueTextBox.FocusLost, function()
						if Opened then
							local Number = tonumber(BlueTextBox.Text);
							if Number then
								Number = clamp(floor(Number), 0, 255);
								CurrentColor = Color3new(CurrentColor.R, CurrentColor.G, Number / 255);
								UpdateColor();
								BlueTextBox.PlaceholderText = tostring(Number);
								Callback(CurrentColor);
							end
							BlueTextBox.Text = ""
						end
					end))
					
					ToggleFunction(RainbowToggle.Container, false, function(Callback)
						if Opened then
							Rainbow = Callback
						end
					end)
					
					AddConnection(CConnect(Services.RunService.RenderStepped, function()
						if Rainbow then
							local Hue = (tick() / 5) % 1
							CurrentColor = Color3.fromHSV(Hue, S, V);
							
							if Opened then
								UpdateHue(Hue);
							end
							
							Button.BackgroundColor3 = CurrentColor
							Callback(CurrentColor);
						end
					end));
									
					Button.BackgroundColor3 = DefaultColor
					SelectColor.Title.Text = Title
					SelectColor.Parent = Section.Options
				end
				
				function ElementLibrary.Dropdown(Title, Options, Callback)
					local DropdownElement = GuiObjects.Elements.Dropdown.DropdownElement:Clone()
					local DropdownSelection = GuiObjects.Elements.Dropdown.DropdownSelection:Clone()
					local TextButton = GuiObjects.Elements.Dropdown.TextButton
					local Button = DropdownElement.Button
					local Opened = false
					local Size = (TextButton.Size.Y.Offset + 5) * #Options
					
					local function ToggleDropdown()
						Opened = not Opened
						
						if (Opened) then
							DropdownSelection.Frame.Visible = true
							DropdownSelection.Visible = true
							
							Utils.Tween(DropdownSelection, "Quad", "Out", .25, {
								Size = UDim2.new(1, -10, 0, Size)
							});
							Utils.Tween(DropdownElement.Button, "Quad", "Out", .25, {
								Rotation = 180
							});
						else
							Utils.Tween(DropdownElement.Button, "Quad", "Out", .25, {
								Rotation = 0
							});
							CWait(Utils.Tween(DropdownSelection, "Quad", "Out", .25, {
								Size = UDim2.new(1, -10, 0, 0)
							}).Completed);
							
							DropdownSelection.Frame.Visible = false
							DropdownSelection.Visible = false
						end
					end
	
					for _, v in next, Options do
						local Clone = Clone(TextButton);
						
						AddConnection(CConnect(Clone.MouseButton1Click, function()
							DropdownElement.Title.Text = Title .. ": " .. v
							Callback(v);
							ToggleDropdown();
						end))
						
						Utils.Click(Clone, "BackgroundColor3")
						Clone.Text = v
						Clone.Parent = DropdownSelection.Container
					end
					
					AddConnection(CConnect(Button.MouseButton1Click, ToggleDropdown));
					
					DropdownElement.Title.Text = Title
					DropdownSelection.Visible = false
					DropdownSelection.Frame.Visible = false
					DropdownSelection.Size = UDim2.new(1, -10, 0, 0)
					DropdownElement.Parent = Section.Options
					DropdownSelection.Parent = Section.Options
				end
				
				return ElementLibrary
				
			end
			
			return PageLibrary
		end
			
		return WindowLibrary
	end
	
	local UI = UILibrary.new(Color3fromRGB(255, 79, 87))
	Window = UI:LoadWindow('<font color="#ff4f57">fates</font> esp', UDim2.fromOffset(400, 279));
	local ESP = Window.NewPage("esp")
	local AIMBOT = Window.NewPage("aimbot")
	local AimbotSection = AIMBOT.NewSection("Aimbot");
	local ConfigSection = AIMBOT.NewSection("Config");
	local TracersSection = ESP.NewSection("Tracers")
	local EspSection = ESP.NewSection("Other")
	
	Window.SetPosition(UIOptions.Position);
	
	TracersSection.Toggle("Enable Tracers", TracerOptions.Enabled, function(Callback)
		TracerOptions.Enabled = Callback
	end)
	TracersSection.Dropdown("To", {"Head","Torso","Left Arm","Right Arm","Left Leg","Right Leg"}, function(Callback)
		TracerOptions.To = Callback
	end)
	TracersSection.Dropdown("From", {"Top", "Bottom", "Left", "Right"}, function(Callback)
		local ViewportSize = Camera.ViewportSize
		TracerOptions.From = Callback
		for i, v in next, Drawings do
			if (v.Tracer) then
				v.Tracer.From = Callback == "Top" and Vector2new(ViewportSize.X / 2, ViewportSize.Y - ViewportSize.Y) or Callback == "Bottom" and Vector2new(ViewportSize.X / 2, ViewportSize.Y) or Callback == "Left" and Vector2new(ViewportSize.X - ViewportSize.X, ViewportSize.Y / 2) or Callback == "Right" and Vector2new(ViewportSize.X, ViewportSize.Y / 2);
			end
		end
	end)
	
	TracersSection.Slider("Tracer Transparency", {Min = 0, Max = 1, Default = TracerOptions.Transparency, Step = .1}, function(Callback)
		TracerOptions.Transparency = Callback
		for i, v in next, Drawings do
			if (v.Tracer) then
				v.Tracer.Transparency = Callback
			end
		end
	end)
	TracersSection.Slider("Tracer Thickness", {Min = 0, Max = 5, Default = TracerOptions.Thickness, Step = .1}, function(Callback)
		TracerOptions.Thickness = Callback
		for i, v in next, Drawings do
			if (v.Tracer) then
				v.Tracer.Thickness = Callback
			end
		end
	end)
	
	EspSection.Toggle("Team Colors", EspOptions.TeamColors, function(Callback)
		EspOptions.TeamColors = Callback
		if (Callback == false) then
			for i, v in next, Drawings do
				if (v.Tracer and v.Text) then
					v.Tracer.Color = EspOptions.Color
					v.Text.Color = EspOptions.Color
				end
			end
		end
	end)
	EspSection.ColorPicker("Esp Color", EspOptions.Color, function(Callback)
		EspOptions.TeamColors = false
		EspOptions.Color = Callback
		for i, v in next, Drawings do
			if (v.Tracer and v.Text and v.Box) then
				v.Tracer.Color = Callback
				v.Text.Color = Callback
				v.Box.Color = Callback
			end
		end
	end)
	EspSection.Toggle("Show Names", EspOptions.Names, function(Callback)
		EspOptions.Names = Callback
	end)
	EspSection.Toggle("Show Health", EspOptions.Health, function(Callback)
		EspOptions.Health = Callback
	end)
	EspSection.Toggle("Show Distance", EspOptions.Distance, function(Callback)
		EspOptions.Distance = Callback
	end)
	EspSection.Slider("Render Distance", {Min = 0, Max = 7000, Default = EspOptions.RenderDistance, Step = 10}, function(Callback)
		EspOptions.RenderDistance = Callback
	end)
	EspSection.Dropdown("Team", {"Allies", "Enemies", "All"}, function(Callback)
		EspOptions.Team = Callback
	end)
	EspSection.Toggle("Box Esp", EspOptions.BoxEsp, function(Callback)
		EspOptions.BoxEsp = Callback
		for i, v in next, Drawings do
			if (v.Box) then
				v.Box.Visible = Callback
			end
		end
	end)
	EspSection.Slider("Box Thickness", {Min = 0, Max = 5, Default = EspOptions.Transparency, Step = .1}, function(Callback)
		EspOptions.Thickness = Callback
		for i, v in next, Drawings do
			if (v.Box) then
				v.Box.Thickness = Callback
			end
		end
	end)
	EspSection.Slider("Box Transparency", {Min = 0, Max = 1, Default = EspOptions.Transparency, Step = .1}, function(Callback)
		EspOptions.Transparency = Callback
		for i, v in next, Drawings do
			if (v.Box) then
				v.Box.Transparency = Callback
			end
		end
	end)
	EspSection.Toggle("Kill Script", false, function(Callback)
		KillScript();
	end)
	
	AimbotSection.Toggle("Silent Aim", AimbotOptions.SilentAim, function(Callback)
		AimbotOptions.SilentAim = Callback
	end)
	AimbotSection.Toggle("Wallbang", Wallbang, function(Callback)
		Wallbang = Callback
	end)
	AimbotSection.Dropdown("Aimbone", {"Head","Torso"}, function(Callback)
		if (Callback == "Torso") then
			AimBone = ISBB and "Chest" or "HumanoidRootPart"
		else
			AimBone = Callback
		end
	end)
	AimbotSection.Slider("Hit Chance", {Min = 0, Max = 100, Default = SilentAimHitChance, Step = 1}, function(Callback)
		SilentAimHitChance = Callback
	end)
	AimbotSection.Toggle("3rd P Aimlock", AimbotOptions.ThirdPerson, function(Callback)
		AimbotOptions.ThirdPerson = Callback
	end)
	AimbotSection.Toggle("1st P Aimlock", AimbotOptions.FirstPerson, function(Callback)
		AimbotOptions.FirstPerson = Callback
	end)
	AimbotSection.Dropdown("Team", {"Allies", "Enemies", "All"}, function(Callback)
		AimbotOptions.Team = Callback
	end)
	AimbotSection.Dropdown("Lock Type", {"Closest Cursor", "Closest Player"}, function(Callback)
		if (Callback == "Closest Cursor") then
			AimbotOptions.ClosestCharacter = false
			AimbotOptions.ClosestCursor = true       
		else
			AimbotOptions.ClosestCharacter = true
			AimbotOptions.ClosestCursor = false
		end
	end)
	
	ConfigSection.Toggle("Show Fov", AimbotOptions.ShowFov, function(Callback)
		AimbotOptions.ShowFov = Callback
		Drawings.SilentAim.Fov.Visible = Callback
	end)
	ConfigSection.ColorPicker("Fov Color", AimbotOptions.FovColor, function(Callback)
		Drawings.SilentAim.Fov.Color = Callback
		Drawings.SilentAim.Snaplines.Color = Callback
	end)
	ConfigSection.Slider("Fov Size", {Min = 70, Max = 500, Default = AimbotOptions.FovSize, Step = 10}, function(Callback)
		AimbotOptions.FovSize = Callback
		Drawings.SilentAim.Fov.Radius = Callback
	end)
	ConfigSection.Toggle("Enable Snaplines", AimbotOptions.Snaplines, function(Callback)
		AimbotOptions.Snaplines = Callback
	end)
	
	if (not isfile("fates-esp.json")) then
		Save();
	end
	
	CThread(function()
		while wait(15) do
			if (UI) then
				Save();
			else
				break;
			end
		end
	end)();
	
	return KillScript
end)
Section:NewButton("Reviz Admin", "A good admin script for fast use.", function()
    -- Creator: illremember#3799

-- Credits to infinite yield, harkinian, dex creators

prefix = ";"
wait(0.3)
Commands = {
	'[-] cmdbar is shown when ; is pressed.',
	'[1] kill [plr] -- You need a tool! Will kill the player, use rkill to kill you and player',
	'[2] bring [plr] -- You need a tool! Will bring player to you',
	'[3] spin [plr] -- You need a tool! Makes you and the player spin crazy',
	'[4] unspin -- Use after using spin cmd and dying, so you stop loop teleporting',
	'[5] attach [plr] -- You need a tool! Attaches you to player',
	'[6] unattach [plr] -- Attempts to unattach you from a player',
	'[7] follow [plr] -- Makes you follow behind the player',
	'[8] unfollow',
	'[9] freefall [plr] -- You need a tool! Teleports you and the player up into the air',
	'[10] trail [plr] -- The opposite of follow, you stay infront of player',
	'[11] untrail',
	'[12] orbit [plr] -- Makes you orbit the player',
	'[13] unorbit',
	'[14] fling [plr] -- Makes you fling the player',
	'[15] unfling',
	'[16] fecheck -- Checks if the game is FE or not',
	'[17] void [plr] -- Teleports player to the void',
	'[18] noclip -- Gives you noclip to walk through walls',
	'[19] clip -- Removes noclip',
	'[20] speed [num]/ws [num] -- Changes how fast you walk 16 is default',
	'[21] jumppower [num]/jp [num] -- Changes how high you jump 50 is default',
	'[22] hipheight [num]/hh [num] -- Changes how high you float 0 is default',
	'[23] default -- Changes your speed, jumppower and hipheight to default values',
	'[24] annoy [plr] -- Loop teleports you to the player',
	'[25] unannoy',
	'[26] headwalk [plr] -- Loop teleports you to the player head',
	'[27] unheadwalk',
	'[28] nolimbs -- Removes your arms and legs',
	'[29] god -- Gives you FE Godmode',
	'[30] drophats -- Drops your accessories',
	'[31] droptool -- Drops any tool you have equipped',
	'[32] loopdhats -- Loop drops your accessories',
	'[33] unloopdhats',
	'[34] loopdtool -- Loop drops any tools you have equipped',
	'[35] unloopdtool',
	'[36] invisible -- Gives you invisibility CREDIT TO TIMELESS',
	'[37] view [plr] -- Changes your camera to the player character',
	'[38] unview',
	'[39] goto [plr] -- Teleports you to player',
	'[40] fly -- Allows you to fly, credit to Infinite Yield',
	'[41] unfly',
	'[42] chat [msg] -- Makes you chat a message',
	'[43] spam [msg] -- Spams a message',
	'[44] unspam',
	'[45] spamwait [num] -- Changes delay of chatting a message for the spam command in seconds default is 1 second',
	'[46] pmspam [plr] -- Spams a player in private message',
	'[47] unpmspam',
	'[48] cfreeze [plr] -- Freezes a player on your client, they will only be frozen for you',
	'[49] uncfreeze [plr]',
	'[50] unlockws -- Unlocks the workspace',
	'[51] lockws -- Locks the workspace',
	'[52] btools -- Gives you btools that will only show to you useful for deleting certain blocks only for you',
	'[53] pstand -- Enables platform stand',
	'[54] unpstand -- Disables platform stand',
	'[55] blockhead -- Removes your head mesh',
	'[56] sit',
	'[57] bringobj [obj] -- Only shows on client, brings an object/part to you constantly, can be used to bring healing parts, weapons, money etc, type in exact name',
	'[58] wsvis [num] -- Changes visibility of workspace parts, num should be between 0 and 1, only shows client sided',
	'[59] hypertotal -- Loads in my FE GUI Hypertotal',
	'[60] cmds -- Prints all commands',
	'[61] rmeshhats/blockhats -- Removes the meshes of all your accessories aka block hats',
	'[62] rmeshtool/blocktool -- Removes the mesh of the tool you have equipped aka block tool',
	'[63] spinner -- Makes you spin',
	'[64] nospinner',
	'[65] reach [num] -- Gives you reach, mostly used for swords, say ;reachd for default and enter number after for custom',
	'[66] noreach -- Removes reach, must have tool equipped',
	'[67] rkill [plr] -- Kills you and the player, use kill to just kill the player without dying',
	'[68] tp me [plr] -- Alternative to goto',
	'[69] cbring [plr] -- Brings player infront of you, shows only on client, allows you to do damage to player',
	'[70] uncbring',
	'[71] swap [plr] -- You need a tool! Swaps players position with yours and your position with players',
	'[72] givetool [plr] -- Gives the tool you have equipped to the player',
	'[73] glitch [plr] -- Glitches you and the player, looks very cool',
	'[74] unglitch -- Unglitches you',
	'[75] grespawn -- Alternative to normal respawn and usually works best for when you want to reset with FE Godmode',
	'[76] explorer -- Loads up DEX',
	'[77] reset -- Resets your character.',
	'[78] anim [id] -- Applies an animation on you, must be created by ROBLOX',
	'[79] animgui -- Loads up Energize animations GUI',
	'[80] savepos -- Saves your current position',
	'[81] loadpos -- Teleports you to your saved position',
	'[82] bang [plr] -- 18+ will not work if you have FE Godmode on',
	'[83] unbang',
	'[84] delcmdbar -- Removes the command bar completely',
	'[85] bringmod [obj] -- Brings all the parts in a model, client only, comes from ;bringobj enter exact name of model',
	'[86] shutdown -- Uses harkinians script to shutdown server',
	'[87] respawn -- If grespawn doesnt work you can use respawn',
	'[88] delobj [obj] -- Deletes a certain brick in workspace, client sided',
	'[89] getplrs -- Prints all players in game',
	'[90] deldecal -- Deletes all decals client sided',
	'[91] opfinality -- Loads in my FE GUI Opfinality',
	'[92] remotes -- Prints all remotes in the game in the console when added',
	'[93] noremotes -- Stops printing remotes',
	'[94] tpdefault -- Stops all loop teleports to a player',
	'[95] stopsit -- Will not allow you to sit',
	'[96] gosit -- Allows you to sit',
	'[97] clicktp -- Enables click tp',
	'[98] noclicktp -- Disables click tp',
	'[99] toolson -- If any tools are dropped in the workspace you will automatically get them',
	'[100] toolsoff -- Stops ;toolson',
	'[101] version -- Gets the admin version',
	'[102] state [num] -- Changes your humanoid state, ;unstate to stop.',
	'[103] gravity [num] -- Changes workspace gravity default is 196.2',
	'[104] pgs -- Checks if the game has PGSPhysicsSolverEnabled enabled',
	'[105] clickdel -- Delete any block you press q on, client sided',
	'[106] noclickdel -- Stops clickdel',
	'[107] looprhats -- Loop removes mesh of your hats/loop block hats',
	'[108] unlooprhats -- Stops loop removing mesh',
	'[109] looprtool -- Loop removes mesh of your tool/loop block tools',
	'[110] unlooprtool -- Stops loop removing mesh',
	'[111] givealltools [plr] -- Gives all the tools you have in your backpack to the player',
	'[112] age [plr] -- Makes you chat the account age of the player',
	'[113] id [plr] -- Makes you chat the account ID of the player',
	'[114] .age [plr] -- Privately shows you the account age of the player',
	'[115] .id [plr] -- Privately shows you the account ID of the player',
	'[116] gameid -- Shows the game ID',
	'[117] removeinvis -- Removes all invisible walls/parts, client sided',
	'[118] removefog -- Removes fog, client sided',
	'[119] disable -- Disables your character by removing humanoid',
	'[120] enable -- Enables your character by adding humanoid',
	'[121] prefix [key] -- Changes the prefix used, default is ;',
	'[122] ;resetprefix -- Resets the prefix to ; incase you change it to an unusable prefix. Say exactly ";resetprefix" to do this command, no matter what your prefix is set to.',
	'[123] flyspeed [num] -- Change your fly speed, default is 1',
	'[124] carpet [plr] -- Makes you a carpet for a player, will not work if FE Godmode is on',
	'[125] uncarpet -- Stops carpet player',
	'[126] stare [plr] -- Turns your character to stare at another player',
	'[127] unstare -- Stops stare player',
	'[128] logchat -- Logs all chat (including /e and whispers) of all players',
	'[129] unlogchat -- Disables logchat',
	'[130] fixcam -- Fixes/resets your camera',
	'[131] unstate -- Stops changing state',
}
speedget = 1

lplayer = game:GetService("Players").LocalPlayer

lplayer.CharacterAdded:Connect(function(character)
	spin = false
	flying = false
	staring = false
	banpl = false
end)

function change()
	prefix = prefix
	speedfly = speedfly
end

function GetPlayer(String) -- Credit to Timeless/xFunnieuss
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            table.insert(Found,v)
        end
    elseif strl == "others" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name ~= lplayer.Name then
                table.insert(Found,v)
            end
        end   
	elseif strl == "me" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name == lplayer.Name then
                table.insert(Found,v)
            end
        end  
    else
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() then
                table.insert(Found,v)
            end
        end    
    end
    return Found    
end

local Mouse = lplayer:GetMouse()

spin = false
followed = false
traill = false
noclip = false
annoying = false
hwalk = false
droppinghats = false
droppingtools = false
flying = false
spamdelay = 1
spamming = false
spammingpm = false
cbringing = false
remotes = true
added = true
binds = false
stopsitting = false
clickgoto = false
gettingtools = false
removingmeshhats = false
removingmeshtool = false
clickdel = false
staring = false
chatlogs = false
banpl = false
changingstate = false
statechosen = 0

adminversion = "Reviz Admin by illremember, Version 2.0"

flying = false
speedfly = 1

function plrchat(plr, chat)
print(plr.Name..": "..tick().."\n"..chat)
end

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
v.Chatted:connect(function(chat)
if chatlogs then
plrchat(v, chat)
end
end)
end
game:GetService("Players").PlayerAdded:connect(function(plr)
plr.Chatted:connect(function(chat)
if chatlogs then
plrchat(plr, chat)
end
end)
end)


local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local CMDBAR = Instance.new("TextBox")
ScreenGui.Parent = game:GetService("CoreGui")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0.3, 0.1, 0.1)
Frame.BackgroundTransparency = 0.3
Frame.Position = UDim2.new(0.5, 0, 0, 10)
Frame.Size = UDim2.new(0, 200, 0, 40)
Frame.Active = true
Frame.Draggable = true
CMDBAR.Name = "CMDBAR"
CMDBAR.Parent = Frame
CMDBAR.BackgroundColor3 = Color3.new(0.105882, 0.164706, 0.207843)
CMDBAR.BackgroundTransparency = 0.20000000298023
CMDBAR.Size = UDim2.new(0, 180, 0, 20)
CMDBAR.Position = UDim2.new(0.05, 0, 0.25, 0)
CMDBAR.Font = Enum.Font.SourceSansLight
CMDBAR.FontSize = Enum.FontSize.Size14
CMDBAR.TextColor3 = Color3.new(0.945098, 0.945098, 0.945098)
CMDBAR.TextScaled = true
CMDBAR.TextSize = 14
CMDBAR.TextWrapped = true
CMDBAR.Text = "Press ; to type, Enter to execute"

local CMDS = Instance.new("ScreenGui")
local CMDSFRAME = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local TextLabel = Instance.new("TextLabel")
local closegui = Instance.new("TextButton")
CMDS.Name = "CMDS"
CMDS.Parent = game:GetService("CoreGui")
CMDSFRAME.Name = "CMDSFRAME"
CMDSFRAME.Parent = CMDS
CMDSFRAME.Active = true
CMDSFRAME.BackgroundColor3 = Color3.new(0.223529, 0.231373, 0.309804)
CMDSFRAME.BorderSizePixel = 0
CMDSFRAME.Draggable = true
CMDSFRAME.Position = UDim2.new(0, 315, 0, 100)
CMDSFRAME.Size = UDim2.new(0, 275, 0, 275)
CMDSFRAME.Visible = false
ScrollingFrame.Parent = CMDSFRAME
ScrollingFrame.BackgroundColor3 = Color3.new(0.160784, 0.160784, 0.203922)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0, 0, 0.0729999989, 0)
ScrollingFrame.Size = UDim2.new(1.04999995, 0, 0.92900002, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 10, 0)
TextLabel.Parent = ScrollingFrame
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Size = UDim2.new(0.930000007, 0, 1, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.FontSize = Enum.FontSize.Size18
TextLabel.Text = "[-] cmdbar is shown when ; is pressed.,\n[1] kill [plr] -- You need a tool! Will kill the player, use rkill to kill you and player,\n[2] bring [plr] -- You need a tool! Will bring player to you,\n[3] spin [plr] -- You need a tool! Makes you and the player spin crazy,\n[4] unspin -- Use after using spin cmd and dying, so you stop loop teleporting,\n[5] attach [plr] -- You need a tool! Attaches you to player,\n[6] unattach [plr] -- Attempts to unattach you from a player,\n[7] follow [plr] -- Makes you follow behind the player,\n[8] unfollow,\n[9] freefall [plr] -- You need a tool! Teleports you and the player up into the air,\n[10] trail [plr] -- The opposite of follow, you stay infront of player,\n[11] untrail,\n[12] orbit [plr] -- Makes you orbit the player,\n[13] unorbit,\n[14] fling [plr] -- Makes you fling the player,\n[15] unfling,\n[16] fecheck -- Checks if the game is FE or not,\n[17] void [plr] -- Teleports player to the void,\n[18] noclip -- Gives you noclip to walk through walls,\n[19] clip -- Removes noclip,\n[20] speed [num]/ws [num] -- Changes how fast you walk 16 is default,\n[21] jumppower [num]/jp [num] -- Changes how high you jump 50 is default,\n[22] hipheight [num]/hh [num] -- Changes how high you float 0 is default,\n[23] default -- Changes your speed, jumppower and hipheight to default values,\n[24] annoy [plr] -- Loop teleports you to the player,\n[25] unannoy,\n[26] headwalk [plr] -- Loop teleports you to the player head,\n[27] unheadwalk,\n[28] nolimbs -- Removes your arms and legs,\n[29] god -- Gives you FE Godmode,\n[30] drophats -- Drops your accessories,\n[31] droptool -- Drops any tool you have equipped,\n[32] loopdhats -- Loop drops your accessories,\n[33] unloopdhats,\n[34] loopdtool -- Loop drops any tools you have equipped,\n[35] unloopdtool,\n[36] invisible -- Gives you invisibility CREDIT TO TIMELESS,\n[37] view [plr] -- Changes your camera to the player character,\n[38] unview,\n[39] goto [plr] -- Teleports you to player,\n[40] fly -- Allows you to fly,\n[41] unfly,\n[42] chat [msg] -- Makes you chat a message,\n[43] spam [msg] -- Spams a message,\n[44] unspam,\n[45] spamwait [num] -- Changes delay of chatting a message for the spam command in seconds default is 1 second,\n[46] pmspam [plr] -- Spams a player in private message,\n[47] unpmspam,\n[48] cfreeze [plr] -- Freezes a player on your client, they will only be frozen for you,\n[49] uncfreeze [plr],\n[50] unlockws -- Unlocks the workspace,\n[51] lockws -- Locks the workspace,\n[52] btools -- Gives you btools that will only show to you useful for deleting certain blocks only for you,\n[53] pstand -- Enables platform stand,\n[54] unpstand -- Disables platform stand,\n[55] blockhead -- Removes your head mesh,\n[56] sit,\n[57] bringobj [obj] -- Only shows on client, brings an object/part to you constantly, can be used to bring healing parts, weapons, money etc, type in exact name,\n[58] wsvis [num] -- Changes visibility of workspace parts, num should be between 0 and 1, only shows client sided,\n[59] hypertotal -- Loads in my FE GUI Hypertotal,\n[60] cmds -- Prints all commands,\n[61] rmeshhats/blockhats -- Removes the meshes of all your accessories aka block hats,\n[62] rmeshtool/blocktool -- Removes the mesh of the tool you have equipped aka block tool,\n[63] spinner -- Makes you spin,\n[64] nospinner,\n[65] reach [num] -- Gives you reach, mostly used for swords, say ;reachd for default and enter number after for custom,\n[66] noreach -- Removes reach, must have tool equipped,\n[67] rkill [plr] -- Kills you and the player, use kill to just kill the player without dying,\n[68] tp me [plr] -- Alternative to goto,\n[69] cbring [plr] -- Brings player infront of you, shows only on client, allows you to do damage to player,\n[70] uncbring,\n[71] swap [plr] -- You need a tool! Swaps players position with yours and your position with players,\n[72] givetool [plr] -- Gives the tool you have equipped to the player,\n[73] glitch [plr] -- Glitches you and the player, looks very cool,\n[74] unglitch -- Unglitches you,\n[75] grespawn -- Alternative to normal respawn and usually works best for when you want to reset with FE Godmode,\n[76] explorer -- Loads up DEX,\n[77] reset -- Resets your character.,\n[78] anim [id] -- Applies an animation on you, must be created by ROBLOX,\n[79] animgui -- Loads up Energize animations GUI,\n[80] savepos -- Saves your current position,\n[81] loadpos -- Teleports you to your saved position,\n[82] bang [plr] -- 18+,\n[83] unbang,\n[84] delcmdbar -- Removes the command bar completely,\n[85] bringmod [obj] -- Brings all the parts in a model, client only, comes from ;bringobj enter exact name of model,\n[86] shutdown -- Uses harkinians script to shutdown server,\n[87] respawn -- If grespawn doesnt work you can use respawn,\n[88] delobj [obj] -- Deletes a certain brick in workspace, client sided,\n[89] getplrs -- Prints all players in game,\n[90] deldecal -- Deletes all decals client sided,\n[91] opfinality -- Loads in my FE GUI Opfinality,\n[92] remotes -- Prints all remotes in the game in the console when added,\n[93] noremotes -- Stops printing remotes,\n[94] tpdefault -- Stops all loop teleports to a player,\n[95] stopsit -- Will not allow you to sit,\n[96] gosit -- Allows you to sit,\n[97] clicktp -- Enables click tp,\n[98] noclicktp -- Disables click tp,\n[99] toolson -- If any tools are dropped in the workspace you will automatically get them,\n[100] toolsoff -- Stops ;toolson,\n[101] version -- Gets the admin version, \n This list of commands is NOT showing everything, go to my thread in the pastebin link to see ALL commands."
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 15
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.TextYAlignment = Enum.TextYAlignment.Top
closegui.Name = "closegui"
closegui.Parent = CMDSFRAME
closegui.BackgroundColor3 = Color3.new(0.890196, 0.223529, 0.0588235)
closegui.BorderSizePixel = 0
closegui.Position = UDim2.new(0.995000005, 0, 0, 0)
closegui.Size = UDim2.new(0.0545952693, 0, 0.0728644878, 0)
closegui.Font = Enum.Font.SourceSansBold
closegui.FontSize = Enum.FontSize.Size24
closegui.Text = "X"
closegui.TextColor3 = Color3.new(1, 1, 1)
closegui.TextSize = 20

closegui.MouseButton1Click:connect(function()
	CMDSFRAME.Visible = false
end)

game:GetService('RunService').Stepped:connect(function()
	if spin then
		lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[spinplr.Name].Character.HumanoidRootPart.CFrame
	end
	if followed then
		lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[flwplr.Name].Character.HumanoidRootPart.CFrame + game:GetService("Players")[flwplr.Name].Character.HumanoidRootPart.CFrame.lookVector * -5
	end
	if traill then
		lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[trlplr.Name].Character.HumanoidRootPart.CFrame + game:GetService("Players")[trlplr.Name].Character.HumanoidRootPart.CFrame.lookVector * 5
	end
	if annoying then
		lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[annplr.Name].Character.HumanoidRootPart.CFrame
	end
	if hwalk then
		lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[hdwplr.Name].Character.HumanoidRootPart.CFrame + Vector3.new(0, 4, 0)
	end
	if staring then
		lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(lplayer.Character.Torso.Position, game:GetService("Players")[stareplr.Name].Character.Torso.Position)
	end
end)
game:GetService('RunService').Stepped:connect(function()
	if noclip then
		if lplayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
			lplayer.Character.Head.CanCollide = false
			lplayer.Character.Torso.CanCollide = false
			lplayer.Character["Left Leg"].CanCollide = false
			lplayer.Character["Right Leg"].CanCollide = false
		else
			lplayer.Character.Humanoid:ChangeState(11)
		end
	end
	if changingstate then
		lplayer.Character.Humanoid:ChangeState(statechosen)
	end
end)
game:GetService('RunService').Stepped:connect(function()
	if droppinghats then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) or (v:IsA("Hat")) then
				v.Parent = workspace
			end
		end
	end
	if droppingtools then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Tool")) then
				v.Parent = workspace
			end
		end
	end
	if removingmeshhats then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) or (v:IsA("Hat")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
	if removingmeshtool then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Tool")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
end)
game:GetService('RunService').Stepped:connect(function()
	if banpl then
		lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[bplrr].Character.HumanoidRootPart.CFrame
	end
end)
game:GetService('RunService').Stepped:connect(function()
	if stopsitting then
		lplayer.Character.Humanoid.Sit = false
	end
end)

plr = lplayer 
hum = plr.Character.HumanoidRootPart
mouse = plr:GetMouse() 
mouse.KeyDown:connect(function(key) 
	if key == "e" then 
		if mouse.Target then 
			if clickgoto then
				hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
			elseif clickdel then
				mouse.Target:Destroy()
			end
		end 
	end
end)

game:GetService("Workspace").ChildAdded:connect(function(part)
	if gettingtools then
		if part:IsA("Tool") then
			part.Handle.CFrame = lplayer.Character.HumanoidRootPart.CFrame
		end
	end
end)

lplayer.Chatted:Connect(function(msg)
	if string.sub(msg, 1, 6) == (prefix.."kill ") then
		if string.sub(msg, 7) == "me" then
			lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(100000,0,100000)
		else
			for i,v in pairs(GetPlayer(string.sub(msg, 7)))do
				local NOW = lplayer.Character.HumanoidRootPart.CFrame
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				local function tp(player,player2)
				local char1,char2=player.Character,player2.Character
				if char1 and char2 then
				char1:MoveTo(char2.Head.Position)
				end
				end
				wait(0.1)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.5)
				lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-100000,10,-100000))
				wait(0.7)
				tp(lplayer,game:GetService("Players")[v.Name])
				wait(0.7)
				lplayer.Character.HumanoidRootPart.CFrame = NOW
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."bring ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8)))do
			local NOW = lplayer.Character.HumanoidRootPart.CFrame
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			local function tp(player,player2)
			local char1,char2=player.Character,player2.Character
			if char1 and char2 then
			char1.HumanoidRootPart.CFrame = char2.HumanoidRootPart.CFrame
			end
			end
			local function getout(player,player2)
			local char1,char2=player.Character,player2.Character
			if char1 and char2 then
			char1:MoveTo(char2.Head.Position)
			end
			end
			tp(game:GetService("Players")[v.Name], lplayer)
			wait(0.2)
			tp(game:GetService("Players")[v.Name], lplayer)
			wait(0.5)
			lplayer.Character.HumanoidRootPart.CFrame = NOW
			wait(0.5)
			getout(lplayer, game:GetService("Players")[v.Name])
			wait(0.3)
			lplayer.Character.HumanoidRootPart.CFrame = NOW
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 6) == (prefix.."spin ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			lplayer.Character.Animate.Disabled = false
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
			spinplr = v
			wait(0.5)
			spin = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."unspin") then
		spin = false
	end
	if string.sub(msg, 1, 8) == (prefix.."attach ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 9))) do
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
			wait(0.3)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
			attplr = v
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."unattach ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 11))) do
			local function getout(player,player2)
			local char1,char2=player.Character,player2.Character
			if char1 and char2 then
			char1:MoveTo(char2.Head.Position)
			end
			end
			getout(lplayer, game:GetService("Players")[v.Name])
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."follow ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 9))) do
			followed = true
			flwplr = v
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."unfollow") then
		followed = false
	end
	if string.sub(msg, 1, 10) == (prefix.."freefall ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 11))) do
			local NOW = lplayer.Character.HumanoidRootPart.CFrame
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.2)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.6)
			lplayer.Character.HumanoidRootPart.CFrame = NOW
			wait(0.6)
			lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,50000,0)
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."trail ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
			traill = true
			trlplr = v
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."untrail") then
		traill = false
	end
	if string.sub(msg, 1, 7) == (prefix.."orbit ") then
		if string.sub(msg, 8) == "all" or string.sub(msg, 8) == "others" or string.sub(msg, 8) == "me" then
			lplayer.Character.HumanoidRootPart.CFrame = lplayer.Character.HumanoidRootPart.CFrame
		else
			for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
				local o = Instance.new("RocketPropulsion")
				o.Parent = lplayer.Character.HumanoidRootPart
				o.Name = "Orbit"
				o.Target = game:GetService("Players")[v.Name].Character.HumanoidRootPart
				o:Fire()
				noclip = true
			end
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."unorbit") then
		lplayer.Character.HumanoidRootPart.Orbit:Destroy()
		noclip = false
	end
	if string.sub(msg, 1, 7) == (prefix.."fling ") then
		if string.sub(msg, 8) == "all" or string.sub(msg, 8) == "others" or string.sub(msg, 8) == "me" then
			lplayer.Character.HumanoidRootPart.CFrame = lplayer.Character.HumanoidRootPart.CFrame
		else
			for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
				local y = Instance.new("RocketPropulsion")
				y.Parent = lplayer.Character.HumanoidRootPart
				y.CartoonFactor = 1
				y.MaxThrust = 800000
				y.MaxSpeed = 1000
				y.ThrustP = 200000
				y.Name = "Fling"
				game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[v.Name].Character.Head
				y.Target = game:GetService("Players")[v.Name].Character.HumanoidRootPart
				y:Fire()
				noclip = true
			end
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."unfling") then
		noclip = false
		lplayer.Character.HumanoidRootPart.Fling:Destroy()
		game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Head
		wait(0.4)
		lplayer.Character.HumanoidRootPart.Fling:Destroy()
	end
	if string.sub(msg, 1, 8) == (prefix.."fecheck") then
		if game:GetService("Workspace").FilteringEnabled == true then
			warn("FE is Enabled (Filtering Enabled)")
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "FE is Enabled";
				Text = "Filtering Enabled. Enjoy using Reviz Admin!";
			})
		else
			warn("FE is Disabled (Filtering Disabled) Consider using a different admin script.")
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "FE is Disabled";
				Text = "Filtering Disabled. Consider using a different admin script.";
			})
		end
	end
	if string.sub(msg, 1, 6) == (prefix.."void ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.2)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.6)
			lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(999999999999999,0,999999999999999)
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."noclip") then
		noclip = true
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Noclip enabled";
		Text = "Type ;clip to disable";
		})
	end
	if string.sub(msg, 1, 5) == (prefix.."clip") then
		noclip = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Noclip disabled";
		Text = "Type ;noclip to enable";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."speed ") then
		lplayer.Character.Humanoid.WalkSpeed = (string.sub(msg, 8))
	end
	if string.sub(msg, 1, 4) == (prefix.."ws ") then
		lplayer.Character.Humanoid.WalkSpeed = (string.sub(msg, 5))
	end
	if string.sub(msg, 1, 11) == (prefix.."hipheight ") then
		lplayer.Character.Humanoid.HipHeight = (string.sub(msg, 12))
	end
	if string.sub(msg, 1, 4) == (prefix.."hh ") then
		lplayer.Character.Humanoid.HipHeight = (string.sub(msg, 5))
	end
	if string.sub(msg, 1, 11) == (prefix.."jumppower ") then
		lplayer.Character.Humanoid.JumpPower = (string.sub(msg, 12))
	end
	if string.sub(msg, 1, 4) == (prefix.."jp ") then
		lplayer.Character.Humanoid.JumpPower = (string.sub(msg, 5))
	end
	if string.sub(msg, 1, 8) == (prefix.."default") then
		lplayer.Character.Humanoid.JumpPower = 50
		lplayer.Character.Humanoid.WalkSpeed = 16
		lplayer.Character.Humanoid.HipHeight = 0
	end
	if string.sub(msg, 1, 7) == (prefix.."annoy ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
			annoying = true
			annplr = v
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."unannoy") then
		annoying = false
	end
	if string.sub(msg, 1, 10) == (prefix.."headwalk ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 11))) do
			hwalk = true
			hdwplr = v
		end
	end
	if string.sub(msg, 1, 11) == (prefix.."unheadwalk") then
		hwalk = false
	end
	if string.sub(msg, 1, 8) == (prefix.."nolimbs") then
		lplayer.Character["Left Leg"]:Destroy()
		lplayer.Character["Left Arm"]:Destroy()
		lplayer.Character["Right Leg"]:Destroy()
		lplayer.Character["Right Arm"]:Destroy()
	end
	if string.sub(msg, 1, 4) == (prefix.."god") then
		lplayer.Character.Humanoid.Name = 1
		local l = lplayer.Character["1"]:Clone()
		l.Parent = lplayer.Character
		l.Name = "Humanoid"
		wait(0.1)
		lplayer.Character["1"]:Destroy()
		game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
		lplayer.Character.Animate.Disabled = true
		wait(0.1)
		lplayer.Character.Animate.Disabled = false
		lplayer.Character.Humanoid.DisplayDistanceType = "None"
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "FE Godmode enabled";
		Text = "Use ;grespawn or ;respawn to remove";
		})
	end
	if string.sub(msg, 1, 9) == (prefix.."drophats") then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) or (v:IsA("Hat")) then
				v.Parent = workspace
			end
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."droptool") then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Tool")) then
				v.Parent = workspace
			end
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."loopdhats") then
		droppinghats = true
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Loop Drop Enabled";
		Text = "Type ;unloopdhats to disable";
		})
	end
	if string.sub(msg, 1, 12) == (prefix.."unloopdhats") then
		droppinghats = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Loop Drop Disabled";
		Text = "Type ;loopdhats to enable.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."loopdtool") then
		droppingtools = true
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Loop Drop Enabled";
		Text = "Type ;unloopdtool to disable";
		})
	end
	if string.sub(msg, 1, 12) == (prefix.."unloopdtool") then
		droppingtools = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Loop Drop Disabled";
		Text = "Type ;loopdtool to enable.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."invisible") then -- Credit to Timeless
		Local = game:GetService('Players').LocalPlayer
		Char  = Local.Character
		touched,tpdback = false, false
		box = Instance.new('Part',workspace)
		box.Anchored = true
		box.CanCollide = true
		box.Size = Vector3.new(10,1,10)
		box.Position = Vector3.new(0,10000,0)
		box.Touched:connect(function(part)
		    if (part.Parent.Name == Local.Name) then
		        if touched == false then
		            touched = true
		            function apply()
		                if script.Disabled ~= true then
		                    no = Char.HumanoidRootPart:Clone()
		                    wait(.25)
		                    Char.HumanoidRootPart:Destroy()
		                    no.Parent = Char
		                    Char:MoveTo(loc)
		                    touched = false
		                end end
		            if Char then
		                apply()
		            end
		        end
		    end
		end)
		repeat wait() until Char
		loc = Char.HumanoidRootPart.Position
		Char:MoveTo(box.Position + Vector3.new(0,.5,0))
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Invisibility enabled!";
		Text = "Reset or use ;respawn to remove.";
		})
	end
	if string.sub(msg, 1, 6) == (prefix.."view ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			if game:GetService("Players")[v.Name].Character.Humanoid then
				game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[v.Name].Character.Humanoid
			else
				game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[v.Name].Character.Head
			end
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."unview") then
		if lplayer.Character.Humanoid then
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Humanoid
		else
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Head
		end
	end
	if string.sub(msg, 1, 6) == (prefix.."goto ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
		end
	end
	if string.sub(msg, 1, 4) == (prefix.."fly") then
	repeat wait() until lplayer and lplayer.Character and lplayer.Character:FindFirstChild('HumanoidRootPart') and lplayer.Character:FindFirstChild('Humanoid')
	repeat wait() until Mouse
	
	local T = lplayer.Character.HumanoidRootPart
	local CONTROL = {F = 0, B = 0, L = 0, R = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
	local SPEED = speedget
	
	local function fly()
		flying = true
		local BG = Instance.new('BodyGyro', T)
		local BV = Instance.new('BodyVelocity', T)
		BG.P = 9e4
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0.1, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
		repeat wait()
		lplayer.Character.Humanoid.PlatformStand = true
		if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
		SPEED = 50
		elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
		SPEED = 0
		end
		if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
		BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
		lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
		elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
		BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
		else
		BV.velocity = Vector3.new(0, 0.1, 0)
		end
		BG.cframe = workspace.CurrentCamera.CoordinateFrame
				until not flying
				CONTROL = {F = 0, B = 0, L = 0, R = 0}
				lCONTROL = {F = 0, B = 0, L = 0, R = 0}
				SPEED = 0
				BG:destroy()
				BV:destroy()
				lplayer.Character.Humanoid.PlatformStand = false
			end)
		end
	Mouse.KeyDown:connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = speedfly
		elseif KEY:lower() == 's' then
			CONTROL.B = -speedfly
		elseif KEY:lower() == 'a' then
			CONTROL.L = -speedfly 
		elseif KEY:lower() == 'd' then 
			CONTROL.R = speedfly
		end
	end)
	Mouse.KeyUp:connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		end
	end)
	fly()
	end
	if string.sub(msg, 1, 6) == (prefix.."unfly") then
		flying = false
		lplayer.Character.Humanoid.PlatformStand = false
	end
	if string.sub(msg, 1, 6) == (prefix.."chat ") then
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer((string.sub(msg, 7)), "All")
	end
	if string.sub(msg, 1, 6) == (prefix.."spam ") then
		spamtext = (string.sub(msg, 7))
		spamming = true
	end
	if string.sub(msg, 1, 7) == (prefix.."unspam") then
		spamming = false
	end
	if string.sub(msg, 1, 10) == (prefix.."spamwait ") then
		spamdelay = (string.sub(msg, 11))
	end
	if string.sub(msg, 1, 8) == (prefix.."pmspam ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 9))) do
			pmspammed = v.Name
			spammingpm = true
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."unpmspam") then
		spammingpm = false
	end
	if string.sub(msg, 1, 9) == (prefix.."cfreeze ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 10))) do
			v.Character["Left Leg"].Anchored = true
			v.Character["Left Arm"].Anchored = true
			v.Character["Right Leg"].Anchored = true
			v.Character["Right Arm"].Anchored = true
			v.Character.Torso.Anchored = true
			v.Character.Head.Anchored = true
		end
	end
	if string.sub(msg, 1, 11) == (prefix.."uncfreeze ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 12))) do
			v.Character["Left Leg"].Anchored = false
			v.Character["Left Arm"].Anchored = false
			v.Character["Right Leg"].Anchored = false
			v.Character["Right Arm"].Anchored = false
			v.Character.Torso.Anchored = false
			v.Character.Head.Anchored = false
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."unlockws") then
		local a = game:GetService("Workspace"):getChildren()
		for i = 1, #a do
			if a[i].className == "Part" then
				a[i].Locked = false
			elseif a[i].className == "Model" then
				local r = a[i]:getChildren()
				for i = 1, #r do
					if r[i].className == "Part" then
					r[i].Locked = false
					end
				end
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Success!";
		Text = "Workspace unlocked. Use ;lockws to lock.";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."lockws") then
		local a = game:GetService("Workspace"):getChildren()
		for i = 1, #a do
			if a[i].className == "Part" then
				a[i].Locked = true
			elseif a[i].className == "Model" then
				local r = a[i]:getChildren()
				for i = 1, #r do
					if r[i].className == "Part" then
					r[i].Locked = true
					end
				end
			end
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."btools") then
		local Clone_T = Instance.new("HopperBin",lplayer.Backpack)
		Clone_T.BinType = "Clone"
		local Destruct = Instance.new("HopperBin",lplayer.Backpack)
		Destruct.BinType = "Hammer"
		local Hold_T = Instance.new("HopperBin",lplayer.Backpack)
		Hold_T.BinType = "Grab"
	end
	if string.sub(msg, 1, 7) == (prefix.."pstand") then
		lplayer.Character.Humanoid.PlatformStand = true
	end
	if string.sub(msg, 1, 9) == (prefix.."unpstand") then
		lplayer.Character.Humanoid.PlatformStand = false
	end
	if string.sub(msg, 1, 10) == (prefix.."blockhead") then
		lplayer.Character.Head.Mesh:Destroy()
	end
	if string.sub(msg, 1, 4) == (prefix.."sit") then
		lplayer.Character.Humanoid.Sit = true
	end
	if string.sub(msg, 1, 10) == (prefix.."bringobj ") then
		local function bringobjw()
		for i,obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
		if obj.Name == (string.sub(msg, 11)) then
		obj.CFrame = lplayer.Character.HumanoidRootPart.CFrame
		obj.CanCollide = false
		obj.Transparency = 0.7
		wait()
		obj.CFrame = lplayer.Character["Left Leg"].CFrame
		wait()
		obj.CFrame = lplayer.Character["Right Leg"].CFrame
		wait()
		obj.CFrame = lplayer.Character["Head"].CFrame
		end
		end
		end
		while wait() do
			bringobjw()
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "BringObj";
		Text = "BringObj enabled.";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."wsvis ") then
		vis = (string.sub(msg, 8))
		local a = game:GetService("Workspace"):GetDescendants()
		for i = 1, #a do
			if a[i].className == "Part" then
				a[i].Transparency = vis
			elseif a[i].className == "Model" then
				local r = a[i]:getChildren()
				for i = 1, #r do
					if r[i].className == "Part" then
					r[i].Transparency = vis
					end
				end
			end
		end
	end
	if string.sub(msg, 1, 11) == (prefix.."hypertotal") then
		loadstring(game:GetObjects("rbxassetid://1255063809")[1].Source)()
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Success!";
		Text = "HyperTotal GUI Loaded!";
		})
	end
	if string.sub(msg, 1, 5) == (prefix.."cmds") then
		CMDSFRAME.Visible = true
	end
	if string.sub(msg, 1, 10) == (prefix.."rmeshhats") then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) or (v:IsA("Hat")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."blockhats") then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Accessory")) or (v:IsA("Hat")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."rmeshtool") then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Tool")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."blocktool") then
		for i,v in pairs(lplayer.Character:GetChildren()) do
			if (v:IsA("Tool")) then
				v.Handle.Mesh:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."spinner") then
		local p = Instance.new("RocketPropulsion")
		p.Parent = lplayer.Character.HumanoidRootPart
		p.Name = "Spinner"
		p.Target = lplayer.Character["Left Arm"]
		p:Fire()
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Spinner enabled";
		Text = "Type ;nospinner to disable.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."nospinner") then
		lplayer.Character.HumanoidRootPart.Spinner:Destroy()
	end
	if string.sub(msg, 1, 7) == (prefix.."reachd") then
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
			if v:isA("Tool") then
				local a = Instance.new("SelectionBox",v.Handle)
				a.Adornee = v.Handle
				v.Handle.Size = Vector3.new(0.5,0.5,60)
				v.GripPos = Vector3.new(0,0,0)
				lplayer.Character.Humanoid:UnequipTools()
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Reach applied!";
		Text = "Applied to equipped sword. Use ;noreach to disable.";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."reach ") then
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
			if v:isA("Tool") then
				handleSize = v.Handle.Size
				wait()
				local a = Instance.new("SelectionBox",v.Handle)
				a.Name = "a"
				a.Adornee = v.Handle
				v.Handle.Size = Vector3.new(0.5,0.5,(string.sub(msg, 8)))
				v.GripPos = Vector3.new(0,0,0)
				lplayer.Character.Humanoid:UnequipTools()
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Reach applied!";
		Text = "Applied to equipped sword. Use ;noreach to disable.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."noreach") then
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
			if v:isA("Tool") then
				v.Handle.a:Destroy()
				v.Handle.Size = handleSize
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Reach removed!";
		Text = "Removed reach from equipped sword.";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."rkill ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8)))do
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			wait(0.1)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.2)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.5)
			lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-100000,10,-100000))
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."tp me ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."cbring ") then
		if (string.sub(msg, 9)) == "all" or (string.sub(msg, 9)) == "All" or (string.sub(msg, 9)) == "ALL" then
			cbringall = true
		else
			for i,v in pairs(GetPlayer(string.sub(msg, 9))) do
				brplr = v.Name
			end
		end
		cbring = true
	end
	if string.sub(msg, 1, 9) == (prefix.."uncbring") then
		cbring = false
		cbringall = false
	end
	if string.sub(msg, 1, 6) == (prefix.."swap ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			local NOWPLR = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			local NOW = lplayer.Character.HumanoidRootPart.CFrame
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			local function tp(player,player2)
			local char1,char2=player.Character,player2.Character
			if char1 and char2 then
			char1:MoveTo(char2.Head.Position)
			end
			end
			wait(0.1)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.2)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			wait(0.5)
			lplayer.Character.HumanoidRootPart.CFrame = NOW
			wait(0.6)
			tp(lplayer, game:GetService("Players")[v.Name])
			wait(0.4)
			lplayer.Character.HumanoidRootPart.CFrame = NOWPLR
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."glitch ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 9))) do
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
			lplayer.Character.Humanoid:EquipTool(v)
			end
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
			wait(0.3)
			lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
			wait(0.4)
			b = Instance.new("BodyForce")
			b.Parent = lplayer.Character.HumanoidRootPart
			b.Name = "Glitch"
			b.Force = Vector3.new(100000000,5000,0)
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools needed!";
			Text = "You need a tool in your backpack for this command!";
			})
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."unglitch") then
		lplayer.Character.HumanoidRootPart.Glitch:Destroy()
		lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(10000,0,10000)
		b = Instance.new("BodyForce")
		b.Parent = lplayer.Character.HumanoidRootPart
		b.Name = "unGlitch"
		b.Force = Vector3.new(0,-5000000,0)
		wait(2)
		lplayer.Character.HumanoidRootPart.unGlitch:Destroy()
	end
	if string.sub(msg, 1, 9) == (prefix.."grespawn") then
		lplayer.Character.Humanoid.Health = 0
		wait(1)
		lplayer.Character.Head.CFrame = CFrame.new(1000000,0,1000000)
		lplayer.Character.Torso.CFrame = CFrame.new(1000000,0,1000000)
	end
	if string.sub(msg, 1, 9) == (prefix.."explorer") then
		loadstring(game:GetObjects("rbxassetid://492005721")[1].Source)()
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Success!";
		Text = "DEX Explorer has loaded.";
		})
	end
	if string.sub(msg, 1, 6) == (prefix.."anim ") then
		local Anim = Instance.new("Animation")
		Anim.AnimationId = "rbxassetid://"..(string.sub(msg, 7))
		local track = lplayer.Character.Humanoid:LoadAnimation(Anim)
		track:Play(.1, 1, 1)
	end
	if string.sub(msg, 1, 8) == (prefix.."animgui") then
		loadstring(game:GetObjects("rbxassetid://1202558084")[1].Source)()
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Success!";
		Text = "Energize Animations GUI has loaded.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."savepos") then
		saved = lplayer.Character.HumanoidRootPart.CFrame
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Position Saved";
		Text = "Use ;loadpos to return to saved position.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."loadpos") then
		lplayer.Character.HumanoidRootPart.CFrame = saved
	end
	if string.sub(msg, 1, 6) == (prefix.."bang ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 7))) do
			local Anim2 = Instance.new("Animation")
			Anim2.AnimationId = "rbxassetid://148840371"
			local track2 = lplayer.Character.Humanoid:LoadAnimation(Anim2)
			track2:Play(.1, 1, 1)
			bplrr = v.Name
			banpl = true
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."unbang") then
		banpl = false
	end
	if string.sub(msg, 1, 10) == (prefix.."bringmod ") then
		local function bringmodw()
		for i,obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
		if obj.Name == (string.sub(msg, 11)) then
		for i,ch in pairs(obj:GetDescendants()) do
		if (ch:IsA("BasePart")) then
		ch.CFrame = lplayer.Character.HumanoidRootPart.CFrame
		ch.CanCollide = false
		ch.Transparency = 0.7
		wait()
		ch.CFrame = lplayer.Character["Left Leg"].CFrame
		wait()
		ch.CFrame = lplayer.Character["Right Leg"].CFrame
		wait()
		ch.CFrame = lplayer.Character["Head"].CFrame
		end
		end
		end
		end
		end
		while wait() do
			bringmodw()
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "BringMod";
		Text = "BringMod enabled.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."respawn") then
		local mod = Instance.new('Model', workspace) mod.Name = 're '..lplayer.Name
		local hum = Instance.new('Humanoid', mod)
		local ins = Instance.new('Part', mod) ins.Name = 'Torso' ins.CanCollide = false ins.Transparency = 1
		lplayer.Character = mod
	end
	if string.sub(msg, 1, 9) == (prefix.."shutdown") then
		game:GetService'RunService'.Stepped:Connect(function()
		pcall(function()
		    for i,v in pairs(game:GetService'Players':GetPlayers()) do
		        if v.Character ~= nil and v.Character:FindFirstChild'Head' then
		            for _,x in pairs(v.Character.Head:GetChildren()) do
		                if x:IsA'Sound' then x.Playing = true x.CharacterSoundEvent:FireServer(true, true) end
		            end
		        end
		    end
		end)
		end)
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Attempting Shutdown";
		Text = "Shutdown Attempt has begun.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."delobj ") then
		objtodel = (string.sub(msg, 9))
		for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
			if v.Name == objtodel then
				v:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."getplrs") then
		for i,v in pairs(game:GetService("Players"):GetPlayers())do
			print(v)
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Printed";
		Text = "Players have been printed to console. (F9)";
		})
	end
	if string.sub(msg, 1, 9) == (prefix.."deldecal") then
		for i,v in pairs(game:GetService("Workspace"):GetDescendants())do
			if (v:IsA("Decal")) then
				v:Destroy()
			end
		end
	end
	if string.sub(msg, 1, 11) == (prefix.."opfinality") then
		loadstring(game:GetObjects("rbxassetid://1294358929")[1].Source)()
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Success!";
		Text = "OpFinality GUI has loaded.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."remotes") then
		remotes = true
		added = true
		game.DescendantAdded:connect(function(rmt)
		if added == true then
		if remotes == true then 
		if rmt:IsA("RemoteEvent") then
		print("A RemoteEvent was added!")
		print(" game." .. rmt:GetFullName() .. " | RemoteEvent")
		print(" game." .. rmt:GetFullName() .. " | RemoteEvent", 247, 0, 0, true)
		end end end
		end)
		game.DescendantAdded:connect(function(rmtfnctn)
		if added == true then
		if remotes == true then 
		if rmtfnctn:IsA("RemoteFunction") then
		warn("A RemoteFunction was added!")
		warn(" game." .. rmtfnctn:GetFullName() .. " | RemoteFunction")
		print(" game." .. rmtfnctn:GetFullName() .. " | RemoteFunction", 5, 102, 198, true)
		end end end
		end)
		
		game.DescendantAdded:connect(function(bndfnctn)
		if added == true then
		if binds == true then 
		if bndfnctn:IsA("BindableFunction") then
		print("A BindableFunction was added!")
		print(" game." .. bndfnctn:GetFullName() .. " | BindableFunction")
		print(" game." .. bndfnctn:GetFullName() .. " | BindableFunction", 239, 247, 4, true)
		end end end
		end)
		
		game.DescendantAdded:connect(function(bnd)
		if added == true then
		if binds == true then 
		if bnd:IsA("BindableEvent") then
		warn("A BindableEvent was added!")
		warn(" game." .. bnd:GetFullName() .. " | BindableEvent")
		print(" game." .. bnd:GetFullName() .. " | BindableEvent", 13, 193, 22, true)
		end end end
		end)
		
		
		if binds == true then
		for i,v in pairs(game:GetDescendants()) do
		if v:IsA("BindableFunction") then
		print(" game." .. v:GetFullName() .. " | BindableFunction")
		print(" game." .. v:GetFullName() .. " | BindableFunction", 239, 247, 4, true)
		end end
		for i,v in pairs(game:GetDescendants()) do
		if v:IsA("BindableEvent") then
		warn(" game." .. v:GetFullName() .. " | BindableEvent")
		print(" game." .. v:GetFullName() .. " | BindableEvent", 13, 193, 22, true)
		end end
		else
		print("Off")
		end
		if remotes == true then
		for i,v in pairs(game:GetDescendants()) do
		if v:IsA("RemoteFunction") then
		warn(" game." .. v:GetFullName() .. " | RemoteFunction")
		print(" game." .. v:GetFullName() .. " | RemoteFunction", 5, 102, 198, true)
		end end
		wait()
		for i,v in pairs(game:GetDescendants()) do
		if v:IsA("RemoteEvent") then
		print(" game." .. v:GetFullName() .. " | RemoteEvent")
		print(" game." .. v:GetFullName() .. " | RemoteEvent", 247, 0, 0, true)
		end end
		else
		print("Off")
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Printing Remotes";
		Text = "Type ;noremotes to disable.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."noremotes") then
		remotes = false
		added = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Printing Remotes Disabled";
		Text = "Type ;remotes to enable.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."tpdefault") then
		spin = false
		followed = false
		traill = false
		noclip = false
		annoying = false
		hwalk = false
		cbringing = false
	end
	if string.sub(msg, 1, 8) == (prefix.."stopsit") then
		stopsitting = true
	end
	if string.sub(msg, 1, 6) == (prefix.."gosit") then
		stopsitting = false
	end
	if string.sub(msg, 1, 8) == (prefix.."version") then
		print(adminversion)
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Version";
		Text = adminversion;
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."clicktp") then
		clickgoto = true
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Click TP";
		Text = "Press E to teleport to mouse position, ;noclicktp to stop";
		})
	end
	if string.sub(msg, 1, 9) == (prefix.."clickdel") then
		clickdel = true
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Click Delete";
		Text = "Press E to delete part at mouse, ;noclickdel to stop";
		})
	end
	if string.sub(msg, 1, 11) == (prefix.."noclickdel") then
		clickdel = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Click Delete";
		Text = "Click delete has been disabled.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."noclicktp") then
		clickgoto = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Click TP";
		Text = "Click TP has been disabled.";
		})
	end
	if string.sub(msg, 1, 8) == (prefix.."toolson") then
		gettingtools = true
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Tools Enabled";
		Text = "Automatically colleting tools dropped.";
		})
	end
	if string.sub(msg, 1, 9) == (prefix.."toolsoff") then
		gettingtools = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Tools Disabled";
		Text = "Click TP has been disabled.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."delcmdbar") then
		ScreenGui:Destroy()
	end
	if string.sub(msg, 1, 6) == (prefix.."reset") then
		lplayer.Character.Head:Destroy()
	end
	if string.sub(msg, 1, 7) == (prefix.."state ") then
		statechosen = string.sub(msg, 8)
		changingstate = true
	end
	if string.sub(msg, 1, 9) == (prefix.."gravity ") then
		game:GetService("Workspace").Gravity = string.sub(msg, 10)
	end
	if string.sub(msg, 1, 10) == (prefix.."looprhats") then
		removingmeshhats = true
	end
	if string.sub(msg, 1, 12) == (prefix.."unlooprhats") then
		removingmeshhats = false
	end
	if string.sub(msg, 1, 10) == (prefix.."looprtool") then
		removingmeshtool = true
	end
	if string.sub(msg, 1, 12) == (prefix.."unlooprtool") then
		removingmeshtool = false
	end
	if string.sub(msg, 1, 10) == (prefix.."givetool ") then
		for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
			if v:IsA("Tool") then
				for i,player in pairs(GetPlayer(string.sub(msg, 11))) do
					v.Parent = player.Character
				end
			end
		end
	end
	if string.sub(msg, 1, 14) == (prefix.."givealltools ") then
		for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
			if v:IsA("Tool") then
				v.Parent = lplayer.Character
				wait()
				for i,player in pairs(GetPlayer(string.sub(msg, 15))) do
					v.Parent = player.Character
				end
			end
		end
	end
	if string.sub(msg, 1, 5) == (prefix.."age ") then
		for i,player in pairs(GetPlayer(string.sub(msg, 6))) do
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player.Name.." Account Age: "..player.AccountAge.." days!", "All")
		end
	end
	if string.sub(msg, 1, 4) == (prefix.."id ") then
		for i,player in pairs(GetPlayer(string.sub(msg, 5))) do
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player.Name.." Account ID: "..player.UserId, "All")
		end
	end
	if string.sub(msg, 1, 6) == (prefix..".age ") then
		for i,player in pairs(GetPlayer(string.sub(msg, 7))) do
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = player.AccountAge.." Days";
			Text = "Account age of "..player.Name;
			})
		end
	end
	if string.sub(msg, 1, 5) == (prefix..".id ") then
		for i,player in pairs(GetPlayer(string.sub(msg, 6))) do
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = player.UserId.." ID";
			Text = "Account ID of "..player.Name;
			})
		end
	end
	if string.sub(msg, 1, 7) == (prefix.."gameid") then
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Game ID";
		Text = "Game ID: ".. game.GameId;
		})
	end
	if string.sub(msg, 1, 4) == (prefix.."pgs") then
		local pgscheck = game:GetService("Workspace"):PGSIsEnabled()
		if pgscheck == true then
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "PGSPhysicsSolverEnabled";
			Text = "PGS is Enabled!";
			})
		else
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "PGSPhysicsSolverEnabled";
			Text = "PGS is Disabled!";
			})
		end
	end
	if string.sub(msg, 1, 12) == (prefix.."removeinvis") then
		for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
			if v:IsA("Part") then
				if v.Transparency == 1 then
					if v.Name ~= "HumanoidRootPart" then
						v:Destroy()
					end
				end
			end
		end
	end
	if string.sub(msg, 1, 10) == (prefix.."removefog") then
		game:GetService("Lighting").FogStart = 0
		game:GetService("Lighting").FogEnd = 9999999999999
	end
	if string.sub(msg, 1, 8) == (prefix.."disable") then
		lplayer.Character.Humanoid.Parent = lplayer
	end
	if string.sub(msg, 1, 7) == (prefix.."enable") then
		lplayer.Humanoid.Parent = lplayer.Character
	end
	if string.sub(msg, 1, 8) == (prefix.."prefix ") then
		prefix = (string.sub(msg, 9, 9))
		wait(0.1)
		change()
		wait(0.1)
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Prefix changed!";
		Text = "Prefix is now "..prefix..". Use ;resetprefix to reset to ;";
		})
	end
	if string.sub(msg, 1, 12) == (";resetprefix") then
		prefix = ";"
		wait(0.1)
		change()
		wait(0.1)
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Prefix changed!";
		Text = "Prefix is now "..prefix..". Make sure it's one key!";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."flyspeed ") then
		speedfly = string.sub(msg, 11)
		wait()
		change()
	end
	if string.sub(msg, 1, 8) == (prefix.."carpet ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 9))) do
			local Anim3 = Instance.new("Animation")
			Anim3.AnimationId = "rbxassetid://282574440"
			local track3 = lplayer.Character.Humanoid:LoadAnimation(Anim3)
			track3:Play(.1, 1, 1)
			bplrr = v.Name
			banpl = true
		end
	end
	if string.sub(msg, 1, 9) == (prefix.."uncarpet") then
		banpl = false
	end
	if string.sub(msg, 1, 7) == (prefix.."stare ") then
		for i,v in pairs(GetPlayer(string.sub(msg, 8))) do
			staring = true
			stareplr = v
		end
	end
	if string.sub(msg, 1, 8) == (prefix.."unstare") then
		staring = false
	end
	if string.sub(msg, 1, 8) == (prefix.."logchat") then
		chatlogs = true
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "LogChat enabled";
		Text = "Now logging all player chat.";
		})
	end
	if string.sub(msg, 1, 10) == (prefix.."unlogchat") then
		chatlogs = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "LogChat disabled";
		Text = "Stopped logging all player chat.";
		})
	end
	if string.sub(msg, 1, 7) == (prefix.."fixcam") then
		game:GetService("Workspace").CurrentCamera:Destroy()
		wait(0.1)
		game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Humanoid
		game:GetService("Workspace").CurrentCamera.CameraType = "Custom"
		lplayer.CameraMinZoomDistance = 0.5
		lplayer.CameraMaxZoomDistance = 400
		lplayer.CameraMode = "Classic"
	end
	if string.sub(msg, 1, 8) == (prefix.."unstate") then
		changingstate = false
	end
end)

local function tp()
	for i, player in ipairs(game:GetService("Players"):GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			if player.Name == brplr then
				player.Character.HumanoidRootPart.CFrame = lplayer.Character.HumanoidRootPart.CFrame + lplayer.Character.HumanoidRootPart.CFrame.lookVector * 2
			end
		end
	end
end
local function tpall()
	for i, player in ipairs(game:GetService("Players"):GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame = lplayer.Character.HumanoidRootPart.CFrame + lplayer.Character.HumanoidRootPart.CFrame.lookVector * 3
		end
	end
end
spawn(function()
	while wait(spamdelay) do
		if spamming == true then
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(spamtext, "All")
		end
	end
end)
spawn(function()
	while wait(spamdelay) do
		if spammingpm == true then
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..pmspammed.." @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@", "All")
		end
	end
end)
spawn(function()
	while wait() do
		if cbring == true then
			tp()
		end
	end
end)
spawn(function()
	while wait() do
		if cbringall == true then
			tpall()
		end
	end
end)

Mouse.KeyDown:connect(function(Key)
	if Key == prefix then
		CMDBAR:CaptureFocus()
	end
end)

CMDBAR.FocusLost:connect(function(enterPressed)
	if enterPressed then
		if string.sub(CMDBAR.Text, 1, 5) == ("kill ") then
			if string.sub(CMDBAR.Text, 6) == "me" then
				lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(100000,0,100000)
			else
				for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6)))do
					local NOW = lplayer.Character.HumanoidRootPart.CFrame
					lplayer.Character.Humanoid.Name = 1
					local l = lplayer.Character["1"]:Clone()
					l.Parent = lplayer.Character
					l.Name = "Humanoid"
					wait(0.1)
					lplayer.Character["1"]:Destroy()
					game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
					lplayer.Character.Animate.Disabled = true
					wait(0.1)
					lplayer.Character.Animate.Disabled = false
					lplayer.Character.Humanoid.DisplayDistanceType = "None"
					for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
					lplayer.Character.Humanoid:EquipTool(v)
					end
					local function tp(player,player2)
					local char1,char2=player.Character,player2.Character
					if char1 and char2 then
					char1:MoveTo(char2.Head.Position)
					end
					end
					wait(0.1)
					lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
					wait(0.2)
					lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
					wait(0.5)
					lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-100000,10,-100000))
					wait(0.7)
					tp(lplayer,game:GetService("Players")[v.Name])
					wait(0.7)
					lplayer.Character.HumanoidRootPart.CFrame = NOW
					game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "Tools needed!";
					Text = "You need a tool in your backpack for this command!";
					})
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("bring ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7)))do
				local NOW = lplayer.Character.HumanoidRootPart.CFrame
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				local function tp(player,player2)
				local char1,char2=player.Character,player2.Character
				if char1 and char2 then
				char1.HumanoidRootPart.CFrame = char2.HumanoidRootPart.CFrame
				end
				end
				local function getout(player,player2)
				local char1,char2=player.Character,player2.Character
				if char1 and char2 then
				char1:MoveTo(char2.Head.Position)
				end
				end
				tp(game:GetService("Players")[v.Name], lplayer)
				wait(0.2)
				tp(game:GetService("Players")[v.Name], lplayer)
				wait(0.5)
				lplayer.Character.HumanoidRootPart.CFrame = NOW
				wait(0.5)
				getout(lplayer, game:GetService("Players")[v.Name])
				wait(0.3)
				lplayer.Character.HumanoidRootPart.CFrame = NOW
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("spin ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
				spinplr = v
				wait(0.5)
				spin = true
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("unspin") then
			spin = false
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("attach ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 8))) do
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
				wait(0.3)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
				attplr = v
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("unattach ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 10))) do
				local function getout(player,player2)
				local char1,char2=player.Character,player2.Character
				if char1 and char2 then
				char1:MoveTo(char2.Head.Position)
				end
				end
				getout(lplayer, game:GetService("Players")[v.Name])
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("follow ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 8))) do
				followed = true
				flwplr = v
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("unfollow") then
			followed = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("freefall ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 10))) do
				local NOW = lplayer.Character.HumanoidRootPart.CFrame
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.6)
				lplayer.Character.HumanoidRootPart.CFrame = NOW
				wait(0.6)
				lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,50000,0)
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("trail ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
				traill = true
				trlplr = v
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("untrail") then
			traill = false
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("orbit ") then
			if string.sub(CMDBAR.Text, 7) == "all" or string.sub(CMDBAR.Text, 7) == "others" or string.sub(CMDBAR.Text, 7) == "me" then
				lplayer.Character.HumanoidRootPart.CFrame = lplayer.Character.HumanoidRootPart.CFrame
			else
				for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
					local o = Instance.new("RocketPropulsion")
					o.Parent = lplayer.Character.HumanoidRootPart
					o.Name = "Orbit"
					o.Target = game:GetService("Players")[v.Name].Character.HumanoidRootPart
					o:Fire()
					noclip = true
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("unorbit") then
			lplayer.Character.HumanoidRootPart.Orbit:Destroy()
			noclip = false
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("fling ") then
			if string.sub(CMDBAR.Text, 7) == "all" or string.sub(CMDBAR.Text, 7) == "others" or string.sub(CMDBAR.Text, 7) == "me" then
				lplayer.Character.HumanoidRootPart.CFrame = lplayer.Character.HumanoidRootPart.CFrame
			else
				for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
					local y = Instance.new("RocketPropulsion")
					y.Parent = lplayer.Character.HumanoidRootPart
					y.CartoonFactor = 1
					y.MaxThrust = 800000
					y.MaxSpeed = 1000
					y.ThrustP = 200000
					y.Name = "Fling"
					game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[v.Name].Character.Head
					y.Target = game:GetService("Players")[v.Name].Character.HumanoidRootPart
					y:Fire()
					noclip = true
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("unfling") then
			noclip = false
			lplayer.Character.HumanoidRootPart.Fling:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Head
			wait(0.4)
			lplayer.Character.HumanoidRootPart.Fling:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("fecheck") then
			if game:GetService("Workspace").FilteringEnabled == true then
				warn("FE is Enabled (Filtering Enabled)")
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "FE is Enabled";
					Text = "Filtering Enabled. Enjoy using Reviz Admin!";
				})
			else
				warn("FE is Disabled (Filtering Disabled) Consider using a different admin script.")
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "FE is Disabled";
					Text = "Filtering Disabled. Consider using a different admin script.";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("void ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.6)
				lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(999999999999999,0,999999999999999)
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("noclip") then
			noclip = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Noclip enabled";
			Text = "Type ;clip to disable";
			})
		end
		if string.sub(CMDBAR.Text, 1, 4) == ("clip") then
			noclip = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Noclip disabled";
			Text = "Type ;noclip to enable";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("speed ") then
			lplayer.Character.Humanoid.WalkSpeed = (string.sub(CMDBAR.Text, 7))
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("ws ") then
			lplayer.Character.Humanoid.WalkSpeed = (string.sub(CMDBAR.Text, 4))
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("hipheight ") then
			lplayer.Character.Humanoid.HipHeight = (string.sub(CMDBAR.Text, 11))
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("hh ") then
			lplayer.Character.Humanoid.HipHeight = (string.sub(CMDBAR.Text, 4))
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("jumppower ") then
			lplayer.Character.Humanoid.JumpPower = (string.sub(CMDBAR.Text, 11))
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("jp ") then
			lplayer.Character.Humanoid.JumpPower = (string.sub(CMDBAR.Text, 4))
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("default") then
			lplayer.Character.Humanoid.JumpPower = 50
			lplayer.Character.Humanoid.WalkSpeed = 16
			lplayer.Character.Humanoid.HipHeight = 0
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("annoy ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
				annoying = true
				annplr = v
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("unannoy") then
			annoying = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("headwalk ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 10))) do
				hwalk = true
				hdwplr = v
			end
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("unheadwalk") then
			hwalk = false
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("nolimbs") then
			lplayer.Character["Left Leg"]:Destroy()
			lplayer.Character["Left Arm"]:Destroy()
			lplayer.Character["Right Leg"]:Destroy()
			lplayer.Character["Right Arm"]:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("god") then
			lplayer.Character.Humanoid.Name = 1
			local l = lplayer.Character["1"]:Clone()
			l.Parent = lplayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			lplayer.Character["1"]:Destroy()
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
			lplayer.Character.Animate.Disabled = true
			wait(0.1)
			lplayer.Character.Animate.Disabled = false
			lplayer.Character.Humanoid.DisplayDistanceType = "None"
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "FE Godmode enabled";
			Text = "Use ;grespawn or ;respawn to remove.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("drophats") then
			for i,v in pairs(lplayer.Character:GetChildren()) do
				if (v:IsA("Accessory")) or (v:IsA("Hat")) then
					v.Parent = workspace
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("droptool") then
			for i,v in pairs(lplayer.Character:GetChildren()) do
				if (v:IsA("Tool")) then
					v.Parent = workspace
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("loopdhats") then
			droppinghats = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Loop Drop Enabled";
			Text = "Type ;unloopdhats to disable";
			})
		end
		if string.sub(CMDBAR.Text, 1, 11) == ("unloopdhats") then
			droppinghats = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Loop Drop Disabled";
			Text = "Type ;loopdhats to enable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("loopdtool") then
			droppingtools = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Loop Drop Enabled";
			Text = "Type ;unloopdtool to disable";
			})
		end
		if string.sub(CMDBAR.Text, 1, 11) == ("unloopdtool") then
			droppingtools = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Loop Drop Disabled";
			Text = "Type ;loopdtool to enable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("invisible") then -- Credit to Timeless
			Local = game:GetService('Players').LocalPlayer
			Char  = Local.Character
			touched,tpdback = false, false
			box = Instance.new('Part',workspace)
			box.Anchored = true
			box.CanCollide = true
			box.Size = Vector3.new(10,1,10)
			box.Position = Vector3.new(0,10000,0)
			box.Touched:connect(function(part)
			    if (part.Parent.Name == Local.Name) then
			        if touched == false then
			            touched = true
			            function apply()
			                if script.Disabled ~= true then
			                    no = Char.HumanoidRootPart:Clone()
			                    wait(.25)
			                    Char.HumanoidRootPart:Destroy()
			                    no.Parent = Char
			                    Char:MoveTo(loc)
			                    touched = false
			                end end
			            if Char then
			                apply()
			            end
			        end
			    end
			end)
			repeat wait() until Char
			loc = Char.HumanoidRootPart.Position
			Char:MoveTo(box.Position + Vector3.new(0,.5,0))
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Invisibility enabled!";
			Text = "Reset or use ;respawn to remove.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("view ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				if game:GetService("Players")[v.Name].Character.Humanoid then
					game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[v.Name].Character.Humanoid
				else
					game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[v.Name].Character.Head
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("unview") then
			if lplayer.Character.Humanoid then
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Humanoid
			else
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Head
			end
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("goto ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			end
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("fly") then
		repeat wait() until lplayer and lplayer.Character and lplayer.Character:FindFirstChild('HumanoidRootPart') and lplayer.Character:FindFirstChild('Humanoid')
		repeat wait() until Mouse
		
		local T = lplayer.Character.HumanoidRootPart
		local CONTROL = {F = 0, B = 0, L = 0, R = 0}
		local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
		local SPEED = speedget
		
		local function fly()
			flying = true
			local BG = Instance.new('BodyGyro', T)
			local BV = Instance.new('BodyVelocity', T)
			BG.P = 9e4
			BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			BG.cframe = T.CFrame
			BV.velocity = Vector3.new(0, 0.1, 0)
			BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
			spawn(function()
			repeat wait()
			lplayer.Character.Humanoid.PlatformStand = true
			if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
			SPEED = 50
			elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
			SPEED = 0
			end
			if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
			BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
			lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
			elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
			BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
			else
			BV.velocity = Vector3.new(0, 0.1, 0)
			end
			BG.cframe = workspace.CurrentCamera.CoordinateFrame
					until not flying
					CONTROL = {F = 0, B = 0, L = 0, R = 0}
					lCONTROL = {F = 0, B = 0, L = 0, R = 0}
					SPEED = 0
					BG:destroy()
					BV:destroy()
					lplayer.Character.Humanoid.PlatformStand = false
				end)
			end
		Mouse.KeyDown:connect(function(KEY)
			if KEY:lower() == 'w' then
				CONTROL.F = speedfly
			elseif KEY:lower() == 's' then
				CONTROL.B = -speedfly
			elseif KEY:lower() == 'a' then
				CONTROL.L = -speedfly 
			elseif KEY:lower() == 'd' then 
				CONTROL.R = speedfly
			end
		end)
		Mouse.KeyUp:connect(function(KEY)
			if KEY:lower() == 'w' then
				CONTROL.F = 0
			elseif KEY:lower() == 's' then
				CONTROL.B = 0
			elseif KEY:lower() == 'a' then
				CONTROL.L = 0
			elseif KEY:lower() == 'd' then
				CONTROL.R = 0
			end
		end)
		fly()
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("unfly") then
			flying = false
			lplayer.Character.Humanoid.PlatformStand = false
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("chat ") then
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer((string.sub(CMDBAR.Text, 6)), "All")
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("spam ") then
			spamtext = (string.sub(CMDBAR.Text, 6))
			spamming = true
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("unspam") then
			spamming = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("spamwait ") then
			spamdelay = (string.sub(CMDBAR.Text, 10))
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("pmspam ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 8))) do
				pmspammed = v.Name
				spammingpm = true
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("unpmspam") then
			spammingpm = false
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("cfreeze ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 9))) do
				v.Character["Left Leg"].Anchored = true
				v.Character["Left Arm"].Anchored = true
				v.Character["Right Leg"].Anchored = true
				v.Character["Right Arm"].Anchored = true
				v.Character.Torso.Anchored = true
				v.Character.Head.Anchored = true
			end
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("uncfreeze ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 11))) do
				v.Character["Left Leg"].Anchored = false
				v.Character["Left Arm"].Anchored = false
				v.Character["Right Leg"].Anchored = false
				v.Character["Right Arm"].Anchored = false
				v.Character.Torso.Anchored = false
				v.Character.Head.Anchored = false
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("unlockws") then
			local a = game:GetService("Workspace"):getChildren()
			for i = 1, #a do
				if a[i].className == "Part" then
					a[i].Locked = false
				elseif a[i].className == "Model" then
					local r = a[i]:getChildren()
					for i = 1, #r do
						if r[i].className == "Part" then
						r[i].Locked = false
						end
					end
				end
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Success!";
			Text = "Workspace unlocked. Use ;lockws to lock.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("lockws") then
			local a = game:GetService("Workspace"):getChildren()
			for i = 1, #a do
				if a[i].className == "Part" then
					a[i].Locked = true
				elseif a[i].className == "Model" then
					local r = a[i]:getChildren()
					for i = 1, #r do
						if r[i].className == "Part" then
						r[i].Locked = true
						end
					end
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("btools") then
			local Clone_T = Instance.new("HopperBin",lplayer.Backpack)
			Clone_T.BinType = "Clone"
			local Destruct = Instance.new("HopperBin",lplayer.Backpack)
			Destruct.BinType = "Hammer"
			local Hold_T = Instance.new("HopperBin",lplayer.Backpack)
			Hold_T.BinType = "Grab"
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("pstand") then
			lplayer.Character.Humanoid.PlatformStand = true
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("unpstand") then
			lplayer.Character.Humanoid.PlatformStand = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("blockhead") then
			lplayer.Character.Head.Mesh:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("sit") then
			lplayer.Character.Humanoid.Sit = true
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("bringobj ") then
			local function bringobjw()
			for i,obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
			if obj.Name == (string.sub(CMDBAR.Text, 10)) then
			obj.CFrame = lplayer.Character.HumanoidRootPart.CFrame
			obj.CanCollide = false
			obj.Transparency = 0.7
			wait()
			obj.CFrame = lplayer.Character["Left Leg"].CFrame
			wait()
			obj.CFrame = lplayer.Character["Right Leg"].CFrame
			wait()
			obj.CFrame = lplayer.Character["Head"].CFrame
			end
			end
			end
			while wait() do
				bringobjw()
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "BringObj";
			Text = "BringObj enabled.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("wsvis ") then
			vis = (string.sub(CMDBAR.Text, 7))
			local a = game:GetService("Workspace"):GetDescendants()
			for i = 1, #a do
				if a[i].className == "Part" then
					a[i].Transparency = vis
				elseif a[i].className == "Model" then
					local r = a[i]:getChildren()
					for i = 1, #r do
						if r[i].className == "Part" then
						r[i].Transparency = vis
						end
					end
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("hypertotal") then
			loadstring(game:GetObjects("rbxassetid://1255063809")[1].Source)()
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Success!";
			Text = "HyperTotal GUI Loaded!";
			})
		end
		if string.sub(CMDBAR.Text, 1, 4) == ("cmds") then
			CMDSFRAME.Visible = true
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("rmeshhats") then
			for i,v in pairs(lplayer.Character:GetChildren()) do
				if (v:IsA("Accessory")) or (v:IsA("Hat")) then
					v.Handle.Mesh:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("blockhats") then
			for i,v in pairs(lplayer.Character:GetChildren()) do
				if (v:IsA("Accessory")) or (v:IsA("Hat")) then
					v.Handle.Mesh:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("rmeshtool") then
			for i,v in pairs(lplayer.Character:GetChildren()) do
				if (v:IsA("Tool")) then
					v.Handle.Mesh:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("blocktool") then
			for i,v in pairs(lplayer.Character:GetChildren()) do
				if (v:IsA("Tool")) then
					v.Handle.Mesh:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("spinner") then
			local p = Instance.new("RocketPropulsion")
			p.Parent = lplayer.Character.HumanoidRootPart
			p.Name = "Spinner"
			p.Target = lplayer.Character["Left Arm"]
			p:Fire()
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Spinner enabled";
			Text = "Type ;nospinner to disable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("nospinner") then
			lplayer.Character.HumanoidRootPart.Spinner:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("reachd") then
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
				if v:isA("Tool") then
					local a = Instance.new("SelectionBox",v.Handle)
					a.Adornee = v.Handle
					v.Handle.Size = Vector3.new(0.5,0.5,60)
					v.GripPos = Vector3.new(0,0,0)
					lplayer.Character.Humanoid:UnequipTools()
				end
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Reach applied!";
			Text = "Applied to equipped sword. Use ;noreach to disable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("reach ") then
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
				if v:isA("Tool") then
					local a = Instance.new("SelectionBox",v.Handle)
					a.Name = "Reach"
					a.Adornee = v.Handle
					v.Handle.Size = Vector3.new(0.5,0.5,(string.sub(CMDBAR.Text, 7)))
					v.GripPos = Vector3.new(0,0,0)
					lplayer.Character.Humanoid:UnequipTools()
				end
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Reach applied!";
			Text = "Applied to equipped sword. Use ;noreach to disable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("noreach") then
			for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
				if v:isA("Tool") then
					v.Handle.Reach:Destroy()
				end
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Reach removed!";
			Text = "Removed reach from equipped sword.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("rkill ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7)))do
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				wait(0.1)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.5)
				lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-100000,10,-100000))
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("tp me ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("cbring ") then
			if (string.sub(CMDBAR.Text, 8)) == "all" or (string.sub(CMDBAR.Text, 8)) == "All" or (string.sub(CMDBAR.Text, 8)) == "ALL" then
				cbringall = true
			else
				for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 8))) do
					brplr = v.Name
				end
			end
			cbring = true
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("uncbring") then
			cbring = false
			cbringall = false
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("swap ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				local NOWPLR = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				local NOW = lplayer.Character.HumanoidRootPart.CFrame
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				local function tp(player,player2)
				local char1,char2=player.Character,player2.Character
				if char1 and char2 then
				char1:MoveTo(char2.Head.Position)
				end
				end
				wait(0.1)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.2)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character.HumanoidRootPart.CFrame
				wait(0.5)
				lplayer.Character.HumanoidRootPart.CFrame = NOW
				wait(0.6)
				tp(lplayer, game:GetService("Players")[v.Name])
				wait(0.4)
				lplayer.Character.HumanoidRootPart.CFrame = NOWPLR
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("glitch ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 8))) do
				lplayer.Character.Humanoid.Name = 1
				local l = lplayer.Character["1"]:Clone()
				l.Parent = lplayer.Character
				l.Name = "Humanoid"
				wait(0.1)
				lplayer.Character["1"]:Destroy()
				game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
				lplayer.Character.Animate.Disabled = true
				wait(0.1)
				lplayer.Character.Animate.Disabled = false
				lplayer.Character.Humanoid.DisplayDistanceType = "None"
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
				lplayer.Character.Humanoid:EquipTool(v)
				end
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
				wait(0.3)
				lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
				wait(0.4)
				b = Instance.new("BodyForce")
				b.Parent = lplayer.Character.HumanoidRootPart
				b.Name = "Glitch"
				b.Force = Vector3.new(100000000,5000,0)
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Tools needed!";
				Text = "You need a tool in your backpack for this command!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("unglitch") then
			lplayer.Character.HumanoidRootPart.Glitch:Destroy()
			lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(10000,0,10000)
			b = Instance.new("BodyForce")
			b.Parent = lplayer.Character.HumanoidRootPart
			b.Name = "unGlitch"
			b.Force = Vector3.new(0,-5000000,0)
			wait(2)
			lplayer.Character.HumanoidRootPart.unGlitch:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("grespawn") then
			lplayer.Character.Humanoid.Health = 0
			wait(1)
			lplayer.Character.Head.CFrame = CFrame.new(1000000,0,1000000)
			lplayer.Character.Torso.CFrame = CFrame.new(1000000,0,1000000)
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("explorer") then
			loadstring(game:GetObjects("rbxassetid://492005721")[1].Source)()
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Success!";
			Text = "DEX Explorer has loaded.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("anim ") then
			local Anim = Instance.new("Animation")
			Anim.AnimationId = "rbxassetid://"..(string.sub(CMDBAR.Text, 6))
			local track = lplayer.Character.Humanoid:LoadAnimation(Anim)
			track:Play(.1, 1, 1)
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("animgui") then
			loadstring(game:GetObjects("rbxassetid://1202558084")[1].Source)()
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Success!";
			Text = "Energize Animations GUI has loaded.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("savepos") then
			saved = lplayer.Character.HumanoidRootPart.CFrame
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Position Saved";
			Text = "Use ;loadpos to return to saved position.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("loadpos") then
			lplayer.Character.HumanoidRootPart.CFrame = saved
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("bang ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				local Anim2 = Instance.new("Animation")
				Anim2.AnimationId = "rbxassetid://148840371"
				local track2 = lplayer.Character.Humanoid:LoadAnimation(Anim2)
				track2:Play(.1, 1, 1)
				bplrr = v.Name
				banpl = true
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("unbang") then
			banpl = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("bringmod ") then
			local function bringmodw()
			for i,obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
			if obj.Name == (string.sub(CMDBAR.Text, 10)) then
			for i,ch in pairs(obj:GetDescendants()) do
			if (ch:IsA("BasePart")) then
			ch.CFrame = lplayer.Character.HumanoidRootPart.CFrame
			ch.CanCollide = false
			ch.Transparency = 0.7
			wait()
			ch.CFrame = lplayer.Character["Left Leg"].CFrame
			wait()
			ch.CFrame = lplayer.Character["Right Leg"].CFrame
			wait()
			ch.CFrame = lplayer.Character["Head"].CFrame
			end
			end
			end
			end
			end
			while wait() do
				bringmodw()
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "BringMod";
			Text = "BringMod enabled.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("respawn") then
			local mod = Instance.new('Model', workspace) mod.Name = 're '..lplayer.Name
			local hum = Instance.new('Humanoid', mod)
			local ins = Instance.new('Part', mod) ins.Name = 'Torso' ins.CanCollide = false ins.Transparency = 1
			lplayer.Character = mod
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("shutdown") then
			game:GetService'RunService'.Stepped:Connect(function()
			pcall(function()
			    for i,v in pairs(game:GetService'Players':GetPlayers()) do
			        if v.Character ~= nil and v.Character:FindFirstChild'Head' then
			            for _,x in pairs(v.Character.Head:GetChildren()) do
			                if x:IsA'Sound' then x.Playing = true x.CharacterSoundEvent:FireServer(true, true) end
			            end
			        end
			    end
			end)
			end)
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Attempting Shutdown";
			Text = "Shutdown Attempt has begun.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("delobj ") then
			objtodel = (string.sub(CMDBAR.Text, 8))
			for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
				if v.Name == objtodel then
					v:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("getplrs") then
			for i,v in pairs(game:GetService("Players"):GetPlayers())do
				print(v)
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Printed";
			Text = "Players have been printed to console. (F9)";
			})
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("deldecal") then
			for i,v in pairs(game:GetService("Workspace"):GetDescendants())do
				if (v:IsA("Decal")) then
					v:Destroy()
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 10) == ("opfinality") then
			loadstring(game:GetObjects("rbxassetid://1294358929")[1].Source)()
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Success!";
			Text = "OpFinality GUI has loaded.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("remotes") then
			remotes = true
			added = true
			game.DescendantAdded:connect(function(rmt)
			if added == true then
			if remotes == true then 
			if rmt:IsA("RemoteEvent") then
			print("A RemoteEvent was added!")
			print(" game." .. rmt:GetFullName() .. " | RemoteEvent")
			print(" game." .. rmt:GetFullName() .. " | RemoteEvent", 247, 0, 0, true)
			end end end
			end)
			game.DescendantAdded:connect(function(rmtfnctn)
			if added == true then
			if remotes == true then 
			if rmtfnctn:IsA("RemoteFunction") then
			warn("A RemoteFunction was added!")
			warn(" game." .. rmtfnctn:GetFullName() .. " | RemoteFunction")
			print(" game." .. rmtfnctn:GetFullName() .. " | RemoteFunction", 5, 102, 198, true)
			end end end
			end)
			
			game.DescendantAdded:connect(function(bndfnctn)
			if added == true then
			if binds == true then 
			if bndfnctn:IsA("BindableFunction") then
			print("A BindableFunction was added!")
			print(" game." .. bndfnctn:GetFullName() .. " | BindableFunction")
			print(" game." .. bndfnctn:GetFullName() .. " | BindableFunction", 239, 247, 4, true)
			end end end
			end)
			
			game.DescendantAdded:connect(function(bnd)
			if added == true then
			if binds == true then 
			if bnd:IsA("BindableEvent") then
			warn("A BindableEvent was added!")
			warn(" game." .. bnd:GetFullName() .. " | BindableEvent")
			print(" game." .. bnd:GetFullName() .. " | BindableEvent", 13, 193, 22, true)
			end end end
			end)
			
			
			if binds == true then
			for i,v in pairs(game:GetDescendants()) do
			if v:IsA("BindableFunction") then
			print(" game." .. v:GetFullName() .. " | BindableFunction")
			print(" game." .. v:GetFullName() .. " | BindableFunction", 239, 247, 4, true)
			end end
			for i,v in pairs(game:GetDescendants()) do
			if v:IsA("BindableEvent") then
			warn(" game." .. v:GetFullName() .. " | BindableEvent")
			print(" game." .. v:GetFullName() .. " | BindableEvent", 13, 193, 22, true)
			end end
			else
			print("Off")
			end
			if remotes == true then
			for i,v in pairs(game:GetDescendants()) do
			if v:IsA("RemoteFunction") then
			warn(" game." .. v:GetFullName() .. " | RemoteFunction")
			print(" game." .. v:GetFullName() .. " | RemoteFunction", 5, 102, 198, true)
			end end
			wait()
			for i,v in pairs(game:GetDescendants()) do
			if v:IsA("RemoteEvent") then
			print(" game." .. v:GetFullName() .. " | RemoteEvent")
			print(" game." .. v:GetFullName() .. " | RemoteEvent", 247, 0, 0, true)
			end end
			else
			print("Off")
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Printing Remotes";
			Text = "Type ;noremotes to disable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("noremotes") then
			remotes = false
			added = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Printing Remotes Disabled";
			Text = "Type ;remotes to enable.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("tpdefault") then
			spin = false
			followed = false
			traill = false
			noclip = false
			annoying = false
			hwalk = false
			cbringing = false
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("stopsit") then
			stopsitting = true
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("gosit") then
			stopsitting = false
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("version") then
			print(adminversion)
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Version";
			Text = adminversion;
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("clicktp") then
			clickgoto = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Click TP";
			Text = "Press E to teleport to mouse position";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("noclicktp") then
			clickgoto = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Click TP";
			Text = "Click TP has been disabled.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("toolson") then
			gettingtools = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools Enabled";
			Text = "Automatically colleting tools dropped.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("toolsoff") then
			gettingtools = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Tools Disabled";
			Text = "Click TP has been disabled.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("delcmdbar") then
			ScreenGui:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 5) == ("reset") then
			lplayer.Character.Head:Destroy()
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("state ") then
			statechosen = string.sub(CMDBAR.Text, 7)
			changingstate = true
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("gravity ") then
			game:GetService("Workspace").Gravity = string.sub(CMDBAR.Text, 9)
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("looprhats") then
		removingmeshhats = true
		end
		if string.sub(CMDBAR.Text, 1, 11) == ("unlooprhats") then
			removingmeshhats = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("looprtool") then
			removingmeshtool = true
		end
		if string.sub(CMDBAR.Text, 1, 11) == ("unlooprtool") then
			removingmeshtool = false
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("givetool ") then
			for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
				if v:IsA("Tool") then
					for i,player in pairs(GetPlayer(string.sub(CMDBAR.Text, 10))) do
						v.Parent = player.Character
					end
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 4) == ("age ") then
			for i,player in pairs(GetPlayer(string.sub(CMDBAR.Text, 5))) do
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player.Name.." Account Age: "..player.AccountAge.." days!", "All")
			end
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("id ") then
			for i,player in pairs(GetPlayer(string.sub(CMDBAR.Text, 4))) do
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player.Name.." Account ID: "..player.UserId, "All")
			end
		end
		if string.sub(CMDBAR.Text, 1, 5) == (".age ") then
			for i,player in pairs(GetPlayer(string.sub(CMDBAR.Text, 6))) do
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = player.AccountAge.." Days";
				Text = "Account age of "..player.Name;
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 4) == (".id ") then
			for i,player in pairs(GetPlayer(string.sub(CMDBAR.Text, 5))) do
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = player.UserId.." ID";
				Text = "Account ID of "..player.Name;
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("gameid") then
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Game ID";
			Text = "Game ID: ".. game.GameId;
			})
		end
		if string.sub(CMDBAR.Text, 1, 3) == ("pgs") then
			local pgscheck = game:GetService("Workspace"):PGSIsEnabled()
			if pgscheck == true then
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "PGSPhysicsSolverEnabled";
				Text = "PGS is Enabled!";
				})
			else
				game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "PGSPhysicsSolverEnabled";
				Text = "PGS is Disabled!";
				})
			end
		end
		if string.sub(CMDBAR.Text, 1, 11) == ("removeinvis") then
			for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
				if v:IsA("Part") then
					if v.Transparency == 1 then
						if v.Name ~= "HumanoidRootPart" then
							v:Destroy()
						end
					end
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("removefog") then
			game:GetService("Lighting").FogStart = 0
			game:GetService("Lighting").FogEnd = 9999999999999
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("disable") then
			lplayer.Character.Humanoid.Parent = lplayer
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("enable") then
			lplayer.Humanoid.Parent = lplayer.Character
		end
		if string.sub(CMDBAR.Text, 1, 13) == ("givealltools ") then
			for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
				if v:IsA("Tool") then
					v.Parent = lplayer.Character
					wait()
					for i,player in pairs(GetPlayer(string.sub(CMDBAR.Text, 14))) do
						v.Parent = player.Character
					end
				end
			end
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("flyspeed ") then
			speedfly = string.sub(CMDBAR.Text, 10)
			wait()
			change()
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("carpet ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 8))) do
				local Anim3 = Instance.new("Animation")
				Anim3.AnimationId = "rbxassetid://282574440"
				local track3 = lplayer.Character.Humanoid:LoadAnimation(Anim3)
				track3:Play(.1, 1, 1)
				bplrr = v.Name
				banpl = true
			end
		end
		if string.sub(CMDBAR.Text, 1, 8) == ("uncarpet") then
			banpl = false
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("stare ") then
			for i,v in pairs(GetPlayer(string.sub(CMDBAR.Text, 7))) do
				staring = true
				stareplr = v
			end
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("unstare") then
			staring = false
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("logchat") then
			chatlogs = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "LogChat enabled";
			Text = "Now logging all player chat.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 9) == ("unlogchat") then
			chatlogs = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "LogChat disabled";
			Text = "Stopped logging all player chat.";
			})
		end
		if string.sub(CMDBAR.Text, 1, 6) == ("fixcam") then
			game:GetService("Workspace").CurrentCamera:Destroy()
			wait(0.1)
			game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Humanoid
			game:GetService("Workspace").CurrentCamera.CameraType = "Custom"
			lplayer.CameraMinZoomDistance = 0.5
			lplayer.CameraMaxZoomDistance = 400
			lplayer.CameraMode = "Classic"
		end
		if string.sub(CMDBAR.Text, 1, 7) == ("unstate") then
			changingstate = false
		end
		CMDBAR.Text = ""
	end
end)

wait(0.3)
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Loaded successfully!";
	Text = "Reviz Admin V2 by illremember";
})
wait(0.1)
print("Reviz Admin V2 loaded!")
if game:GetService("Workspace").FilteringEnabled == true then
	warn("FE is Enabled (Filtering Enabled)")
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "FE is Enabled";
		Text = "Filtering Enabled. Enjoy using Reviz Admin!";
	})
else
	warn("FE is Disabled (Filtering Disabled) Consider using a different admin script.")
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "FE is Disabled";
		Text = "Filtering Disabled. Consider using a different admin script.";
	})
end

local intro = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
intro.Parent = game:GetService("CoreGui")
Frame.Parent = intro
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BackgroundTransparency = 1
Frame.Size = UDim2.new(1, 0, 0, 300)
Frame.Position = UDim2.new(0, 0, -0.4, 0)
ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(0, 0, 0, 0)
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
ImageLabel.Image = "http://www.roblox.com/asset/?id=1542162618"
Frame:TweenPosition(UDim2.new(0, 0, 0.2, 0), "Out", "Elastic", 3)
wait(3.01)
Frame:TweenPosition(UDim2.new(0, 0, 1.5, 0), "Out", "Elastic", 5)
wait(5.01)
intro:Destroy()
end)
local PlayerSection = PlayerSettings:NewSection("Player Properties")
PlayerSection:NewSlider("Speed", "Sets your player's speed.", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
PlayerSection:NewSlider("Jump Power", "Sets your player's jump power.", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)
sittoggle = PlayerSection:NewToggle("Sit", "Whether you are sitting or not.", function(state)
    if state then
        game.Players.LocalPlayer.Character.Humanoid.Sit = true
    else
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
	getgenv().Toggled = state
end)
game.GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Toggled then
        sittoggle:UpdateToggle("Toggle On")
        else
        sittoggle:UpdateToggle("Toggle Off")
    end
end)
