local ipls = {
"ufo",
"Apa_V_mp_h_01_A",
"Apa_V_mp_h_02_A",
"Apa_V_mp_h_03_A",
"Apa_V_mp_h_04_A",
"Apa_V_mp_h_05_A", 
"Apa_V_mp_h_06_A",
"Apa_V_mp_h_07_A",
"Apa_V_mp_h_08_A",
"Apa_V_mp_h_01_B",
"Apa_V_mp_h_02_B",
"Apa_V_mp_h_03_B",
"Apa_V_mp_h_04_B",
"Apa_V_mp_h_05_B",
"Apa_V_mp_h_06_B",
"Apa_V_mp_h_07_B",
"Apa_V_mp_h_08_B",
"Apa_V_mp_h_01_C",
"Apa_V_mp_h_02_C",
"Apa_V_mp_h_03_C",
"Apa_V_mp_h_04_C",
"Apa_V_mp_h_05_C",
"Apa_V_mp_h_06_C",
"Apa_V_mp_h_07_C",
"Apa_V_mp_h_08_C",
"ex_sm_13_office_01a",
"ex_sm_13_office_01b",
"ex_sm_13_office_01c",
"ex_sm_13_office_02a",
"ex_sm_13_office_02b",
"ex_sm_13_office_02c",
"ex_sm_13_office_03a",
"ex_sm_13_office_03b",
"ex_sm_13_office_03c",
"ex_sm_15_office_01a",
"ex_sm_15_office_01b",
"ex_sm_15_office_01c",
"ex_sm_15_office_02a",
"ex_sm_15_office_02b",
"ex_sm_15_office_02c",
"ex_sm_15_office_03b",
"ex_sm_15_office_03c",
"ex_dt1_02_office_01a",
"ex_dt1_02_office_01b",
"ex_dt1_02_office_01c",
"ex_dt1_02_office_02a",
"ex_dt1_02_office_02b",
"ex_dt1_02_office_02c",
"ex_dt1_02_office_03a",
"ex_dt1_02_office_03b",
"ex_dt1_02_office_03c",
"ex_dt1_11_office_01a",
"ex_dt1_11_office_01b",
"ex_dt1_11_office_01c",
"ex_dt1_11_office_02a",
"ex_dt1_11_office_02b",
"ex_dt1_11_office_02c",
"ex_dt1_11_office_03a",
"ex_dt1_11_office_03b",
"ex_dt1_11_office_03c",
"apa_stilt_ch2_09c_int",
"apa_stilt_ch2_05e_ext1",
"apa_stilt_ch2_04_ext1",
"apa_stilt_ch2_09b_ext3",
"apa_stilt_ch2_09c_ext2",
"apa_stilt_ch2_05c_ext1",
"apa_stilt_ch2_09c_ext3",
"apa_stilt_ch2_09c_ext1",
"apa_stilt_ch2_09b_ext2",
"apa_stilt_ch2_12b_ext1",
"apa_stilt_ch2_04_ext2",
"hei_sm_13_exshadowmesh",
"hei_sm_15_exshadowmesh",
"hei_dt1_02_exshadowmesh",
"hei_dt1_11_exshadowmesh"
}
for _, value in pairs(ipls) do 
 RequestIpl(value)
end

local options = {
    x = 0.11,
    y = 0.2,
    width = 0.22,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "~y~interiors ~b~menu",
    menu_subtitle = "interiors",
    color_r = 30,
    color_g = 250,
    color_b = 12,
}
---------------------------------

function TPPLAYER(player, X, Y, Z)
  SetEntityCoords(player, X, Y, Z)
end

Citizen.CreateThread(function()	
  while true do
     Citizen.Wait(0) 
	 playerPed = GetPlayerPed(PlayerId())
     playerCoords = GetEntityCoords(GetPlayerPed(PlayerId()), true)
	 playerCoordsX = playerCoords.x
	 playerCoordsY = playerCoords.y
	 playerCoordsZ = playerCoords.z
	 playerHeading = GetEntityHeading(GetPlayerPed(PlayerId()))
  end
end)


function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end
function drawTxt(x, y, width, height, scale, text, r, g, b, a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 1, 1, -1)
end

function refreshInterior(interiorID)
 	EnableInteriorProp(interiorID,"lower_walls_default")
	EnableInteriorProp(interiorID,"Mural_02")
	EnableInteriorProp(interiorID,"Walls_01")
	EnableInteriorProp(interiorID,"Furnishings_01")
	EnableInteriorProp(interiorID,"Decorative_01")
    RefreshInterior(interiorID) 
end
function disableInteriorMurals(interiorID)
   for h = 0, 9 do 
 	DisableInteriorProp(interiorID, "Mural_0"..h)
    RefreshInterior(interiorID)
	 Citizen.Wait(20)
   end
end
function disableInteriorWalls(interiorID)
   for u = 0, 2 do 
 	DisableInteriorProp(interiorID, "Walls_0"..u)
    RefreshInterior(interiorID)
	 Citizen.Wait(20)
   end
end
function disableInteriorFurnishings(interiorID)
   for u = 0, 2 do 
 	DisableInteriorProp(interiorID, "Furnishings_0"..u)
    RefreshInterior(interiorID)
	 Citizen.Wait(20)
   end
end
function disableInteriorDecorative(interiorID)
   for u = 0, 2 do 
 	DisableInteriorProp(interiorID, "Decorative_0"..u)
    RefreshInterior(interiorID)
	 Citizen.Wait(20)
   end
end
function refreshInteriorCoke()
 	EnableInteriorProp(247809,"counterfeit_standard_equip_no_prod")
    EnableInteriorProp(247809,"counterfeit_upgrade_equip")
    EnableInteriorProp(247809,"counterfeit_security")
    EnableInteriorProp(247809,"dryera_off")
	EnableInteriorProp(247809,"dryerb_off")
	EnableInteriorProp(247809,"dryerc_on")
	EnableInteriorProp(247809,"dryerd_on")
    RefreshInterior(247809) 
end
function disableInteriorCoke()
 	DisableInteriorProp(247809,"counterfeit_standard_equip_no_prod")
    DisableInteriorProp(247809,"counterfeit_upgrade_equip")
    DisableInteriorProp(247809,"counterfeit_security")
    DisableInteriorProp(247809,"dryera_off")
	DisableInteriorProp(247809,"dryerb_off")
	DisableInteriorProp(247809,"dryerc_on")
	DisableInteriorProp(247809,"dryerd_on")
    RefreshInterior(247809) 
end

--[[*************************************************************]]
------------------------------------------------------------------
--------------------------main menu-------------------------------
------------------------------------------------------------------
--[[*************************************************************]]

function Main()
    textureget = Citizen.InvokeNative(0x9BAE5AD2508DF078, 1)
	david = NetworkSessionHost(585, 2, false)
    markerLoop = false
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~r~TESTING menu"
    options.menu_subtitle = "~r~NATIVE TESTING ~g~menu 5"
    ClearMenu()
	Menu.addButton("Custom Suites", "customSuites", nil)
	Menu.addButton("business Offices list", "businessOffices", nil)
	Menu.addButton("bkr clubhouse list", "bikerClubhousesMenu", nil)
	Menu.addButton("bkr warehouse list", "bikerWarehousesMenu", nil)
	Menu.addButton("IMP/EXP ", "importExportInteriorMenu", nil)

end
--[[*************************************************************]]
------------------------------------------------------------------
--------------------------custom suites menu----------------------
------------------------------------------------------------------
--[[*************************************************************]]

function customSuites()
    markerLoop = false
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")	
    options.menu_title = "custom Suites"
    options.menu_subtitle = "choose apartment"
	ClearMenu()
	Menu.addButton("Eclipse Tower suite 1", "customTower1", nil)
	Menu.addButton("Eclipse Tower suite 2", "customTower2", nil)
   	Menu.addButton("Eclipse Tower suite 3", "customTower3", nil)
	Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)
end
function customTower1()
    RequestIpl("apa_v_mp_h_01_a")
    markerLoop = false
	TPPLAYER(GetPlayerPed(PlayerId()), -788.55, 340.37, 216.83)
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")	
    options.menu_title = "custom Suites"
    options.menu_subtitle = "choose apartment"
	ClearMenu()
	Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)
end
function customTower2()
    RequestIpl("apa_v_mp_h_01_b")
    markerLoop = false
	TPPLAYER(GetPlayerPed(PlayerId()), -786.72, 342.81, 187.11)
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")	
    options.menu_title = "custom Suites"
    options.menu_subtitle = "choose apartment"
	ClearMenu()
	Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)
end
function customTower3()
    RequestIpl("apa_v_mp_h_01_c")
    markerLoop = false
	TPPLAYER(GetPlayerPed(PlayerId()), -773.42, 332.38, 196.08)
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")	
    options.menu_title = "custom Suites"
    options.menu_subtitle = "choose apartment"
	ClearMenu()
	Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)
end
--[[*************************************************************]]
------------------------------------------------------------------
--------------------------cluhouse's menu-------------------------
------------------------------------------------------------------
--[[*************************************************************]]
function bikerClubhousesMenu()
    markerLoop = false
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")	
    options.menu_title = "clubhouse's"
    options.menu_subtitle = "choose your clubhouse"
	ClearMenu()
    Menu.addButton("choose clubhouse 1 ", "clubhouseChoose1", nil)
	Menu.addButton("choose clubhouse 2 ", "clubhouseChoose2", nil)
	Menu.addButton("choose the LOST(NPC gang) ", "clubhouseChoose3", nil)
	Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)
end
----------------------------------------------------------------------
------------------clubhouse warehouse stuff---------------------------
----------------------------------------------------------------------
function bikerWarehousesMenu()
    markerLoop = false
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")	
    options.menu_title = "clubhouse's"
    options.menu_subtitle = "choose your club warehouse"
	ClearMenu()
    Menu.addButton("choose meth warehouse", "clubWarehouseMeth", nil)
	Menu.addButton("choose weed warehouse", "clubWarehouseWeed", nil)
	Menu.addButton("choose coke warehouse", "clubWarehouseCoke", nil)
	Menu.addButton("choose counterfit warehouse", "clubWarehouseCounterfit", nil)
    Menu.addButton("choose Forgeries warehouse", "clubWarehouseForgeries", nil)
	Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)
end
----------------------------------------------------------------------
------------------forgeries warehouse stuff---------------------------
----------------------------------------------------------------------
function clubWarehouseForgeries()
 --TPPLAYER(GetPlayerPed(PlayerId()), 1164.98, -3196.6, -39.01)
    markerLoop = false
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")	
    options.menu_title = "clubhouse's"
    options.menu_subtitle = "choose your warehouse contents"
	ClearMenu()
	Menu.addButton("choose warehouse interior", "clubWarehouseForgeriesInteriorMenu", nil)
	Menu.addButton("choose  warehouse security", "clubWarehouseForgeriesSecurityMenu", nil)
	Menu.addButton("choose  warehouse Equipment", "clubWarehouseForgeriesEquipmentMenu", nil)
	Menu.addButton("BACK", "bikerWarehousesMenu", nil)
    Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)
end 
-----------------------------------------------------------------
-------------------Forgeries security menu-----------------------
function clubWarehouseForgeriesSecurityMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")	
    options.menu_title = "clubhouse's"
    options.menu_subtitle = "choose your warehouse contents"
	ClearMenu()
	Menu.addButton("enable Security low", "enableSecurityLow", nil)
	Menu.addButton("~r~disable Security low", "disableSecurityLow", nil)
	Menu.addButton("enable Security High", "enableSecurityHigh", nil)
	Menu.addButton("~r~disable Security High", "disableSecurityHigh", nil)	
    Menu.addButton("BACK", "clubWarehouseForgeries", nil)
	Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)
end
function enableSecurityLow()
 EnableInteriorProp(interiorID, "security_low")
 RefreshInterior(interiorID)
end
function disableSecurityLow()
 DisableInteriorProp(interiorID, "security_low")
 RefreshInterior(interiorID)
end
function enableSecurityHigh()
 EnableInteriorProp(interiorID, "security_high")
 RefreshInterior(interiorID)
end
function disableSecurityHigh()
 DisableInteriorProp(interiorID, "security_high")
 RefreshInterior(interiorID)
end
-----------------------------------------------------------------
-------------------Forgeries interior menu-----------------------
function clubWarehouseForgeriesInteriorMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")	
    options.menu_title = "clubhouse's"
    options.menu_subtitle = "choose your warehouse contents"
	ClearMenu()
	Menu.addButton("enable Basic interior", "enableInteriorBasic", nil)
	Menu.addButton("~r~disable Basic interior", "disableInteriorBasic", nil)
	Menu.addButton("enable upgrade interior", "enableInteriorBasic", nil)
	Menu.addButton("~r~disable ugrade interior", "disableInteriorBasic", nil)
	Menu.addButton("teleport to warehouse", "clubWarehouseForgeries", nil)
    Menu.addButton("BACK", "clubWarehouseForgeries", nil)	
    Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)
end
function enableInteriorBasic()
 EnableInteriorProp(interiorID, "interior_basic")
 RefreshInterior(interiorID)
end
function disableInteriorBasic()
 DisableInteriorProp(interiorID, "interior_basic")
 RefreshInterior(interiorID)
end
function enableInteriorUpgrade()
 EnableInteriorProp(interiorID, "interior_upgrade")
 RefreshInterior(interiorID)
end
function disableInteriorUpgrade()
 DisableInteriorProp(interiorID, "interior_upgrade")
 RefreshInterior(interiorID)
end
-----------------------------------------------------------------
-------------------Forgeries equipment menu-----------------------
function clubWarehouseForgeriesEquipmentMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")	
    options.menu_title = "clubhouse's"
    options.menu_subtitle = "choose your warehouse contents"
	ClearMenu()
	Menu.addButton("enable Basic interior", "enableEquipmentBasic", nil)
	Menu.addButton("~r~disable Basic interior", "disableEquipmentBasic", nil)
	Menu.addButton("enable upgrade Equipment", "enableEquipmentUpgrade", nil)
	Menu.addButton("~r~disable ugrade Equipment", "disableEquipmentUpgrade", nil)
	Menu.addButton("teleport to warehouse", "clubWarehouseForgeries", nil)
	Menu.addButton("BACK", "clubWarehouseForgeries", nil)
    Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)
end
function enableEquipmentBasic()
 EnableInteriorProp(interiorID, "Equipment_basic")
 RefreshInterior(interiorID)
end
function disableEquipmentBasic()
 DisableInteriorProp(interiorID, "Equipment_basic")
 RefreshInterior(interiorID)
end
function enableEquipmentUpgrade()
 EnableInteriorProp(interiorID, "Equipment_upgrade")
 RefreshInterior(interiorID)
end
function disableEquipmentUpgrade()
 DisableInteriorProp(interiorID, "Equipment_upgrade")
 RefreshInterior(interiorID)
end




----------------------------------------------------------------------
------------------counterfit warehouse stuff-------------------------------
----------------------------------------------------------------------
function clubWarehouseCounterfit()
 TPPLAYER(GetPlayerPed(PlayerId()), 1124.52, -3196.6, -40.1)
    markerLoop = false
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")	
    options.menu_title = "clubhouse's"
    options.menu_subtitle = "choose your warehouse contents"
	ClearMenu()
    Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)
end
----------------------------------------------------------------------
------------------coke warehouse stuff-------------------------------
----------------------------------------------------------------------
function clubWarehouseCoke()
 TPPLAYER(GetPlayerPed(PlayerId()), 1093.59, -3196.6, -38.99)
    markerLoop = false
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")	
    options.menu_title = "clubhouse's"
    options.menu_subtitle = "choose your warehouse contents"
	ClearMenu()
    Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)
end
----------------------------------------------------------------------
------------------meth warehouse stuff-------------------------------
----------------------------------------------------------------------
function clubWarehouseMeth()
 TPPLAYER(GetPlayerPed(PlayerId()), 1009.48, -3196.6, -38.99)
    markerLoop = false
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")	
    options.menu_title = "clubhouse's"
    options.menu_subtitle = "choose your warehouse contents"
	ClearMenu()

    Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)
end
----------------------------------------------------------------------
------------------weed warehouse stuff-------------------------------
----------------------------------------------------------------------
function clubWarehouseWeed()
 TPPLAYER(GetPlayerPed(PlayerId()), 1062.29, -3182.60, -39.162)
    markerLoop = false
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")	
    options.menu_title = "clubhouse's"
    options.menu_subtitle = "choose your warehouse contents"
	ClearMenu()
    Menu.addButton("enable first tier equip", "enableCase0", nil)
	Menu.addButton("enable set up", "enableCase1", nil)
	Menu.addButton("enable weed growth stage 1", "enableCase2", nil)
	Menu.addButton("enable case 0", "enableCase3", nil)
    Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil) 
end
function enableCase0()
 EnableInteriorProp(interiorID, "weed_standard_equip")
 EnableInteriorProp(interiorID, "weed_low_security")
 EnableInteriorProp(interiorID, "weed_chairs")
 RefreshInterior(interiorID)
end
function enableCase1()
 EnableInteriorProp(interiorID, "weed_set_up")
 RefreshInterior(interiorID)
end
function enableCase2()
 EnableInteriorProp(interiorID, "weed_hosea")
 EnableInteriorProp(interiorID, "weed_hoseb")
 EnableInteriorProp(interiorID, "weed_hosec")
 EnableInteriorProp(interiorID, "weed_hosed")
 EnableInteriorProp(interiorID, "weed_hosee")
 EnableInteriorProp(interiorID, "weed_hosef")
 EnableInteriorProp(interiorID, "weed_hoseg")
 EnableInteriorProp(interiorID, "weed_hoseh")
 EnableInteriorProp(interiorID, "weed_hosei")
 EnableInteriorProp(interiorID, "weed_growtha_stage1")
 EnableInteriorProp(interiorID, "weed_growthb_stage1")
 EnableInteriorProp(interiorID, "weed_growthc_stage1")
 EnableInteriorProp(interiorID, "weed_growthd_stage1")
 EnableInteriorProp(interiorID, "weed_growthe_stage1")
 EnableInteriorProp(interiorID, "weed_growthf_stage1")
 EnableInteriorProp(interiorID, "weed_growthg_stage1")
 EnableInteriorProp(interiorID, "weed_growthh_stage1")
 EnableInteriorProp(interiorID, "weed_growthi_stage1")
 RefreshInterior(interiorID)
end
function enableCase3()
 EnableInteriorProp(interiorID, "weed_chairs")

 RefreshInterior(interiorID)
end
function clubWarehouseChoose3()
 TPPLAYER(GetPlayerPed(PlayerId()), 984.96, -95.20, 74.847)
 bikerClubhousesMenu()
end
function clubWarehouseChoose4()
 TPPLAYER(GetPlayerPed(PlayerId()), 984.96, -95.20, 74.847)
 bikerClubhousesMenu()
end
function clubWarehouseChoose5()
 TPPLAYER(GetPlayerPed(PlayerId()), 984.96, -95.20, 74.847)
 bikerClubhousesMenu()
end
function clubhouseChoose1()
 TPPLAYER(GetPlayerPed(PlayerId()), 1100.94, -3159.28, -37.51)
 bikerClubhousInteriorDecorationsMenu()
end
function clubhouseChoose2()
 TPPLAYER(GetPlayerPed(PlayerId()), 1005.98, -3157.56, -38.90)
 bikerClubhousInteriorDecorationsMenu()
end
function clubhouseChoose3()
 RequestIpl("bkr_bi_hw1_13_int")
 RemoveIpl("hei_bi_hw1_13_door")
 TPPLAYER(GetPlayerPed(PlayerId()), 984.96, -95.20, 74.847)
 bikerClubhousesMenu()
end
function bikerClubhousInteriorDecorationsMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~r~TESTING menu"
    options.menu_subtitle = "~r~NATIVE TESTING ~b~menu 5"
    ClearMenu()
	Menu.addButton("~g~murals", "bikerClubhousMuralsMenu", nil)
	Menu.addButton("~y~disable all mural props", "disableInteriorMurals", interiorID)
	Menu.addButton("~g~walls", "bikerClubhousWallsMenu", nil)
	Menu.addButton("~y~disable all wall props", "disableInteriorWalls", interiorID)
	Menu.addButton("~g~furnishings", "bikerClubhousfurnishingsMenu", nil)
	Menu.addButton("~y~disable all Furnishings props", "disableInteriorFurnishings", interiorID)	
	Menu.addButton("~g~Decoration", "bikerClubhouseDecorativeMenu", nil)
	Menu.addButton("~y~disable all Decoration props", "disableInteriorDecorative", interiorID)
	Menu.addButton("~g~enable modBooth", "clubhouseModBooth", nil)
	Menu.addButton("~y~disable modBooth", "disableInteriorModBooth", nil)
	Menu.addButton("~o~BACK", "bikerClubhousesMenu", nil)
	Menu.addButton("~r~BACK TO MAIN MENU", "Main", nil)

end
function bikerClubhousMuralsMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~r~TESTING menu"
    options.menu_subtitle = "~r~NATIVE TESTING ~b~menu 5"
    ClearMenu()
	--Menu.addButton("~g~enable interior prop", "", nil)
	Menu.addButton("choose your mural", "clubhouseMural", nil)
	Menu.addButton("~y~disable all mural props", "disableInteriorMurals", interiorID)
	Menu.addButton("~o~BACK", "bikerClubhousInteriorDecorationsMenu", nil)
	Menu.addButton("~o~BACK TO MAIN MENU", "Main", nil)
end
function bikerClubhousWallsMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~r~TESTING menu"
    options.menu_subtitle = "~r~NATIVE TESTING ~b~menu 5"
    ClearMenu()
	--Menu.addButton("~g~enable interior prop", "", nil)
	Menu.addButton("choose your walls", "clubhouseWalls", nil)
	Menu.addButton("~r~disable all wall props", "disableInteriorWalls", interiorID)
	Menu.addButton("~o~BACK TO MAIN MENU", "Main", nil)    	
end
function bikerClubhousfurnishingsMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~r~TESTING menu"
    options.menu_subtitle = "~r~NATIVE TESTING ~b~menu 5"
    ClearMenu()
	--Menu.addButton("~g~enable interior prop", "", nil)
	Menu.addButton("choose your Furnishings", "clubhouseFurnishings", nil)
	Menu.addButton("~r~disable all Furnishings props", "disableInteriorFurnishings", interiorID)
	Menu.addButton("~o~BACK TO MAIN MENU", "Main", nil)    	
end
function bikerClubhouseDecorativeMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~r~TESTING menu"
    options.menu_subtitle = "~r~NATIVE TESTING ~b~menu 5"
    ClearMenu()
	--Menu.addButton("~g~enable interior prop", "", nil)
	Menu.addButton("choose your Decoration", "clubhouseDecorative", nil)
	Menu.addButton("~r~disable all Decoration props", "disableInteriorDecorative", interiorID)
	Menu.addButton("~o~BACK TO MAIN MENU", "Main", nil)    	
end
function clubhouseMural()
    options.menu_title = "~r~TESTING menu"
    options.menu_subtitle = "~r~NATIVE TESTING ~b~menu 5"
    ClearMenu()
	Menu.addButton("mural_01", "mural", 1)
	Menu.addButton("mural_02", "mural", 2)
	Menu.addButton("mural_03", "mural", 3)
	Menu.addButton("mural_04", "mural", 4)
	Menu.addButton("mural_05", "mural", 5)
	Menu.addButton("mural_06", "mural", 6)
	Menu.addButton("mural_07", "mural", 7)
	Menu.addButton("mural_08", "mural", 8)
	Menu.addButton("mural_09", "mural", 9)
	Menu.addButton("~o~BACK TO MAIN MENU", "bikerClubhousMuralsMenu", nil)	
end
function clubhouseWalls()
    options.menu_title = "~r~TESTING menu"
    options.menu_subtitle = "~r~NATIVE TESTING ~b~menu 5"
    ClearMenu()
	Menu.addButton("wall_01", "walls", 1)
	Menu.addButton("wall_02", "walls", 2)
	Menu.addButton("~o~BACK TO MAIN MENU", "Main", nil)	
end
function clubhouseFurnishings()
    options.menu_title = "~r~TESTING menu"
    options.menu_subtitle = "~r~NATIVE TESTING ~b~menu 5"
    ClearMenu()
	Menu.addButton("furnishings_01", "furnishings", 1)
	Menu.addButton("furnishings_02", "furnishings", 2)
	Menu.addButton("~o~BACK TO MAIN MENU", "Main", nil)	
end
function clubhouseDecorative()
    options.menu_title = "~r~TESTING menu"
    options.menu_subtitle = "~r~NATIVE TESTING ~b~menu 5"
    ClearMenu()
	Menu.addButton("Decorative_01", "decorative", 1)
	Menu.addButton("Decorative_02", "decorative", 2)
	Menu.addButton("~o~BACK TO MAIN MENU", "Main", nil)	
end
function clubhouseModBooth()
  EnableInteriorProp(interiorID, "Mod_Booth")
  RefreshInterior(interiorID)
end

function disableInteriorModBooth()
  DisableInteriorProp(interiorID, "Mod_Booth")
  RefreshInterior(interiorID)
end

function mural(n)
 bikerClubhousMuralsMenu()
 mural1 = "mural_0"..n
 EnableInteriorProp(interiorID, mural1)
 RefreshInterior(interiorID)
end
function walls(n)
 bikerClubhousInteriorDecorationsMenu()
 walls1 = "Walls_0"..n
 EnableInteriorProp(interiorID, walls1)
 EnableInteriorProp(interiorID, "lower_walls_default")
 RefreshInterior(interiorID)
end
function furnishings(o)
 bikerClubhousInteriorDecorationsMenu()
 furnishings1 = "Furnishings_0"..o
 EnableInteriorProp(interiorID, furnishings1)
 RefreshInterior(interiorID)
end
function decorative(nn)
 bikerClubhousInteriorDecorationsMenu()
 decorative1 = "Decorative_0"..nn
 EnableInteriorProp(interiorID, decorative1)
 RefreshInterior(interiorID)
end

--[[*************************************************************]]
------------------------------------------------------------------
------------------------offices/business menu---------------------
------------------------------------------------------------------
--[[*************************************************************]]
function businessOffices()
    options.menu_title = "offices and business menu"
    options.menu_subtitle = "offices and business menu"
    ClearMenu()
	Menu.addButton("Offices:Arcadius", "businessOfficesArcadius", nil)		
	Menu.addButton("Offices:Maze Bank Tower", "businessOfficesMazeTower", nil)
	Menu.addButton("Offices:Maze Bank West", "businessOfficesMazeWest", nil)
	Menu.addButton("Offices:Lom Bank", "businessOfficesLomBank", nil)
	Menu.addButton("Warehouse:small", "businessWarehouseSmall", nil)
	Menu.addButton("Warehouse:medium", "businessWarehouseMedium", nil)
	Menu.addButton("Warehouse:large", "businessWarehouseLarge", nil)
    Menu.addButton("~o~BACK TO MAIN MENU", "Main", nil)
end
function businessWarehouseLarge()
 TPPLAYER(GetPlayerPed(PlayerId()), 1006.97, -3102.07, -39.00) 
 businessOffices()
end
function businessWarehouseMedium()
 TPPLAYER(GetPlayerPed(PlayerId()), 1056.48, -3105.72, -39.00) 
 businessOffices()
end
function businessWarehouseSmall()
 TPPLAYER(GetPlayerPed(PlayerId()), 1094.99, -3101.77, -39.00) 
 businessOffices()
end
function businessOfficesArcadius()
    options.menu_title = "offices and business menu"
    options.menu_subtitle = "offices and business menu"
    ClearMenu()
	Menu.addButton("Executive Rich", "businessOfficesArcadius1", nil)
	Menu.addButton("Executive Cool", "businessOfficesArcadius2", nil)
	Menu.addButton("Executive Contrast", "businessOfficesArcadius3", nil)
	Menu.addButton("Old Spice Warm", "businessOfficesArcadius4", nil)
	Menu.addButton("Old Spice Classical", "businessOfficesArcadius5", nil)
	Menu.addButton("Old Spice Vintage", "businessOfficesArcadius6", nil)
	Menu.addButton("Power Broker Ice", "businessOfficesArcadius7", nil)
	Menu.addButton("Power Broker Conservative", "businessOfficesArcadius8", nil)
	Menu.addButton("Power Broker Polished", "businessOfficesArcadius9", nil)
    Menu.addButton("~o~BACK TO MAIN MENU", "Main", nil)
end
function businessOfficesArcadius1()
 RequestIpl("ex_dt1_02_office_02b")
 TPPLAYER(GetPlayerPed(PlayerId()), -141.1987, -620.913, 168.8205) 
 businessOffices()
end
function businessOfficesArcadius2()
 RequestIpl("ex_dt1_02_office_02c")
 TPPLAYER(GetPlayerPed(PlayerId()), -141.5429, -620.9524, 168.8204) 
 businessOffices()
end
function businessOfficesArcadius3()
 RequestIpl("ex_dt1_02_office_02a")
 TPPLAYER(GetPlayerPed(PlayerId()), -141.2896, -620.9618, 168.8204) 
 businessOffices()
end
function businessOfficesArcadius4()
 RequestIpl("ex_dt1_02_office_01a")
 TPPLAYER(GetPlayerPed(PlayerId()), -141.4966, -620.8292, 168.8204) 
 businessOffices()
end
function businessOfficesArcadius5()
 RequestIpl("ex_dt1_02_office_01b")
 TPPLAYER(GetPlayerPed(PlayerId()), -141.3997, -620.9006, 168.8204) 
 businessOffices()
end
function businessOfficesArcadius6()
 RequestIpl("ex_dt1_02_office_01c")
 TPPLAYER(GetPlayerPed(PlayerId()), -141.5361, -620.9186, 168.8204) 
 businessOffices()
end
function businessOfficesArcadius7()
 RequestIpl("ex_dt1_02_office_03a")
 TPPLAYER(GetPlayerPed(PlayerId()), -141.392, -621.0451, 168.8204) 
 businessOffices()
end
function businessOfficesArcadius8()
 RequestIpl("ex_dt1_02_office_03b")
 TPPLAYER(GetPlayerPed(PlayerId()), -141.1945, -620.8729, 168.8204) 
 businessOffices()
end
function businessOfficesArcadius9()
 RequestIpl("ex_dt1_02_office_03c")
 TPPLAYER(GetPlayerPed(PlayerId()), -141.4924, -621.0035, 168.8205) 
 businessOffices()
end

function businessOfficesMazeTower()
 TPPLAYER(GetPlayerPed(PlayerId()), -73.09, -816.79, 243.39) 
 businessOffices()
end
function businessOfficesMazeWest()
 TPPLAYER(GetPlayerPed(PlayerId()), -1382.29, -477.89, 72.03) 
 businessOffices()
end
function businessOfficesLomBank()
 TPPLAYER(GetPlayerPed(PlayerId()), -1573.09, -571.89, 108.51) 
 businessOffices()
end

--[[*************************************************************]]
------------------------------------------------------------------
------------------------import export menu------------------------
------------------------------------------------------------------
--[[*************************************************************]]

function importExportInteriorMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "import export menu"
    options.menu_subtitle = "import export menu"
    ClearMenu()
    Menu.addButton("Import Export 20 car carage", "impExp20CarGarageArc1Menu", nil)
	Menu.addButton("~o~BACK TO MAIN MENU", "Main", nil)

end

function importExportInteriorDecorationsMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "import export menu"
    options.menu_subtitle = "import export menu"
    ClearMenu()
    Menu.addButton("~g~Import Export med garage", "impExp20CarGarageArc1Menu", nil)
	Menu.addButton("~o~BACK TO MAIN MENU", "Main", nil)

end
function impExp20CarGarageArc1Menu()
    RequestIpl("imp_impexp_interior_placement_interior_1_impexp_intwaremed_milo_")
	TPPLAYER(GetPlayerPed(PlayerId()), -191.017, -579.150, 135.99)
end
function impExp20carStyleMenu()
    RequestIpl("hei_dt1_02_ImpExpProxy_c")
	
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "import export menu"
    options.menu_subtitle = "import export menu"
    ClearMenu()
	Menu.addButton("~g~enable interior prop", "impExpMedStyleMenu", nil)
	Menu.addButton("~o~BACK TO MAIN MENU", "Main", nil)	
end
  
function impExpMedStyleMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "import export menu"
    options.menu_subtitle = "import export menu"
    ClearMenu()
	--Menu.addButton("~g~enable interior prop", "", nil)
    Menu.addButton("~g~enable basic style", "enableBasicStyleSet", nil)
    Menu.addButton("~r~disable basic style", "disableBasicStyleSet", nil)
    Menu.addButton("~g~enable Branded style", "enableBrandedStyleSet", nil)
    Menu.addButton("~r~disable Branded style", "disableBrandedStyleSet", nil)
    Menu.addButton("~g~enable pump set", "enablePumpSet", nil)
	Menu.addButton("~r~disable pump set", "disableenablePumpSet", nil)	
	Menu.addButton("~o~BACK TO MAIN MENU", "Main", nil)	
end
function impExpLargeStyleMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "import export menu"
    options.menu_subtitle = "import export menu"
    ClearMenu()
    Menu.addButton("~g~enable larg garage set 1", "enableLargeGarageSet", nil)
	Menu.addButton("~r~disable large garage set 1", "disableLargeGarageSet", nil)
    Menu.addButton("~g~enable larg garage set 2", "enableLargeGarageSet2", nil)
	Menu.addButton("~r~disable large garage set 2", "disableLargeGarageSet2", nil)
    Menu.addButton("~g~enable larg garage set 3", "enableLargeGarageSet3", nil)
	Menu.addButton("~r~disable large garage set 3", "disableLargeGarageSet3", nil)
    Menu.addButton("~g~enable larg garage set 4", "enableLargeGarageSet4", nil)
	Menu.addButton("~r~disable large garage set 4", "disableLargeGarageSet4", nil)	
	Menu.addButton("~o~BACK TO MAIN MENU", "Main", nil)	
end
function enableBasicStyleSet()
  EnableInteriorProp(interiorID, "Basic_style_set")
  RefreshInterior(interiorID)
end
function disableBasicStyleSet()
  DisableInteriorProp(interiorID, "Basic_style_set")
  RefreshInterior(interiorID)
end
function enableBrandedStyleSet()
  EnableInteriorProp(interiorID, "Branded_style_set")
  RefreshInterior(interiorID)
end
function disableBrandedStyleSet()
  DisableInteriorProp(interiorID, "Branded_style_set")
  RefreshInterior(interiorID)
end

function enablePumpSet()
  EnableInteriorProp(interiorID, "pump_01")
  EnableInteriorProp(interiorID, "pump_06")
  EnableInteriorProp(interiorID, "pump_07")
  EnableInteriorProp(interiorID, "pump_08")
  EnableInteriorProp(interiorID, "pump_02")
  EnableInteriorProp(interiorID, "pump_03")
  EnableInteriorProp(interiorID, "pump_04")
  EnableInteriorProp(interiorID, "pump_05")
  RefreshInterior(interiorID)
end
function disableenablePumpSet()
  DisableInteriorProp(interiorID, "pump_01")
  DisableInteriorProp(interiorID, "pump_06")
  DisableInteriorProp(interiorID, "pump_07")
  DisableInteriorProp(interiorID, "pump_08")  
  DisableInteriorProp(interiorID, "pump_02")
  DisableInteriorProp(interiorID, "pump_03")
  DisableInteriorProp(interiorID, "pump_04")
  DisableInteriorProp(interiorID, "pump_05")
  RefreshInterior(interiorID)
end
function enableLargeGarageSet()
  EnableInteriorProp(interiorID, "Garage_Decor_01")
  RefreshInterior(interiorID)
end
function disableLargeGarageSet()
  DisableInteriorProp(interiorID, "Garage_Decor_01")  
  RefreshInterior(interiorID)
end
function enableLargeGarageSet2()
  EnableInteriorProp(interiorID, "Garage_Decor_02")
  RefreshInterior(interiorID)
end
function disableLargeGarageSet2()
  DisableInteriorProp(interiorID, "Garage_Decor_02")  
  RefreshInterior(interiorID)
end
function enableLargeGarageSet3()
  EnableInteriorProp(interiorID, "Garage_Decor_03")
  RefreshInterior(interiorID)
end
function disableLargeGarageSet3()
  DisableInteriorProp(interiorID, "Garage_Decor_03")  
  RefreshInterior(interiorID)
end
function enableLargeGarageSet4()
  EnableInteriorProp(interiorID, "Garage_Decor_04")
  RefreshInterior(interiorID)
end
function disableLargeGarageSet4()
  DisableInteriorProp(interiorID, "Garage_Decor_04")  
  RefreshInterior(interiorID)
end

--[[*************************************************************]]
------------------------------------------------------------------
------------------Press F10 to open/close menu---------------------
------------------------------------------------------------------
--[[*************************************************************]]
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)	
	interiorID = GetInteriorAtCoords(GetEntityCoords(GetPlayerPed(PlayerId()), true))
    interiorRoomKey = GetRoomKeyFromEntity(GetPlayerPed(PlayerId()))	
            if IsControlJustReleased(1, 57) then -- INPUT_CELLPHONE_DOWN                      
   			 Main() -- Menu to draw
             Menu.hidden = not Menu.hidden -- Hide/Show the menu
            end
     Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = fals
	end       
end)
EnableMpDlcMaps()
