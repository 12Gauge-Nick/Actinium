Actinium = {
	['Owner'] = tostring(getfenv().owner),
	['Version'] = 1.1,
	['Colors'] = {
		'Institutional white',
		'Black',
		'Camo',
		'Really blue',
		'New Yeller',
		'Teal',
		'Navy blue',
		'Lime green',
		'Hot pink',
		'Reddish brown'
	},
	['Commands'] = {},
	['Tablets'] = {},
	['Settings'] = {
		Santex = "!",
		Suffix = ";",
		Intro = true,
	},
	['VotingData'] = {
		VoteRunning = false,
		Yes = 0,
		No = 0,
	},
	['PrivateServer'] = {
		Enabled = false,
		Mode = 'Friends'
	},
	['DataSyncing'] = {
		Key = function(player) return tostring(player) end,
		BDataName = "~TEST~[Actinium] 1.1 Banlist",
		CDataName = "~TEST~[Actinium] 1.1 User-Entered"
	},
	['AgeKick'] = {
		Enabled = false,
		KAge = 360
	},
	['Ranked'] = {
		{'Player','Creator',4,'Teal',true,false,true,false,true},
		{'jillmiles1','Creator',5,'Teal',true,false,true,true,true},
		{'GravityLegendary','Friend & scripter',3,'Teal',true,true,true,true,true},
		{'Despairus','Wire creator',3,'Teal',true,true,true,true,true},
		{'brianush1','Creator',2,'Teal',true,true,true,true,true},
		{'MessorAdmin','Creator',5,'Teal',true,false,true,true,true},
		{'adark','Creator',5,'Teal',true,false,true,true,true},
	},
	['Rules'] = {
		"Do NOT kill the creator of this admin",
		"Do NOT steal or copy this admin or any others",
		"Do NOT private server",
		"Do NOT have a GUI orb",
	},
	['Logs'] = {
		Errors = {},
		CommandChats = {},
		Enters = {},
		Scripts = {}
	},
	['Functions'] = {
		GetPlayerData = function(plr,data)
			for i,v in pairs(Actinium.Ranked) do
				if v[1]:lower() == plr.Name:lower() then
					return v[data]
				end
			end
		end,
		AddRank = function(plr,rank,desc,color)
			coroutine.resume(coroutine.create(function()
				local r,e = ypcall(function()
				for i,v in pairs(Actinium.Ranked) do
					if v[1]:lower() == plr:lower() then
						table.remove(Actinium.Ranked,i)
					end
				end
				table.insert(Actinium.Ranked,{
					plr,
					desc,
					rank,
					color,
					false,
					false,
					false,
					false,
					false
				})
				end)
				if not r then print(e) end
			end))
		end,
		NewDesc = function(plr,desc)
			for i,v in pairs(Actinium.Ranked) do
				if v[1]:lower() == plr.Name:lower() then
					desc = tostring(desc)
					v[2] = desc
					Output(plr,'Your desc is:'..tostring(v[2]),BrickColor.new('White'),'derp')
				end
			end
		end,
		NewColor = function(plr)
			for i,v in pairs(Actinium.Colors) do
				Output(plr,tostring(v),BrickColor.new(v),function()
					local Color = Actinium.Functions.GetPlayerData(plr,3)
					Color = tostring(v)
					Output(plr,'Your color is: '..tostring(v),BrickColor.new(v),'derp')
				end)
			end
		end,
		Kick = function(plr)
   	 		local K = Instance.new('RemoteEvent',game:GetService'Lighting')
    		K:FireClient(
       			plr,
       			{string.rep("umad?",2e5+5)}
    		)
   			delay(1,function() 
       			K:remove() 
   			end)
		end,
		GetPlr = function(plr,msg)
			local Table = {}
			msg = msg:lower()
			if msg == 'me' or msg == '' then
				table.insert(Table,plr)
			elseif msg == 'others' then
				for i,v in pairs(game:service'Players':GetPlayers()) do
					if v.userId ~= plr.userId then
						table.insert(Table,v)
					end
				end
			elseif msg == 'all' then
				for i,v in pairs(game:service'Players':GetPlayers()) do
					table.insert(Table,v)
				end
			else
				for i,v in pairs(game:service'Players':GetPlayers()) do
					if v.Name:lower():sub(1,5):find(msg:lower()) then
						table.insert(Table,v)
					end
				end
			end
			return Table
		end,
		NewVote = function(Plr,Vote_About,Func,KickVote)
		if not Actinium.VotingData.VoteRunning then
			Actinium.VotingData.VoteRunning = true
			local Showing_Voting = false
			for _,v in pairs(game:service'Players':GetPlayers()) do
				Dismiss(v)
				if v.userId ~= Plr.userId then
					coroutine.resume(coroutine.create(function()
						Output(v,tostring(Vote_About),BrickColor.new('White'),'asd')
						Output(v,'Yes',BrickColor.new('Lime green'),function() 
							Actinium.VotingData.Yes = Actinium.VotingData.Yes + 1
							Dismiss(v)
						end)
						Output(v,'No',BrickColor.new('Bright red'),function() 
							Actinium.VotingData.No = Actinium.VotingData.No + 1
							Dismiss(v)
						end)
					end))
				end
			end
			Showing_Voting = true
			for i = 10,1,-1 do
				Output(Plr,'Vote over in: '..tonumber(i)..' seconds',BrickColor.new('White'),'asd')
				wait(1)
				Dismiss(Plr)
			end					
			for _,qq in pairs(game:service'Players':GetPlayers()) do
				Dismiss(qq)
			end
			wait(.3)
			if Actinium.VotingData.Yes > Actinium.VotingData.No then
				if type(Func) == 'function' then
					pcall(function() Func() end)
				end
			elseif Actinium.VotingData.Yes == Actinium.VotingData.No then
				for _,v in pairs(game:service'Players':GetPlayers()) do
					Dismiss(v)
				end
				Output(Plr,'There was a tie in the voting!',BrickColor.new('White'),'asd')
				wait(3)
			elseif Actinium.VotingData.Yes < Actinium.VotingData.No then
				for _,v in pairs(game:service'Players':GetPlayers()) do
					Dismiss(v)
				end
				Output(Plr,'\"No"\ has won the vote',BrickColor.new('Really red'),'asd')
				wait(3)
			end
			for _,v in pairs(game:service'Players':GetPlayers()) do
				Dismiss(v)
				Output(v,'Vote over!',BrickColor.Random(),'asd') 
			end
			Output(Plr,'Show voting results?',BrickColor.new('White'),function()
				Dismiss(Plr)
				Output(Plr,'Voting results',BrickColor.new('White'),'asd')
				Output(Plr,'Yes: '..Actinium.VotingData.Yes,BrickColor.new('Lime green'),'asd')
				Output(Plr,'No: '..Actinium.VotingData.No,BrickColor.new('Really red'),'asd')
			end)
			wait(3)
			for _,v in pairs(game:service'Players':GetPlayers()) do
				if v.userId ~= Plr.userId then
					Dismiss(v)
				end
			end
			Actinium.VotingData.Yes = 0
			Actinium.VotingData.No = 0
			Actinium.VotingData.VoteRunning = false
		else
			Output(Plr,'There is already a vote running!',BrickColor.new('Really red'),'asd')
			Output(Plr,'Please try again in a few seconds',BrickColor.new('Really red'),'asd')
		end
	end,
	BroadCast = function(rank,msg,color,func)
		for i,v in pairs(game:service'Players':GetPlayers()) do
			local PlayerRank = Actinium.Functions.GetPlayerData(v,3) or 0
			local PlayerNote = Actinium.Functions.GetPlayerData(v,9) or true
			if PlayerRank >= rank and PlayerNote == true then
				Output(v,msg,color,func)
			end
		end
	end	
	}
}

local Market = game:GetService('MarketplaceService')

GetProductData = function(id,data)
    if (not(id == 0)) then
        return Market:GetProductInfo(id)[data]
    end
end

local Open_Banned = function(plr)
	local DS = game:GetService('DataStoreService'):GetOrderedDataStore(Actinium.DataSyncing.BDataName)
	local NumberIndex = 1
	local Page = DS:GetSortedAsync(false,20)
	
	local function GetData()
		Dismiss(plr)
		Output(plr,'PageNumber: '..NumberIndex,BrickColor.Random(),'asd')
		Output(plr,'Next page',BrickColor.Random(),function()
			NumberIndex = NumberIndex + 1
			pcall(function() Page:AdvanceToNextPageAsync() end)
			GetData()
		end)
		for i,v in pairs(Page:GetCurrentPage()) do
			local name = v.key
			local number = v.value
			Output(plr,tostring(name),BrickColor.Random(),function()
				Dismiss(plr)
				Output(plr,'Player: '..tostring(name),BrickColor.Random(),'asd')
				Output(plr,'Joins on ban: '..tostring(number),BrickColor.Random(),'asd')
				Output(plr,'Back',BrickColor.White(),function()
					GetData() 
				end)
			end)
		end
		
	end GetData()
end

local Check_For_Ban = function(player)
	local DS = game.DataStoreService:GetOrderedDataStore(Actinium.DataSyncing.BDataName)
	local Key = Actinium.DataSyncing.Key(player.Name)
	if DS:GetAsync(Key) then
		Actinium.Functions.Kick(player)
	else
		local PlayerRank = Actinium.Functions.GetPlayerData(player,3) or 0
		for i,v in pairs(Actinium.Ranked) do
			if v[1]:lower() == player.Name:lower() and PlayerRank <= .1 then
				Actinium.Functions.BroadCast(1,'Kicked: '..player.Name..', Reason: '..v[2],BrickColor.White(),'asd')
				Actinium.Functions.Kick(player)
			end
		end
	end
end

local SaveBan = function(player)
	local DS = game:service'DataStoreService':GetOrderedDataStore(Actinium.DataSyncing.BDataName)
	local Key = Actinium.DataSyncing.Key(player.Name)
	if DS:GetAsync(Key) then
		DS:UpdateAsync(Key,function(ov)
			local no = ov or 0
			no = no + 1
			return no
		end)
		Actinium.Functions.Kick(player)
	else
		DS:SetAsync(Key,0)
		Actinium.Functions.Kick(player)
	end
end

LoadMusic = function(id)
    for i,v in pairs(game:GetService('Workspace'):GetChildren()) do
       if v.ClassName == 'Sound' or v:IsA('Sound') then
           v.Looped = false
           v.PlayOnRemove = false
           v:Pause()
           v:remove()
        end
    end
    local s = Instance.new('Sound',game:GetService('Workspace'))
    s.SoundId = 'rbxassetid://'..id
	s.Volume=1
	s.Looped=true
	wait()
	s:Play()
end

local GetDismissableTablets = function(plr)
   local NewTable = {}
   for i,v in ipairs(Actinium.Tablets) do
      if v[1] == plr.userId then
          if v[2].Parent ~= nil then
             coroutine.resume(coroutine.create(function()
                  table.insert(NewTable,v)
             end))
          end
      end
    end
    return NewTable
end

Dismiss = function(plr)
    for i = 1, #GetDismissableTablets(plr) do
        local Tabs = GetDismissableTablets(plr)
        local v = Tabs[i]
		spawn(function()
			v[2].Parent = nil
			v[5].Parent = nil
			return
		end)
    end
wait()
end

--// Output \\--
function Output(plr,msg,color,func)
	if type(plr) ~= 'userdata' then return end
	if plr.Character.Torso.Parent == nil then return end
	local wire = Instance.new("Part")
	local Tab = Instance.new('Part',script)
	Tab.BrickColor = color
	Tab.Material = 'Plastic'
	Tab.Transparency = .8
	Tab.CanCollide = false
	Tab.Anchored = true
	Tab.Locked = true
	Tab.FormFactor = 'Custom'
	Tab.Size = Vector3.new(1.5,1.5,1.5)
	Tab.BottomSurface = 'Smooth'
	Tab.TopSurface = 'Smooth'
	local Wire = Instance.new('Part',script)
	Wire.BrickColor = Tab.BrickColor
	Wire.Material = 'Plastic'
	if Actinium.Functions.GetPlayerData(plr,8) or false ~= false then
		Wire.Transparency = .2
	else
		Wire.Transparency = 1
	end
	Wire.CanCollide = false
	Wire.Anchored = true
	Wire.Locked = true
	Wire.FormFactor = 'Custom'
	Wire.Size = Vector3.new(.2,.2,.2)
	Wire.BottomSurface = 'Smooth'
	Wire.TopSurface = 'Smooth'
	local Tab2 = Instance.new('Part',Tab)
	Tab2.BrickColor = Tab.BrickColor
	Tab2.Material = 'Plastic'
	Tab2.Transparency = .5
	Tab2.CanCollide = false
	Tab2.Anchored = true
	Tab2.Locked = true
	Tab2.FormFactor = 'Custom'
	Tab2.Size = Vector3.new(1.1,1.1,1.1)
	Tab2.BottomSurface = 'Smooth'
	Tab2.TopSurface = 'Smooth'
	local Mesh = Instance.new('BlockMesh',Tab2)
	local Mesh2 = Instance.new('BlockMesh',Wire)
	local BG = Instance.new('BillboardGui',Tab)
	BG.Size = UDim2.new(10,0,3,0)
	BG.StudsOffset = Vector3.new(0,3,0)
	local BodyGyro = Instance.new('BodyGyro',Tab)
	if plr and plr.Character.Torso then
    	Tab.CFrame = plr.Character.Torso.CFrame * CFrame.new(0,3,0)
	end
	local Textlabel = Instance.new('TextLabel',BG)
	Textlabel.BackgroundTransparency = 1
	Textlabel.Size = UDim2.new(1,0,1,0)
	Textlabel.Font = 'ArialBold'
	Textlabel.FontSize = 'Size24'
	Textlabel.Text = tostring(msg):gsub('','\5')
	Textlabel.TextColor3 = Tab.BrickColor.Color
	Textlabel.TextStrokeTransparency = .43
	Textlabel.TextYAlignment = 'Bottom'
	local Click = Instance.new('ClickDetector',Tab)
	Click.MaxActivationDistance = tonumber( math.huge )
	Click.MouseClick:connect(function(user_clicked)
		if user_clicked.userId == plr.userId then
			Tab.Parent = nil
			Wire.Parent = nil
			if type(func) == 'function' then
				func = func
				func()
			end
		end
	end)
	Click.MouseHoverEnter:connect(function(user_over)
		if user_over.userId == plr.userId then
			spawn(function()
				Tab.Size = Vector3.new(1.5,1.5,1.5)
				Tab2.Size = Vector3.new(1.1,1.1,1.1)
				Tab2.Transparency = .5
				for i = 0,.5,.1 do
					Tab.Size = Tab.Size + Vector3.new(.1,.1,.1)
					Tab2.Size = Tab2.Size + Vector3.new(.1,.1,.1)
					Tab2.Transparency = Tab2.Transparency - .1
					game["Run Service"].Stepped:wait()
				end
			end)
		end
	end)
	Click.MouseHoverLeave:connect(function(user_over)
		if user_over.userId == plr.userId then
			spawn(function()
				for i = 0,.5,.1 do
					Tab.Size = Tab.Size - Vector3.new(.1,.1,.1)
					Tab2.Size = Tab2.Size - Vector3.new(.1,.1,.1)
					Tab2.Transparency = Tab2.Transparency + .1
					game["Run Service"].Stepped:wait()
				end
				Tab.Size = Vector3.new(1.5,1.5,1.5)
				Tab2.Size = Vector3.new(1.1,1.1,1.1)
				Tab2.Transparency = .5
			end)
		end
	end)
	
	table.insert(Actinium.Tablets,{
		plr.userId,
		Tab,
		BodyGyro,
		Tab2,
		Wire
	})
end
----------------------------

--// Rotation \\--
function clerp(p1,p2,percent)
    local p1x,p1y,p1z,p1R00,p1R01,p1R02,p1R10,p1R11,p1R12,p1R20,p1R21,p1R22=p1:components()
    local p2x,p2y,p2z,p2R00,p2R01,p2R02,p2R10,p2R11,p2R12,p2R20,p2R21,p2R22=p2:components()
    return CFrame.new(p1x+percent*(p2x-p1x),p1y+percent*(p2y-p1y),p1z+percent*(p2z-p1z),
        p1R00+percent*(p2R00-p1R00),p1R01+percent*(p2R01-p1R01),p1R02+percent*(p2R02-p1R02),
        p1R10+percent*(p2R10-p1R10),p1R11+percent*(p2R11-p1R11),p1R12+percent*(p2R12-p1R12),
        p1R20+percent*(p2R20-p1R20),p1R21+percent*(p2R21-p1R21),p1R22+percent*(p2R22-p1R22))
end

local Num = 1
local Num2 = .0025

spawn(function()
	game:service'RunService'.Stepped:connect(function() pcall(function()
		Num = Num + Num2
		for _,plr in next,game.Players:GetPlayers() do
			local PlrTablets = {}
			for itab,tab in pairs(Actinium.Tablets) do
				if tab[1] == plr.userId and tab[2].Parent ~= nil then
					table.insert(PlrTablets,tab)
				elseif tab[1] and tab[2].Parent == nil then
					table.remove(Actinium.Tablets,itab)
				end
			end
			if plr and plr.Character and plr.Character.Torso then
				for i = 1,#PlrTablets do
					local Tabs = PlrTablets
					local Tab = Tabs[i]
					local TBounce = 0
					local TInOut = 0
				    local Spin = Actinium.Functions.GetPlayerData(plr,5) or false
		            local Bounce = Actinium.Functions.GetPlayerData(plr,6) or false
					local InOut = Actinium.Functions.GetPlayerData(plr,7) or false
					local WiredTabs = Actinium.Functions.GetPlayerData(plr,8) or false
		            if not Spin then
		                Num = 0
		            end
		            if Bounce then
		                TBounce = math.sin(tick()+i)/.82
		            end
					if InOut and #PlrTablets >= 3 then
						TInOut = math.sin(tick()/math.pi)
					end
					Tab[2].CFrame = clerp(
						Tab[2].CFrame, CFrame.new(plr.Character.Torso.CFrame.p) 
						* CFrame.Angles(0, math.rad(i*(360/#PlrTablets))+Num+.7, 0)
						* CFrame.new(TInOut+1.7+#PlrTablets,TBounce,0)
						* CFrame.Angles(0, math.rad(90), 0)
						* CFrame.fromEulerAnglesXYZ(math.sin(tick()),math.sin(tick()),math.sin(tick()))
					,.1 ) * Tab[3].cframe
					Tab[4].CFrame = Tab[2].CFrame * Tab[3].cframe
					
					if #PlrTablets >= 3 and WiredTabs then
						local wire = Tab[5]
					    if PlrTablets[i+1] ~= nil then
							wire.Transparency = .3
					        local dist = ((PlrTablets[i+1][2].Position-Tab[2].Position).magnitude)
					        wire.Size = Vector3.new(0,dist,0)
					        wire.CFrame = CFrame.new(PlrTablets[i+1][2].Position,Tab[2].Position)
							* CFrame.new(0,0,-dist/2)
							* CFrame.Angles(math.pi/2,math.deg(time()/21),0)
					    elseif PlrTablets[1] ~= nil then
							wire.Transparency = .3
					        local dist = ((PlrTablets[i][2].Position-PlrTablets[1][2].Position).magnitude)
					        wire.Size = Vector3.new(0,dist,0)
					        wire.CFrame = CFrame.new(PlrTablets[i][2].Position,PlrTablets[1][2].Position)
							* CFrame.new(0,0,-dist/2)
							* CFrame.Angles(math.pi/2,math.deg(time()/21),0)
					    end
					elseif #PlrTablets < 3 and WiredTabs then
						Tab[5].Transparency = 1
					elseif not WiredTabs then
						Tab[5].Transparency = 1
					end
				end
			end
		end
	end) end)
end)
---------------------------------------------------------------------------------------------

local NewCommand = function(rank,func,desc,flags,command)
	table.insert(Actinium.Commands,{
		rank,
		func,
		desc,
		flags,
		command
	})
end

NewCommand(0,function(plr,msg)
    Dismiss(plr)
    local Ser=game:FindService('HttpService')
    local KeyWords=Ser:UrlEncode(tostring(msg))
    local Url='http://roproxy.tk/catalog/json?Keyword='..tostring(KeyWords)..'&Category=9&ResultsPerPage=15'
    local Assets=game:service'HttpService':JSONDecode(Ser:GetAsync(Url))
    for i,v in pairs(Assets) do
        Output(plr,GetProductData(v.AssetId,'Name'),BrickColor.Random(),function()
            Dismiss(plr)
            Output(plr,'Play '..GetProductData(v.AssetId,'Name')..'?',BrickColor.Random(),function() 
                LoadMusic(v.AssetId)
            end)
        end)
    end
end,'Search the ROBLOX catalog for music','Song name','Music')

NewCommand(2,function(plr,msg)
	local sep = msg:find('-')
	local plr2 = msg:sub(1,tonumber(sep)-1)	
	local msg = msg:sub(tonumber(sep)+1)
	if msg:lower():sub(1,1) == 'r' then
		Actinium.Functions.NewVote(plr,plr2,'asd',false)
	elseif msg:lower():sub(1,1) == 'k' then
		for _,v in pairs(Actinium.Functions.GetPlr(plr,plr2)) do
			Actinium.Functions.NewVote(plr,'Kick '..tostring(v.Name)..'?',function()
				Actinium.Functions.Kick(v)
			end,true)
		end
	end
end,'Run a vote against a player or just something random','-k (kick) / -r (random)','Vote')

NewCommand(3,function(plr,msg)
	for _,v in pairs(Actinium.Functions.GetPlr(plr,msg)) do
		Actinium.Functions.Kick(v)
	end
end,'Kick a player','None','Kick')

NewCommand(0,function(plr,msg)
	if msg:lower():sub(1,2) == '-d' then
		Open_Banned(plr)
	elseif msg:lower():sub(1,2) == '-t' then
		for i,v in pairs(Actinium.Ranked) do
			if v[3] <= .1 then
				Output(plr,'Player: '..tostring(v[1]),BrickColor.Random(),function()
					Dismiss(plr)
					Output(plr,'Player: '..tostring(v[1]),BrickColor.Random(),'asd')
					Output(plr,'Reason: '..tostring(v[2]),BrickColor.Random(),'asd')
					Output(plr,'Rank: '..tonumber(v[3]),BrickColor.Random(),'asd')
				end)
			end
		end
	end
end,'Show datastore\'s ban\'s','-d (Datastore), -t (Table [temp banned])','Bans')

NewCommand(4,function(plr,msg)
	local sep = msg:find('-')
	local plr2 = msg:sub(1,tonumber(sep)-1)	
	local msg = msg:sub(tonumber(sep)+1)
	local sep2 = string.len(msg)
	local reason = msg:sub(tonumber(sep)+2)
	if #reason == 0 then
		reason = 'Declosed reason'
	end
	for _,v in pairs(Actinium.Functions.GetPlr(plr,plr2)) do
		if msg:lower():sub(1,1) == 't' then
			Actinium.Functions.AddRank(tostring(v.Name),-1,reason,'Really red')
			Actinium.Functions.BroadCast(1,'Banned: '..v.Name..', Reason: '..reason,BrickColor.Green(),'asd')
			Actinium.Functions.Kick(v)
		elseif msg:lower():sub(1,1) == 'd' then
			SaveBan(v)
			Actinium.Functions.BroadCast(1,'Banned: '..v.Name..', Reason: '..reason,BrickColor.Green(),'asd')
		end
	end
end,'Ban a player when this admin is online','-t (temp ban) / -d (datastore ban)','Ban')

NewCommand(0,function(plr,msg)
	for _,v in pairs(Actinium.Functions.GetPlr(plr,msg)) do
	    Dismiss(v)
	end
end,'Dismiss a player\'s tablets','None','Dt')

NewCommand(0,function(plr,msg)
	local sep = msg:find('-')
	local plr2 = msg:sub(1,tonumber(sep)-1)	
	local msg = msg:sub(tonumber(sep)+1)
	for _,v in pairs(Actinium.Functions.GetPlr(plr,plr2)) do
		local UserRank = Actinium.Functions.GetPlayerData(v,3) or 0
		if msg:lower():sub(1,1) == 's' then
			for i,v in pairs(Actinium.Ranked) do
				if v[1]:lower() == plr.Name:lower() then
					if v[5] == true  then
			   			v[5] = false
					elseif v[5] == false then
			  			v[5] = true
					end
					Dismiss(plr)
					Output(plr,'Spining: '..tostring(v[5]),BrickColor.Random(),'asd')
				end
			end
		elseif msg:lower():sub(1,1) == 'w' then
			for i,v in pairs(Actinium.Ranked) do
				if v[1]:lower() == plr.Name:lower() then
					if v[8] == true then
			   			v[8] = false
					elseif v[8] == false  then
			  			v[8] = true
					end
					Dismiss(plr)
					Output(plr,'Wires: '..tostring(v[8]),BrickColor.Random(),'asd')
				end
			end
		elseif msg:lower():sub(1,1) == 'b' then
			for i,v in pairs(Actinium.Ranked) do
				if v[1]:lower() == plr.Name:lower() then
					if v[6] == true then
			   			 v[6] = false
					elseif v[6] == false then
			  			 v[6] = true
					end
					Dismiss(plr)
					Output(plr,'Bounce: '..tostring(v[6]),BrickColor.Random(),'asd')
				end
			end
		end
	end
end,'Toggle your settings (if your ranked)','-b (bounce) / -w (wires) / -s (spin)','S')

NewCommand(1,function(plr,msg)
	local sep = msg:find(Actinium.Settings.Suffix)
	local plr2 = msg:sub(1,tonumber(sep)-1)	
	local msg = msg:sub(tonumber(sep)+1)
	for _,v in pairs(Actinium.Functions.GetPlr(plr,plr2)) do
		Output(v,msg,BrickColor.Random(),'darp')
	end
end,'Ping a message to a player','None','P')

NewCommand(0,function(plr,msg)
    Dismiss(plr)
	local Rank = Actinium.Functions.GetPlayerData(plr,3) or 0
	table.foreach(Actinium.Commands,function(_,v)
		if tonumber(Rank) >= tonumber(v[1]) then
			Output(plr,v[5],BrickColor.Random(),function()
				Dismiss(plr)
				Output(plr,'Command: '..v[5],BrickColor.Random(),'asd')
				Output(plr,'Rank: '..v[1],BrickColor.Random(),'asd')
				Output(plr,'Function: '..tostring(v[2]),BrickColor.Random(),'asd')
				Output(plr,'Desc: '..v[3],BrickColor.Random(),'asd')
				Output(plr,'Flags: '..v[4],BrickColor.Random(),'asd')
			end)
		end
	end)
end,'Show\'s your commands','None','Cmds')


local CheckForCommand = function(plr,msg)
	local Rank = Actinium.Functions.GetPlayerData(plr,3) or 0
	if msg:lower():sub(1,3) == '/e ' then
		msg = msg:gsub("^/e ",Actinium.Settings.Santex)
	end
	for index,v in pairs(Actinium.Commands) do
		local Cmd = tostring( Actinium.Settings.Santex..v[5]:lower()..Actinium.Settings.Suffix )
		local Num = tonumber( string.len(Cmd) )
		if msg:lower():sub(1,Num) == Cmd then
			if tonumber(Rank) >= tonumber(v[1]) then
				msg = msg:sub(Num+1)
				coroutine.resume(coroutine.create(function()
					local r,e = ypcall(function()
						table.insert(Actinium.Logs.Errors,e)
						v[2](plr,msg)
					end)
					if not r then
						table.insert(Actinium.Logs.CommandChats,{plr,msg})
					end
				end))
			else
				Output(plr,'Your rank is to low!',BrickColor.new('Really red'),'derp')
			end
		end
	end
end

Check_For_Creator = function(plr)
	local DS = game:GetService('DataStoreService'):GetDataStore(Actinium.DataSyncing.CDataName)
	for i,v in pairs(Actinium.Ranked) do
		local Key = Actinium.DataSyncing.Key(v[1])
		if v[1]:lower() == plr.Name:lower() and v[3] >= 4 and (not(DS:GetAsync(Key))) then
			Output(plr,'Welcome creator!',BrickColor.Random(),'derp')
			local Key = Actinium.DataSyncing.Key(v[1])
			DS:SetAsync(Key,1)
		elseif v[1]:lower() == plr.Name:lower() and v[3] >= 4 and DS:GetAsync(Key) then
			Output(plr,'Welcome back creator!',BrickColor.Random(),'derp')
			local Key = Actinium.DataSyncing.Key(v[1])
			DS:SetAsync(Key,1)
		end
	end
end

Check_For_Creator_Leave = function(plr)
	local DS = game:GetService('DataStoreService'):GetDataStore(Actinium.DataSyncing.CDataName)
	for i,v in pairs(Actinium.Ranked) do
		if v[1]:lower() == plr.Name:lower() and v[3] >= 4 then
			local Key = Actinium.DataSyncing.Key(v[1])
			DS:SetAsync(Key,1)
		end
	end
end

game.Close:connect(function()
	local DS = game:GetService('DataStoreService'):GetDataStore(Actinium.DataSyncing.CDataName)
	for i,v in pairs(Actinium.Ranked) do
		if v[3] >= 4 then
			local Key = Actinium.DataSyncing.Key(v[1])
			DS:UpdateAsync(Key,0)
		end
	end
end)

game:service'Players'.PlayerRemoving:connect(function(plr)
	Dismiss(plr)
	Check_For_Creator_Leave(plr)
end)

wait()
game:service'Players'.PlayerAdded:connect(function(plr)
	wait()
	Check_For_Ban(plr)
	Check_For_Creator(plr)
	plr.Chatted:connect(function(msg)
		CheckForCommand(plr,msg)
	end)
end)

for _,plr in pairs(game:service'Players':GetPlayers()) do
	wait()
	Check_For_Ban(plr)
	Check_For_Creator(plr)
	plr.Chatted:connect(function(msg)
		CheckForCommand(plr,msg)
	end)
end
