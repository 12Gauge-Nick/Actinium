return {
  {'Update script','Update',0,'None',,function(plr,msg)
    LoadDatabases(plr)
    Output(plr,'Database\'s updated!',BrickColor.new('Lime green'),nil,'asd')
  end},
  {'Ping','P',0,'None',function(plr,msg)
    Output(plr,tostring(msg),BrickColor.Random(),nil,'asd')
  end},
  {'Search http','Music',3,'None',function(plr,msg)
    local http = Actinium.Service.Http
    local Keywords = http:UrlEncode(tostring(msg))
    local Url = 'http://roproxy.tk/catalog/json?Keyword='..tostring(Keywords)..'&Category=9&ResultsPerPage=30'
    local Assets = http:JSONDecode(http:GetAsync(Url))
    local AssetTable = Assets
    
    local ShowMusic = function()
       for _,v in pairs(AssetTable) do
          Output(plr,tostring(v.Name),BrickColor.Random(),nil,function()
            
          end)
       end
    end
    ShowMusic()
  end},
}
