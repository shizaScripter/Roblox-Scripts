--variables
getgenv().QuestFarm = false;
getgenv().FarmKills = false;
getgenv().AltFarmKills = false;
getgenv().Clicker = false;

local plr = game.Players.LocalPlayer
local Strength = game:GetService("Players").LocalPlayer.PlayerGui.Main.Hotkeys["1"]
local Durability = game:GetService("Players").LocalPlayer.PlayerGui.Main.Hotkeys["2"]
local Chakra = game:GetService("Players").LocalPlayer.PlayerGui.Main.Hotkeys["3"]
local Sword = game:GetService("Players").LocalPlayer.PlayerGui.Main.Hotkeys["4"]
local killAmount = 0
local FarmPlr = ""
local m = require(game.Players.LocalPlayer.PlayerGui.Main.MainClient.StatModuleClient)

--Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("AFS Clicker vasia20017 Developement", "Serpent")
local Tab = Window:NewTab("Main")
local Tab2 = Window:NewTab("Quests")
local Tab3 = Window:NewTab("Settings")
local Section = Tab:NewSection("Main")
local Section2 = Tab2:NewSection("Quest Farm")
local Section3 = Tab3:NewSection("Settings")


Section:NewToggle("Clicker", "ToggleInfo", function(state)
    if state then
       SClicker(state)
    else
       SClicker(state)
    end
end)

Section2:NewToggle("QuestFarm", "ToggleInfo", function(state)
    if state then
       SQuests(state)
    else
       SQuests(state)
    end
end)

Section2:NewToggle("KillFarm", "ToggleInfo", function(state)
    if state then
       SKillFarm(state)
    else
       SKillFarm(state)
    end
end)

local Section4 = Tab2:NewSection("Kill/Quest Farm Settings")



Section4:NewTextBox("Kill Amount ","", function(txt)
	killAmount = tostring(txt)
end)

local Section5 = Tab2:NewSection("alt settings")

Section5:NewToggle("KillFarm", "ToggleInfo", function(state)
    if state then
       SQuests(state)
    else
       SQuests(state)
    end
end)


Section5:NewTextBox("Farmer Name","Farmer Name to teleport", function(txt)
	FarmPlr = txt
end)

Section5:NewToggle("Kick after finish", "ToggleInfo", function(state)
    if state then
       SQuests(state)
    else
       SQuests(state)
    end
end)

Section3:NewButton("Change Theme", "ButtonInfo", function()
    Library:ChangeTheme("DarkTheme")
end)

Section3:NewKeybind("UI Toggle", "KeybindInfo", Enum.KeyCode.F, function()
    Library:ToggleUI()
end)


--Functions
function SClicker(state)
   getgenv().Clicker = state
   if getgenv().Clicker == true then
      while true do
         wait(0.2)
         m:ActivateKey()
      end
   end
end

function SQuests(state)
   getgenv().QuestFarm = state
   if getgenv().QuestFarm == true then
      local qCont = game:GetService("Players").LocalPlayer.PlayerGui.Main.Category.Frames.Quests.Container.List
      for i,v in pairs(qCont:GetChildren()) do
         if v:IsA("Frame") then
            for _,k in pairs(v.Bars:GetChildren()) do
               if k:IsA("Frame") then
                  if k.Name == "Chakra" then
                     EQStat("Chakra")
                  elseif k.Name == "Strength" then
                     EQStat("Strength")
                  elseif k.Name == "Durability" then
                     EQStat("Durability")   
                  end
               end
            end 
         end
      end
   end
end

function EQStat(stat)
   if stat == "Strength" then
      for i,v in next,getconnections(Strength.MouseButton1Click) do
          v:Fire()
      end
    elseif stat == "Durability" then
       for i,v in next,getconnections(Durability.MouseButton1Click) do
          v:Fire()
      end
    elseif stat == "Chakra" then
      for i,v in next,getconnections(Chakra.MouseButton1Click) do
          v:Fire()
      end 
    elseif stat == "Sword" then
      for i,v in next,getconnections(Sword.MouseButton1Click) do
          v:Fire()
      end
   end
end

function QuestTalk(npc)
   for i,v in pairs(workspace.NPCs:GetChildren()) do
       if v.Name == npc then
          fireclickdetector(v.ClickBox.ClickDetector)
       end  
   end
end

function DimCheck()
   if game.PlaceId == 4042427666 then
      return 1
   end
end

function findPlr(plr2,chart)
   for i,v in pairs(game:GetService("Players"):GetChildren()) do
      if v.Name == plr2 then
         if chart == true then
            return v.Character
         end 
      end
   end
end

function SKillFarm(state)
   getgenv().FarmKills = state
   if getgenv().FarmKills == true then
      local Websocket = WebSocket.connect("wss://demo.piesocket.com/v3/channel_1?api_key=oCdCMcMPQpbvNjUIzqtvF1d2X2okWpDQj4AwARJuAgtjhzKxVEjQU6IdCjwm&notify_self")
      Websocket.OnMessage:Connect(function(msg)
          if string.sub(msg,1,2) == "a " then
            print(msg)
            print(string.sub(msg,2,2))
          end
      end)
      while true do
          if getgenv().FarmKills == true then
              wait(0.2)
              plr.Character.HumanoidRootPart.CFrame = CFrame.new(107.960732, 61.0075188, -1602.83191, -0.416828513, -3.06281223e-08, 0.908985138, 9.90277194e-09, 1, 3.82359175e-08, -0.908985138, 2.49392933e-08, -0.416828513)
              Websocket:Send("a " .. tostring(killAmount))
              else
              break;   
          end
      end       
   end
end

