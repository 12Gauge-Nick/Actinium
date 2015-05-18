return {
  {'Test HTTP command','Test',0,'None',function(plr,msg)
    Output(plr,'HTTP commands works!',BrickColor.new('Deep orange'),nil,'asd')
  end},
  {'Ping','P',0,'None',function(plr,msg)
    Output(plr,tostring(msg),BrickColor.Random(),nil,'asd')
  end}
}
