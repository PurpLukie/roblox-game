
repeat
	wait()
until game.Players.LocalPlayer.Character
wait(0.5)

--// Variables
local L_1_ = script.Parent
local L_2_ = game.Players.LocalPlayer
local L_3_ = L_2_.Character
local L_4_ = L_2_:GetMouse()
local L_5_ = workspace.CurrentCamera

local L_6_ = L_3_:WaitForChild('Torso')
local L_7_ = L_3_:WaitForChild('Head')
local L_8_ = L_3_:WaitForChild('HumanoidRootPart')
local L_9_ = L_8_:WaitForChild('RootJoint')
local L_10_ = L_6_:WaitForChild('Right Hip')
local L_11_ = L_6_:WaitForChild('Left Hip')

--// Services
local L_12_ = game:GetService('UserInputService')
local L_13_ = game:GetService('RunService')
local L_14_ = game:GetService('TweenService')

--// Declarables
local L_15_ = false

local L_16_ = false
local L_17_ = true

local L_18_ = L_1_:WaitForChild('Resource')
local L_19_ = L_18_:WaitForChild('FX')
local L_20_ = L_18_:WaitForChild('Events')
local L_21_ = L_18_:WaitForChild('HUD')
local L_22_ = L_18_:WaitForChild('Modules')
local L_23_ = L_18_:WaitForChild('SettingsModule')
local L_24_ = require(L_23_:WaitForChild("ClientConfig"))
local L_25_ = L_18_:WaitForChild('Vars')

local L_26_
local L_27_
local L_28_
local L_29_
local L_30_
local L_31_
local L_32_
local L_33_
local L_34_
local L_35_
local L_36_
local L_37_
local L_38_
local L_39_
local L_40_
local L_41_

local L_42_

local L_43_
local L_44_
local L_45_
local L_46_
local L_47_
local L_48_
local L_49_

local L_50_ = L_24_.AimZoom

local L_51_ = L_24_.MouseSensitivity
local L_52_ = L_12_.MouseDeltaSensitivity

local L_53_ = game.ReplicatedStorage:FindFirstChild('SoundIso_Network') or nil
local L_54_
if L_53_ then
	L_54_ = L_53_:WaitForChild('EventConnection')
end

local L_55_ = CFrame.Angles(0, 0, 0)

--// Weapon Parts
local L_56_ = L_1_:WaitForChild('AimPart')
local L_57_
local L_58_ = L_1_:WaitForChild('Grip')
local L_59_ = L_1_:WaitForChild('FirePart')
local L_60_
local L_61_ = L_1_:WaitForChild('Mag')
local L_62_ = L_1_:WaitForChild('Bolt')

--// Probability
local L_63_

--// States
local L_64_ = false
local L_65_ = false
local L_66_ = false
local L_67_ = false
local L_68_ = false
local L_69_ = true
local L_70_ = false
local L_71_ = false
local L_72_ = false
local L_73_ = false
local L_74_ = false
local L_75_ = false
local L_76_ = false
local L_77_ = false
local L_78_ = false
local L_79_ = false

local L_80_ = false
local L_81_ = false
local L_82_ = false

local L_83_ = false
local L_84_ = true
local L_85_ = true

local L_86_ = false

local L_87_
local L_88_

local L_89_
local L_90_
local L_91_

local L_92_ = L_24_.FireMode

local L_93_ = 0
local L_94_ = false
local L_95_ = true
local L_96_ = false

local L_97_ = 70

--// Tables
local L_98_ = {

	"285421759";
	"151130102";
	"151130171";
	"285421804";
	"287769483";
	"287769415";
	"285421687";
	"287769261";
	"287772525";
	"287772445";
	"287772351";
	"285421819";
	"287772163";

}

local L_99_ = {

	"2282590559";
	"2282583154";
	"2282584222";
	"2282584708";
	"2282585118";
	"2282586860";
	"2282587182";
	"2282587628";
	"2282588117";
	"2282588433";
	"2282576973";
	"2282577954";
	"2282578595";
	"2282579272";
	"2282579760";
	"2282580279";
	"2282580551";
	"2282580935";
	"2282582377";
	"2282582717";
	"2282449653";

}

local L_100_ = {

	"2297264589";
	"2297264920";
	"2297265171";
	"2297265394";
	"2297266410";
	"2297266774";
	"2297267106";
	"2297267463";
	"2297267748";
	"2297268261";
	"2297268486";
	"2297268707";
	"2297268894";
	"2297269092";
	"2297269542";
	"2297269946";
	"2297270243";
	"2297270591";
	"2297270984";
	"2297271381";
	"2297271626";
	"2297272112";
	"2297272424";

}

local L_101_ = workspace:FindFirstChild("BulletModel: " .. L_2_.Name) or Instance.new("Folder", workspace)
L_101_.Name = "BulletModel: " .. L_2_.Name

local L_102_

local L_103_ = L_24_.Ammo
local L_104_ = L_24_.StoredAmmo * L_24_.MagCount

local L_105_ = L_24_.ExplosiveAmmo

IgnoreList = {
	L_3_,
	L_101_,
	L_5_
}

--// Services
local L_106_ = game:GetService('RunService').RenderStepped
local L_107_ = game:GetService('UserInputService')

--// Events
local L_108_ = L_20_:WaitForChild('Equipped')
local L_109_ = L_20_:WaitForChild('ShootEvent')
local L_110_ = L_20_:WaitForChild('DamageEvent')
local L_111_ = L_20_:WaitForChild('CreateOwner')
local L_112_ = L_20_:WaitForChild('Stance')
local L_113_ = L_20_:WaitForChild('HitEvent')
local L_114_ = L_20_:WaitForChild('KillEvent')
local L_115_ = L_20_:WaitForChild('AimEvent')
local L_116_ = L_20_:WaitForChild('ExploEvent')
local L_117_ = L_20_:WaitForChild('AttachEvent')
local L_118_ = L_20_:WaitForChild('ServerFXEvent')
local L_119_ = L_20_:WaitForChild('ChangeIDEvent')

--// Modules
local L_120_ = require(L_22_:WaitForChild("Utilities"))
local L_121_ = require(L_22_:WaitForChild("Spring"))
local L_122_ = require(L_22_:WaitForChild("Plugins"))
local L_123_ = require(L_22_:WaitForChild("easing"))

local L_124_ = L_120_.Fade
local L_125_ = L_120_.SpawnCam
local L_126_ = L_120_.FixCam
local L_127_ = L_120_.tweenFoV
local L_128_ = L_120_.tweenCam
local L_129_ = L_120_.tweenRoll
local L_130_ = L_120_.TweenJoint

local L_131_ = L_120_.Weld

--// Math
local L_132_ = function(L_169_arg1, L_170_arg2, L_171_arg3)
	if L_169_arg1 > L_171_arg3 then
		return L_171_arg3
	elseif L_169_arg1 < L_170_arg2 then
		return L_170_arg2
	end
	return L_169_arg1
end

local L_133_ = L_121_.new(Vector3.new())
L_133_.s = 30
L_133_.d = 0.55

local L_134_ = CFrame.Angles(0, 0, 0)

--// Functions
function MakeFakeArms()
	Arms = Instance.new("Model")
	Arms.Name = "Arms"
	Arms.Parent = L_5_

	local L_172_ = Instance.new("Humanoid")
	L_172_.MaxHealth = 0
	L_172_.Health = 0
	L_172_.Name = ""
	L_172_.Parent = Arms

	if L_3_:FindFirstChild("Shirt") then
		local L_177_ = L_3_:FindFirstChild("Shirt"):clone()
		L_177_.Parent = Arms
	end

	local L_173_ = L_3_:FindFirstChild("Right Arm"):clone()
	for L_178_forvar1, L_179_forvar2 in pairs(L_173_:GetChildren()) do
		if L_179_forvar2:IsA('Motor6D') then
			L_179_forvar2:Destroy()
		end
	end
	L_173_.Name = "Right Arm"
	L_173_.FormFactor = "Custom"
	L_173_.Size = Vector3.new(0.8, 2.5, 0.8)
	L_173_.Transparency = 0.0

	local L_174_ = Instance.new("Motor6D")
	L_174_.Part0 = L_173_
	L_174_.Part1 = L_3_:FindFirstChild("Right Arm")
	L_174_.C0 = CFrame.new()
	L_174_.C1 = CFrame.new()
	L_174_.Parent = L_173_	
	L_173_.Parent = Arms

	local L_175_ = L_3_:FindFirstChild("Left Arm"):clone()
	L_175_.Name = "Left Arm"
	L_175_.FormFactor = "Custom"
	L_175_.Size = Vector3.new(0.8, 2.5, 0.8)
	L_175_.Transparency = 0.0	

	local L_176_ = Instance.new("Motor6D")
	L_176_.Part0 = L_175_
	L_176_.Part1 = L_3_:FindFirstChild("Left Arm")
	L_176_.C0 = CFrame.new()
	L_176_.C1 = CFrame.new()
	L_176_.Parent = L_175_	
	L_175_.Parent = Arms
end

function RemoveArmModel()
	if Arms then
		Arms:Destroy()
		Arms = nil
	end
end

local L_135_

function CreateShell()
	L_135_ = time()
	local L_180_ = L_1_.Shell:clone()
	if L_180_:FindFirstChild('Shell') then
		L_180_.Shell:Destroy()
	end
	L_180_.CFrame =  L_1_.Chamber.CFrame
	L_180_.Velocity = L_1_.Chamber.CFrame.lookVector * 30 + Vector3.new(0, 4, 0)
	--shell.RotVelocity = Vector3.new(-10,40,30)
	L_180_.Parent = L_101_
	L_180_.CanCollide = false
	game:GetService("Debris"):addItem(L_180_, 1)
	delay(0.5, function()
		if L_19_:FindFirstChild('ShellCasing') then
			local L_181_ = L_19_.ShellCasing:clone()
			L_181_.Parent = L_2_.PlayerGui
			L_181_:Play()
			game:GetService('Debris'):AddItem(L_181_, L_181_.TimeLength)
		end
	end)
end

-- 100 == 1  0 == 0  1/0.5

function JamCalculation()
	local L_182_
	if (math.random(1, 100) <= L_24_.JamChance) then	
		L_182_ = true
		L_75_ = true
	else
		L_182_ = false
	end
	return L_182_
end

function TracerCalculation()
	local L_183_
	if (math.random(1, 100) <= L_24_.TracerChance) then	
		L_183_ = true
	else
		L_183_ = false
	end
	return L_183_
end

function ScreamCalculation()
	local L_184_
	if (math.random(1, 100) <= L_24_.SuppressCalloutChance) then	
		L_184_ = true
	else
		L_184_ = false
	end
	return L_184_
end

function SearchResupply(L_185_arg1)
	local L_186_ = false
	local L_187_ = nil

	if L_185_arg1:FindFirstChild('ResupplyVal') or L_185_arg1.Parent:FindFirstChild('ResupplyVal') then
		L_186_ = true
		if L_185_arg1:FindFirstChild('ResupplyVal') then
			L_187_ = L_185_arg1.ResupplyVal
		elseif L_185_arg1.Parent:FindFirstChild('ResupplyVal') then
			L_187_ = L_185_arg1.Parent.ResupplyVal
		end
	end
	return L_186_, L_187_
end

function CheckReverb()
	local L_188_, L_189_ = workspace:FindPartOnRayWithIgnoreList(Ray.new(L_6_.CFrame.p, (L_6_.CFrame.upVector).unit * 30), IgnoreList);

	if L_188_ then
		local L_190_ = L_59_:WaitForChild('Fire'):FindFirstChild('ReverbSoundEffect') or Instance.new("ReverbSoundEffect", L_59_:WaitForChild('Fire'))
	elseif not L_188_ then
		if L_59_:WaitForChild('Fire'):FindFirstChild('ReverbSoundEffect') then
			L_59_.Fire.ReverbSoundEffect:Destroy()
		end
	end
end

function UpdateAmmo()
	L_29_.Text = L_103_
	L_30_.Text = L_29_.Text

	L_31_.Text = '| ' .. math.ceil(L_104_ / L_24_.StoredAmmo)
	L_32_.Text = L_31_.Text

	if L_93_ == 0 then
		L_40_.Image = 'rbxassetid://' .. 1868007495
	elseif L_93_ == 1 then
		L_40_.Image = 'rbxassetid://' .. 1868007947
	elseif L_93_ == 2 then
		L_40_.Image = 'rbxassetid://' .. 1868008584
	end

	if L_92_ == 1 then
		L_35_.BackgroundTransparency = 0
		L_36_.BackgroundTransparency = 0.7
		L_37_.BackgroundTransparency = 0.7
		L_38_.BackgroundTransparency = 0.7
		L_39_.BackgroundTransparency = 0.7
	elseif L_92_ == 2 then
		L_35_.BackgroundTransparency = 0
		L_36_.BackgroundTransparency = 0
		L_37_.BackgroundTransparency = 0
		L_38_.BackgroundTransparency = 0
		L_39_.BackgroundTransparency = 0
	elseif L_92_ == 3 then
		L_35_.BackgroundTransparency = 0
		L_36_.BackgroundTransparency = 0
		L_37_.BackgroundTransparency = 0
		L_38_.BackgroundTransparency = 0.7
		L_39_.BackgroundTransparency = 0.7
	elseif L_92_ == 4 then
		L_35_.BackgroundTransparency = 0
		L_36_.BackgroundTransparency = 0
		L_37_.BackgroundTransparency = 0
		L_38_.BackgroundTransparency = 0
		L_39_.BackgroundTransparency = 0.7
	elseif L_92_ == 5 then
		L_35_.BackgroundTransparency = 0
		L_36_.BackgroundTransparency = 0.7
		L_37_.BackgroundTransparency = 0
		L_38_.BackgroundTransparency = 0.7
		L_39_.BackgroundTransparency = 0.7
	elseif L_92_ == 6 then
		L_35_.BackgroundTransparency = 0
		L_36_.BackgroundTransparency = 0.7
		L_37_.BackgroundTransparency = 0
		L_38_.BackgroundTransparency = 0
		L_39_.BackgroundTransparency = 0.7
	end

end

--// Connections
L_108_.OnClientEvent:connect(function(L_191_arg1, L_192_arg2, L_193_arg3, L_194_arg4, L_195_arg5, L_196_arg6, L_197_arg7)
	if L_191_arg1 and not L_15_ then
		MakeFakeArms()

		L_42_ = L_2_.PlayerGui.MainGui
		L_26_ = L_42_:WaitForChild('Others')
		L_27_ = L_26_:WaitForChild('Kill')
		L_28_ = L_42_:WaitForChild('GameGui'):WaitForChild('AmmoFrame')
		L_29_ = L_28_:WaitForChild('Ammo')
		L_30_ = L_28_:WaitForChild('AmmoBackground')
		L_31_ = L_28_:WaitForChild('MagCount')
		L_32_ = L_28_:WaitForChild('MagCountBackground')
		L_33_ = L_28_:WaitForChild('DistDisp')
		L_34_ = L_28_:WaitForChild('Title')
		L_35_ = L_28_:WaitForChild('Mode1')
		L_36_ = L_28_:WaitForChild('Mode2')
		L_37_ = L_28_:WaitForChild('Mode3')
		L_38_ = L_28_:WaitForChild('Mode4')
		L_39_ = L_28_:WaitForChild('Mode5')
		L_40_ = L_28_:WaitForChild('Stances')
		L_41_ = L_42_:WaitForChild('Shading')
		L_41_.Visible = false

		L_34_.Text = L_1_.Name
		UpdateAmmo()

		L_43_ = L_192_arg2
		L_44_ = L_193_arg3
		L_45_ = L_194_arg4
		L_46_ = L_195_arg5
		L_47_ = L_196_arg6
		L_48_ = L_197_arg7	
		L_49_ = L_62_.Bolt

		L_87_ = L_48_.C1
		L_88_ = L_48_.C0

		if L_1_:FindFirstChild('AimPart2') then
			L_57_ = L_1_:WaitForChild('AimPart2')
		end

		if L_1_:FindFirstChild('FirePart2') then
			L_60_ = L_1_.FirePart2
		end

		if L_24_.FirstPersonOnly then
			L_2_.CameraMode = Enum.CameraMode.LockFirstPerson
		end
		--uis.MouseIconEnabled = false
		L_5_.FieldOfView = 70
		L_15_ = true
	elseif L_15_ then
		if L_3_ and L_3_.Humanoid and L_3_.Humanoid.Health > 0 and L_9_ then
			Stand()
			Unlean()
		end	

		L_93_ = 0
		L_80_ = false
		L_81_ = false
		L_82_ = false
		L_64_ = false
		L_67_ = false
		L_66_ = false
		Shooting = false

		L_97_ = 70

		RemoveArmModel()

		L_42_:Destroy()	

		for L_198_forvar1, L_199_forvar2 in pairs(IgnoreList) do
			if L_199_forvar2 ~= L_3_ and L_199_forvar2 ~= L_5_ and L_199_forvar2 ~= L_101_ then
				table.remove(IgnoreList, L_198_forvar1)
			end
		end

		if L_3_:FindFirstChild('Right Arm') and L_3_:FindFirstChild('Left Arm') then
			L_3_['Right Arm'].LocalTransparencyModifier = 0
			L_3_['Left Arm'].LocalTransparencyModifier = 0
		end	

		L_78_ = false
		L_69_ = true

		L_2_.CameraMode = Enum.CameraMode.Classic
		L_107_.MouseIconEnabled = true		
		L_5_.FieldOfView = 70
		L_15_ = false
		L_107_.MouseDeltaSensitivity = L_52_
		L_4_.Icon = ""
		L_15_ = false
		L_4_.TargetFilter = nil
	end
end)

--// Firemode Functions
function CreateBullet(L_200_arg1)
	local L_201_ = L_59_.Position
	local L_202_ = (L_4_.Hit.p - L_201_).unit
	local L_203_ = CFrame.Angles(math.rad(math.random(-L_200_arg1, L_200_arg1)), math.rad(math.random(-L_200_arg1, L_200_arg1)), math.rad(math.random(-L_200_arg1, L_200_arg1)))
	L_202_ = L_203_ * L_202_	
	local L_204_ = CFrame.new(L_201_, L_201_ + L_202_)	

	local L_205_ = Instance.new("Part", L_101_)
	game.Debris:AddItem(L_205_, 10)
	L_205_.Shape = Enum.PartType.Ball
	L_205_.Size = Vector3.new(1, 1, 12)
	L_205_.Name = "Bullet"
	L_205_.TopSurface = "Smooth"
	L_205_.BottomSurface = "Smooth"
	L_205_.BrickColor = BrickColor.new("Bright green")
	L_205_.Material = "Neon"
	L_205_.CanCollide = false
	--Bullet.CFrame = FirePart.CFrame + (Grip.CFrame.p - Grip.CFrame.p)
	L_205_.CFrame = L_204_

	local L_206_ = Instance.new("Sound")
	L_206_.SoundId = "rbxassetid://341519743"
	L_206_.Looped = true
	L_206_:Play()
	L_206_.Parent = L_205_
	L_206_.Volume = 0.4
	L_206_.MaxDistance = 30

	L_205_.Transparency = 1
	local L_207_ = L_205_:GetMass()
	local L_208_ = Instance.new('BodyForce', L_205_)

	if not L_83_ then
		L_208_.Force = L_24_.BulletPhysics
		L_205_.Velocity = L_202_ * L_24_.BulletSpeed
	else
		L_208_.Force = L_24_.ExploPhysics
		L_205_.Velocity = L_202_ * L_24_.ExploSpeed
	end

	local L_209_ = Instance.new('Attachment', L_205_)
	L_209_.Position = Vector3.new(0.1, 0, 0)
	local L_210_ = Instance.new('Attachment', L_205_)
	L_210_.Position = Vector3.new(-0.1, 0, 0)

	local L_211_ = TracerCalculation()

	if L_24_.TracerEnabled == true and L_211_ then
		local L_212_ = Instance.new('Trail', L_205_)
		L_212_.Attachment0 = L_209_
		L_212_.Attachment1 = L_210_
		L_212_.Transparency = NumberSequence.new(L_24_.TracerTransparency)
		L_212_.LightEmission = L_24_.TracerLightEmission
		L_212_.TextureLength = L_24_.TracerTextureLength
		L_212_.Lifetime = L_24_.TracerLifetime
		L_212_.FaceCamera = L_24_.TracerFaceCamera
		L_212_.Color = ColorSequence.new(L_24_.TracerColor.Color)
	end

	if L_1_:FindFirstChild('Shell') and not L_83_ then	
		CreateShell()	
	end	

	delay(0.2, function()
		L_205_.Transparency = 0
	end)

	return L_205_
end

function CheckForHumanoid(L_213_arg1)
	local L_214_ = false
	local L_215_ = nil
	if L_213_arg1 then
		if (L_213_arg1.Parent:FindFirstChild("Humanoid") or L_213_arg1.Parent.Parent:FindFirstChild("Humanoid")) then
			L_214_ = true
			if L_213_arg1.Parent:FindFirstChild('Humanoid') then
				L_215_ = L_213_arg1.Parent.Humanoid
			elseif L_213_arg1.Parent.Parent:FindFirstChild('Humanoid') then
				L_215_ = L_213_arg1.Parent.Parent.Humanoid
			end
		else
			L_214_ = false
		end	
	end
	return L_214_, L_215_
end

function CastRay(L_216_arg1)
	local L_217_, L_218_, L_219_
	local L_220_ = L_56_.Position;
	local L_221_ = L_216_arg1.Position;
	local L_222_ = 0

	local L_223_ = L_83_	

	while true do
		L_106_:wait()
		L_221_ = L_216_arg1.Position;
		L_222_ = L_222_ + (L_221_ - L_220_).magnitude
		L_217_, L_218_, L_219_ = workspace:FindPartOnRayWithIgnoreList(Ray.new(L_220_, (L_221_ - L_220_)), IgnoreList);
		local L_224_ = Vector3.new(0, 1, 0):Cross(L_219_)
		local L_225_ = math.asin(L_224_.magnitude) -- division by 1 is redundant
		if L_222_ > L_24_.BulletDecay then
			L_216_arg1:Destroy()
			break
		end
		if L_217_ and (L_217_ and L_217_.Transparency >= 1 or L_217_.CanCollide == false) and L_217_.Name ~= 'Right Arm' and L_217_.Name ~= 'Left Arm' and L_217_.Name ~= 'Right Leg' and L_217_.Name ~= 'Left Leg' and L_217_.Name ~= 'Armor' then
			table.insert(IgnoreList, L_217_)
		end

		if L_217_ then
			L_224_ = Vector3.new(0, 1, 0):Cross(L_219_)
			L_225_ = math.asin(L_224_.magnitude) -- division by 1 is redundant

			L_118_:FireServer(L_218_)

			local L_226_ = CheckForHumanoid(L_217_)
			if L_226_ == false then
				L_216_arg1:Destroy()
				local L_227_ = L_113_:InvokeServer(L_218_, L_224_, L_225_, L_219_, "Part", L_217_)
			elseif L_226_ == true then
				L_216_arg1:Destroy()
				local L_228_ = L_113_:InvokeServer(L_218_, L_224_, L_225_, L_219_, "Human", L_217_)
			end
		end

		if L_217_ and L_223_ then
			L_116_:FireServer(L_218_)
		end

		if L_217_ then
			local L_229_, L_230_ = CheckForHumanoid(L_217_)
			if L_229_ then
				L_111_:FireServer(L_230_)
				if L_24_.AntiTK then
					if game.Players:FindFirstChild(L_230_.Parent.Name) and game.Players:FindFirstChild(L_230_.Parent.Name).TeamColor ~= L_2_.TeamColor or L_230_.Parent:FindFirstChild('Vars') and game.Players:FindFirstChild(L_230_.Parent:WaitForChild('Vars'):WaitForChild('BotID').Value) and L_2_.TeamColor ~= L_230_.Parent:WaitForChild('Vars'):WaitForChild('teamColor').Value then
						if L_217_.Name == 'Head' then
							L_110_:FireServer(L_230_, L_24_.HeadDamage)
							local L_231_ = L_19_:WaitForChild('BodyHit'):clone()
							L_231_.Parent = L_2_.PlayerGui
							L_231_:Play()
							game:GetService("Debris"):addItem(L_231_, L_231_.TimeLength)
						end
						if L_217_.Name ~= 'Head' and not (L_217_.Parent:IsA('Accessory') or L_217_.Parent:IsA('Hat')) then
							if L_217_.Name ~= 'Torso' and L_217_.Name ~= 'HumanoidRootPart' and L_217_.Name ~= 'Armor' then
								L_110_:FireServer(L_230_, L_24_.LimbDamage)
							elseif L_217_.Name == 'Torso' or L_217_.Name == 'HumanoidRootPart' and L_217_.Name ~= 'Armor'  then
								L_110_:FireServer(L_230_, L_24_.BaseDamage)
							elseif L_217_.Name == 'Armor' then
								L_110_:FireServer(L_230_, L_24_.ArmorDamage)
							end
							local L_232_ = L_19_:WaitForChild('BodyHit'):clone()
							L_232_.Parent = L_2_.PlayerGui
							L_232_:Play()
							game:GetService("Debris"):addItem(L_232_, L_232_.TimeLength)
						end
						if (L_217_.Parent:IsA('Accessory') or L_217_.Parent:IsA('Hat')) then
							L_110_:FireServer(L_230_, L_24_.HeadDamage)
							local L_233_ = L_19_:WaitForChild('BodyHit'):clone()
							L_233_.Parent = L_2_.PlayerGui
							L_233_:Play()
							game:GetService("Debris"):addItem(L_233_, L_233_.TimeLength)
						end
					end
				else
					if L_217_.Name == 'Head' then
						L_110_:FireServer(L_230_, L_24_.HeadDamage)
						local L_234_ = L_19_:WaitForChild('BodyHit'):clone()
						L_234_.Parent = L_2_.PlayerGui
						L_234_:Play()
						game:GetService("Debris"):addItem(L_234_, L_234_.TimeLength)
					end
					if L_217_.Name ~= 'Head' and not (L_217_.Parent:IsA('Accessory') or L_217_.Parent:IsA('Hat')) then
						if L_217_.Name ~= 'Torso' and L_217_.Name ~= 'HumanoidRootPart' and L_217_.Name ~= 'Armor' then
							L_110_:FireServer(L_230_, L_24_.LimbDamage)
						elseif L_217_.Name == 'Torso' or L_217_.Name == 'HumanoidRootPart' and L_217_.Name ~= 'Armor' then
							L_110_:FireServer(L_230_, L_24_.BaseDamage)
						elseif L_217_.Name == 'Armor' then
							L_110_:FireServer(L_230_, L_24_.ArmorDamage)
						end
						local L_235_ = L_19_:WaitForChild('BodyHit'):clone()
						L_235_.Parent = L_2_.PlayerGui
						L_235_:Play()
						game:GetService("Debris"):addItem(L_235_, L_235_.TimeLength)
					end
					if (L_217_.Parent:IsA('Accessory') or L_217_.Parent:IsA('Hat')) then
						L_110_:FireServer(L_230_, L_24_.HeadDamage)
						local L_236_ = L_19_:WaitForChild('BodyHit'):clone()
						L_236_.Parent = L_2_.PlayerGui
						L_236_:Play()
						game:GetService("Debris"):addItem(L_236_, L_236_.TimeLength)
					end
				end	
			end
		end

		if L_217_ and L_217_.Parent:FindFirstChild("Humanoid") then
			return L_217_, L_218_;
		end
		L_220_ = L_221_;
	end
end

function fireSemi()
	if L_15_ then
		L_69_ = false
		Recoiling = true
		Shooting = true

		--CheckReverb()
		if L_54_ then
			L_54_:FireServer(L_59_:WaitForChild('Fire').SoundId, L_59_)
		else
			L_59_:WaitForChild('Fire'):Play()	
		end
		L_109_:FireServer()
		L_102_ = CreateBullet(L_24_.BulletSpread)
		L_103_ = L_103_ - 1
		UpdateAmmo()
		RecoilFront = true
		local L_237_, L_238_ = spawn(function()
			CastRay(L_102_)
		end)

		if L_24_.CanBolt == true then
			BoltingBackAnim()
			delay(L_24_.Firerate / 2, function()
				if L_24_.CanSlideLock == false then
					BoltingForwardAnim()
				elseif L_24_.CanSlideLock == true then
					if L_103_ > 0 then
						BoltingForwardAnim()
					end
				end
			end)
		end

		delay(L_24_.Firerate / 2, function()
			Recoiling = false
			RecoilFront = false
		end)		

		wait(L_24_.Firerate)

		local L_239_ = JamCalculation()
		if L_239_ then
			L_69_ = false
		else
			L_69_ = true
		end
		Shooting = false
	end
end

function fireExplo()
	if L_15_ then
		L_69_ = false
		Recoiling = true
		Shooting = true
		if L_54_ then
			L_54_:FireServer(L_60_:WaitForChild('Fire').SoundId, L_60_)
		else
			L_60_:WaitForChild('Fire'):Play()	
		end
		L_109_:FireServer()
		L_102_ = CreateBullet(L_24_.BulletSpread)
		L_105_ = L_105_ - 1
		UpdateAmmo()
		RecoilFront = true
		local L_240_, L_241_ = spawn(function()
			CastRay(L_102_)
		end)

		delay(L_24_.Firerate / 2, function()
			Recoiling = false
			RecoilFront = false
		end)		

		L_69_ = false
		Shooting = false
	end
end

function fireShot()
	if L_15_ then
		L_69_ = false
		Recoiling = true
		Shooting = true
		RecoilFront = true
		--CheckReverb()
		if L_54_ then
			L_54_:FireServer(L_59_:WaitForChild('Fire').SoundId, L_59_)
		else
			L_59_:WaitForChild('Fire'):Play()	
		end
		L_109_:FireServer()
		for L_243_forvar1 = 1, L_24_.ShotNum do
			spawn(function()
				L_102_ = CreateBullet(L_24_.BulletSpread)
			end)
			local L_244_, L_245_ = spawn(function()
				CastRay(L_102_)
			end)
		end

		for L_246_forvar1, L_247_forvar2 in pairs(L_59_:GetChildren()) do
			if L_247_forvar2.Name:sub(1, 7) == "FlashFX" then
				L_247_forvar2.Enabled = true
			end
		end

		delay(1 / 30, function()
			for L_248_forvar1, L_249_forvar2 in pairs(L_59_:GetChildren()) do
				if L_249_forvar2.Name:sub(1, 7) == "FlashFX" then
					L_249_forvar2.Enabled = false
				end
			end
		end)

		if L_24_.CanBolt == true then
			BoltingBackAnim()
			delay(L_24_.Firerate / 2, function()
				if L_24_.CanSlideLock == false then
					BoltingForwardAnim()
				elseif L_24_.CanSlideLock == true then
					if L_103_ > 0 then
						BoltingForwardAnim()
					end
				end
			end)
		end

		delay(L_24_.Firerate / 2, function()
			Recoiling = false
			RecoilFront = false
		end)
		L_103_ = L_103_ - 1
		UpdateAmmo()
		wait(L_24_.Firerate)

		L_76_ = true
		BoltBackAnim()
		BoltForwardAnim()
		IdleAnim()
		L_76_ = false

		local L_242_ = JamCalculation()
		if L_242_ then
			L_69_ = false
		else
			L_69_ = true
		end

		Shooting = false
	end
end

function fireBoltAction()
	if L_15_ then
		L_69_ = false
		Recoiling = true
		Shooting = true
		--CheckReverb()
		if L_54_ then
			L_54_:FireServer(L_59_:WaitForChild('Fire').SoundId, L_59_)
		else
			L_59_:WaitForChild('Fire'):Play()	
		end
		L_109_:FireServer()
		L_102_ = CreateBullet(L_24_.BulletSpread)
		L_103_ = L_103_ - 1
		UpdateAmmo()
		RecoilFront = true
		local L_250_, L_251_ = spawn(function()
			CastRay(L_102_)
		end)

		for L_253_forvar1, L_254_forvar2 in pairs(L_59_:GetChildren()) do
			if L_254_forvar2.Name:sub(1, 7) == "FlashFX" then
				L_254_forvar2.Enabled = true
			end
		end

		delay(1 / 30, function()
			for L_255_forvar1, L_256_forvar2 in pairs(L_59_:GetChildren()) do
				if L_256_forvar2.Name:sub(1, 7) == "FlashFX" then
					L_256_forvar2.Enabled = false
				end
			end
		end)

		if L_24_.CanBolt == true then
			BoltingBackAnim()
			delay(L_24_.Firerate / 2, function()
				if L_24_.CanSlideLock == false then
					BoltingForwardAnim()
				elseif L_24_.CanSlideLock == true then
					if L_103_ > 0 then
						BoltingForwardAnim()
					end
				end
			end)
		end

		delay(L_24_.Firerate / 2, function()
			Recoiling = false
			RecoilFront = false
		end)
		wait(L_24_.Firerate)

		L_76_ = true
		BoltBackAnim()
		BoltForwardAnim()
		IdleAnim()
		L_76_ = false

		local L_252_ = JamCalculation()
		if L_252_ then
			L_69_ = false
		else
			L_69_ = true
		end		

		Shooting = false
	end
end

function fireAuto()
	while not Shooting and L_103_ > 0 and L_68_ and L_69_ and L_15_ do
		L_69_ = false
		Recoiling = true
		--CheckReverb()
		if L_54_ then
			L_54_:FireServer(L_59_:WaitForChild('Fire').SoundId, L_59_)
		else
			L_59_:WaitForChild('Fire'):Play()	
		end
		L_109_:FireServer()
		L_103_ = L_103_ - 1
		UpdateAmmo()
		Shooting = true
		RecoilFront = true
		L_102_ = CreateBullet(L_24_.BulletSpread)
		local L_257_, L_258_ = spawn(function()
			CastRay(L_102_)
		end)

		for L_260_forvar1, L_261_forvar2 in pairs(L_59_:GetChildren()) do
			if L_261_forvar2.Name:sub(1, 7) == "FlashFX" then
				L_261_forvar2.Enabled = true
			end
		end

		delay(1 / 30, function()
			for L_262_forvar1, L_263_forvar2 in pairs(L_59_:GetChildren()) do
				if L_263_forvar2.Name:sub(1, 7) == "FlashFX" then
					L_263_forvar2.Enabled = false
				end
			end
		end)

		if L_24_.CanBolt == true then
			BoltingBackAnim()
			delay(L_24_.Firerate / 2, function()
				if L_24_.CanSlideLock == false then
					BoltingForwardAnim()
				elseif L_24_.CanSlideLock == true then
					if L_103_ > 0 then
						BoltingForwardAnim()
					end
				end
			end)
		end


		delay(L_24_.Firerate / 2, function()
			Recoiling = false
			RecoilFront = false
		end)
		wait(L_24_.Firerate)

		local L_259_ = JamCalculation()
		if L_259_ then
			L_69_ = false
		else
			L_69_ = true
		end

		Shooting = false
	end
end

function fireBurst()
	if not Shooting and L_103_ > 0 and L_68_ and L_15_ then
		for L_264_forvar1 = 1, L_24_.BurstNum do
			if L_103_ > 0 and L_68_ then
				L_69_ = false
				Recoiling = true
				--CheckReverb()
				if L_54_ then
					L_54_:FireServer(L_59_:WaitForChild('Fire').SoundId, L_59_)
				else
					L_59_:WaitForChild('Fire'):Play()	
				end
				L_109_:FireServer()
				L_102_ = CreateBullet(L_24_.BulletSpread)
				local L_265_, L_266_ = spawn(function()
					CastRay(L_102_)
				end)

				for L_268_forvar1, L_269_forvar2 in pairs(L_59_:GetChildren()) do
					if L_269_forvar2.Name:sub(1, 7) == "FlashFX" then
						L_269_forvar2.Enabled = true
					end
				end

				delay(1 / 30, function()
					for L_270_forvar1, L_271_forvar2 in pairs(L_59_:GetChildren()) do
						if L_271_forvar2.Name:sub(1, 7) == "FlashFX" then
							L_271_forvar2.Enabled = false
						end
					end
				end)

				if L_24_.CanBolt == true then
					BoltingBackAnim()
					delay(L_24_.Firerate / 2, function()
						if L_24_.CanSlideLock == false then
							BoltingForwardAnim()
						elseif L_24_.CanSlideLock == true then
							if L_103_ > 0 then
								BoltingForwardAnim()
							end
						end
					end)
				end

				L_103_ = L_103_ - 1
				UpdateAmmo()
				RecoilFront = true
				delay(L_24_.Firerate / 2, function()
					Recoiling = false
					RecoilFront = false
				end)
				wait(L_24_.Firerate)

				local L_267_ = JamCalculation()
				if L_267_ then
					L_69_ = false
				else
					L_69_ = true
				end

			end
			Shooting = true
		end
		Shooting = false
	end
end

function Shoot()
	if L_15_ and L_69_ then
		if L_92_ == 1 then
			fireSemi()
		elseif L_92_ == 2 then
			fireAuto()
		elseif L_92_ == 3 then
			fireBurst()	
		elseif L_92_ == 4 then
			fireBoltAction()
		elseif L_92_ == 5 then
			fireShot()
		elseif L_92_ == 6 then
			fireExplo()
		end
	end
end

--// Walk and Sway
local L_136_

local L_137_ = 0.6
local L_138_ = 0.05 -- speed
local L_139_ = -0.1 -- height

local L_140_ = 0
local L_141_ = 0
local L_142_ = 35 --This is the limit of the mouse input for the sway
local L_143_ = -9 --This is the magnitude of the sway when you're unaimed
local L_144_ = -9 --This is the magnitude of the sway when you're aimed

--local Sprinting =false
local L_145_ = L_121_.new(Vector3.new())
L_145_.s = 15
L_145_.d = 0.5

game:GetService("UserInputService").InputChanged:connect(function(L_272_arg1) --Get the mouse delta for the gun sway
	if L_272_arg1.UserInputType == Enum.UserInputType.MouseMovement then
		L_140_ = math.min(math.max(L_272_arg1.Delta.x, -L_142_), L_142_)
		L_141_ = math.min(math.max(L_272_arg1.Delta.y, -L_142_), L_142_)
	end
end)

L_4_.Idle:connect(function() --Reset the sway to 0 when the mouse is still
	L_140_ = 0
	L_141_ = 0
end)

local L_146_ = false
local L_147_ = CFrame.new()
local L_148_ = CFrame.new()

local L_149_ 
local L_150_
local L_151_
local L_152_

local L_153_
local L_154_
local L_155_

if not L_24_.TacticalModeEnabled then
	L_149_ = 0
	L_150_ = CFrame.new()
	L_151_ = 0.1
	L_152_ = 2

	L_153_ = 0
	L_154_ = .2
	L_155_ = 17
else
	L_149_ = 0
	L_150_ = CFrame.new()
	L_151_ = 0.05
	L_152_ = 2

	L_153_ = 0
	L_154_ = 0.09
	L_155_ = 11
end

local L_156_ = 0
local L_157_ = 5
local L_158_ = .3

local L_159_, L_160_ = 0, 0

local L_161_ = nil
local L_162_ = nil
local L_163_ = nil

L_3_.Humanoid.Running:connect(function(L_273_arg1)
	if L_273_arg1 > 1 then
		L_146_ = true
	else
		L_146_ = false
	end
end)

--// Renders
local L_164_

L_106_:connect(function()
	if L_15_ then
		L_159_, L_160_ = L_159_ or 0, L_160_ or 0
		if L_162_ == nil or L_161_ == nil then
			L_162_ = L_45_.C0
			L_161_ = L_45_.C1
		end

		local L_274_ = (math.sin(L_153_ * L_155_ / 2) * L_154_)
		local L_275_ = (math.sin(L_153_ * L_155_) * L_154_)
		local L_276_ = CFrame.new(L_274_, L_275_, 0.02)

		local L_277_ = (math.sin(L_153_ * L_155_ / 2) * L_154_)
		local L_278_ = (math.sin(L_153_ * L_155_) * L_154_)
		local L_279_ = CFrame.new(L_274_, L_275_, 0.02) * CFrame.Angles((math.cos(L_153_ * L_155_) * L_154_), (math.cos(L_153_ * L_155_ / 2) * L_154_), 0)

		local L_280_ = (math.sin(L_149_ * L_152_ / 2) * L_151_)
		local L_281_ = (math.cos(L_149_ * L_152_) * L_151_)
		local L_282_ = CFrame.new(L_280_, L_281_, 0.02)

		if L_146_ then
			L_153_ = L_153_ + .017
			if L_24_.WalkAnimEnabled == true then
				if L_24_.TacticalModeEnabled then
					L_147_ = L_279_
				else
					L_147_ = L_276_
				end
			else
				L_147_ = CFrame.new()
			end
		else
			L_153_ = 0
			L_147_ = CFrame.new()
		end

		L_145_.t = Vector3.new(L_140_, L_141_, 0)
		local L_283_ = L_145_.p
		local L_284_ = L_283_.X / L_142_ * (L_64_ and L_144_ or L_143_)
		local L_285_ = L_283_.Y / L_142_ * (L_64_ and L_144_ or L_143_)

		L_5_.CFrame = L_5_.CFrame:lerp(L_5_.CFrame * L_148_, 0.2)

		if L_64_ then
			L_136_ = CFrame.Angles(math.rad(-L_284_), math.rad(L_284_), math.rad(L_285_)) * CFrame.fromAxisAngle(Vector3.new(5, 0, -1), math.rad(L_284_))	
			L_149_ = 0
			L_150_ = CFrame.new()
		elseif not L_64_ then
			L_136_ = CFrame.Angles(math.rad(-L_285_), math.rad(-L_284_), math.rad(-L_284_)) * CFrame.fromAxisAngle(L_44_.Position, math.rad(-L_285_))
			L_149_ = L_149_ + 0.017			
			L_150_ = L_282_
		end

		if L_24_.SwayEnabled ==  true then
			L_45_.C0 = L_45_.C0:lerp(L_162_ * L_136_ * L_147_ * L_150_, 0.1)
		else
			L_45_.C0 = L_45_.C0:lerp(L_162_ * L_147_, 0.1)
		end		

		if L_67_ and not L_70_ and L_72_ and not L_64_ and not L_66_ and not Shooting then
			L_45_.C1 = L_45_.C1:lerp(L_45_.C0 * L_24_.SprintPos, 0.1)
		elseif not L_67_ and not L_70_ and not L_72_ and not L_64_ and not L_66_ and not Shooting and not L_79_ then
			L_45_.C1 = L_45_.C1:lerp(CFrame.new() * L_134_, 0.05)
		end


		if L_64_ and not L_67_ then
			if not L_65_ then
				L_90_ = L_24_.AimCamRecoil
				L_89_ = L_24_.AimGunRecoil
				L_91_ = L_24_.AimKickback
			elseif L_65_ then
				if L_93_ == 1 then
					L_90_ = L_24_.AimCamRecoil / 1.5
					L_89_ = L_24_.AimGunRecoil / 1.5
					L_91_ = L_24_.AimKickback / 1.5
				end

				if L_93_ == 2 then
					L_90_ = L_24_.AimCamRecoil / 2
					L_89_ = L_24_.AimGunRecoil / 2
					L_91_ = L_24_.AimKickback / 2
				end
			end

			if (L_3_.Head.Position - L_5_.CoordinateFrame.p).magnitude < 2 then
				L_45_.C1 = L_45_.C1:lerp(L_45_.C0 * L_56_.CFrame:toObjectSpace(L_44_.CFrame), L_24_.AimSpeed)

				L_42_:WaitForChild('Sense'):WaitForChild('Sensitivity').Visible = true
				L_42_:WaitForChild('Sense'):WaitForChild('Sensitivity').Text = L_51_
				L_107_.MouseDeltaSensitivity = L_51_
			end
		elseif not L_64_ and not L_67_ and L_15_ and not L_79_ then
			if (L_3_.Head.Position - L_5_.CoordinateFrame.p).magnitude < 2 then
				L_45_.C1 = L_45_.C1:lerp(CFrame.new() * L_134_, L_24_.UnaimSpeed)

				L_42_:WaitForChild('Sense'):WaitForChild('Sensitivity').Visible = false
				L_42_:WaitForChild('Sense'):WaitForChild('Sensitivity').Text = L_51_
				L_107_.MouseDeltaSensitivity = L_52_
			end	

			if not L_65_ then
				L_90_ = L_24_.camrecoil
				L_89_ = L_24_.gunrecoil
				L_91_ = L_24_.Kickback
			elseif L_65_ then
				if L_93_ == 1 then
					L_90_ = L_24_.camrecoil / 1.5
					L_89_ = L_24_.gunrecoil / 1.5
					L_91_ = L_24_.Kickback / 1.5
				end

				if L_93_ == 2 then
					L_90_ = L_24_.camrecoil / 2
					L_89_ = L_24_.gunrecoil / 2
					L_91_ = L_24_.Kickback / 2
				end
			end	
		end

		if Recoiling then
			if not L_64_ then
				L_148_ = CFrame.fromEulerAnglesXYZ(math.rad(L_90_ * math.random(0, L_24_.CamShake)), math.rad(L_90_ * math.random(-L_24_.CamShake, L_24_.CamShake)), math.rad(L_90_ * math.random(-L_24_.CamShake, L_24_.CamShake)))--CFrame.Angles(camrecoil,0,0)	
			else
				L_148_ = CFrame.fromEulerAnglesXYZ(math.rad(L_90_ * math.random(0, L_24_.AimCamShake)), math.rad(L_90_ * math.random(-L_24_.AimCamShake, L_24_.AimCamShake)), math.rad(L_90_ * math.random(-L_24_.AimCamShake, L_24_.AimCamShake)))
			end
			--cam.CoordinateFrame = cam.CoordinateFrame *  CFrame.fromEulerAnglesXYZ(math.rad(camrecoil*math.random(0,3)), math.rad(camrecoil*math.random(-1,1)), math.rad(camrecoil*math.random(-1,1)))
			L_45_.C0 = L_45_.C0:lerp(L_45_.C0 * CFrame.new(0, 0, L_89_) * CFrame.Angles(-math.rad(L_91_), 0, 0), 0.3)
		elseif not Recoiling then	
			L_148_ = CFrame.Angles(0, 0, 0)
			L_45_.C0 = L_45_.C0:lerp(CFrame.new(), 0.2)
		end

		if L_65_ then
			L_3_:WaitForChild('Humanoid').Jump = false
		end

		if L_15_ then 
			L_5_.FieldOfView = L_5_.FieldOfView * (1 - L_24_.ZoomSpeed) + (L_97_ * L_24_.ZoomSpeed)
			if (L_3_.Head.Position - L_5_.CoordinateFrame.p).magnitude >= 2 then
				L_90_ = L_24_.AimCamRecoil
				L_89_ = L_24_.AimGunRecoil
				L_91_ = L_24_.AimKickback

				L_42_:WaitForChild('Sense'):WaitForChild('Sensitivity').Visible = true
				L_42_:WaitForChild('Sense'):WaitForChild('Sensitivity').Text = L_51_
				L_107_.MouseDeltaSensitivity = L_51_
			elseif (L_3_.Head.Position - L_5_.CoordinateFrame.p).magnitude < 2 and not L_64_ and not L_65_ then
				L_90_ = L_24_.camrecoil
				L_89_ = L_24_.gunrecoil
				L_91_ = L_24_.Kickback

				L_42_:WaitForChild('Sense'):WaitForChild('Sensitivity').Visible = false
				L_42_:WaitForChild('Sense'):WaitForChild('Sensitivity').Text = L_51_
				L_107_.MouseDeltaSensitivity = L_52_
			end
		end

		if L_15_ and L_24_.CameraGo then --and (char.Head.Position - cam.CoordinateFrame.p).magnitude < 2 then
			L_4_.TargetFilter = game.Workspace
			local L_286_ =  L_3_:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, 1.5, 0) * CFrame.new(L_3_:WaitForChild("Humanoid").CameraOffset)
			L_48_.C0 = L_8_.CFrame:toObjectSpace(L_286_)
			L_48_.C1 = CFrame.Angles(-math.asin((L_4_.Hit.p - L_4_.Origin.p).unit.y), 0, 0)
			L_107_.MouseIconEnabled = false	
		end

		if L_15_ and (L_3_.Head.Position - L_5_.CoordinateFrame.p).magnitude >= 2 then
			if L_4_.Icon ~= "http://www.roblox.com/asset?id=" .. L_24_.TPSMouseIcon then
				L_4_.Icon = "http://www.roblox.com/asset?id=" .. L_24_.TPSMouseIcon
			end
			L_107_.MouseIconEnabled = true

			if L_3_:FindFirstChild('Right Arm') and L_3_:FindFirstChild('Left Arm') then
				L_3_['Right Arm'].LocalTransparencyModifier = 1
				L_3_['Left Arm'].LocalTransparencyModifier = 1
			end
		end;
	end
end)

--// Stances
function Prone()
	UpdateAmmo()
	L_112_:FireServer("Prone")	
end

function Stand()
	UpdateAmmo()
	L_112_:FireServer("Stand")
end

function Crouch()
	UpdateAmmo()
	L_112_:FireServer("Crouch")

end

function LeanRight()
	if L_93_ ~= 2 then
		L_112_:FireServer("LeanRight")
		L_130_(L_9_, nil, CFrame.new(0, 0.200000003, 0, -0.939692616, 0, -0.342020124, -0.342020124, 0, 0.939692616, 0, 1, 0), function(L_297_arg1)
			return math.sin(math.rad(L_297_arg1))
		end, 0.25)
		L_130_(L_10_, nil, CFrame.new(0.300000012, 0.600000024, 0, 0, 0.342020124, 0.939692616, 0, 0.939692616, -0.342020124, -1, 0, 0), function(L_298_arg1)
			return math.sin(math.rad(L_298_arg1))
		end, 0.25)
		L_130_(L_11_,  nil, nil, function(L_299_arg1)
			return math.sin(math.rad(L_299_arg1))
		end, 0.25)	
		L_130_(L_6_:WaitForChild("Clone"), nil, CFrame.new(-0.400000006, -0.300000012, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0), function(L_300_arg1)
			return math.sin(math.rad(L_300_arg1))
		end, 0.25)
		if not L_65_ then
			L_14_:Create(L_3_:WaitForChild('Humanoid'), TweenInfo.new(0.3), {
				CameraOffset = Vector3.new(1, -0.5, 0)
			}):Play()	
		elseif L_65_ then
			if L_93_ == 1 then
				L_14_:Create(L_3_:WaitForChild('Humanoid'), TweenInfo.new(0.3), {
					CameraOffset = Vector3.new(1, -1.5, 0)
				}):Play()	
			end
		end;
	end	
end

function LeanLeft()
	if L_93_ ~= 2 then
		L_112_:FireServer("LeanLeft")
		L_130_(L_9_, nil, CFrame.new(0, 0.200000003, 0, -0.939692616, 0, 0.342020124, 0.342020124, 0, 0.939692616, 0, 1, 0), function(L_301_arg1)
			return math.sin(math.rad(L_301_arg1))
		end, 0.25)
		L_130_(L_10_, nil, nil, function(L_302_arg1)
			return math.sin(math.rad(L_302_arg1))
		end, 0.25)
		L_130_(L_11_,  nil, CFrame.new(-0.300000012, 0.600000024, 0, 0, -0.342020124, -0.939692616, 0, 0.939692616, -0.342020124, 1, 0, 0), function(L_303_arg1)
			return math.sin(math.rad(L_303_arg1))
		end, 0.25)
		L_130_(L_6_:WaitForChild("Clone"), nil, CFrame.new(0.400000006, -0.300000012, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0), function(L_304_arg1)
			return math.sin(math.rad(L_304_arg1))
		end, 0.25)
		if not L_65_ then
			L_14_:Create(L_3_:WaitForChild('Humanoid'), TweenInfo.new(0.3), {
				CameraOffset = Vector3.new(-1, -0.5, 0)
			}):Play()	
		elseif L_65_ then
			if L_93_ == 1 then
				L_14_:Create(L_3_:WaitForChild('Humanoid'), TweenInfo.new(0.3), {
					CameraOffset = Vector3.new(-1, -1.5, 0)
				}):Play()	
			end
		end;
	end	
end

function Unlean()
	if L_93_ ~= 2 then
		L_112_:FireServer("Unlean")
		L_130_(L_9_, nil, CFrame.new(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0), function(L_305_arg1)
			return math.sin(math.rad(L_305_arg1))
		end, 0.25)
		L_130_(L_10_, nil, CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), function(L_306_arg1)
			return math.sin(math.rad(L_306_arg1))
		end, 0.25)
		L_130_(L_11_,  nil, CFrame.new(-0.5, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), function(L_307_arg1)
			return math.sin(math.rad(L_307_arg1))
		end, 0.25)	
		if L_6_:FindFirstChild('Clone') then
			L_130_(L_6_:WaitForChild("Clone"), nil, CFrame.new(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0), function(L_308_arg1)
				return math.sin(math.rad(L_308_arg1))
			end, 0.25)
		end		
		if not L_65_ then
			L_14_:Create(L_3_:WaitForChild('Humanoid'), TweenInfo.new(0.3), {
				CameraOffset = Vector3.new(0, 0, 0)
			}):Play()	
		elseif L_65_ then			
			if L_93_ == 1 then
				L_14_:Create(L_3_:WaitForChild('Humanoid'), TweenInfo.new(0.3), {
					CameraOffset = Vector3.new(0, -1, 0)
				}):Play()	
			end
		end;
	end
end

local L_165_ = false

L_107_.InputBegan:connect(function(L_309_arg1, L_310_arg2)
	if not L_310_arg2 and L_15_ == true then
		if L_15_ then
			if L_309_arg1.KeyCode == Enum.KeyCode.C then 
				Prone()
			else if L_309_arg1.KeyCode == Enum.KeyCode.LeftControl then 
					Crouch()
				end
			end
		end
	end
end)

--// Touch Connections
L_3_:WaitForChild('Humanoid').Touched:connect(function(L_311_arg1)
	local L_312_, L_313_ = SearchResupply(L_311_arg1)
	if L_312_ and L_17_ then
		L_17_ = false
		L_103_ = L_24_.Ammo
		L_104_ = L_24_.StoredAmmo * L_24_.MagCount
		L_105_ = L_24_.ExplosiveAmmo
		if L_58_:FindFirstChild('Resupply') then
			L_58_.Resupply:Play()
		end
		wait(15)
		L_17_ = true
	end;
end)

--// Input Connections
L_107_.InputBegan:connect(function(L_314_arg1, L_315_arg2)
	if not L_315_arg2 and L_15_ then
		if L_314_arg1.UserInputType == (Enum.UserInputType.MouseButton2 or L_314_arg1.KeyCode == Enum.KeyCode.ButtonL2) and not L_79_ and not L_78_ and not L_77_ and L_24_.CanAim and not L_74_ and L_15_ and not L_66_ and not L_67_ then
			if not L_64_ then
				if not L_65_ then
					if L_24_.TacticalModeEnabled then
						L_154_ = 0.015
						L_155_ = 7
						L_3_:WaitForChild("Humanoid").WalkSpeed = 7
					else
						L_155_ = 10
						L_154_ = 0.008
						L_3_:WaitForChild("Humanoid").WalkSpeed = 10
					end

				end

				if (L_3_.Head.Position - L_5_.CoordinateFrame.p).magnitude <= 2 then
					L_97_ = L_50_
				end
				L_133_.target = L_56_.CFrame:toObjectSpace(L_44_.CFrame).p
				L_115_:FireServer(true)				
				L_64_ = true
			end
		end;

		if L_314_arg1.KeyCode == Enum.KeyCode.A and L_15_ then
			L_134_ = CFrame.Angles(0, 0, 0.1)
		end;

		if L_314_arg1.KeyCode == Enum.KeyCode.D and L_15_ then
			L_134_ = CFrame.Angles(0, 0, -0.1)
		end;

		if L_314_arg1.KeyCode == Enum.KeyCode.E and L_15_ and not L_80_ and not L_81_ then
			L_80_ = true
			L_82_ = false
			L_81_ = true
			LeanRight()
		end

		if L_314_arg1.KeyCode == Enum.KeyCode.Q and L_15_ and not L_80_ and not L_82_ then
			L_80_ = true
			L_81_ = false
			L_82_ = true
			LeanLeft()
		end

		if L_314_arg1.KeyCode == L_24_.AlternateAimKey and not L_79_ and not L_78_ and not L_77_ and L_24_.CanAim and not L_74_ and L_15_ and not L_66_ and not L_67_ then
			if not L_64_ then
				if not L_65_ then
					L_3_.Humanoid.WalkSpeed = 10
					L_155_ = 10
					L_154_ = 0.008
				end
				L_97_ = L_50_
				L_133_.target = L_56_.CFrame:toObjectSpace(L_44_.CFrame).p
				L_115_:FireServer(true)
				L_64_ = true
			end
		end;

		if L_314_arg1.UserInputType == (Enum.UserInputType.MouseButton1 or L_314_arg1.KeyCode == Enum.KeyCode.ButtonR2) and not L_79_ and not L_77_ and L_69_ and L_15_ and not L_66_ and not L_67_ and not L_74_ then
			L_68_ = true
			if not Shooting and L_15_ and not L_83_ then
				if L_103_ > 0 then			
					Shoot()
				end
			elseif not Shooting and L_15_ and L_83_ then
				if L_105_ > 0 then
					Shoot()
				end
			end
		end;

		if L_314_arg1.KeyCode == (L_24_.LaserKey or L_314_arg1.KeyCode == Enum.KeyCode.DPadRight) and L_15_ and L_24_.LaserAttached then
			local L_316_ = L_1_:FindFirstChild("LaserLight")
			L_122_.KeyDown[1].Plugin()
		end;

		if L_314_arg1.KeyCode == (L_24_.LightKey or L_314_arg1.KeyCode == Enum.KeyCode.ButtonR3) and L_15_ and L_24_.LightAttached then
			local L_317_ = L_1_:FindFirstChild("FlashLight"):FindFirstChild('Light')
			local L_318_ = false
			L_317_.Enabled = not L_317_.Enabled
		end;

		if L_15_ and L_314_arg1.KeyCode == (L_24_.FireSelectKey or L_314_arg1.KeyCode == Enum.KeyCode.DPadUp) and not L_79_ and not L_70_ and not L_78_ then
			L_70_ = true
			if L_92_ == 1 then
				if Shooting then
					Shooting = false
				end
				if L_24_.AutoEnabled then
					L_92_ = 2
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.AutoEnabled and L_24_.BurstEnabled then
					L_92_ = 3
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.AutoEnabled and not L_24_.BurstEnabled and L_24_.BoltAction then
					L_92_ = 4
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.AutoEnabled and not L_24_.BurstEnabled and not L_24_.BoltAction and L_24_.ExplosiveEnabled then
					L_92_ = 6
					L_83_ = true
					L_84_ = L_69_
					L_69_ = L_85_
				elseif not L_24_.AutoEnabled and not L_24_.BurstEnabled and not L_24_.BoltAction and not L_24_.ExplosiveEnabled then
					L_92_ = 1
					L_83_ = false
					L_69_ = L_84_
				end
			elseif L_92_ == 2 then
				if Shooting then
					Shooting = false
				end
				if L_24_.BurstEnabled then
					L_92_ = 3
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.BurstEnabled and L_24_.BoltAction then
					L_92_ = 4
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.BurstEnabled and not L_24_.BoltAction and L_24_.ExplosiveEnabled then
					L_92_ = 6
					L_83_ = true
					L_84_ = L_69_
					L_69_ = L_85_
				elseif not L_24_.BurstEnabled and not L_24_.BoltAction and not L_24_.ExplosiveEnabled and L_24_.SemiEnabled then
					L_92_ = 1
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.BurstEnabled and not L_24_.BoltAction and not L_24_.SemiEnabled then
					L_92_ = 2
					L_83_ = false
					L_69_ = L_84_
				end
			elseif L_92_ == 3 then
				if Shooting then
					Shooting = false
				end
				if L_24_.BoltAction then
					L_92_ = 4
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.BoltAction and L_24_.ExplosiveEnabled then
					L_92_ = 6
					L_83_ = true
					L_84_ = L_69_
					L_69_ = L_85_
				elseif not L_24_.BoltAction and not L_24_.ExplosiveEnabled and L_24_.SemiEnabled then
					L_92_ = 1
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.BoltAction and not L_24_.SemiEnabled and L_24_.AutoEnabled then
					L_92_ = 2
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.BoltAction and not L_24_.SemiEnabled and not L_24_.AutoEnabled then
					L_92_ = 3
					L_83_ = false
					L_69_ = L_84_
				end
			elseif L_92_ == 4 then
				if Shooting then
					Shooting = false
				end
				if L_24_.ExplosiveEnabled then
					L_92_ = 6
					L_83_ = true
					L_84_ = L_69_
					L_69_ = L_85_
				elseif not L_24_.ExplosiveEnabled and L_24_.SemiEnabled then
					L_92_ = 1
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.SemiEnabled and L_24_.AutoEnabled then
					L_92_ = 2
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.SemiEnabled and not L_24_.AutoEnabled and L_24_.BurstEnabled then
					L_92_ = 3
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.SemiEnabled and not L_24_.AutoEnabled and not L_24_.BurstEnabled then
					L_92_ = 4
					L_83_ = false
					L_69_ = L_84_
				end
			elseif L_92_ == 6 then
				if Shooting then
					Shooting = false
				end
				L_85_ = L_69_
				if L_24_.SemiEnabled then
					L_92_ = 1
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.SemiEnabled and L_24_.AutoEnabled then
					L_92_ = 2
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.SemiEnabled and not L_24_.AutoEnabled and L_24_.BurstEnabled then
					L_92_ = 3
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.SemiEnabled and not L_24_.AutoEnabled and not L_24_.BurstEnabled and L_24_.BoltAction then
					L_92_ = 4
					L_83_ = false
					L_69_ = L_84_
				elseif not L_24_.SemiEnabled and not L_24_.AutoEnabled and not L_24_.BurstEnabled and not L_24_.BoltAction then
					L_92_ = 6
					L_83_ = true
					L_84_ = L_69_
					L_69_ = L_85_
				end
			end
			UpdateAmmo()
			FireModeAnim()
			IdleAnim()
			L_70_ = false
		end;

		if L_314_arg1.KeyCode == (Enum.KeyCode.F or L_314_arg1.KeyCode == Enum.KeyCode.DPadDown) and not L_79_ and not L_77_ and not L_78_ and not L_67_ and not L_70_ and not L_64_ and not L_66_ and not Shooting and not L_76_ then			
			if not L_73_ and not L_74_ then
				L_74_ = true
				Shooting = false
				L_69_ = false
				L_135_ = time()
				delay(0.6, function()
					if L_103_ ~= L_24_.Ammo and L_103_ > 0 then
						CreateShell()
					end
				end)	
				BoltBackAnim()
				L_73_ = true
			elseif L_73_ and L_74_ then
				BoltForwardAnim()
				Shooting = false
				L_69_ = true
				if L_103_ ~= L_24_.Ammo and L_103_ > 0 then
					L_103_ = L_103_ - 1
				elseif L_103_ >= L_24_.Ammo then
					L_69_ = true
				end						
				L_73_ = false
				L_74_ = false
				IdleAnim()
				L_75_ = false
			end
			UpdateAmmo()
		end;

		if L_314_arg1.KeyCode == (Enum.KeyCode.LeftShift or L_314_arg1.KeyCode == Enum.KeyCode.ButtonL3) and not L_78_ and not L_77_ and L_146_ then
			L_71_ = true
			if L_15_ and not L_70_ and not L_67_ and L_71_ and not L_65_ and not L_74_ then
				Shooting = false
				L_64_ = false
				L_67_ = true

				delay(0, function()
					if L_67_ and not L_66_ then
						L_64_ = false
						L_72_ = true
					end
				end)
				L_97_ = 80
				if L_24_.TacticalModeEnabled then
					L_154_ = 0.4
					L_155_ = 16
				else
					L_155_ = L_24_.SprintSpeed
					L_154_ = 0.4
				end
				L_3_.Humanoid.WalkSpeed = 24
			end
		end;

		if L_314_arg1.KeyCode == (Enum.KeyCode.R or L_314_arg1.KeyCode == Enum.KeyCode.ButtonX) and not L_79_ and not L_78_ and not L_77_ and L_15_ and not L_66_ and not L_64_ and not Shooting and not L_67_ and not L_74_ then		
			if not L_83_ then			
				if L_104_ > 0 and L_103_ < L_24_.Ammo then
					Shooting = false
					L_66_ = true

					for L_319_forvar1, L_320_forvar2 in pairs(game.Players:GetChildren()) do
						if L_320_forvar2 and L_320_forvar2:IsA('Player') and L_320_forvar2 ~= L_2_ and L_320_forvar2.TeamColor == L_2_.TeamColor then
							if (L_320_forvar2.Character.HumanoidRootPart.Position - L_3_.HumanoidRootPart.Position).magnitude  <= 150 then
								if L_7_:FindFirstChild('AHH') and not L_7_.AHH.IsPlaying then
									L_119_:FireServer(L_7_.AHH, L_100_[math.random(0, 23)])
								end
							end
						end
					end

					ReloadAnim()
					if L_103_ <= 0 then
						if not L_24_.CanSlideLock then
							BoltBackAnim()
							BoltForwardAnim()
						end
					end
					IdleAnim()
					L_69_ = true

					if L_103_ <= 0 then
						if (L_104_ - (L_24_.Ammo - L_103_)) < 0 then
							L_103_ = L_103_ + L_104_
							L_104_ = 0
						else
							L_104_ = L_104_ - (L_24_.Ammo - L_103_)
							L_103_ = L_24_.Ammo
						end
					elseif L_103_ > 0 then
						if (L_104_ - (L_24_.Ammo - L_103_)) < 0 then
							L_103_ = L_103_ + L_104_ + 1
							L_104_ = 0
						else
							L_104_ = L_104_ - (L_24_.Ammo - L_103_)
							L_103_ = L_24_.Ammo + 1
						end
					end

					L_66_ = false
					if not L_75_ then
						L_69_ = true
					end
				end;
			elseif L_83_ then
				if L_105_ > 0 then
					Shooting = false
					L_66_ = true
					nadeReload()
					IdleAnim()
					L_66_ = false
					L_69_ = true
				end
			end;
			UpdateAmmo()
		end;

		if L_314_arg1.KeyCode == Enum.KeyCode.RightBracket and L_64_ then
			if (L_51_ < 1) then
				L_51_ = L_51_ + L_24_.SensitivityIncrement
			end
		end

		if L_314_arg1.KeyCode == Enum.KeyCode.LeftBracket and L_64_ then
			if (L_51_ > 0.1) then
				L_51_ = L_51_ - L_24_.SensitivityIncrement
			end
		end

		if L_314_arg1.KeyCode == (Enum.KeyCode.T or L_314_arg1.KeyCode == Enum.KeyCode.DPadLeft) and L_1_:FindFirstChild("AimPart2") then
			if not L_86_ then
				L_56_ = L_1_:WaitForChild("AimPart2")
				L_50_ = L_24_.CycleAimZoom
				if L_64_ then
					L_97_ = L_24_.CycleAimZoom
				end
				L_86_ = true
			else
				L_56_ = L_1_:FindFirstChild("AimPart")
				L_50_ = L_24_.AimZoom
				if L_64_ then
					L_97_ = L_24_.AimZoom
				end
				L_86_ = false
			end;
		end;

		if L_314_arg1.KeyCode == L_24_.InspectionKey and not L_79_ and not L_78_ then
			if not L_77_ then
				L_77_ = true
				InspectAnim()
				IdleAnim()
				L_77_ = false
			end
		end;

		if L_314_arg1.KeyCode == L_24_.AttachmentKey and not L_79_ and not L_77_ then
			if L_15_ then
				if not L_78_ then
					L_67_ = false
					L_64_ = false
					L_69_ = false
					L_78_ = true

					AttachAnim()
				elseif L_78_ then
					L_67_ = false
					L_64_ = false
					L_69_ = true
					L_78_ = false

					IdleAnim()
				end
			end
		end;

		if L_314_arg1.KeyCode == Enum.KeyCode.P and not L_77_ and not L_78_ and not L_64_ and not L_67_ and not L_65_ and not L_66_ and not Recoiling and not L_67_ then
			if not L_79_ then
				L_79_ = true
				L_14_:Create(L_45_, TweenInfo.new(0.2), {
					C1 = L_24_.SprintPos
				}):Play()
				wait(0.2)
				L_112_:FireServer("Patrol", L_24_.SprintPos)
			else
				L_79_ = false
				L_14_:Create(L_45_, TweenInfo.new(0.2), {
					C1 = CFrame.new()
				}):Play()
				wait(0.2)
				L_112_:FireServer("Unpatrol")
			end
		end;
	end
end)

L_107_.InputEnded:connect(function(L_321_arg1, L_322_arg2)
	if not L_322_arg2 and L_15_ then
		if L_321_arg1.UserInputType == (Enum.UserInputType.MouseButton2 or L_321_arg1.KeyCode == Enum.KeyCode.ButtonL2) and not L_77_ and L_24_.CanAim and not L_78_ then
			if L_64_ then
				if not L_65_ then
					L_3_:WaitForChild("Humanoid").WalkSpeed = 16
					if L_24_.TacticalModeEnabled then
						L_154_ = 0.09
						L_155_ = 11
					else
						L_154_ = .2
						L_155_ = 17
					end
				end	
				L_97_ = 70
				L_133_.target = Vector3.new()
				L_115_:FireServer(false)
				L_64_ = false
			end
		end;

		if L_321_arg1.KeyCode == Enum.KeyCode.A and L_15_ then
			L_134_ = CFrame.Angles(0, 0, 0)
		end;

		if L_321_arg1.KeyCode == Enum.KeyCode.D and L_15_ then
			L_134_ = CFrame.Angles(0, 0, 0)
		end;

		if L_321_arg1.KeyCode == Enum.KeyCode.E and L_15_ and L_80_ then
			Unlean()		
			L_80_ = false
			L_82_ = false
			L_81_ = false
		end

		if L_321_arg1.KeyCode == Enum.KeyCode.Q and L_15_ and L_80_ then
			Unlean()		
			L_80_ = false
			L_82_ = false
			L_81_ = false
		end

		if L_321_arg1.KeyCode == L_24_.AlternateAimKey and not L_77_ and L_24_.CanAim then
			if L_64_ then
				if not L_65_ then
					L_3_.Humanoid.WalkSpeed = 16
					L_155_ = 17
					L_154_ = .25
				end	
				L_97_ = 70
				L_133_.target = Vector3.new()
				L_115_:FireServer(false)
				L_64_ = false
			end
		end;

		if L_321_arg1.UserInputType == (Enum.UserInputType.MouseButton1 or L_321_arg1.KeyCode == Enum.KeyCode.ButtonR2) and not L_77_ then
			L_68_ = false				
			if Shooting then
				Shooting = false
			end
		end;

		if L_321_arg1.KeyCode == Enum.KeyCode.E and L_15_ then
			local L_323_ = L_42_:WaitForChild('GameGui')
			if L_16_ then
				L_323_:WaitForChild('AmmoFrame').Visible = false
				L_16_ = false
			end
		end;

		if L_321_arg1.KeyCode == (Enum.KeyCode.LeftShift or L_321_arg1.KeyCode == Enum.KeyCode.ButtonL3) and not L_77_ and not L_70_ and not L_65_ then -- SPRINT
			L_71_ = false
			if L_67_ and not L_64_ and not Shooting and not L_71_ then
				L_67_ = false
				L_72_ = false
				L_97_ = 70

				L_3_.Humanoid.WalkSpeed = 16
				if L_24_.TacticalModeEnabled then
					L_154_ = 0.09
					L_155_ = 11
				else
					L_154_ = .2
					L_155_ = 17
				end			
			end
		end;
	end
end)

L_107_.InputChanged:connect(function(L_324_arg1, L_325_arg2)
	if not L_325_arg2 and L_15_ and L_24_.FirstPersonOnly and L_64_ then
		if L_324_arg1.UserInputType == Enum.UserInputType.MouseWheel then
			if L_324_arg1.Position.Z == 1 and (L_51_ < 1) then
				L_51_ = L_51_ + L_24_.SensitivityIncrement
			elseif L_324_arg1.Position.Z == -1 and (L_51_ > 0.1) then
				L_51_ = L_51_ - L_24_.SensitivityIncrement
			end
		end
	end
end)

L_107_.InputChanged:connect(function(L_326_arg1, L_327_arg2)
	if not L_327_arg2 and L_15_ then
		local L_328_, L_329_ = workspace:FindPartOnRayWithIgnoreList(Ray.new(L_56_.CFrame.p, (L_56_.CFrame.lookVector).unit * 10000), IgnoreList);
		if L_328_ then
			local L_330_ = (L_329_ - L_6_.Position).magnitude
			L_33_.Text = math.ceil(L_330_) .. ' m'
		end
	end
end)

--// Event Connections
L_115_.OnClientEvent:connect(function(L_331_arg1, L_332_arg2)
	if L_331_arg1 ~= L_2_ then
		local L_333_ = L_331_arg1.Character
		local L_334_ = L_333_.AnimBase.AnimBaseW
		local L_335_ = L_334_.C1
		if L_332_arg2 then
			L_130_(L_334_,  nil , L_333_.Head.CFrame, function(L_336_arg1)
				return math.sin(math.rad(L_336_arg1))
			end, 0.25)
		elseif not L_332_arg2 then
			L_130_(L_334_,  nil , L_335_, function(L_337_arg1)
				return math.sin(math.rad(L_337_arg1))
			end, 0.25)
		end
	end
end)

L_118_.OnClientEvent:connect(function(L_338_arg1, L_339_arg2)
	if L_42_ and L_339_arg2 ~= L_2_ and L_24_.CanCallout then
		if (L_3_.HumanoidRootPart.Position - L_338_arg1).magnitude <= 10 then
			L_41_.Visible = true
			local L_340_ = ScreamCalculation()
			if L_340_ then
				if L_7_:FindFirstChild('AHH') and not L_7_.AHH.IsPlaying then
					L_119_:FireServer(L_7_.AHH, L_99_[math.random(0, 21)])
				end
			end
			L_14_:Create(L_41_, TweenInfo.new(0.1), {
				BackgroundTransparency = 0.4
			}):Play()
			delay(0.1, function()
				L_14_:Create(L_41_, TweenInfo.new(3), {
					BackgroundTransparency = 1
				}):Play()
			end)
		end
	end
end)

--// UI Tween Info
local L_166_ = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local L_167_ = {
	TextTransparency = 1
}



--[[killEvent.OnClientEvent:connect(function()
	KillText.TextTransparency = 0
	delay(2, function()
		local testTween = tweenService:Create(KillText,killInfo,killGoals)
		testTween:Play()
	end)
end)]]--

--// Animations
local L_168_

function IdleAnim(L_341_arg1)
	L_24_.IdleAnim(L_3_, L_168_, {
		L_45_,
		L_46_,
		L_47_
	});
end;

function EquipAnim(L_342_arg1)
	L_24_.EquipAnim(L_3_, L_168_, {
		L_45_
	});
end;

function UnequipAnim(L_343_arg1)
	L_24_.UnequipAnim(L_3_, L_168_, {
		L_45_
	});
end;

function FireModeAnim(L_344_arg1)
	L_24_.FireModeAnim(L_3_, L_168_, {
		L_45_,
		L_47_,
		L_46_,
		L_58_
	});
end

function ReloadAnim(L_345_arg1)
	L_24_.ReloadAnim(L_3_, L_168_, {
		L_45_,
		L_46_,
		L_47_,
		L_61_,
		L_3_:WaitForChild('Left Arm'),
		L_58_,
		L_49_,
		L_3_:WaitForChild('Right Arm'),
		L_43_
	});
end;

function BoltingBackAnim(L_346_arg1)
	L_24_.BoltingBackAnim(L_3_, L_168_, {
		L_49_
	});
end

function BoltingForwardAnim(L_347_arg1)
	L_24_.BoltingForwardAnim(L_3_, L_168_, {
		L_49_
	});
end

function BoltingForwardAnim(L_348_arg1)
	L_24_.BoltingForwardAnim(L_3_, L_168_, {
		L_49_
	});
end

function BoltBackAnim(L_349_arg1)
	L_24_.BoltBackAnim(L_3_, L_168_, {
		L_49_,
		L_47_,
		L_46_,
		L_45_,
		L_62_
	});
end

function BoltForwardAnim(L_350_arg1)
	L_24_.BoltForwardAnim(L_3_, L_168_, {
		L_49_,
		L_47_,
		L_46_,
		L_45_,
		L_62_
	});
end

function InspectAnim(L_351_arg1)
	L_24_.InspectAnim(L_3_, L_168_, {
		L_47_,
		L_46_
	});
end

function nadeReload(L_352_arg1)
	L_24_.nadeReload(L_3_, L_168_, {
		L_46_,
		L_47_
	});
end

function AttachAnim(L_353_arg1)
	L_24_.AttachAnim(L_3_, L_168_, {
		L_46_,
		L_47_
	});
end

function PatrolAnim(L_354_arg1)
	L_24_.PatrolAnim(L_3_, L_168_, {
		L_46_,
		L_47_
	});
end
