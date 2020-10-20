util.AddNetworkString("showPorn")
util.AddNetworkString("initMenu")

local config = {
  commands = {"/porn", "!porn", "!genporn", "/genporn",}
}

hook.Add("PlayerInitialSpawn", "initmenu", function(ply)
  net.Start("showPorn")
  net.Send(ply)
end)

hook.Add("PlayerSay", "pcmd", function(ply,text)
  local text = string.Trim(text)
  if table.HasValue(config.commands, text) then
    net.Start("initMenu")
    net.Send(ply)
    return ""
  end
end)
