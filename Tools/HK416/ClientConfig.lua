local Tool = script.Parent.Parent.Parent
local Utilize = require(script.Parent.Parent:WaitForChild("Modules"):WaitForChild("Utilities"))
local TweenJoint = Utilize.TweenJoint
local ts = game:GetService('TweenService')
local sConfig = require(script.Parent:WaitForChild('ServerConfig'))

local Settings = {

--// Positioning
	SprintPos = CFrame.new(0, 0, 0, 0.844756603, -0.251352191, 0.472449303, 0.103136979, 0.942750931, 0.317149073, -0.525118113, -0.219186768, 0.822318792);			

--// Ammo Settings			
	Ammo = 30;
	StoredAmmo = 30;
	MagCount = math.huge; --  If you want infinate ammo, set to math.huge EX. MagCount = math.huge;
	ExplosiveAmmo = 3;
	
--// Damage Settings	
	BaseDamage = 34; -- Torso Damage
	LimbDamage = 24; -- Arms and Legs
	ArmorDamage = 30; -- How much damage is dealt against armor (Name the armor "Armor")
	HeadDamage = 68; -- If you set this to 100, there's a chance the player won't die because of the heal script	
	
--// Recoil Settings	
	gunrecoil = -0.3; -- How much the gun recoils backwards when not aiming
	camrecoil = 0.23; -- How much the camera flicks when not aiming
	AimGunRecoil = -0.2; -- How much the gun recoils backwards when aiming
	AimCamRecoil = 0.21; -- How much the camera flicks when aiming
	
	CamShake = 8; -- THIS IS NEW!!!! CONTROLS CAMERA SHAKE WHEN FIRING
	AimCamShake = 6; -- THIS IS ALSO NEW!!!!
	
	Kickback = 0.4; -- Upward gun rotation when not aiming
	AimKickback = 0.2; -- Upward gun rotation when aiming
	
--// Handling Settings		
	Firerate = 60 / 800; -- 60 = 1 Minute, 700 = Rounds per that 60 seconds. DO NOT TOUCH THE 60!
	
	FireMode = 2; -- 1 = Semi, 2 = Auto, 3 = Burst, 4 = Bolt Action, 5 = Shot, 6 = Explosive
	
--// Firemode Settings
	CanSelectFire = true;
	BurstEnabled = false;
	SemiEnabled = true;
	AutoEnabled = true;
	BoltAction = false;
	ExplosiveEnabled = false;
	
--// Firemode Shot Customization
	BurstNum = 3; -- How many bullets per burst
	ShotNum = 5; -- How many bullets per shot
	
--// Aim|Zoom|Sensitivity Customization
	ZoomSpeed = 0.23; -- The lower the number the slower and smoother the tween
	AimZoom = 40; -- Default zoom
	AimSpeed = 0.24;
	UnaimSpeed = 0.23;
	CycleAimZoom = 30; -- Cycled zoom
	MouseSensitivity = 0.5; -- Number between 0.1 and 1
	SensitivityIncrement = 0.05; -- No touchy
	
--// Bullet Physics
	BulletPhysics = Vector3.new(0,55,0); -- Drop fixation: Lower number = more drop
	BulletSpeed = 10000; -- Bullet Speed
	BulletSpread = 0; -- How much spread the bullet has
	
	ExploPhysics = Vector3.new(0,20,0); -- Drop for explosive rounds
	ExploSpeed = 600; -- Speed for explosive rounds
	
	BulletDecay = 10000; -- How far the bullet travels before slowing down and being deleted (BUGGY)
	
--// Probabilities
	JamChance = 0; -- This is percent scaled. For 100% Chance of jamming, put 100, for 0%, 0; and everything inbetween
	TracerChance = 100; -- This is the percen scaled. For 100% Chance of showing tracer, put 100, for 0%, 0; and everything inbetween
	
--// Tracer Vars
	TracerTransparency = 0;	
	TracerLightEmission = 1;
	TracerTextureLength = 0.1;
	TracerLifetime = 0.0005;
	TracerFaceCamera = true;
	TracerColor = BrickColor.new('White');

--// Dev Vars
	CameraGo = true; -- No touchy
	FirstPersonOnly = false; -- SET THIS TO FALSE TO ENABLE THIRD PERSON, TRUE FOR FIRST PERSON ONLY
	TPSMouseIcon = 1415957732; -- Image used as the third person reticle
	
--// Extras
	WalkAnimEnabled = true; -- Set to false to disable walking animation, true to enable
	SwayEnabled = true;	 -- Set to false to disable sway, true to enable
	TacticalModeEnabled = true; -- SET THIS TO TRUE TO TURN ON TACTICAL MODEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

-- Customization
	AntiTK = false; -- Set to false to allow TK and damaging of NPC, true for no TK. (To damage NPC, this needs to be false)
	
	MouseSense = 0.5;

	CanAim = true; -- Allows player to aim
	CanBolt = true; -- When shooting, if this is enabled, the bolt will move (SCAR-L, ACR, AK Series)
	
	LaserAttached = true;
	LightAttached = true;
	TracerEnabled = true;
	
	SprintSpeed = 20;
	
	CanCallout = false;
	SuppressCalloutChance = 0;

--// KeyBindings
	FireSelectKey = Enum.KeyCode.V;
	CycleSightKey = Enum.KeyCode.T;
	LaserKey = Enum.KeyCode.G;
	LightKey = Enum.KeyCode.B;
	InteractKey = Enum.KeyCode.E;
	AlternateAimKey = Enum.KeyCode.Z;
	InspectionKey = Enum.KeyCode.H;
	AttachmentKey = Enum.KeyCode.LeftControl;
	
--// Unused (Don't delete)
	RestMode = false;
	AttachmentsEnabled = true;
	UIScope = false;
	CanSlideLock = false;
		
--// Animations
	
	-- Idle Anim
	IdleAnim = function(char, speed, objs)
		TweenJoint(objs[2],  nil , CFrame.new(-0.902175903, 0.295501232, -1.32277012, 1, 0, 0, 0, 1.19248806e-08, 1, 0, -1, 1.19248806e-08), function(X) return math.sin(math.rad(X)) end, 0.25)
		TweenJoint(objs[3],  nil , CFrame.new(1.06851184, 0.973718464, -2.29667926, 0.787567914, -0.220087856, 0.575584888, -0.615963876, -0.308488727, 0.724860668, 0.0180283934, -0.925416589, -0.378522098), function(X) return math.sin(math.rad(X)) end, 0.25)
		wait(0.18)	
	end;
	
	-- FireMode Anim
	FireModeAnim = function(char, speed, objs)
		TweenJoint(objs[1],  nil , CFrame.new(0.340285569, 0, -0.0787199363, 0.962304771, 0.271973342, 0, -0.261981696, 0.926952124, -0.268561482, -0.0730415657, 0.258437991, 0.963262498), function(X) return math.sin(math.rad(X)) end, 0.25)
		wait(0.1)
		TweenJoint(objs[2],  nil , CFrame.new(0.67163527, -0.310947895, -1.34432662, 0.766044378, -2.80971371e-008, 0.642787576, -0.620885074, -0.258818865, 0.739942133, 0.166365519, -0.965925872, -0.198266774), function(X) return math.sin(math.rad(X)) end, 0.25)
		wait(0.25)
		objs[4]:WaitForChild("Click"):Play()		
	end;
	
	-- Reload Anim
	ReloadAnim = function(char, speed, objs)
			ts:Create(objs[2],TweenInfo.new(0.5),{C1 = CFrame.new(-1.83314121, 0.112866193, -0.954399943, 0.758022368, -0.558526218, -0.336824089, 0.157115281, -0.344846308, 0.925416529, -0.633021891, -0.75440675, -0.173648208)}):Play()
			ts:Create(objs[3],TweenInfo.new(0.5),{C1 = CFrame.new(-0.570892751, 0.765644431, -2.10391617, 0.545084536, -0.836516321, 0.0558858961, -0.482962906, -0.258818835, 0.836516321, -0.685295284, -0.482962966, -0.545084476)}):Play()
			wait(0.2)		
			
			local MagC = objs[4]:clone()
			MagC:FindFirstChild("Mag"):Destroy()
			MagC.Parent = Tool
			MagC.Name = "MagC"
			local MagCW = Instance.new("Motor6D")
			MagCW.Part0 = MagC
			MagCW.Part1 = workspace.CurrentCamera:WaitForChild("Arms"):WaitForChild("Left Arm")
			MagCW.Parent = MagC
			MagCW.C1 = MagC.CFrame:toObjectSpace(objs[4].CFrame)
			objs[4].Transparency = 1
			
			objs[6]:WaitForChild("MagOut"):Play()		
			
			ts:Create(objs[3],TweenInfo.new(0.4),{C1 = CFrame.new(-0.970892727, 0.365644425, -3.30391622, 0.545084536, -0.836516321, 0.0558858961, -0.482962906, -0.258818835, 0.836516321, -0.685295284, -0.482962966, -0.545084476)}):Play()
			ts:Create(objs[2],TweenInfo.new(0.13),{C1 = CFrame.new(-1.83314121, 0.112866193, -1.15439999, 0.758022368, -0.558526218, -0.336824089, 0.157115281, -0.344846308, 0.925416529, -0.633021891, -0.75440675, -0.173648208)}):Play()
			wait(0.1)
			ts:Create(objs[2],TweenInfo.new(0.4),{C1 = CFrame.new(-1.83314121, 0.112866193, -0.954399943, 0.758022368, -0.558526218, -0.336824089, 0.157115281, -0.344846308, 0.925416529, -0.633021891, -0.75440675, -0.173648208)}):Play()
			ts:Create(objs[3],TweenInfo.new(0.5),{C1 = CFrame.new(-2.63354445, 0.365644455, -0.92290014, -0.0482801795, -0.826441228, 0.560948968, 0.376857162, 0.505025029, 0.776484549, -0.925012231, 0.248886406, 0.287067622)}):Play()
			wait(0.75)
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(-1.98033559, 0.365644455, -1.12859631, -0.281058222, -0.892398655, -0.353031129, -0.101086289, -0.338284373, 0.935598731, -0.954351902, 0.298644274, 0.00486823916)}):Play()
			wait(0.10)
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(-0.970892727, 0.365644425, -3.30391622, 0.545084536, -0.836516321, 0.0558858961, -0.482962906, -0.258818835, 0.836516321, -0.685295284, -0.482962966, -0.545084476)}):Play()
			wait(0.10)
			objs[6]:WaitForChild('MagIn'):Play()
			ts:Create(objs[3],TweenInfo.new(0.2),{C1 = CFrame.new(-0.570892751, 0.765644431, -2.10391617, 0.545084536, -0.836516321, 0.0558858961, -0.482962906, -0.258818835, 0.836516321, -0.685295284, -0.482962966, -0.545084476)}):Play()
			wait(0.10)
			ts:Create(objs[2],TweenInfo.new(0.13),{C1 = CFrame.new(-1.83314121, 0.112866186, -0.954399943, 0.758022368, -0.558526218, -0.336824089, 0.0448053852, -0.470608532, 0.881203771, -0.650687635, -0.683063805, -0.331706822)}):Play()
			ts:Create(objs[3],TweenInfo.new(0.13),{C1 = CFrame.new(-0.543338716, 0.753075361, -2.10391617, 0.491499543, -0.870869577, -0.00377259403, -0.594625771, -0.338752329, 0.729154944, -0.63627702, -0.356136084, -0.684338093)}):Play()
			wait(0.1)
			MagC:Destroy()
			objs[4].Transparency = 0
		end;

	-- Bolt Anim
		BoltBackAnim = function(char, speed, objs)
			TweenJoint(objs[2],  nil , CFrame.new(-0.674199283, -0.379443169, -1.24877262, 0.098731339, -0.973386228, -0.206811741, -0.90958333, -0.172570169, 0.377991527, -0.403621316, 0.150792867, -0.902414143), function(X) return math.sin(math.rad(X)) end, 0.25)
			wait(0.2)
			objs[5]:WaitForChild("BoltBack"):Play()
			TweenJoint(objs[2],  nil , CFrame.new(-0.674199283, -0.578711689, -0.798391461, 0.098731339, -0.973386228, -0.206811741, -0.90958333, -0.172570169, 0.377991527, -0.403621316, 0.150792867, -0.902414143), function(X) return math.sin(math.rad(X)) end, 0.25)
			TweenJoint(objs[1],  nil , CFrame.new(0, 0, 0.273770154, 1, 0, 0, 0, 1, 0, 0, 0, 1), function(X) return math.sin(math.rad(X)) end, 0.25)
			TweenJoint(objs[3],  nil , CFrame.new(-0.723402083, 0.311225414, -1.32277012, 0.98480773, 0.173648179, -2.07073381e-09, 0.0128111057, -0.0726553723, 0.997274816, 0.173174962, -0.982123971, -0.0737762004), function(X) return math.sin(math.rad(X)) end, 0.25)
			wait(0.2)
		end;
		
		BoltForwardAnim = function(char, speed, objs)
			TweenJoint(objs[1],  nil , CFrame.new(), function(X) return math.sin(math.rad(X)) end, 0.1)
			wait(0.1)	
		end;
		
		-- Bolting Back
		BoltingBackAnim = function(char, speed, objs)
			TweenJoint(objs[1],  nil , CFrame.new(0, 0, 0.273770154, 1, 0, 0, 0, 1, 0, 0, 0, 1), function(X) return math.sin(math.rad(X)) end, 0.1)
		end;
		
		BoltingForwardAnim = function(char, speed, objs)
			TweenJoint(objs[1],  nil , CFrame.new(), function(X) return math.sin(math.rad(X)) end, 0.1)
		end;
		
		InspectAnim = function(char, speed, objs)
			ts:Create(objs[1],TweenInfo.new(1),{C1 = CFrame.new(0.805950999, 0.654529691, -1.92835355, 0.999723792, 0.0109803826, 0.0207702816, -0.0223077796, 0.721017241, 0.692557871, -0.00737112388, -0.692829967, 0.721063137)}):Play()
			ts:Create(objs[2],TweenInfo.new(1),{C1 = CFrame.new(-1.49363565, -0.699174881, -1.32277012, 0.66716975, -8.8829113e-09, -0.74490571, 0.651565909, -0.484672248, 0.5835706, -0.361035138, -0.874695837, -0.323358655)}):Play()
			wait(1)
			ts:Create(objs[2],TweenInfo.new(1),{C1 = CFrame.new(1.37424219, -0.699174881, -1.03685927, -0.204235911, 0.62879771, 0.750267386, 0.65156585, -0.484672219, 0.58357054, 0.730581641, 0.60803473, -0.310715646)}):Play()
			wait(1)
			ts:Create(objs[2],TweenInfo.new(1),{C1 = CFrame.new(-0.902175903, 0.295501232, -1.32277012, 0.935064793, -0.354476899, 4.22709467e-09, -0.110443868, -0.291336805, 0.950223684, -0.336832345, -0.888520718, -0.311568588)}):Play()
			ts:Create(objs[1],TweenInfo.new(1),{C1 = CFrame.new(0.447846293, 0.654529572, -1.81345785, 0.761665463, -0.514432132, 0.393986136, -0.560285628, -0.217437655, 0.799250066, -0.325492471, -0.82950604, -0.453843832)}):Play()
			wait(1)
			local MagC = Tool:WaitForChild("Mag"):clone()
			MagC:FindFirstChild("Mag"):Destroy()
			MagC.Parent = Tool
			MagC.Name = "MagC"
			local MagCW = Instance.new("Motor6D")
			MagCW.Part0 = MagC
			MagCW.Part1 = workspace.CurrentCamera:WaitForChild("Arms"):WaitForChild("Left Arm")
			MagCW.Parent = MagC
			MagCW.C1 = MagC.CFrame:toObjectSpace(Tool:WaitForChild('Mag').CFrame)
			Tool.Mag.Transparency = 1
			Tool:WaitForChild('Grip'):WaitForChild("MagOut"):Play()
			
			ts:Create(objs[2],TweenInfo.new(0.15),{C1 = CFrame.new(-0.902175903, 0.295501232, -1.55972552, 0.935064793, -0.354476899, 4.22709467e-09, -0.110443868, -0.291336805, 0.950223684, -0.336832345, -0.888520718, -0.311568588)}):Play()
			ts:Create(objs[1],TweenInfo.new(0.3),{C1 = CFrame.new(0.447846293, 0.654529572, -2.9755671, 0.761665463, -0.514432132, 0.393986136, -0.568886042, -0.239798605, 0.786679745, -0.31021595, -0.823320091, -0.475299776)}):Play()
			wait(0.13)
			ts:Create(objs[2],TweenInfo.new(0.20),{C1 = CFrame.new(-0.902175903, 0.295501232, -1.28149843, 0.935064793, -0.354476899, 4.22709467e-09, -0.110443868, -0.291336805, 0.950223684, -0.336832345, -0.888520718, -0.311568588)}):Play()
			wait(0.20)			
			ts:Create(objs[1],TweenInfo.new(0.5),{C1 = CFrame.new(0.447846293, -0.650498748, -1.82401526, 0.761665463, -0.514432132, 0.393986136, -0.646156013, -0.55753684, 0.521185875, -0.0484529883, -0.651545882, -0.75706023)}):Play()
			wait(0.8)
			ts:Create(objs[1],TweenInfo.new(0.6),{C1 = CFrame.new(0.447846293, 0.654529572, -2.9755671, 0.761665463, -0.514432132, 0.393986136, -0.568886042, -0.239798605, 0.786679745, -0.31021595, -0.823320091, -0.475299776)}):Play()
			wait(0.5)
			Tool:WaitForChild('Grip'):WaitForChild("MagIn"):Play()
			ts:Create(objs[1],TweenInfo.new(0.3),{C1 = CFrame.new(0.447846293, 0.654529572, -1.81345785, 0.761665463, -0.514432132, 0.393986136, -0.560285628, -0.217437655, 0.799250066, -0.325492471, -0.82950604, -0.453843832)}):Play()			
			wait(0.3)
			MagC:Destroy()
			Tool.Mag.Transparency = 0
			wait(0.1)
		end;
		
		nadeReload = function(char, speed, objs)
			ts:Create(objs[1], TweenInfo.new(0.6), {C1 = CFrame.new(-0.902175903, -1.15645337, -1.32277012, 0.984807789, -0.163175702, -0.0593911409, 0, -0.342020363, 0.939692557, -0.17364797, -0.925416529, -0.336824328)}):Play()
			ts:Create(objs[2], TweenInfo.new(0.6), {C1 = CFrame.new(0.805950999, 0.654529691, -1.92835355, 0.787567914, -0.220087856, 0.575584888, -0.323594928, 0.647189975, 0.690240026, -0.524426222, -0.72986728, 0.438486755)}):Play()
			wait(0.6)
			ts:Create(objs[2], TweenInfo.new(0.6), {C1 = CFrame.new(0.805950999, 0.559619546, -1.73060048, 0.802135408, -0.348581612, 0.484839559, -0.597102284, -0.477574915, 0.644508123, 0.00688350201, -0.806481719, -0.59121877)}):Play()
			wait(0.6)		
		end;
		
		AttachAnim = function(char, speed, objs)
			TweenJoint(objs[1],  nil , CFrame.new(-2.05413628, -0.386312962, -0.955676377, 0.5, 0, -0.866025329, 0.852868497, -0.17364797, 0.492403895, -0.150383547, -0.984807789, -0.086823985), function(X) return math.sin(math.rad(X)) end, 0.25)
			TweenJoint(objs[2],  nil , CFrame.new(0.931334019, 1.66565645, -1.2231313, 0.787567914, -0.220087856, 0.575584888, -0.0180282295, 0.925416708, 0.378521889, -0.615963817, -0.308488399, 0.724860728), function(X) return math.sin(math.rad(X)) end, 0.25)
			wait(0.18)	
		end;
		
		-- Patrol Anim
		PatrolAnim = function(char, speed, objs)
			TweenJoint(objs[1],  nil , sConfig.PatrolPosR, function(X) return math.sin(math.rad(X)) end, 0.25)
			TweenJoint(objs[2],  nil , sConfig.PatrolPosL, function(X) return math.sin(math.rad(X)) end, 0.25)
			wait(0.18)
		end;
	
	}

return Settings
