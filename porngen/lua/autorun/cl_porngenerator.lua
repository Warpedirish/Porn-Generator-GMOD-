net.Receive("initMenu", function()
  pf = vgui.Create("DFrame")
  pf:SetSize(1500,1000)
  pf:Center()
  pf:SetTitle("Porn Generator")
  pf:MakePopup()

  local pornp = vgui.Create("DFrame",pf)
  pornp:Dock(FILL)
  pornp:Center()
  pornp:ShowCloseButton(false)
  pornp:SetDraggable(false)
  pornp:SetTitle("")
  pornp.Paint = function()end

  local porn = vgui.Create("DHTML", pornp)
  porn:Dock(FILL)
  porn:OpenURL("https://nekos.life/lewd")

  local rfshbtn = vgui.Create("DButton", pf)
  rfshbtn:SetSize(1465, 25)
  rfshbtn:SetPos(15,25)
  rfshbtn:SetText("Refresh Porn")
  rfshbtn.DoClick = function() -- refresh

  porn = vgui.Create("DHTML", pornp)
  porn:Dock(FILL)
  porn:OpenURL("https://nekos.life/lewd")

  end

  net.Receive("showPorn", function(ply)
    if pf:IsVisible() then
      pf:Hide()
    else
      pf:Show()
    end
  end)
end)
