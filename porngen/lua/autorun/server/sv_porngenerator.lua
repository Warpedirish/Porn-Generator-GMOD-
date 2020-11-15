print([[
██████╗  ██████╗ ██████╗ ███╗   ██╗     ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ████████╗ ██████╗ ██████╗ 
██╔══██╗██╔═══██╗██╔══██╗████╗  ██║    ██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗
██████╔╝██║   ██║██████╔╝██╔██╗ ██║    ██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║   ██║   ██║   ██║██████╔╝
██╔═══╝ ██║   ██║██╔══██╗██║╚██╗██║    ██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║   ██║   ██║   ██║██╔══██╗
██║     ╚██████╔╝██║  ██║██║ ╚████║    ╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║   ██║   ╚██████╔╝██║  ██║
╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝     ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
                                                                                                                    
                            ██╗      ██████╗  █████╗ ██████╗ ███████╗██████╗ ██╗                                    
                            ██║     ██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗██║                                    
                            ██║     ██║   ██║███████║██║  ██║█████╗  ██║  ██║██║                                    
                            ██║     ██║   ██║██╔══██║██║  ██║██╔══╝  ██║  ██║╚═╝                                    
                            ███████╗╚██████╔╝██║  ██║██████╔╝███████╗██████╔╝██╗                                    
                            ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═════╝ ╚═╝                                    
                                                                             
]])

util.AddNetworkString("showPorn")
util.AddNetworkString("initMenu")
util.AddNetworkString("logPorn")

local config = {
  commands = {"/porn", "!porn", "!genporn", "/genporn"}
  log = true
}

hook.Add("PlayerInitialSpawn", "initmenu", function(ply)
  net.Start("initMenu")
  net.Send(ply)
end)

hook.Add("PlayerSay", "pcmd", function(ply,text)
  local text = string.Trim(text)
  if table.HasValue(config.commands, text) then
    net.Start("showPorn")
    net.Send(ply)
    return ""
  end
end)

net.Receive("logPorn", function(len,pl)
  if config.log then
    print(pl:Nick().." ("..pl:SteamID()..")".." Is a Horny Fuck (pornGen)")
  end
end)
