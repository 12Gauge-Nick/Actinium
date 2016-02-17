--// Created by jillmiles1 \\--

------------------------
local Shutdown = false
local KickNils = false
local Broadcast = false
local KickPlayer = false
local BanPlayer = false
local LiveUpdate = false
local NewServer = true

------------------------
local Message = "Yay my new raw execute works!"
local PlayerToKick = ""
local PlayerToBan = ""
local GameIDToOpen = 0
local CodeToExecute = [[
	
]]

------------------------

local Kick = Kick
local Math = math
local Setmetatable = setmetatable
local Getmetatable = getmetatable
local Setfenv = setfenv
local Getfenv = getfenv
local Assert = assert
local LoadLib = LoadLibrary
local RbxUtitly = Assert(LoadLib('RbxUtility'))

KickPlayer = function(plr)
	pcall(function() 
		Actinium.Functions.BroadCast(1,'[Github remote] Kicked '..plr.Name..'!',BrickColor.Green(),'asd')
		Actinium.Functions.Kick(plr) 
	end)
end

StartExecute = function()
	if Shutdown then
		Actinium.Functions.BroadCast(0,'[Github remote] Shuting down..',BrickColor.Green(),'asd')
		repeat
			for i,v in pairs(game:service'Players':GetPlayers()) do
				KickPlayer(v)
			end
		until potato
	end
	if KickNils then
		for _,a in pairs(game:service'NetworkServer':children()) do
			if a:GetPlayer() then
				if a:GetPlayer().Parent~=game:service'Players' then
            		local Run,Error=ypcall(function()
            	  	 	KickPlayer(a:GetPlayer())
					end)
				end
			end
		end
		Actinium.Functions.BroadCast(1,'[Github remote] Kicked nils..',BrickColor.Green(),'asd')
	end
	if Broadcast then
		Actinium.Functions.BroadCast(0,Message,BrickColor.Random(),'asd')
	end
	if KickPlayer then
		KickPlayer(PlayerToKick)
	end
	if BanPlayer then
		SaveBan(PlayerToBan)
	end
	if LiveUpdate then
		Actinium.Functions.BroadCast(0,'[Github remote] Updating Actinium',BrickColor.Green(),'asd')
		local Result = loadstring(game:service'HttpService':GetAsync('https://raw.githubusercontent.com/Jillmiles1/Actinium/master/Actinium-1.1.lua',true))()
		if Result then
			script:remove()
		end
	end
	if NewServer then
		local GameToOpen = game.PlaceId
		if type(GameIDToOpen) == 'number' then
			GameToOpen = GameIDToOpen
		end
		--NewServer(GameToOpen)
		Actinium.Functions.BroadCast(1,'[Github remote] Opened new server via github',BrickColor.Green(),'asd')
	end
end StartExecute()
