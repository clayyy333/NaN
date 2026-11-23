local C={FLING_DURATION=1.5,TOUCH_DISTANCE=3,TOUCH_COOLDOWN=3,SIT_RADIUS=10,WIDTH=520,HEIGHT=460,BG=Color3.fromRGB(2,7,6),PANEL=Color3.fromRGB(7,19,15),TITLE=Color3.fromRGB(4,12,10),STROKE=Color3.fromRGB(27,83,61),WHITE=Color3.fromRGB(231,255,242),GREY=Color3.fromRGB(153,194,171),DIM=Color3.fromRGB(14,48,36),GREEN=Color3.fromRGB(0,255,136),RED=Color3.fromRGB(238,75,101),PURPLE=Color3.fromRGB(0,255,136),CYAN=Color3.fromRGB(85,255,193)}
local function _0x2d(a)local b={}for c=1,#a do b[c]=string.char(bit32.bxor(a[c],43))end return table.concat(b)end
local _0x91=_0x2d({101,74,101,109,71,66,69,76,108,126,98})
local _0x92=_0x2d({101,74,101,11,123,78,89,88,68,69,74,71,66,81,74,79,68,11,73,82,11,123,88,82,72,67,68,68})
local _0x93=_0x2d({112,101,74,101,11,123,78,89,88,68,69,74,71,66,81,74,79,68,118,11,104,66,69,95,94,89,74,11,0,11,121,68,95,74,72,66,232,152,69,11,0,11,104,71,232,138,88,66,72,68,11,0,11,110,77,78,72,95,68,11,88,78,69,95,74,79,68,11,0,11,104,68,69,95,74,79,68,89,11,79,78,11,89,78,66,69,66,72,66,68,88})
local P=game:GetService("Players")local R=game:GetService("RunService")local T=game:GetService("TweenService")local U=game:GetService("UserInputService")local W=game:GetService("Workspace")
local pl=P.LocalPlayer local mob=U.TouchEnabled and not U.KeyboardEnabled
local AF={}local tE=false local tC={}local mC={}local tCd={}local mz=false
local sE=false local sC=nil local mt={}
local cE=false local cToken=0 local cCleaning=false
local skipTargetVersion=0
local closing=false
local dragInputConn,keyInputConn,characterAddedConn
local modo="CINTURA"
local cinturaDepth=12
local followConn=nil
local followActive=false
local followOrigin=nil
local function stopFollow()
 followActive=false
 if followConn then followConn:Disconnect() followConn=nil end
end
local function gc()return pl.Character end
local function grp()local c=gc()return c and c:FindFirstChild("HumanoidRootPart")end
local function gpb(n)n=n:lower()local e,p={},{}for _,x in ipairs(P:GetPlayers())do if x~=pl then local a=x.Name:lower()local b=x.DisplayName:lower()if a==n or b==n then table.insert(e,x)elseif a:find(n,1,true)or b:find(n,1,true)then table.insert(p,x)end end end return #e>0 and e or p end
local _0x94=pl.PlayerGui:FindFirstChild(_0x91)if _0x94 then _0x94:Destroy()end
local sg=Instance.new("ScreenGui")sg.Name=_0x91 sg.ResetOnSpawn=false sg.ZIndexBehavior=Enum.ZIndexBehavior.Sibling sg.Parent=pl.PlayerGui
local function mc(r,p)local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,r or 8)c.Parent=p return c end
local function ms(col,t,p)local s=Instance.new("UIStroke")s.Color=col or C.STROKE s.Thickness=t or 1 s.Parent=p return s end
local function mg(a,b,r,p)local g=Instance.new("UIGradient")g.Color=ColorSequence.new(a,b)g.Rotation=r or 90 g.Parent=p return g end
local mf=Instance.new("Frame")mf.Size=UDim2.new(0,C.WIDTH,0,C.HEIGHT)mf.Position=UDim2.new(0.5,-C.WIDTH/2,-0.5,0)mf.BackgroundColor3=C.BG mf.BorderSizePixel=0 mf.Active=true mf.Parent=sg mc(10,mf)ms(Color3.fromRGB(18,112,75),1,mf)mg(Color3.fromRGB(4,14,11),Color3.fromRGB(1,5,4),90,mf)
for scan=1,22 do local line=Instance.new("Frame")line.Size=UDim2.new(1,-4,0,1)line.Position=UDim2.new(0,2,0,scan*20)line.BackgroundColor3=Color3.fromRGB(25,94,67)line.BackgroundTransparency=.9 line.BorderSizePixel=0 line.ZIndex=0 line.Parent=mf end
local matrixLayer=Instance.new("Frame")matrixLayer.Size=UDim2.new(1,0,1,-56)matrixLayer.Position=UDim2.new(0,0,0,56)matrixLayer.BackgroundTransparency=1 matrixLayer.ClipsDescendants=true matrixLayer.ZIndex=0 matrixLayer.Parent=mf
for column=1,16 do
 local stream=Instance.new("TextLabel")stream.Size=UDim2.new(0,24,0,260)stream.Position=UDim2.new(0,(column-1)*34,-.5-math.random(),0)stream.BackgroundTransparency=1 stream.Text="0\n1\n0\n0\n1\n1\n0\n1\n0\n1\n1\n0"stream.TextColor3=Color3.fromRGB(0,180,92)stream.TextTransparency=.78 stream.TextSize=11 stream.Font=Enum.Font.RobotoMono stream.TextYAlignment=Enum.TextYAlignment.Top stream.ZIndex=0 stream.Parent=matrixLayer
 task.spawn(function()while stream.Parent do stream.Position=UDim2.new(0,(column-1)*34,0,-280-math.random(0,180))local tween=T:Create(stream,TweenInfo.new(6+math.random()*5,Enum.EasingStyle.Linear),{Position=UDim2.new(0,(column-1)*34,1,20)})tween:Play()tween.Completed:Wait()end end)
end
T:Create(mf,TweenInfo.new(0.45,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-C.WIDTH/2,0.5,-C.HEIGHT/2)}):Play()
local tb=Instance.new("Frame")tb.Size=UDim2.new(1,0,0,56)tb.BackgroundColor3=C.TITLE tb.BorderSizePixel=0 tb.Parent=mf mc(10,tb)mg(Color3.fromRGB(5,28,19),Color3.fromRGB(2,9,7),0,tb)
local accent=Instance.new("Frame")accent.Size=UDim2.new(0,4,0,28)accent.Position=UDim2.new(0,14,0,14)accent.BackgroundColor3=C.PURPLE accent.BorderSizePixel=0 accent.Parent=tb mc(3,accent)mg(C.CYAN,C.PURPLE,90,accent)
local tl=Instance.new("TextLabel")tl.Size=UDim2.new(1,-110,0,23)tl.Position=UDim2.new(0,28,0,8)tl.BackgroundTransparency=1 tl.Text=_0x92 tl.TextColor3=C.GREEN tl.TextSize=16 tl.Font=Enum.Font.RobotoMono tl.TextXAlignment=Enum.TextXAlignment.Left tl.Parent=tb
local subtitle=Instance.new("TextLabel")subtitle.Size=UDim2.new(1,-110,0,16)subtitle.Position=UDim2.new(0,28,0,31)subtitle.BackgroundTransparency=1 subtitle.Text=""subtitle.TextColor3=C.GREY subtitle.TextSize=10 subtitle.Font=Enum.Font.RobotoMono subtitle.TextXAlignment=Enum.TextXAlignment.Left subtitle.Parent=tb
local minBtn=Instance.new("TextButton")minBtn.Size=UDim2.new(0,30,0,30)minBtn.Position=UDim2.new(1,-76,0,13)minBtn.BackgroundColor3=C.PANEL minBtn.Text="—"minBtn.TextColor3=C.GREY minBtn.TextSize=16 minBtn.Font=Enum.Font.GothamBold minBtn.BorderSizePixel=0 minBtn.Parent=tb mc(8,minBtn)ms(C.STROKE,1,minBtn)
local clsBtn=Instance.new("TextButton")clsBtn.Size=UDim2.new(0,30,0,30)clsBtn.Position=UDim2.new(1,-40,0,13)clsBtn.BackgroundColor3=Color3.fromRGB(49,24,35)clsBtn.Text="×"clsBtn.TextColor3=Color3.fromRGB(255,117,135)clsBtn.TextSize=18 clsBtn.Font=Enum.Font.GothamBold clsBtn.BorderSizePixel=0 clsBtn.Parent=tb mc(8,clsBtn)ms(Color3.fromRGB(112,42,59),1,clsBtn)
local ct=Instance.new("ScrollingFrame")ct.Size=UDim2.new(1,-28,1,-72)ct.Position=UDim2.new(0,14,0,64)ct.BackgroundTransparency=1 ct.BorderSizePixel=0 ct.CanvasSize=UDim2.new(0,0,0,540)ct.ScrollBarThickness=4 ct.ScrollBarImageColor3=C.PURPLE ct.ScrollBarImageTransparency=0.15 ct.ScrollingDirection=Enum.ScrollingDirection.Y ct.ElasticBehavior=Enum.ElasticBehavior.Always ct.ClipsDescendants=true ct.Active=true ct.Parent=mf
local il=Instance.new("TextLabel")il.Size=UDim2.new(1,0,0,20)il.BackgroundTransparency=1 il.Text="DESTINATARIOS"il.TextColor3=C.GREY il.TextSize=10 il.Font=Enum.Font.GothamBold il.TextXAlignment=Enum.TextXAlignment.Left il.Parent=ct

local selectedPlayer = nil
local activeTarget = nil
local selectedPlayerIds = {}
local selectAllPlayers = false
local playerMenuOpen = false
local resetCount = 0
local charAddedConn = nil
local charRemovingConn = nil
local removedCharacter = nil
local updateCommandLayout=function()end
local function playerLabel(player)
	if not player then return "ninguno"end
	if player.DisplayName==player.Name then return "@"..player.Name end
	return player.DisplayName.." (@"..player.Name..")"
end

local playerBtn = Instance.new("TextButton")
playerBtn.Size = UDim2.new(1,0,0,40)
playerBtn.Position = UDim2.new(0,0,0,22)
playerBtn.BackgroundColor3 = Color3.fromRGB(9,24,19)
playerBtn.Text = "JUGADORES: ninguno  ▼"
playerBtn.TextColor3 = Color3.fromRGB(232,238,235)
playerBtn.TextSize = 12
playerBtn.Font = Enum.Font.GothamMedium
playerBtn.TextXAlignment = Enum.TextXAlignment.Left
playerBtn.TextTruncate = Enum.TextTruncate.AtEnd
playerBtn.BorderSizePixel = 0
playerBtn.Parent = ct
mc(9,playerBtn)
local playerBtnStroke=ms(Color3.fromRGB(52,78,67),1,playerBtn)playerBtnStroke.Transparency=.3
local playerPad = Instance.new("UIPadding")
playerPad.PaddingLeft = UDim.new(0,10)
playerPad.Parent = playerBtn

local playerMenu = Instance.new("Frame")
playerMenu.Size = UDim2.new(1,0,0,180)
playerMenu.Position = UDim2.new(0,0,0,64)
playerMenu.BackgroundColor3 = Color3.fromRGB(11,16,28)
playerMenu.BorderSizePixel = 0
playerMenu.Visible = false
playerMenu.ZIndex = 50
playerMenu.Parent = ct
mc(10,playerMenu)
ms(C.PURPLE,1,playerMenu)

local playerScroll = Instance.new("ScrollingFrame")
playerScroll.Size = UDim2.new(1,-8,1,-8)
playerScroll.Position = UDim2.new(0,4,0,4)
playerScroll.BackgroundTransparency = 1
playerScroll.BorderSizePixel = 0
playerScroll.ScrollBarThickness = 5
playerScroll.ScrollBarImageColor3 = C.PURPLE
playerScroll.CanvasSize = UDim2.new(0,0,0,0)
playerScroll.ZIndex = 51
playerScroll.Parent = playerMenu

local function updateResetLabel()
end

local function clearDeathTracking()
	if charAddedConn then charAddedConn:Disconnect() charAddedConn=nil end
	if charRemovingConn then charRemovingConn:Disconnect() charRemovingConn=nil end
	removedCharacter = nil
end

local function trackPlayerDeaths(player)
	clearDeathTracking()
	if not player then return end
	charRemovingConn = player.CharacterRemoving:Connect(function(char)
		if selectedPlayer == player and player.Parent == P then
			removedCharacter = char
		end
	end)
	charAddedConn = player.CharacterAdded:Connect(function(char)
		if selectedPlayer == player and player.Parent == P and removedCharacter and char ~= removedCharacter then
			removedCharacter = nil
			resetCount = resetCount + 1
			updateResetLabel()
			nt("REINICIO", player.Name.." #"..resetCount, 2)
		end
	end)
end

local function updatePlayerButtonText()
	local count=0
	for _,p in ipairs(P:GetPlayers())do if p~=pl and selectedPlayerIds[p.UserId]then count=count+1 end end
	if selectAllPlayers then playerBtn.Text="JUGADORES: TODOS ("..count..")  ▼"
	elseif count>0 then playerBtn.Text="JUGADORES: "..count.." seleccionado"..(count==1 and ""or"s").."  ▼"
	else playerBtn.Text="JUGADORES: ninguno  ▼"end
	updateCommandLayout()
end

local function refreshPlayerList()
	for _,child in ipairs(playerScroll:GetChildren()) do
		if child:IsA("TextButton") then child:Destroy() end
	end
	local players = {}
	for _,p in ipairs(P:GetPlayers()) do
		if p ~= pl then
			table.insert(players,p)
		end
	end
	table.sort(players,function(a,b) return a.DisplayName:lower() < b.DisplayName:lower() end)
	local function decoratePlayerRow(row,marked,text)
		row.Text=""
		local indicator=Instance.new("Frame")indicator.Size=UDim2.new(0,16,0,16)indicator.Position=UDim2.new(0,9,0.5,-8)indicator.BackgroundColor3=marked and Color3.fromRGB(0,190,101)or Color3.fromRGB(13,31,25)indicator.BorderSizePixel=0 indicator.ZIndex=53 indicator.Parent=row mc(8,indicator)local indicatorStroke=ms(marked and Color3.fromRGB(72,255,165)or Color3.fromRGB(66,91,79),1,indicator)indicatorStroke.Transparency=marked and 0 or .2
		local check=Instance.new("TextLabel")check.Size=UDim2.new(1,0,1,0)check.BackgroundTransparency=1 check.Text=marked and"✓"or""check.TextColor3=Color3.fromRGB(240,255,247)check.TextSize=11 check.Font=Enum.Font.GothamBold check.ZIndex=54 check.Parent=indicator
		local label=Instance.new("TextLabel")label.Size=UDim2.new(1,-42,1,0)label.Position=UDim2.new(0,34,0,0)label.BackgroundTransparency=1 label.Text=text label.TextColor3=marked and Color3.fromRGB(231,255,241)or Color3.fromRGB(196,211,204)label.TextSize=11 label.Font=Enum.Font.GothamMedium label.TextXAlignment=Enum.TextXAlignment.Left label.TextTruncate=Enum.TextTruncate.AtEnd label.ZIndex=53 label.Parent=row
	end
	
	local y = 0
	local allButton=Instance.new("TextButton")
	allButton.Size=UDim2.new(1,-6,0,30)allButton.Position=UDim2.new(0,2,0,y)
	allButton.BackgroundColor3=selectAllPlayers and Color3.fromRGB(10,45,32)or Color3.fromRGB(8,21,17)
	allButton.BorderSizePixel=0 allButton.ZIndex=52 allButton.Parent=playerScroll mc(6,allButton)local allStroke=ms(selectAllPlayers and Color3.fromRGB(25,117,78)or Color3.fromRGB(42,62,53),1,allButton)allStroke.Transparency=.25 decoratePlayerRow(allButton,selectAllPlayers,"Seleccionar todos")
	allButton.MouseButton1Click:Connect(function()
		selectAllPlayers=not selectAllPlayers
		for _,candidate in ipairs(P:GetPlayers())do if candidate~=pl then selectedPlayerIds[candidate.UserId]=selectAllPlayers or nil end end
		selectedPlayer=nil resetCount=0 clearDeathTracking()updateResetLabel()updatePlayerButtonText()refreshPlayerList()
		nt("JUGADORES",selectAllPlayers and "todos seleccionados"or"selección limpiada",2)
	end)
	y=y+32
	for _,p in ipairs(players) do
		local b = Instance.new("TextButton")
		b.Size = UDim2.new(1,-6,0,30)
		b.Position = UDim2.new(0,2,0,y)
		local marked=selectedPlayerIds[p.UserId]==true
		b.BackgroundColor3 = marked and Color3.fromRGB(10,42,30)or Color3.fromRGB(7,18,15)
		b.Text = ""
		b.BorderSizePixel = 0
		b.ZIndex = 52
		b.Parent = playerScroll
		mc(6,b)
		local rowStroke=ms(marked and Color3.fromRGB(25,105,72)or Color3.fromRGB(38,57,49),1,b)rowStroke.Transparency=.3
		decoratePlayerRow(b,marked,playerLabel(p))
		
		b.MouseButton1Click:Connect(function()
			selectedPlayerIds[p.UserId]=not selectedPlayerIds[p.UserId] or nil
			selectAllPlayers=false
			selectedPlayer = selectedPlayerIds[p.UserId]and p or nil
			resetCount = 0
			updateResetLabel()
			if selectedPlayer then trackPlayerDeaths(p)else clearDeathTracking()end
			updatePlayerButtonText()
			refreshPlayerList()
			nt("JUGADOR",playerLabel(p)..(selectedPlayerIds[p.UserId]and" seleccionado"or" desmarcado"),2)
		end)
		y = y + 32
	end
	playerScroll.CanvasSize = UDim2.new(0,0,0,math.max(y,1))
end

playerBtn.MouseButton1Click:Connect(function()
	playerMenuOpen = not playerMenuOpen
	playerMenu.Visible = playerMenuOpen
	if playerMenuOpen then
		refreshPlayerList()
		updatePlayerButtonText()playerBtn.Text=playerBtn.Text:gsub("▼","▲")
	else
		updatePlayerButtonText()
	end
end)

P.PlayerRemoving:Connect(function(leaving)
	if selectedPlayer == leaving then
		selectedPlayer = nil
		resetCount = 0
		clearDeathTracking()
		updatePlayerButtonText()
		updateResetLabel()
	end
	updatePlayerButtonText()
end)

P.PlayerAdded:Connect(function(joining)
	if selectAllPlayers and joining~=pl then selectedPlayerIds[joining.UserId]=true end
	updatePlayerButtonText()
	if playerMenuOpen then
		refreshPlayerList()
	end
end)

local function selectedTarget()
	if activeTarget and activeTarget.Parent==P and selectedPlayerIds[activeTarget.UserId]then return activeTarget end
	if selectedPlayer and selectedPlayer.Parent==P and selectedPlayerIds[selectedPlayer.UserId]then return selectedPlayer end
	for _,candidate in ipairs(P:GetPlayers())do if candidate~=pl and selectedPlayerIds[candidate.UserId]then return candidate end end
	return nil
end
local function selectedTargetsSnapshot()
	local targets={}
	for _,candidate in ipairs(P:GetPlayers())do
		if candidate~=pl and selectedPlayerIds[candidate.UserId]then table.insert(targets,candidate)end
	end
	table.sort(targets,function(a,b)return a.Name:lower()<b.Name:lower()end)
	return targets
end
local perspectiveActive=false
local perspectiveTarget=nil
local perspectiveConnection=nil
local perspectiveZoomConnection=nil
local perspectivePinchConnection=nil
local perspectiveInputBeganConnection=nil
local perspectiveInputEndedConnection=nil
local perspectiveTouchStartedConnection=nil
local perspectiveTouchMovedConnection=nil
local perspectiveTouchEndedConnection=nil
local perspectiveSavedType=nil
local perspectiveSavedSubject=nil
local perspectiveSavedCFrame=nil
local PERSPECTIVE_DEFAULT_HEIGHT=8
local PERSPECTIVE_MIN_HEIGHT=8
local PERSPECTIVE_MAX_HEIGHT=80
local perspectiveHeight=PERSPECTIVE_DEFAULT_HEIGHT
local perspectiveTargetHeight=PERSPECTIVE_DEFAULT_HEIGHT
local perspectivePinchScale=nil
local perspectiveMode=_0x2d({127,100,123})
local perspectiveYaw=0
local perspectivePitch=math.rad(-89)
local perspectiveRotating=false
local perspectiveTouch=nil
local perspectiveLastTouch=nil
local perspectivePinching=false
local function pointerOverPerspectiveGui(position)
 local ok,objects=pcall(function()return pl.PlayerGui:GetGuiObjectsAtPosition(position.X,position.Y)end)
 if not ok then return false end
 for _,object in ipairs(objects)do if object==sg or object:IsDescendantOf(sg)then return true end end
 return false
end
local _0xc0=(function(a)local b={}for c=1,#a do b[c]=_0x2d(a[c])end return b end)({
{104,67,74,89,74,72,95,78,89},{123,74,89,78,69,95},{99,94,70,74,69,68,66,79,121,68,68,95,123,74,89,95},{99,94,70,74,69,68,66,79},
{109,66,69,79,109,66,89,88,95,104,67,66,71,79},{109,66,69,79,109,66,89,88,95,104,67,66,71,79,100,77,104,71,74,88,88},
{104,94,89,89,78,69,95,104,74,70,78,89,74},{104,74,70,78,89,74,127,82,91,78},{104,74,70,78,89,74,120,94,73,65,78,72,95},{104,109,89,74,70,78},{109,68,72,94,88},{123,68,88,66,95,66,68,69},
{105,74,72,64,91,74,72,64},{121,78,70,68,95,78,88},{110,90,94,66,91,127,68,68,71,121,109},{121,78,70,68,95,78,109,94,69,72,95,66,68,69},{127,68,68,71},{110,90,94,66,91,127,68,68,71},
{121,78,91,71,66,72,74,95,78,79,120,95,68,89,74,76,78},{98,69,93,68,64,78,120,78,89,93,78,89},{125,74,71,78,69,95,66,69,78,105,74,71,71,68,68,69},{101,78,92,114,78,74,89,105,74,71,71,68,68,69},
{104,71,78,74,89,127,68,68,71,121,110},{121,78,70,68,95,78,110,93,78,69,95},{109,66,89,78,120,78,89,93,78,89},{127,100,123},{105,106,104,96},
{109,121,100,101,127},{98,88,106},{103,68,68,64,125,78,72,95,68,89}
})
local function _0xc1(a,b,...)return a[_0xc0[b]](a,...)end
local function _0xc4(root)
 local look=root and root[_0xc0[10]][_0xc0[30]]or Vector3.new(0,0,-1)
 local horizontal=Vector3.new(look.X,0,look.Z)
 if horizontal.Magnitude<.001 then horizontal=Vector3.new(0,0,-1)else horizontal=horizontal.Unit end
 local radial=perspectiveMode==_0xc0[27]and-horizontal or horizontal
 perspectiveYaw=math.atan2(radial.X,radial.Z)
 perspectivePitch=perspectiveMode==_0xc0[26]and math.rad(-89)or math.rad(-8)
end
local function _0xc2()
 local shouldRestore=perspectiveActive or perspectiveConnection~=nil or perspectiveSavedType~=nil or perspectiveSavedSubject~=nil or perspectiveSavedCFrame~=nil
 perspectiveActive=false
 perspectiveTarget=nil
 if perspectiveConnection then perspectiveConnection:Disconnect()perspectiveConnection=nil end
 if perspectiveZoomConnection then perspectiveZoomConnection:Disconnect()perspectiveZoomConnection=nil end
 if perspectivePinchConnection then perspectivePinchConnection:Disconnect()perspectivePinchConnection=nil end
 if perspectiveInputBeganConnection then perspectiveInputBeganConnection:Disconnect()perspectiveInputBeganConnection=nil end
 if perspectiveInputEndedConnection then perspectiveInputEndedConnection:Disconnect()perspectiveInputEndedConnection=nil end
 if perspectiveTouchStartedConnection then perspectiveTouchStartedConnection:Disconnect()perspectiveTouchStartedConnection=nil end
 if perspectiveTouchMovedConnection then perspectiveTouchMovedConnection:Disconnect()perspectiveTouchMovedConnection=nil end
 if perspectiveTouchEndedConnection then perspectiveTouchEndedConnection:Disconnect()perspectiveTouchEndedConnection=nil end
 perspectivePinchScale=nil
 perspectiveRotating=false
 perspectiveTouch=nil
 perspectiveLastTouch=nil
 perspectivePinching=false
 pcall(function()U.MouseBehavior=Enum.MouseBehavior.Default end)
 local camera=W[_0xc0[7]]
 if shouldRestore and camera then
  camera[_0xc0[8]]=perspectiveSavedType or Enum.CameraType.Custom
  if perspectiveSavedSubject and perspectiveSavedSubject[_0xc0[2]]then
   camera[_0xc0[9]]=perspectiveSavedSubject
  else
   local character=gc()
   local humanoid=character and _0xc1(character,6,_0xc0[4])
   if humanoid then camera[_0xc0[9]]=humanoid end
  end
  if perspectiveSavedCFrame then camera[_0xc0[10]]=perspectiveSavedCFrame end
 end
 perspectiveSavedType=nil
 perspectiveSavedSubject=nil
 perspectiveSavedCFrame=nil
end
local function _0xc3(target)
 _0xc2()
 local character=target and target[_0xc0[1]]
 local root=character and _0xc1(character,5,_0xc0[3])
 local camera=W[_0xc0[7]]
 if not target or target[_0xc0[2]]~=P or not root or not camera then return false end
 perspectiveSavedType=camera[_0xc0[8]]
 perspectiveSavedSubject=camera[_0xc0[9]]
 perspectiveSavedCFrame=camera[_0xc0[10]]
 perspectiveTarget=target
 perspectiveActive=true
 perspectiveHeight=PERSPECTIVE_DEFAULT_HEIGHT
 perspectiveTargetHeight=PERSPECTIVE_DEFAULT_HEIGHT
 _0xc4(root)
 camera[_0xc0[8]]=Enum.CameraType.Scriptable
 perspectiveInputBeganConnection=U.InputBegan:Connect(function(input,processed)
  if not perspectiveActive or processed or pointerOverPerspectiveGui(input.Position)then return end
  if input.UserInputType==Enum.UserInputType.MouseButton2 then
   perspectiveRotating=true
   pcall(function()U.MouseBehavior=Enum.MouseBehavior.LockCurrentPosition end)
  end
 end)
 perspectiveInputEndedConnection=U.InputEnded:Connect(function(input)
  if input.UserInputType==Enum.UserInputType.MouseButton2 then
   perspectiveRotating=false
   pcall(function()U.MouseBehavior=Enum.MouseBehavior.Default end)
  end
 end)
 perspectiveZoomConnection=U.InputChanged:Connect(function(input,processed)
  if not perspectiveActive or processed then return end
  if input.UserInputType==Enum.UserInputType.MouseWheel then
   if pointerOverPerspectiveGui(U:GetMouseLocation())then return end
   perspectiveTargetHeight=math.clamp(perspectiveTargetHeight-input.Position.Z*4,PERSPECTIVE_MIN_HEIGHT,PERSPECTIVE_MAX_HEIGHT)
  elseif perspectiveRotating and input.UserInputType==Enum.UserInputType.MouseMovement then
   perspectiveYaw-=input.Delta.X*.006
   perspectivePitch=math.clamp(perspectivePitch-input.Delta.Y*.006,math.rad(-89),math.rad(80))
  end
 end)
 perspectivePinchConnection=U.TouchPinch:Connect(function(touches,scale,velocity,state,processed)
  if not perspectiveActive or processed then return end
  if state==Enum.UserInputState.Begin then
   perspectivePinching=true
   perspectiveTouch=nil
   perspectiveLastTouch=nil
   perspectivePinchScale=scale
  elseif state==Enum.UserInputState.Change then
   local previous=perspectivePinchScale or scale
   if previous>0 and scale>0 then
    perspectiveTargetHeight=math.clamp(perspectiveTargetHeight/(scale/previous),PERSPECTIVE_MIN_HEIGHT,PERSPECTIVE_MAX_HEIGHT)
   end
   perspectivePinchScale=scale
  else
   perspectivePinching=false
   perspectivePinchScale=nil
  end
 end)
 perspectiveTouchStartedConnection=U.TouchStarted:Connect(function(touch,processed)
  if not perspectiveActive or processed or perspectivePinching or perspectiveTouch or pointerOverPerspectiveGui(touch.Position)then return end
  perspectiveTouch=touch
  perspectiveLastTouch=touch.Position
 end)
 perspectiveTouchMovedConnection=U.TouchMoved:Connect(function(touch,processed)
  if not perspectiveActive or processed or perspectivePinching or touch~=perspectiveTouch or not perspectiveLastTouch then return end
  local delta=touch.Position-perspectiveLastTouch
  perspectiveLastTouch=touch.Position
  perspectiveYaw-=delta.X*.007
  perspectivePitch=math.clamp(perspectivePitch-delta.Y*.007,math.rad(-89),math.rad(80))
 end)
 perspectiveTouchEndedConnection=U.TouchEnded:Connect(function(touch)
  if touch==perspectiveTouch then perspectiveTouch=nil perspectiveLastTouch=nil end
 end)
 perspectiveConnection=R.RenderStepped:Connect(function(dt)
  if not perspectiveActive or not cE or perspectiveTarget~=selectedTarget()or perspectiveTarget[_0xc0[2]]~=P then
   _0xc2()
   return
  end
  camera=W[_0xc0[7]]
  character=perspectiveTarget[_0xc0[1]]
  root=character and _0xc1(character,5,_0xc0[3])
  if not camera or not root or not root[_0xc0[2]]then
   _0xc2()
   return
  end
  perspectiveHeight+=(perspectiveTargetHeight-perspectiveHeight)*(1-math.exp(-10*dt))
  local focus=root[_0xc0[12]]+Vector3.new(0,1,0)
  local rotation=CFrame.Angles(0,perspectiveYaw,0)*CFrame.Angles(perspectivePitch,0,0)
  local position=focus+rotation:VectorToWorldSpace(Vector3.new(0,0,perspectiveHeight))
  camera[_0xc0[8]]=Enum.CameraType.Scriptable
  camera[_0xc0[10]]=CFrame.lookAt(position,focus)
  camera[_0xc0[11]]=CFrame.new(focus)
 end)
 return true
end

local flB=Instance.new("TextButton")flB.Size=UDim2.new(1,0,0,40)flB.Position=UDim2.new(0,0,0,70)flB.BackgroundColor3=Color3.fromRGB(5,52,34)flB.Text="ACTIVAR"flB.TextColor3=C.GREEN flB.TextSize=13 flB.Font=Enum.Font.GothamBold flB.BorderSizePixel=0 flB.Parent=ct mc(7,flB)local flBStroke=ms(Color3.fromRGB(0,180,96),1,flB)
local function mkT(t,y,on)local b=Instance.new("TextButton")b.Size=UDim2.new(1,0,0,34)b.Position=UDim2.new(0,0,0,y)b.BackgroundColor3=on and C.DIM or C.PANEL b.Text=t..(on and "   ACTIVO" or "   INACTIVO")b.TextColor3=on and C.WHITE or C.GREY b.TextSize=11 b.Font=Enum.Font.GothamBold b.TextXAlignment=Enum.TextXAlignment.Left b.BorderSizePixel=0 b.Parent=ct mc(9,b)local s=ms(on and C.PURPLE or C.STROKE,1,b)local pd=Instance.new("UIPadding")pd.PaddingLeft=UDim.new(0,12)pd.Parent=b local function ss(o)b.BackgroundColor3=o and Color3.fromRGB(8,54,37)or C.PANEL b.TextColor3=o and C.WHITE or C.GREY s.Color=o and C.PURPLE or C.STROKE end return b,ss end
local modoBtn=Instance.new("TextButton")modoBtn.Size=UDim2.new(1,0,0,34)modoBtn.Position=UDim2.new(0,0,0,116)modoBtn.BackgroundColor3=C.PANEL modoBtn.Text="MODO: CINTURA"modoBtn.TextColor3=C.CYAN modoBtn.TextSize=11 modoBtn.Font=Enum.Font.GothamBold modoBtn.TextXAlignment=Enum.TextXAlignment.Left modoBtn.BorderSizePixel=0 modoBtn.Parent=ct mc(7,modoBtn)ms(C.STROKE,1,modoBtn)
local pd=Instance.new("UIPadding")pd.PaddingLeft=UDim.new(0,10)pd.Parent=modoBtn
local balloonChoice="ValentineBalloon"
local OBJECT_SELECTED=Color3.fromRGB(112,72,210)
local OBJECT_STROKE=Color3.fromRGB(168,125,255)
local balloonFrame=Instance.new("Frame")
balloonFrame.Size=UDim2.new(1,0,0,32)
balloonFrame.Position=UDim2.new(0,0,0,478)
balloonFrame.BackgroundTransparency=1
balloonFrame.Parent=ct
local valentineB=Instance.new("TextButton")
valentineB.Size=UDim2.new(.5,-3,1,0)
valentineB.BackgroundColor3=OBJECT_SELECTED
valentineB.Text="VALENTINE"
valentineB.TextColor3=C.WHITE
valentineB.TextSize=10
valentineB.Font=Enum.Font.GothamBold
valentineB.BorderSizePixel=0
valentineB.Parent=balloonFrame
mc(9,valentineB)local valentineStroke=ms(OBJECT_STROKE,1,valentineB)
local newYearB=Instance.new("TextButton")
newYearB.Size=UDim2.new(.5,-3,1,0)
newYearB.Position=UDim2.new(.5,3,0,0)
newYearB.BackgroundColor3=C.PANEL
newYearB.Text="NEW YEAR"
newYearB.TextColor3=C.GREY
newYearB.TextSize=10
newYearB.Font=Enum.Font.GothamBold
newYearB.BorderSizePixel=0
newYearB.Parent=balloonFrame
mc(9,newYearB)local newYearStroke=ms(C.STROKE,1,newYearB)
local function selectBalloon(name)
 if cE or cCleaning then return end
 balloonChoice=name
 local valentine=name=="ValentineBalloon"
 valentineB.BackgroundColor3=valentine and OBJECT_SELECTED or C.PANEL
 valentineB.TextColor3=valentine and C.WHITE or C.GREY
 newYearB.BackgroundColor3=valentine and C.PANEL or OBJECT_SELECTED
 newYearB.TextColor3=valentine and C.GREY or C.WHITE
 valentineStroke.Color=valentine and OBJECT_STROKE or C.STROKE
 newYearStroke.Color=valentine and C.STROKE or OBJECT_STROKE
end
valentineB.MouseButton1Click:Connect(function()selectBalloon("ValentineBalloon")end)
newYearB.MouseButton1Click:Connect(function()selectBalloon("NewYearBalloon")end)
local perspectiveFrame=Instance.new("Frame")
perspectiveFrame.Size=UDim2.new(1,0,0,32)
perspectiveFrame.Position=UDim2.new(0,0,0,516)
perspectiveFrame.BackgroundTransparency=1
perspectiveFrame.Parent=ct
local perspectiveButtons={}
local perspectiveOptions={{"CENTRAL",_0xc0[26]},{"FRONTAL",_0xc0[28]},{"TRASERA",_0xc0[27]}}
for index,option in ipairs(perspectiveOptions)do
 local button=Instance.new("TextButton")
 button.Size=UDim2.new(1/3,-4,1,0)
 button.Position=UDim2.new((index-1)/3,index==1 and 0 or 2,0,0)
 button.BackgroundColor3=option[2]==perspectiveMode and C.PURPLE or C.PANEL
 button.Text=option[1]
 button.TextColor3=option[2]==perspectiveMode and C.WHITE or C.GREY
 button.TextSize=9
 button.Font=Enum.Font.GothamBold
 button.BorderSizePixel=0
 button.Parent=perspectiveFrame
  mc(9,button)
 perspectiveButtons[option[2]]=button
 button.MouseButton1Click:Connect(function()
  perspectiveMode=option[2]
  if perspectiveActive and perspectiveTarget then
   local character=perspectiveTarget.Character
   local root=character and character:FindFirstChild("HumanoidRootPart")
   if root then _0xc4(root)end
  end
  for mode,item in pairs(perspectiveButtons)do
   item.BackgroundColor3=mode==perspectiveMode and C.PURPLE or C.PANEL
   item.TextColor3=mode==perspectiveMode and C.WHITE or C.GREY
  end
 end)
end
ct.CanvasSize=UDim2.new(0,0,0,560)
local tT,sT=mkT("FLING POR CONTACTO",156,false)
local sTog,sS=mkT("SIT KILL",196,false)sTog.Text="SIT KILL: INACTIVO"
local skipB=Instance.new("TextButton")skipB.Size=UDim2.new(1,0,0,36)skipB.Position=UDim2.new(0,0,0,278)skipB.BackgroundColor3=Color3.fromRGB(25,57,84)skipB.Text="SIGUIENTE OBJETIVO   →"skipB.TextColor3=Color3.fromRGB(153,220,255)skipB.TextSize=11 skipB.Font=Enum.Font.GothamBold skipB.BorderSizePixel=0 skipB.Parent=ct mc(9,skipB)ms(Color3.fromRGB(44,105,144),1,skipB)
local stopB=Instance.new("TextButton")stopB.Size=UDim2.new(1,0,0,36)stopB.Position=UDim2.new(0,0,0,320)stopB.BackgroundColor3=Color3.fromRGB(69,27,40)stopB.Text="■  DETENER TODO"stopB.TextColor3=Color3.fromRGB(255,157,171)stopB.TextSize=11 stopB.Font=Enum.Font.GothamBold stopB.BorderSizePixel=0 stopB.Parent=ct mc(9,stopB)ms(Color3.fromRGB(127,49,68),1,stopB)

local resetFrame=Instance.new("Frame")
resetFrame.Size=UDim2.new(1,0,0,36)
resetFrame.Position=UDim2.new(0,0,0,362)
resetFrame.BackgroundColor3=Color3.fromRGB(22,27,46)
resetFrame.BorderSizePixel=0
resetFrame.Parent=ct
mc(9,resetFrame)
ms(C.STROKE,1,resetFrame)
local resetLabel=Instance.new("TextLabel")
resetLabel.Size=UDim2.new(1,-16,1,0)
resetLabel.Position=UDim2.new(0,8,0,0)
resetLabel.BackgroundTransparency=1
resetLabel.Text="REINICIOS: 0"
resetLabel.TextColor3=C.GREY
resetLabel.TextSize=11
resetLabel.Font=Enum.Font.GothamBold
resetLabel.TextXAlignment=Enum.TextXAlignment.Left
resetLabel.Parent=resetFrame

updateResetLabel = function()
	if selectedPlayer and selectedPlayer.Parent == P then
		resetLabel.Text = "REINICIOS: "..resetCount.."  ("..playerLabel(selectedPlayer)..")"
	else
		resetLabel.Text = "REINICIOS: 0  (ninguno)"
	end
end
updateResetLabel()

local sl=Instance.new("TextLabel")sl.Size=UDim2.new(1,0,0,30)sl.Position=UDim2.new(0,0,0,404)sl.BackgroundColor3=Color3.fromRGB(12,18,30)sl.BackgroundTransparency=0 sl.BorderSizePixel=0 sl.Text="   ●  LISTO"sl.TextColor3=Color3.fromRGB(116,207,162)sl.TextSize=10 sl.Font=Enum.Font.GothamMedium sl.TextXAlignment=Enum.TextXAlignment.Left sl.Parent=ct mc(9,sl)ms(C.STROKE,1,sl)
local rail=Instance.new("Frame")rail.Size=UDim2.new(1,-24,0,80)rail.Position=UDim2.new(0,12,0,66)rail.BackgroundColor3=Color3.fromRGB(3,14,10)rail.BorderSizePixel=0 rail.Parent=mf mc(8,rail)ms(Color3.fromRGB(20,103,70),1,rail)
local railAccent=Instance.new("Frame")railAccent.Size=UDim2.new(0,4,1,-14)railAccent.Position=UDim2.new(0,0,0,7)railAccent.BackgroundColor3=C.CYAN railAccent.BorderSizePixel=0 railAccent.Parent=rail mc(2,railAccent)mg(C.CYAN,C.PURPLE,90,railAccent)
local railTitle=Instance.new("TextLabel")railTitle.Size=UDim2.new(0,180,0,18)railTitle.Position=UDim2.new(0,12,0,4)railTitle.BackgroundTransparency=1 railTitle.Text="CONTROLES"railTitle.TextColor3=C.GREY railTitle.TextSize=11 railTitle.Font=Enum.Font.RobotoMono railTitle.TextXAlignment=Enum.TextXAlignment.Left railTitle.Parent=rail
ct.Size=UDim2.new(1,-24,1,-166)ct.Position=UDim2.new(0,12,0,154)ct.CanvasSize=UDim2.new(0,0,0,280)ct.ScrollBarThickness=3
il.Text="CONFIGURACIÓN"
flB.Parent=rail flB.Size=UDim2.new(0,154,0,42)flB.Position=UDim2.new(0,10,0,29)flB.TextWrapped=true flB.TextSize=12
skipB.Parent=rail skipB.Size=UDim2.new(0,148,0,42)skipB.Position=UDim2.new(0,174,0,29)skipB.Text="SIGUIENTE"skipB.TextColor3=C.CYAN skipB.BackgroundColor3=Color3.fromRGB(5,33,27)skipB.TextWrapped=true skipB.TextSize=12
stopB.Parent=rail stopB.Size=UDim2.new(0,164,0,42)stopB.Position=UDim2.new(0,332,0,29)stopB.Text="DETENER"stopB.TextWrapped=true stopB.TextSize=12
updateCommandLayout=function()
 local count=0
 for _,candidate in ipairs(P:GetPlayers())do if candidate~=pl and selectedPlayerIds[candidate.UserId]then count=count+1 end end
 local multiple=count>=2
 skipB.Visible=multiple
 if multiple then
  flB.Size=UDim2.new(0,154,0,42)flB.Position=UDim2.new(0,10,0,29)
  skipB.Size=UDim2.new(0,148,0,42)skipB.Position=UDim2.new(0,174,0,29)
  stopB.Size=UDim2.new(0,164,0,42)stopB.Position=UDim2.new(0,332,0,29)
 else
  flB.Size=UDim2.new(.5,-15,0,42)flB.Position=UDim2.new(0,10,0,29)
  stopB.Size=UDim2.new(.5,-15,0,42)stopB.Position=UDim2.new(.5,5,0,29)
 end
end
updateCommandLayout()
resetFrame.Parent=ct resetFrame.Size=UDim2.new(.48,0,0,30)resetFrame.Position=UDim2.new(0,0,0,206)
resetLabel.Size=UDim2.new(1,-12,1,0)resetLabel.Position=UDim2.new(0,6,0,0)resetLabel.TextSize=10 resetLabel.TextWrapped=false
sl.Parent=ct sl.Size=UDim2.new(.5,-4,0,30)sl.Position=UDim2.new(.5,4,0,206)sl.TextSize=10 sl.TextWrapped=false
modoBtn.Size=UDim2.new(.49,-4,0,34)modoBtn.Position=UDim2.new(0,0,0,70)
tT.Size=UDim2.new(.51,-4,0,34)tT.Position=UDim2.new(.49,4,0,70)
sTog.Size=UDim2.new(1,0,0,34)sTog.Position=UDim2.new(0,0,0,110)
balloonFrame.Size=UDim2.new(.49,-4,0,36)balloonFrame.Position=UDim2.new(0,0,0,150)
perspectiveFrame.Size=UDim2.new(.51,-4,0,36)perspectiveFrame.Position=UDim2.new(.49,4,0,150)
for _,node in ipairs(mf:GetDescendants())do
 if node:IsA("TextLabel")or node:IsA("TextButton")or node:IsA("TextBox")then
  if node:IsA("TextButton")or node:IsA("TextBox")then node.Font=Enum.Font.GothamBold else node.Font=Enum.Font.RobotoMono end
  node.TextStrokeTransparency=1
  if node.TextSize<11 then node.TextSize=11 end
 end
end
playerBtn.Font=Enum.Font.GothamMedium
playerBtn.TextColor3=Color3.fromRGB(232,238,235)
playerBtn.TextStrokeTransparency=1
playerBtnStroke.Color=Color3.fromRGB(52,78,67)
playerBtnStroke.Transparency=.3
local confirmShade=Instance.new("Frame")confirmShade.Size=UDim2.new(1,0,1,0)confirmShade.BackgroundColor3=Color3.fromRGB(0,0,0)confirmShade.BackgroundTransparency=0.2 confirmShade.BorderSizePixel=0 confirmShade.Active=true confirmShade.Visible=false confirmShade.ZIndex=300 confirmShade.Parent=mf
local confirmBox=Instance.new("Frame")confirmBox.Size=UDim2.new(0,300,0,150)confirmBox.Position=UDim2.new(0.5,-150,0.5,-75)confirmBox.BackgroundColor3=C.PANEL confirmBox.BorderSizePixel=0 confirmBox.ZIndex=301 confirmBox.Parent=confirmShade mc(10,confirmBox)ms(C.PURPLE,2,confirmBox)
local confirmTitle=Instance.new("TextLabel")confirmTitle.Size=UDim2.new(1,-24,0,58)confirmTitle.Position=UDim2.new(0,12,0,12)confirmTitle.BackgroundTransparency=1 confirmTitle.Text="¿ESTÁS SEGURO?\nSe detendrán y limpiarán todos los flujos."confirmTitle.TextWrapped=true confirmTitle.TextColor3=C.WHITE confirmTitle.TextSize=14 confirmTitle.Font=Enum.Font.GothamBold confirmTitle.ZIndex=302 confirmTitle.Parent=confirmBox
local confirmYes=Instance.new("TextButton")confirmYes.Size=UDim2.new(0.5,-18,0,42)confirmYes.Position=UDim2.new(0,12,1,-54)confirmYes.BackgroundColor3=C.RED confirmYes.Text="SÍ, CERRAR"confirmYes.TextColor3=C.WHITE confirmYes.TextSize=12 confirmYes.Font=Enum.Font.GothamBold confirmYes.BorderSizePixel=0 confirmYes.ZIndex=302 confirmYes.Parent=confirmBox mc(6,confirmYes)
local confirmNo=Instance.new("TextButton")confirmNo.Size=UDim2.new(0.5,-18,0,42)confirmNo.Position=UDim2.new(0.5,6,1,-54)confirmNo.BackgroundColor3=C.DIM confirmNo.Text="NO"confirmNo.TextColor3=C.WHITE confirmNo.TextSize=12 confirmNo.Font=Enum.Font.GothamBold confirmNo.BorderSizePixel=0 confirmNo.ZIndex=302 confirmNo.Parent=confirmBox mc(6,confirmNo)
local function ss(t)
 if t=="idle"then sl.Text="   ●  LISTO"sl.TextColor3=Color3.fromRGB(116,207,162)
 else sl.Text="   ●  "..string.upper(tostring(t))sl.TextColor3=C.GREY end
end
local function _0xc5(target,runToken,itemName,targetCharacter,cycleValid)
 local function valid()
  return cE and runToken==cToken and target==selectedTarget()and target[_0xc0[2]]==P and target[_0xc0[1]]==targetCharacter and cycleValid()
 end
 while valid()do
  while valid()do
   local character=gc()
   local root=character and _0xc1(character,5,_0xc0[3])
   local targetRoot=targetCharacter and _0xc1(targetCharacter,5,_0xc0[3])
   if not root or not targetRoot then return false,"objetivo no disponible"end
   if(root[_0xc0[12]]-targetRoot[_0xc0[12]]).Magnitude<=math.max(12,cinturaDepth+1)then break end
   R.Heartbeat:Wait()
  end
  if not valid()then return false,"cancelado"end
  local remotes=_0xc1(game:GetService(_0xc0[19]),5,_0xc0[14])
  local equipRemote=remotes and _0xc1(remotes,5,_0xc0[15])
  if not equipRemote or not _0xc1(equipRemote,29,_0xc0[16])then ss("conexión para equipar no disponible")return false,"conexión no disponible"end
  ss("solicitando "..itemName.." para "..target.Name.."...")
  local ok,result=pcall(function()return _0xc1(equipRemote,20,itemName)end)
  if not ok or result==false then ss("reintentando "..itemName.."...")task.wait(.5)continue end
  local deadline=tick()+5
  local tool=nil
  while valid()and tick()<deadline do
   local character=gc()
   local backpack=_0xc1(pl,6,_0xc0[13])
   tool=(character and _0xc1(character,5,itemName))or(backpack and _0xc1(backpack,5,itemName))
   if tool and _0xc1(tool,29,_0xc0[17])then
    if tool[_0xc0[2]]~=character then
     local humanoid=character and _0xc1(character,6,_0xc0[4])
     if not humanoid then return false,"personaje no disponible"end
     if not pcall(function()_0xc1(humanoid,18,tool)end)then tool=nil break end
    end
    if tool[_0xc0[2]]==character then break end
   end
   R.Heartbeat:Wait()
  end
  if not valid()then return false,"cancelado"end
  if not tool or tool[_0xc0[2]]~=gc()then ss("el globo no llegó; reintentando...")task.wait(.35)continue end
  ss("esperando colocación en "..target.Name.."...")
  while valid()do
   local character=gc()
   local backpack=_0xc1(pl,6,_0xc0[13])
   if tool[_0xc0[2]]~=character and tool[_0xc0[2]]~=backpack then ss("objeto colocado en "..target.Name)return true,"colocado"end
   R.Heartbeat:Wait()
  end
  return false,"cancelado"
 end
 return false,"cancelado"
end
local function _0xc6()
 local character=gc()
 if not character then return true end
 local tool=_0xc1(character,5,_0xc0[21])or _0xc1(character,5,_0xc0[22])
 if not tool or not _0xc1(tool,29,_0xc0[17])then return true end
 local remotes=_0xc1(game:GetService(_0xc0[19]),5,_0xc0[14])
 local clearRemote=remotes and _0xc1(remotes,5,_0xc0[23])
 if not clearRemote or not _0xc1(clearRemote,29,_0xc0[24])then ss("conexión de limpieza no disponible")return false end
 ss("retirando globo antes de regresar...")
 for attempt=1,3 do
  if not tool[_0xc0[2]]then return true end
  local ok=pcall(function()_0xc1(clearRemote,25,true)end)
  if not ok then return false end
  local deadline=tick()+1.5
  while tool[_0xc0[2]]and tick()<deadline do R.Heartbeat:Wait()end
  if not tool[_0xc0[2]]then ss("globo retirado")return true end
  if attempt<3 then task.wait(.25)end
 end
 ss("no se confirmó la retirada del globo")
 return false
end
local launcherSize=mob and 50 or 60
local mB=Instance.new("TextButton")mB.Size=UDim2.new(0,launcherSize,0,launcherSize)mB.Position=UDim2.new(0,20,0.5,-launcherSize/2)mB.BackgroundColor3=Color3.fromRGB(2,15,10)mB.Text=""mB.AutoButtonColor=false mB.BorderSizePixel=0 mB.ClipsDescendants=true mB.Visible=false mB.ZIndex=100 mB.Parent=sg mc(mob and 11 or 14,mB)ms(Color3.fromRGB(0,220,116),2,mB)
local mBTitle=Instance.new("TextLabel")mBTitle.Size=UDim2.new(1,0,1,0)mBTitle.BackgroundTransparency=1 mBTitle.Text="Abrir"mBTitle.TextColor3=C.WHITE mBTitle.TextSize=mob and 10 or 12 mBTitle.Font=Enum.Font.GothamBold mBTitle.TextStrokeColor3=Color3.fromRGB(0,22,12)mBTitle.TextStrokeTransparency=.25 mBTitle.ZIndex=103 mBTitle.Parent=mB
for column=1,3 do
 local digits=Instance.new("TextLabel")digits.Size=UDim2.new(0,14,0,90)digits.Position=UDim2.new(0,5+(column-1)*18,0,-90-math.random(0,40))digits.BackgroundTransparency=1 digits.Text="0\n1\n1\n0\n1"digits.TextColor3=Color3.fromRGB(0,255,136)digits.TextTransparency=.55 digits.TextSize=9 digits.Font=Enum.Font.RobotoMono digits.TextYAlignment=Enum.TextYAlignment.Top digits.ZIndex=101 digits.Parent=mB
 task.spawn(function()while digits.Parent do digits.Position=UDim2.new(0,5+(column-1)*18,0,-95-math.random(0,35))local tween=T:Create(digits,TweenInfo.new(3.5+math.random()*2.5,Enum.EasingStyle.Linear),{Position=UDim2.new(0,5+(column-1)*18,1,8)})tween:Play()tween.Completed:Wait()end end)
end
local dr,ds,sp
local function isInteractivePoint(position)
 local ok,objects=pcall(function()return pl.PlayerGui:GetGuiObjectsAtPosition(position.X,position.Y)end)
 if not ok then return false end
 for _,object in ipairs(objects)do
  local current=object
  while current and current~=mf do
   if current:IsA("TextButton")or current:IsA("TextBox")then return true end
   current=current.Parent
  end
 end
 return false
end
local function beginDrag(i)
if i.UserInputType~=Enum.UserInputType.MouseButton1 and i.UserInputType~=Enum.UserInputType.Touch then return end
 if isInteractivePoint(i.Position)then return end
 dr=true ds=i.Position sp=mf.Position ct.ScrollingEnabled=false
 i.Changed:Connect(function()if i.UserInputState==Enum.UserInputState.End then dr=false ct.ScrollingEnabled=true end end)
end
for _,dragSurface in ipairs({mf,tb,ct,rail,matrixLayer})do dragSurface.InputBegan:Connect(beginDrag)end
dragInputConn=U.InputChanged:Connect(function(i)
if not dr or(i.UserInputType~=Enum.UserInputType.MouseMovement and i.UserInputType~=Enum.UserInputType.Touch)then return end
local d=i.Position-ds
mf.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)
end)
local nY=-10
local function nt(t,m,d)d=d or 3 local n=Instance.new("Frame")n.Size=UDim2.new(0,260,0,56)n.Position=UDim2.new(1,10,1,nY-56)n.BackgroundColor3=C.PANEL n.BorderSizePixel=0 n.ZIndex=200 n.Parent=sg mc(6,n)ms(C.PURPLE,1,n)local a=Instance.new("TextLabel")a.Size=UDim2.new(1,-12,0,20)a.Position=UDim2.new(0,10,0,6)a.BackgroundTransparency=1 a.Text=t a.TextColor3=C.WHITE a.TextSize=12 a.Font=Enum.Font.GothamBold a.TextXAlignment=Enum.TextXAlignment.Left a.ZIndex=201 a.Parent=n local b=Instance.new("TextLabel")b.Size=UDim2.new(1,-12,0,20)b.Position=UDim2.new(0,10,0,28)b.BackgroundTransparency=1 b.Text=m b.TextColor3=C.GREY b.TextSize=11 b.Font=Enum.Font.Gotham b.TextXAlignment=Enum.TextXAlignment.Left b.TextWrapped=true b.ZIndex=201 b.Parent=n T:Create(n,TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(1,-270,1,nY-56)}):Play()task.delay(d,function()T:Create(n,TweenInfo.new(0.25),{Position=UDim2.new(1,10,1,nY-56)}):Play()task.wait(0.3)n:Destroy()end)end
local matar

local SIT={
VOID_DEPTH=220,
OWN_TRIES=3,
OWN_FRAMES=3,
DRAG_TIME=0.45,
HOLD_TIME=0.85,
CONFIRM_TIMEOUT=2.0,
MAX_ATTEMPTS=10,
RETRY_DELAYS={0.20,0.25,0.30,0.35,0.40,0.45,0.50,0.55,0.60},
COOLDOWN=0.60,
MAX_ATTEMPTS_PER_TARGET=16,
RESET_RELEASE=0.35,
}
local function sitOwns(character)
local root=character and character:FindFirstChild("HumanoidRootPart")
if not root then return false end
local ok,owner=pcall(function()return root:GetNetworkOwner()end)
return ok and owner==pl
end
local function sitOwnRoot(character,root)
if not root or not root.Parent then return false end
if root.Anchored then pcall(function()root.Anchored=false end)end
pcall(function()root:SetNetworkOwner(pl)end)
if sitOwns(character)then return true end
pcall(function()root:SetNetworkOwner(nil)end)
R.Heartbeat:Wait()
if not root.Parent then return false end
if root.Anchored then pcall(function()root.Anchored=false end)end
pcall(function()root:SetNetworkOwner(pl)end)
return sitOwns(character)
end
local function sitOwnAll(character)
local ok=false
for _,p in ipairs(character:GetDescendants())do
if p:IsA("BasePart")then
if p.Anchored then pcall(function()p.Anchored=false end)end
if pcall(function()p:SetNetworkOwner(pl)end)then ok=true end
end
end
return ok
end
local function sitTakeOwnership(character,root)
for _=1,SIT.OWN_TRIES do
if sitOwnRoot(character,root)then return true end
R.Heartbeat:Wait()
end
return false
end
local function sitSnap(character)
local snap={}
for _,p in ipairs(character:GetDescendants())do
if p:IsA("BasePart")then snap[p]={p.Anchored,p.CanCollide,p.Massless,p.CFrame}end
end
return snap
end
local function sitFree(character)
for _,p in ipairs(character:GetDescendants())do
if p:IsA("BasePart")then
pcall(function()p.Anchored=false end)
pcall(function()p.CanCollide=false end)
pcall(function()p.Massless=true end)
end
end
pcall(function()
for _,m in ipairs(character:GetDescendants())do
if m:IsA("Motor6D")then m.Enabled=true end
end
end)
for _,s in ipairs(character:GetDescendants())do
local w=s:FindFirstChild("SeatWeld")
if w and w:IsA("Weld")then pcall(function()w:Destroy()end)end
end
end
local function sitRestore(snap)
for p,s in pairs(snap)do
if p and p.Parent then
pcall(function()p.CanCollide=s[2]end)
pcall(function()p.Massless=s[3]end)
pcall(function()p.CFrame=s[4]end)
pcall(function()p.Anchored=s[1]end)
end
end
end
local function sitDead(ch,hum)
if not ch or not ch.Parent then return true end
if not hum or not hum.Parent then return true end
if hum.Health<=0 then return true end
local ok,name=pcall(function()return hum:GetState().Name end)
return ok and name=="Dead"
end
matar=function(ch,tp,vehicleToken)
local function active()return sE end
if not active()then return end
if not tp or tp~=selectedTarget()or ch~=tp.Character then return end
if not ch or not ch.Parent then return end
local hrp=ch:FindFirstChild("HumanoidRootPart")
local hum=ch:FindFirstChildOfClass("Humanoid")
if not hrp or not hum then return end
task.spawn(function()
local effectMode="ORIGINAL"
local useHealth,useDamage,useDead=true,true,true
local function valid()return active()and tp==selectedTarget()and ch==tp.Character and ch.Parent and hrp.Parent end
local snap=sitSnap(ch)
local oldMax=hum.MaxHealth
local oldWalk=hum.WalkSpeed
local killed=false
local ownedOk=0
for attempt=1,SIT.MAX_ATTEMPTS do
if not valid()then break end
pcall(function()hum.Sit=false end)
pcall(function()hum.PlatformStand=true end)
pcall(function()hum:ChangeState(Enum.HumanoidStateType.GettingUp)end)
pcall(function()hum.WalkSpeed=0 end)
pcall(function()hum.BreakJointsOnDeath=true end)
pcall(function()hum.MaxHealth=math.huge end)
sitFree(ch)
sitOwnAll(ch)
local owned=sitTakeOwnership(ch,hrp)
if not valid()then break end
if owned then ownedOk=ownedOk+1 end
local anchor=grp()
local base=anchor and anchor.Position or hrp.Position
local voidPos=Vector3.new(base.X,base.Y-SIT.VOID_DEPTH,base.Z)
local dragUntil=tick()+SIT.DRAG_TIME
while tick()<dragUntil do
if not valid()then break end
sitOwnRoot(ch,hrp)
hrp.CFrame=CFrame.new(voidPos)
hrp.AssemblyLinearVelocity=Vector3.new(0,-50000,0)
hrp.AssemblyAngularVelocity=Vector3.new(99999,99999,99999)
R.Heartbeat:Wait()
end
if not valid()then break end
for _=1,SIT.OWN_FRAMES do
if not valid()then break end
pcall(function()hrp.Anchored=true end)
hrp.CFrame=CFrame.new(voidPos)
hrp.AssemblyLinearVelocity=Vector3.zero
hrp.AssemblyAngularVelocity=Vector3.zero
if useDamage then
for _,ff in ipairs(ch:GetChildren())do
if ff:IsA("ForceField")then pcall(function()ff:Destroy()end)end
end
pcall(function()hum:TakeDamage(math.huge)end)
end
if useHealth then pcall(function()hum.Health=0 end)end
if useDead then pcall(function()hum:ChangeState(Enum.HumanoidStateType.Dead)end)end
R.Heartbeat:Wait()
end
if not valid()then break end
pcall(function()ch:BreakJoints()end)
local confirmUntil=tick()+SIT.CONFIRM_TIMEOUT
local holdUntil=tick()+SIT.HOLD_TIME
while tick()<confirmUntil do
if sitDead(ch,hum)then killed=true break end
if not valid()then killed=true break end
if tick()<holdUntil then
pcall(function()hrp.Anchored=true end)
hrp.CFrame=CFrame.new(voidPos)
hrp.AssemblyLinearVelocity=Vector3.zero
hrp.AssemblyAngularVelocity=Vector3.zero
else
pcall(function()hrp.Anchored=false end)
if hum.Health>0 then
if useDamage then pcall(function()hum:TakeDamage(math.huge)end)end
if useHealth then pcall(function()hum.Health=0 end)end
end
end
R.Heartbeat:Wait()
end
local okState,stateName=pcall(function()return hum:GetState().Name end)
if killed then break end
if attempt<SIT.MAX_ATTEMPTS then
pcall(function()hrp.Anchored=false end)
task.wait(SIT.RETRY_DELAYS[math.min(attempt,#SIT.RETRY_DELAYS)])
end
end
if killed then
pcall(function()hrp.Anchored=false end)
task.wait(SIT.RESET_RELEASE)
nt("SIT KILL",tp.Name)
else
sitRestore(snap)
pcall(function()hum.MaxHealth=oldMax end)
pcall(function()hum.WalkSpeed=oldWalk end)
pcall(function()hum.PlatformStand=false end)
pcall(function()hum.Sit=false end)
nt("SIT KILL FALLÓ",tp.Name.." ("..SIT.MAX_ATTEMPTS.." intentos, "..ownedOk.." con red)",3)
end
end)
end
local function sitPerform(tch,tp,state)
local function finish(ok)
if mt[tp]==state then
state.busy=false
if ok then state.attempts=0 end
end
end
if not sE or tp~=selectedTarget()or tch~=tp.Character then return finish(false)end
local ch=gc()
local hrp=ch and ch:FindFirstChild("HumanoidRootPart")
local thrp=tch and tch:FindFirstChild("HumanoidRootPart")
local thum=tch and tch:FindFirstChildOfClass("Humanoid")
if not hrp or not thrp or not thum then return finish(false)end
local function valid()return sE and tp==selectedTarget()and tch==tp.Character and tch.Parent and thrp.Parent end
local owned=sitTakeOwnership(tch,thrp)
if not valid()then return finish(false)end
sitFree(tch)
pcall(function()thum.Sit=false end)
pcall(function()thum:ChangeState(Enum.HumanoidStateType.GettingUp)end)
local deadline=tick()+0.9
local seated=false
while tick()<deadline do
if not valid()then return finish(false)end
sitOwnRoot(tch,thrp)
thrp.CFrame=hrp.CFrame*CFrame.new(0,1.2,-2.5)
thrp.AssemblyLinearVelocity=Vector3.zero
thrp.AssemblyAngularVelocity=Vector3.zero
pcall(function()thum.Sit=true end)
pcall(function()thum:ChangeState(Enum.HumanoidStateType.Seated)end)
R.Heartbeat:Wait()
local ok,name=pcall(function()return thum:GetState().Name end)
if ok and name=="Seated"then seated=true break end
end
if not valid()then return finish(false)end
matar(tch,tp)
finish(true)
end
local function startSit()
if sC then sC:Disconnect()end
sE=true mt={}
sC=R.Heartbeat:Connect(function()
if not sE or closing then return end
local tp=selectedTarget()if not tp then return end
local ch=gc()
local hrp=ch and ch:FindFirstChild("HumanoidRootPart")
local tch=tp.Character
local thrp=tch and tch:FindFirstChild("HumanoidRootPart")
local thum=tch and tch:FindFirstChildOfClass("Humanoid")
if not hrp or not thrp or not thum then return end
local dist=(hrp.Position-thrp.Position).Magnitude
if dist>C.SIT_RADIUS or dist<0.15 then return end
local state=mt[tp]
if type(state)~="table"or state.character~=tch then
state={character=tch,busy=false,attempts=0,lastAttempt=0}
mt[tp]=state
end
if state.busy then return end
if tick()-state.lastAttempt>20 then state.attempts=0 end
if state.attempts>=SIT.MAX_ATTEMPTS_PER_TARGET then return end
local cooldown=SIT.COOLDOWN
if tick()-state.lastAttempt<cooldown then return end
state.busy=true state.lastAttempt=tick()state.attempts=state.attempts+1
task.spawn(function()sitPerform(tch,tp,state)end)
end)
ss("efecto sentado activo")
nt("SIT KILL","ataque con confirmación")
end
local function stopSit()
sE=false if sC then sC:Disconnect()sC=nil end mt={}ss("idle")nt("SIT KILL","inactivo",2)
end

local _0x30=(function(a)local b={}for c=1,#a do b[c]=_0x2d(a[c])end return b end)({
{109,66,69,79,109,66,89,88,95,104,67,66,71,79},{109,66,69,79,109,66,89,88,95,104,67,66,71,79,100,77,104,71,74,88,88},
{108,78,95,111,78,88,72,78,69,79,74,69,95,88},{98,88,106},{120,78,95,101,78,95,92,68,89,64,100,92,69,78,89},{102,68,93,78},
{104,67,74,89,74,72,95,78,89},{123,74,89,78,69,95},{123,68,88,66,95,66,68,69},{104,109,89,74,70,78},
{123,71,74,95,77,68,89,70,120,95,74,69,79},{104,74,69,104,68,71,71,66,79,78},{102,74,88,88,71,78,88,88},{106,69,72,67,68,89,78,79},{120,66,95},
{99,94,70,74,69,68,66,79,121,68,68,95,123,74,89,95},{99,94,70,74,69,68,66,79},{105,74,88,78,123,74,89,95},
{106,88,88,78,70,73,71,82,103,66,69,78,74,89,125,78,71,68,72,66,95,82},{106,88,88,78,70,73,71,82,106,69,76,94,71,74,89,125,78,71,68,72,66,95,82}
})
local function _0x31(a,b,...)return a[_0x30[b]](a,...)end
local function startFollow(tp,runToken,character,root,origin)
 stopFollow()
 if not cE or not runToken or runToken~=cToken or not root or not root[_0x30[8]]then return false end
 followActive=true
 followOrigin=origin
 followConn=R.Heartbeat:Connect(function()
  if closing or not cE or runToken~=cToken or tp~=selectedTarget() or character~=gc() or not root[_0x30[8]]then
   stopFollow()
   return
  end
  local targetChar=tp[_0x30[7]]
  local targetRoot=targetChar and _0x31(targetChar,1,_0x30[16])
  if not targetRoot or not targetRoot[_0x30[8]] or not targetChar[_0x30[8]] then
   stopFollow()
    ss("objetivo sin HRP: esperando reaparición...")
   return
  end
  local desired=targetRoot[_0x30[9]]-Vector3.new(0,cinturaDepth,0)
  root[_0x30[10]]=CFrame.new(desired)*CFrame.Angles(-math.pi/2,0,0)
  root[_0x30[19]]=Vector3.zero
  root[_0x30[20]]=Vector3.zero
 end)
 return true
end
local _0x4e=(function(a)local b={}for c=1,#a do b[c]=_0x2d(a[c])end return b end)({
 {104,98,101,127,126,121,106},{121,100,127,106,104,98,100,101},
 {106,88,88,78,70,73,71,82,103,66,69,78,74,89,125,78,71,68,72,66,95,82},
 {106,88,88,78,70,73,71,82,106,69,76,94,71,74,89,125,78,71,68,72,66,95,82},
 {123,67,82,88,66,72,88,121,78,91,121,68,68,95,123,74,89,95},
 {102,68,93,78,111,66,89,78,72,95,66,68,69,98,69,95,78,89,69,74,71},
 {99,94,70,74,69,68,66,79,121,68,68,95,123,74,89,95},
 {99,94,70,74,69,68,66,79},{105,74,88,78,123,74,89,95}
})
local function _0x56(a,b,c)return Vector3.new(a,b,c)end
local function _0x4f(a,b,c)pcall(function()sethiddenproperty(a,b,c)end)end
local function fling(tp,fromTouch,runToken)
if not tp or tp==pl or tp~=selectedTarget()then return end
if AF[tp]then return end
if fromTouch and tCd[tp]then if tick()-tCd[tp]<C.TOUCH_COOLDOWN then return end end
local ch=gc()local trc=tp[_0x30[7]]if not ch or not trc then return end
local hrp=_0x31(ch,1,_0x4e[7])local hum=_0x31(ch,2,_0x4e[8])local thrp=_0x31(trc,1,_0x4e[7])local thum=_0x31(trc,2,_0x4e[8])
if not hrp or not hum or not thrp then return end
AF[tp]=true if fromTouch then tCd[tp]=tick()end
local savedPos=hrp[_0x30[10]]
ss("fling "..tp.Name.." ["..modo.."]")nt("NaN "..modo,tp.Name,2)
hum[_0x30[11]]=true
for _,v in ipairs(_0x31(ch,3))do if _0x31(v,4,_0x4e[9])then v[_0x30[12]]=false v[_0x30[13]]=true end end
hrp[_0x30[12]]=true
for _,v in ipairs(_0x31(trc,3))do if _0x31(v,4,_0x4e[9])then pcall(function()_0x31(v,5,pl)end)end end
local _0x6e=(function(a)return a-a end)(math.huge)
local _0x7a=_0x56(_0x6e,_0x6e,_0x6e)
local st=tick()
local steps=0
local cn
cn=R.Heartbeat:Connect(function()
steps=steps+1
local elapsed=tick()-st
local cycleDone=elapsed>=C.FLING_DURATION
if closing or cycleDone or(fromTouch and not tE)or not ch[_0x30[8]]or not trc[_0x30[8]]or tp~=selectedTarget()or tp[_0x30[7]]~=trc or(runToken and(not cE or runToken~=cToken))then
cn:Disconnect()AF[tp]=nil
if cycleDone and modo==_0x4e[1] and runToken and cE and runToken==cToken and not closing and tp==selectedTarget() and trc[_0x30[8]]and ch[_0x30[8]]then
 _0x4f(hrp,_0x4e[5],nil)
 _0x4f(hum,_0x4e[6],Vector3.zero)
 if hum then hum[_0x30[11]]=false end
 for _,v in ipairs(_0x31(ch,3))do
  if _0x31(v,4,_0x4e[9])then v[_0x30[12]]=true v[_0x30[13]]=false end
 end
 if startFollow(tp,runToken,ch,hrp,savedPos) then
  ss("ancla seguidora: "..cinturaDepth.." studs")
  return
 end
end
if hrp and hrp[_0x30[8]]then hrp[_0x30[14]]=true end
for _,v in ipairs(_0x31(ch,3))do
if _0x31(v,4,_0x4e[9])then
v[_0x30[12]]=true
v[_0x30[13]]=false
v.AssemblyLinearVelocity=Vector3.zero
v.AssemblyAngularVelocity=Vector3.zero
end
end
if hum then hum[_0x30[11]]=false end
_0x4f(hrp,_0x4e[5],nil)
task.wait(0.2)
if hrp and hrp[_0x30[8]]and savedPos then hrp[_0x30[10]]=savedPos end
task.wait(0.2)
if hrp and hrp[_0x30[8]]then hrp[_0x4e[3]]=Vector3.zero hrp[_0x4e[4]]=Vector3.zero end
pcall(function()_0x31(hrp,5,pl)end)
task.wait(0.1)
if hrp and hrp[_0x30[8]]then hrp[_0x30[14]]=false end
task.wait(0.05)
if hrp and hrp[_0x30[8]]then hrp[_0x4e[3]]=Vector3.zero hrp[_0x4e[4]]=Vector3.zero end
ss("idle")
return
end
local _0xa={}
_0xa[11]=function()hrp[_0x30[10]]=CFrame.new(thrp[_0x30[9]]-Vector3.new(0,cinturaDepth,0))*CFrame.Angles(-math.pi/2,0,0)hrp[_0x4e[3]]=_0x7a hrp[_0x4e[4]]=_0x7a if thum then pcall(function()_0x31(thum,6,_0x7a)end)_0x4f(thum,_0x4e[6],_0x7a)end _0x4f(hum,_0x4e[6],_0x7a)end
_0xa[23]=function()hrp[_0x30[10]]=CFrame.new(thrp[_0x30[9]])*CFrame.Angles(math.random(-180,180)*math.pi/180,math.random(-180,180)*math.pi/180,math.random(-180,180)*math.pi/180)hrp[_0x4e[3]]=_0x56(math.random(-20000,20000),math.random(-20000,20000),math.random(-20000,20000))hrp[_0x4e[4]]=_0x56(math.random(100000,200000),math.random(100000,200000),math.random(100000,200000))end
_0xa[37]=function()hrp[_0x30[10]]=CFrame.new(thrp[_0x30[9]]+Vector3.new(0,1,0))hrp[_0x4e[3]]=_0x7a hrp[_0x4e[4]]=_0x7a if thum then pcall(function()_0x31(thum,6,_0x7a)end)end end
(_0xa[modo==_0x4e[1]and 11 or modo==_0x4e[2]and 23 or 37])()
_0x4f(hrp,_0x4e[5],thrp)
if thum then
if thum[_0x30[15]]then thum[_0x30[15]]=false end
if thum[_0x30[11]]==false then thum[_0x30[11]]=true end
end
end)
end
local function minimizar()
mz=true
T:Create(mf,TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Position=UDim2.new(0.5,-C.WIDTH/2,-0.5,0)}):Play()
task.wait(0.35)
mf.Visible=false
mB.Visible=true
end
minBtn.MouseButton1Click:Connect(minimizar)
mB.MouseButton1Click:Connect(function()
mz=false
mf.Visible=true
mf.Position=UDim2.new(0.5,-C.WIDTH/2,-0.5,0)
T:Create(mf,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-C.WIDTH/2,0.5,-C.HEIGHT/2)}):Play()
mB.Visible=false
end)
local function clrT()for _,c in pairs(tC)do if c then c:Disconnect()end end for _,c in pairs(mC)do if c then c:Disconnect()end end tC={}mC={}end
local function setupT()
clrT()if not tE then return end
local ch=gc()if not ch then return end
local mc2=R.Heartbeat:Connect(function()
if not tE then return end
local h=grp()if not h then return end
for _,plr in ipairs(P:GetPlayers())do if plr~=pl then local tc=plr.Character if tc then local th=tc:FindFirstChild("HumanoidRootPart")if th and(h.Position-th.Position).Magnitude<C.TOUCH_DISTANCE then fling(plr,true)end end end end
end)
table.insert(mC,mc2)
for _,pt in ipairs(ch:GetChildren())do if pt:IsA("BasePart")and pt.Name~="HumanoidRootPart"then local c=pt.Touched:Connect(function(h)if not tE then return end local tp=P:GetPlayerFromCharacter(h.Parent)if tp and tp~=pl then fling(tp,true)end end)table.insert(tC,c)end end
ss("contacto activo")end
local function setContinuousState(enabled)
cE=enabled
flB.Text=enabled and "DESACTIVAR"or"ACTIVAR"
flB.TextColor3=enabled and C.WHITE or C.GREEN
flB.BackgroundColor3=enabled and Color3.fromRGB(118,25,45)or Color3.fromRGB(5,52,34)
flBStroke.Color=enabled and Color3.fromRGB(255,89,116)or Color3.fromRGB(0,180,96)
flBStroke.Thickness=enabled and 1.5 or 1
end
flB.MouseButton1Click:Connect(function()
if cE then
 cToken=cToken+1
 setContinuousState(false)
 activeTarget=nil
_0xc2()
stopFollow()
tE=false clrT()sT(false)tT.Text="FLING POR CONTACTO   INACTIVO"
if sE then stopSit()end sS(false)sTog.Text="SIT KILL: INACTIVO"
ss("parando...")
nt("NaN FLING","parando ciclo",2)
return
end
if cCleaning then nt("AVISO","espera la limpieza final",2)return end
 local initialTargets=selectedTargetsSnapshot()
 if #initialTargets==0 then nt("AVISO","selecciona uno o más jugadores de la lista")return end
cToken=cToken+1
local myToken=cToken
local startCharacter=gc()
local startRoot=startCharacter and startCharacter:FindFirstChild("HumanoidRootPart")
local startHumanoid=startCharacter and startCharacter:FindFirstChildOfClass("Humanoid")
if not startRoot or not startHumanoid then nt("ERROR","personaje no disponible")return end
local origin=startRoot.CFrame
local originalPlatformStand=startHumanoid.PlatformStand
local originalRootAnchored=startRoot.Anchored
local originalPartState={}
for _,part in ipairs(startCharacter:GetDescendants())do
if part:IsA("BasePart")then originalPartState[part]={part.CanCollide,part.Massless}end
end
setContinuousState(true)
 nt("NaN CONTINUO",#initialTargets.." objetivo(s)",2)
task.spawn(function()
 local targetIndex=1
 local function waitAtActivationPoint()
  _0xc2()
  stopFollow()
  if startRoot and startRoot.Parent and startCharacter==gc()then
   startRoot.Anchored=true
   startRoot.AssemblyLinearVelocity=Vector3.zero
   startRoot.AssemblyAngularVelocity=Vector3.zero
   startRoot.CFrame=origin
   R.Heartbeat:Wait()
   startRoot.AssemblyLinearVelocity=Vector3.zero
   startRoot.AssemblyAngularVelocity=Vector3.zero
   startRoot.Anchored=originalRootAnchored
  end
 end
 while cE and myToken==cToken do
  local targets=selectedTargetsSnapshot()
  if #targets==0 then
   activeTarget=nil waitAtActivationPoint()ss("esperando jugadores seleccionados...")task.wait(.2)continue
  end
  if targetIndex>#targets then targetIndex=1 end
  local target=targets[targetIndex]
  activeTarget=target selectedPlayer=target trackPlayerDeaths(target)updateResetLabel()
  local targetSkipVersion=skipTargetVersion
 local targetCharacter=target.Character
 local targetRootAtStart=targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart")
  if #targets>1 and(not targetCharacter or not targetCharacter.Parent or not targetRootAtStart or not targetRootAtStart.Parent)then
   waitAtActivationPoint()
   ss("omitiendo "..target.Name..": sin HRP")
   targetIndex=targetIndex+1
   task.wait(.05)
   continue
  end
  if not targetCharacter or not targetCharacter.Parent or not targetRootAtStart or not targetRootAtStart.Parent then waitAtActivationPoint()end
  while cE and myToken==cToken and selectedPlayerIds[target.UserId]and target.Parent==P and(not targetCharacter or not targetCharacter.Parent or not targetRootAtStart or not targetRootAtStart.Parent)do
  _0xc2()
  stopFollow()
   ss("esperando que reaparezca "..target.Name.."...")
  task.wait(.1)
  targetCharacter=target.Character
  targetRootAtStart=targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart")
 end
  if not cE or myToken~=cToken then break end
  if target.Parent~=P or not selectedPlayerIds[target.UserId]then targetIndex=targetIndex+1 continue end
 local cycleLost=false
  local placementDone=false
 _0xc3(target)
 local targetMonitor=R.Heartbeat:Connect(function()
  if not cE or myToken~=cToken then return end
   if target.Parent~=P or not selectedPlayerIds[target.UserId]or target.Character~=targetCharacter or not targetCharacter.Parent or not targetRootAtStart.Parent or targetCharacter:FindFirstChild("HumanoidRootPart")~=targetRootAtStart then
   cycleLost=true
   stopFollow()
   ss("objetivo reinició o perdió HRP: restaurando...")
  end
 end)
  task.spawn(function()
   local placed=_0xc5(target,myToken,balloonChoice,targetCharacter,function()return not cycleLost and skipTargetVersion==targetSkipVersion end)
   if placed then placementDone=true end
  end)
  while cE and myToken==cToken and skipTargetVersion==targetSkipVersion and not cycleLost and not placementDone and target==selectedTarget()and target.Parent==P do
  if followActive then
   task.wait(0.05)
  else
    task.spawn(function()fling(target,false,myToken)end)
    R.Heartbeat:Wait()
    local deadline=tick()+C.FLING_DURATION+1
   repeat task.wait(0.05)until skipTargetVersion~=targetSkipVersion or placementDone or not AF[target]or tick()>=deadline or cycleLost or not cE or myToken~=cToken or target~=selectedTarget()or target.Parent~=P
   local settle=tick()+0.6
   repeat task.wait(0.05)until skipTargetVersion~=targetSkipVersion or placementDone or tick()>=settle or cycleLost or not cE or myToken~=cToken or target~=selectedTarget()or target.Parent~=P
  end
 end
 cCleaning=true
  local skipped=skipTargetVersion~=targetSkipVersion
 if targetMonitor then targetMonitor:Disconnect()targetMonitor=nil end
 _0xc2()
 stopFollow()
  if not placementDone then _0xc6()end
  ss(placementDone and "cambiando de objetivo..."or"limpiando y regresando...")
  if placementDone then
   task.wait(.05)
  else
   local shutdownDeadline=tick()+3
   while AF[target]and tick()<shutdownDeadline do task.wait(.05)end
   R.Heartbeat:Wait()
   R.Heartbeat:Wait()
  end
 pcall(function()sethiddenproperty(startRoot,"PhysicsRepRootPart",nil)end)
 if startRoot and startRoot.Parent and startCharacter==gc()then
  startRoot.Anchored=true
  startRoot.AssemblyLinearVelocity=Vector3.zero
  startRoot.AssemblyAngularVelocity=Vector3.zero
  for part,state in pairs(originalPartState)do
   if part and part.Parent then
    part.CanCollide=state[1]
    part.Massless=state[2]
    part.AssemblyLinearVelocity=Vector3.zero
    part.AssemblyAngularVelocity=Vector3.zero
   end
  end
  if startHumanoid and startHumanoid.Parent then
   startHumanoid.PlatformStand=originalPlatformStand
   pcall(function()startHumanoid:Move(Vector3.zero)end)
   pcall(function()sethiddenproperty(startHumanoid,"MoveDirectionInternal",Vector3.zero)end)
  end
   if not placementDone then startRoot.CFrame=origin end
  R.Heartbeat:Wait()
  startRoot.AssemblyLinearVelocity=Vector3.zero
  startRoot.AssemblyAngularVelocity=Vector3.zero
  startRoot.Anchored=originalRootAnchored
 end
 cCleaning=false
  if placementDone then
   targetIndex=targetIndex+1
   ss("siguiente objetivo...")
  elseif skipped then
   targetIndex=targetIndex+1
   ss("objetivo omitido; avanzando...")
  elseif target.Parent~=P or not selectedPlayerIds[target.UserId]then
   targetIndex=targetIndex+1
  elseif cE and myToken==cToken then ss("esperando que reaparezca "..target.Name.."...")end
end
cCleaning=false
 activeTarget=nil
_0xc2()
if myToken==cToken then setContinuousState(false)end
ss("idle")
end)
end)
skipB.MouseButton1Click:Connect(function()
if not cE then nt("SIGUIENTE OBJETIVO","activa primero el NaN",2)return end
if cCleaning then nt("SIGUIENTE OBJETIVO","espera el cambio actual",2)return end
skipTargetVersion=skipTargetVersion+1
stopFollow()
ss("omitiendo objetivo actual...")
nt("SIGUIENTE OBJETIVO","avanzando al siguiente seleccionado",2)
end)
stopB.MouseButton1Click:Connect(function()
_0xc2()
cToken=cToken+1 setContinuousState(false)
stopFollow()
tE=false clrT()sT(false)tT.Text="FLING POR CONTACTO   INACTIVO"
if sE then stopSit()end sS(false)sTog.Text="SIT KILL: INACTIVO"
ss("deteniendo y restaurando...")nt("DETENER","flujos cancelados",2)
end)
clsBtn.MouseButton1Click:Connect(function()
if not closing then confirmShade.Visible=true end
end)
confirmNo.MouseButton1Click:Connect(function()
if not closing then confirmShade.Visible=false end
end)
confirmYes.MouseButton1Click:Connect(function()
if closing then return end
closing=true
_0xc2()
confirmYes.Text="CERRANDO..."confirmNo.Active=false
cToken=cToken+1 cE=false
stopFollow()
tE=false clrT()
if sE then stopSit()end
clearDeathTracking()
flB.Text="ACTIVAR"flB.TextColor3=C.GREEN flB.BackgroundColor3=Color3.fromRGB(5,52,34)flBStroke.Color=Color3.fromRGB(0,180,96)flBStroke.Thickness=1
ss("limpiando y cerrando...")
task.spawn(function()
task.wait(0.8)
if dragInputConn then dragInputConn:Disconnect()dragInputConn=nil end
if keyInputConn then keyInputConn:Disconnect()keyInputConn=nil end
if characterAddedConn then characterAddedConn:Disconnect()characterAddedConn=nil end
if sg and sg.Parent then sg:Destroy()end
end)
end)
modoBtn.MouseButton1Click:Connect(function()
if modo=="CINTURA"then modo="ROTACION"modoBtn.Text="MODO: ROTACION"
elseif modo=="ROTACION"then modo="CLASICO"modoBtn.Text="MODO: CLASICO"
else modo="CINTURA"modoBtn.Text="MODO: CINTURA"end
nt("MODO",modo,2)
end)
tT.MouseButton1Click:Connect(function()
tE=not tE sT(tE)tT.Text="FLING POR CONTACTO   "..(tE and "ACTIVO" or "INACTIVO")
if tE then setupT()nt("CONTACTO","activo")else clrT()ss("idle")nt("CONTACTO","inactivo",2)end
end)
sTog.MouseButton1Click:Connect(function()
if sE then stopSit()sS(false)sTog.Text="SIT KILL: INACTIVO"
else startSit()sS(true)sTog.Text="SIT KILL: ACTIVO"end
end)
if not mob then keyInputConn=U.InputBegan:Connect(function(i,g)if g or closing then return end if i.KeyCode==Enum.KeyCode.X then
if mz then
mz=false
mf.Visible=true
mf.Position=UDim2.new(0.5,-C.WIDTH/2,-0.5,0)
T:Create(mf,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-C.WIDTH/2,0.5,-C.HEIGHT/2)}):Play()
mB.Visible=false
else
minimizar()
end
end end)end
characterAddedConn=pl.CharacterAdded:Connect(function()task.wait(1)if not closing and tE then setupT()end end)
task.wait(0.5)nt("CARGADO",_0x92,3)ss("idle")
print(_0x93)
