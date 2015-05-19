return {
  {'Update script','Update',0,'None',function(plr,msg)
    pcall(function()
		Actinium.Functions.UploadBans(plr)
		Actinium.Functions.UploadRanks(plr)
		Actinium.Functions.UploadCommands(plr)
	end)
  end},
  {'Ping','P',0,'None',function(plr,msg)
    Output(plr,tostring(msg),BrickColor.Random(),nil,'asd')
  end},
  {'Dismiss','Dt',0,'None',function(plr,msg)
    Actinium.Functions.Dismiss(plr)
  end},
  {'Bans','Bans',0,'None',function(plr,msg)
    for _,v in next,Actinium.Banned do
        Output(plr,tostring(v.Name),BrickColor.Random(),nil,'asd')
    end
  end},
  {'Search http','Music',0,'None',function(plr,msg)
    Actinium.Functions.Dismiss(plr)
    local http = Actinium.Services.Http
    local Keywords = http:UrlEncode(tostring(msg))
    local Url = 'http://roproxy.tk/catalog/json?Keyword='..tostring(Keywords)..'&Category=9&ResultsPerPage=30'
    local Assets = http:JSONDecode(http:GetAsync(Url))
    local AssetTable = Assets
    
    ShowMusic = function()
       for _,v in pairs(AssetTable) do
          Output(plr,tostring(v.Name),BrickColor.Random(),nil,function()
            Actinium.Functions.Dismiss(plr)
            Output(plr,'Back',BrickColor.Random(),nil,function() ShowMusic() end)
            Output(plr,'Now playing: '..v.Name,BrickColor.Random(),nil,function() ShowMusic() end)
            Actinium.Functions.LoadMusic(v.AssetId)
          end)
       end
    end
    ShowMusic()
  end},
}
