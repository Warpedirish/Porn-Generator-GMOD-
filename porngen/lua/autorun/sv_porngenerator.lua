util.AddNetworkString("showPorn")
util.AddNetworkString("initMenu")

local config = {
  commands = {"/porn", "!porn", "!genporn", "/genporn",}
}

hook.Add("PlayerInitialSpawn", "initmenu", function()
  for k,v in pairs(player.GetAll()) do
    net.Start("showPorn")
    net.Send(v)
  end
end)

hook.Add("PlayerSay", "pcmd", function(ply,text)
  local text = string.Trim(text)
  if table.HasValue(config.commands, text) then
    net.Start("initMenu")
    net.Send(ply)
    return ""
  end
end)
