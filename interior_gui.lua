-- Credit : Ideo

--------------------------------------------------------------------------------------------------------------------
-- Graphic Functions
--------------------------------------------------------------------------------------------------------------------

Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


--------------------------------------------------
--------------------------------------------------
Menu = {}
Menu.GUI = {}
Menu.buttonCount = 0
Menu.selection = 0
Menu.hidden = true
MenuTitle = "Menu"


--------------------------------------------------
--------------------------------------------------
function Menu.addButton(name, func,args)

	local yoffset = 0.3
	local xoffset = 0
	local xmin = 0.0
	local xmax = 0.2
	local ymin = 0.05
	local ymax = 0.05
	Menu.GUI[Menu.buttonCount+1] = {}
	Menu.GUI[Menu.buttonCount+1]["name"] = name
	Menu.GUI[Menu.buttonCount+1]["func"] = func
	Menu.GUI[Menu.buttonCount+1]["args"] = args
	Menu.GUI[Menu.buttonCount+1]["active"] = false
	Menu.GUI[Menu.buttonCount+1]["xmin"] = xmin + xoffset
	Menu.GUI[Menu.buttonCount+1]["ymin"] = ymin * (Menu.buttonCount + 0.01) +yoffset
	Menu.GUI[Menu.buttonCount+1]["xmax"] = xmax 
	Menu.GUI[Menu.buttonCount+1]["ymax"] = ymax 
	Menu.buttonCount = Menu.buttonCount+1
end

--------------------------------------------------
--------------------------------------------------
function Menu.updateSelection() 
	if IsControlJustPressed(1, Keys["DOWN"]) then 
		if(Menu.selection < Menu.buttonCount -1 ) then
			Menu.selection = Menu.selection +1
		else
			Menu.selection = 0
		end		
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	elseif IsControlJustPressed(1, Keys["TOP"]) then
		if(Menu.selection > 0)then
			Menu.selection = Menu.selection -1
		else
			Menu.selection = Menu.buttonCount-1
		end	
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	elseif IsControlJustPressed(1, Keys["NENTER"])  then
		MenuCallFunction(Menu.GUI[Menu.selection +1]["func"], Menu.GUI[Menu.selection +1]["args"])
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	--elseif IsControlJustPressed(1, Keys["BACKSPACE"])  then
	--		MenuCallFunction(Menu.GUI[Menu.selection -1]["func"], Menu.GUI[Menu.selection -1]["args"])
	--		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
	local iterator = 0
	for id, settings in ipairs(Menu.GUI) do
		Menu.GUI[id]["active"] = false
		if(iterator == Menu.selection ) then
			Menu.GUI[iterator +1]["active"] = true
		end
		iterator = iterator +1
	end
end


--------------------------------------------------
--------------------------------------------------
function Menu.renderGUI(options)
	if not Menu.hidden then
		Menu.renderButtons(options)
		Menu.updateSelection()
	end
end

--------------------------------------------------
--------------------------------------------------
function Menu.renderBox(xMin,xMax,yMin,yMax,color1,color2,color3,color4)
	DrawRect(xMin, yMin,xMax, yMax, color1, color2, color3, color4);
end


--------------------------------------------------
--------------------------------------------------
function Menu:setTitle(options)
	SetTextFont(1)
	SetTextProportional(0)
	SetTextScale(1.0, 1.0)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(options.menu_title)
	DrawText(options.x, options.y)
end

--------------------------------------------------
--------------------------------------------------
function Menu:setSubTitle(options)
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(options.scale +0.1, options.scale +0.1)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(options.menu_subtitle)
	DrawRect(options.x,(options.y +0.08),options.width,options.height,options.color_r,options.color_g,options.color_b,150)
	DrawText(options.x - options.width/2 + 0.005, (options.y+ 0.08) - options.height/2 + 0.0028)

	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(options.scale, options.scale)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(options.rightText)
	DrawText((options.x + options.width/2 - 0.0385) , options.y + 0.067)
end


--------------------------------------------------
--------------------------------------------------
function Menu:drawButtons(options)
	local y = options.y + 0.12

	for id, settings in pairs(Menu.GUI) do
		SetTextFont(0)
		SetTextProportional(0)
		SetTextScale(options.scale, options.scale)
		if(settings["active"]) then
			SetTextColour(0, 0, 0, 255)
		else
			SetTextColour(255, 255, 255, 255)
		end
		SetTextCentre(0)
		SetTextEntry("STRING")
		AddTextComponentString(settings["name"])
		if(settings["active"]) then
			DrawRect(options.x,y,options.width,options.height,250,250,200,200)
		else
			DrawRect(options.x,y,options.width,options.height,0,0,0,150)
		end
		DrawText(options.x - options.width /2 + 0.005, y - 0.04 /2 + 0.0028)
		y = y + 0.04
	end
end

--------------------------------------------------
--------------------------------------------------
function Menu.renderButtons(options)

	Menu:setTitle(options)
	Menu:setSubTitle(options)
	Menu:drawButtons(options)

end


--------------------------------------------------
--------------------------------------------------
function ClearMenu()
	--Menu = {}
	Menu.GUI = {}
	Menu.buttonCount = 0
	Menu.selection = 0
end


--------------------------------------------------
--------------------------------------------------
function MenuCallFunction(fnc, arg)
	_G[fnc](arg)
end

--------------------------------------
--------------------------------------
--------------------------------------

---------------------
Menu2 = {}
Menu2.GUI2 = {}
Menu2.buttonCount2 = 0
Menu2.selection2 = 0
Menu2.hidden2 = true
MenuTitle2 = "Menu2"
------------------------
function Menu2.addButton2(name2, func2, args2)

	local yoffset2 = 0.3
	local xoffset2 = 0
	local xmin2 = 0.0
	local xmax2 = 0.2
	local ymin2 = 0.05
	local ymax2 = 0.05
	Menu2.GUI2[Menu2.buttonCount2+1] = {}
	Menu2.GUI2[Menu2.buttonCount2+1]["name2"] = name2
	Menu2.GUI2[Menu2.buttonCount2+1]["func2"] = func2
	Menu2.GUI2[Menu2.buttonCount2+1]["args2"] = args2
	Menu2.GUI2[Menu2.buttonCount2+1]["active2"] = false
	Menu2.GUI2[Menu2.buttonCount2+1]["xmin2"] = xmin2 + xoffset2
	Menu2.GUI2[Menu2.buttonCount2+1]["ymin2"] = ymin2 * (Menu2.buttonCount2 + 0.01) +yoffset2
	Menu2.GUI2[Menu2.buttonCount2+1]["xmax2"] = xmax2 
	Menu2.GUI2[Menu2.buttonCount2+1]["ymax2"] = ymax2 
	Menu2.buttonCount2 = Menu2.buttonCount2+1
end
----------------------------------
function Menu2.updateSelection2() 
	if IsControlJustPressed(1, Keys["DOWN"]) then 
		if(Menu2.selection2 < Menu2.buttonCount2 -1 ) then
			Menu2.selection2 = Menu2.selection2 +1
		else
			Menu2.selection2 = 0
		end		
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	elseif IsControlJustPressed(1, Keys["TOP"]) then
		if(Menu2.selection2 > 0)then
			Menu2.selection2 = Menu2.selection2 -1
		else
			Menu2.selection2 = Menu2.buttonCount2 -1
		end	
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	elseif IsControlJustPressed(1, Keys["NENTER"])  then
		MenuCallFunction2(Menu2.GUI2[Menu2.selection2 +1]["func2"], Menu2.GUI2[Menu2.selection2 +1]["args2"])
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)

	end
	local iterator2 = 0
	for id2, settings2 in ipairs(Menu2.GUI2) do
		Menu2.GUI2[id2]["active2"] = false
		if(iterator2 == Menu2.selection2 ) then
			Menu2.GUI2[iterator2 +1]["active2"] = true
		end
		iterator2 = iterator2 +1
	end
end
-------------------
function Menu2.renderGUI2(options2)
	if not Menu2.hidden2 then
		Menu2.renderButtons2(options2)
		Menu2.updateSelection2()
	end
end
-------------------
function Menu2.renderBox2(xMin,xMax,yMin,yMax,color1,color2,color3,color4)
	DrawRect(xMin, yMin,xMax, yMax, color1, color2, color3, color4);
end
--------------------
function Menu2:setTitle2(options2)
	SetTextFont(1)
	SetTextProportional(0)
	SetTextScale(1.0, 1.0)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(options2.menu_title2)
	DrawText(options2.x2, options2.y2)
end
------------------------------
function Menu2:drawButtons2(options2)
	local y2 = options2.y2 + 0.12

	for id2, settings2 in pairs(Menu2.GUI2) do
		SetTextFont(0)
		SetTextProportional(0)
		SetTextScale(options2.scale2, options2.scale2)
		if(settings2["active2"]) then
			SetTextColour(0, 0, 0, 255)
		else
			SetTextColour(255, 255, 255, 255)
		end
		SetTextCentre(0)
		SetTextEntry("STRING")
		AddTextComponentString(settings2["name2"])
		if(settings2["active2"]) then
			DrawRect(options2.x2,y2,options2.width2,options2.height2,250,250,250,155)
		else
			DrawRect(options2.x2,y2,options2.width2,options2.height2,0,0,0,150)
		end
		DrawText(options2.x2 - options2.width2 /2 + 0.005, y2 - 0.04 /2 + 0.0028)
		y2 = y2 + 0.04
	end
end
------------------------
function Menu2:setSubTitle2(options2)
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(options2.scale2 +0.1, options2.scale2 +0.1)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(options2.menu_subtitle2)
	DrawRect(options2.x2,(options2.y2 +0.08),options2.width2,options2.height2,options2.color_r2,options2.color_g2,options2.color_b2,150)
	DrawText(options2.x2 - options2.width2/2 + 0.005, (options2.y2+ 0.08) - options2.height2/2 + 0.0028)

	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(options2.scale2, options2.scale2)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(options2.rightText2)
	DrawText((options2.x2 + options2.width2/2 - 0.0385) , options2.y2 + 0.067)
end
------------------------
function Menu2.renderButtons2(options2)

	Menu2:setTitle2(options2)
	Menu2:setSubTitle2(options2)
	Menu2:drawButtons2(options2)

end
-------------------
function ClearMenu2()
	--Menu = {}
	Menu2.GUI2 = {}
	Menu2.buttonCount2 = 0
	Menu2.selection2 = 0
end
--------------------
function MenuCallFunction2(fnc2, arg2)
	_G[fnc2](arg2)
end