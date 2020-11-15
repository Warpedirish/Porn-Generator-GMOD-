net.Receive("initMenu", function()
  local pf = vgui.Create("DFrame")
  pf:SetSize(1500,1000)
  pf:Center()
  pf:Hide()
  pf:ShowCloseButton(false)
  pf:SetTitle("Porn Generator")
  pf:MakePopup()
  pf.Paint = function(self,w,h)
    draw.RoundedBox(0,0,0,w,h,Color(20,20,20))

    surface.SetDrawColor(0,0,0,255)
    surface.DrawOutlinedRect(0,0,self:GetWide(),self:GetTall())
  end

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

  local function refreshporn()
    porn = vgui.Create("DHTML", pornp)
    porn:Dock(FILL)
    porn:OpenURL("https://nekos.life/lewd")
  end

  local rfshbtn = vgui.Create("DButton", pf)
  rfshbtn:SetSize(1465, 25)
  rfshbtn:SetPos(15,25)
  rfshbtn:SetText("Refresh Porn")
  rfshbtn.Paint = function(self,w,h)
    self:SetTextColor(Color(255,255,255))
    draw.RoundedBox(0,0,0,w,h,Color(35,35,35))

    surface.SetDrawColor(0,0,0,255)
    surface.DrawOutlinedRect(0,0,self:GetWide(),self:GetTall())
  end
  rfshbtn.DoClick = function() -- refresh
    refreshporn()
    net.Start("logPorn")
    net.SendToServer()
  end

  local hidebtn = vgui.Create("DButton", pf)
  hidebtn:SetSize(20,20)
  hidebtn:SetPos(1480,0)
  hidebtn:SetFont("TargetID")
  hidebtn:SetText("X")
  hidebtn.DoClick = function()
    pf:Hide()
  end  
  hidebtn.Paint = function(self,w,h)
    self:SetTextColor(Color(255,255,255))
    draw.RoundedBox(0,0,0,w,h,Color(35,35,35))

    surface.SetDrawColor(0,0,0,255)
    surface.DrawOutlinedRect(0,0,self:GetWide(),self:GetTall())
  end

  hook.Add("Think", "keyDown", function()
    local KeyPressed = false
    if input.IsKeyDown(KEY_ENTER) and !KeyPressed and pf:IsVisible() then
      refreshporn()
      KeyPressed = true
      net.Start("logPorn")
      net.SendToServer()
    else
      KeyPressed = false
    end
  end)
  net.Receive("showPorn", function(ply)
    if pf:IsVisible() then
      pf:Hide()
    else
      pf:Show()
      net.Start("logPorn")
      net.SendToServer()
    end
  end)
end)