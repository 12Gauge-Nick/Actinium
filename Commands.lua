return {
  {'Update','Updates the database\'s',4,'None',function(plr,msg)
    LoadDatabases(plr)
    Output(plr,'Database\'s updated!',BrickColor.new('Lime green'),nil,'asd')
  end},
  {'Ping','P',0,'None',function(plr,msg)
    Output(plr,tostring(msg),BrickColor.Random(),nil,'asd')
  end}
}
