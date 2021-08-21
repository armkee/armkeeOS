-- By armkee

local event = require("event")
local component = require("component")
local computer = require("computer")
local gpu = component.gpu
local term = require("term")
local shell = require("shell")

--local image = require("image")
--local ecs = require("ECSAPI")
--local buffer = require("doubleBuffering")
--local GUI = require("GUI")

local xScr, yScr = gpu.getResolution()
local xCen, yCen = math.ceil(xScr/2), math.ceil(yScr/2)
local linedwn = "  Создано armkee"
local clr = {
  yellow = 0xf8f32b,
  white = 0xFFFFFF,
  black = 0x000000,
  blue  = 0x009acd,
  green = 0x0b5e56,
  cyan  = 0xeeb422,
  red   = 0xee3b3b
}
local keys = {
  one = 2,
  two = 3,
  tri = 4,
  nol = 11,
  enter = 28,
  left = 203,
  right = 205,
  up = 200,
  down = 208,
  tab = 15,
  backspace = 14,
  delete = 211,
  home = 199,
  leftShift = 42,
  rightShift = 54,
  leftCtrl = 29,
  rightCtrl = 157,
  leftAlt = 56,
  rightAlt = 184,
  f1 = 59,
  f4 = 62,
  f5 = 63,
  f6 = 64,
  f7 = 65,
  f8 = 66,
  f10 = 68
}
if gpu.getDepth() > 1 then
  lf1,lf2,lb1,lb2,lb3,lb4,lb5 = clr.white,clr.black,clr.black,clr.red,clr.yellow,clr.green,clr.blue
else
  lf1,lf2,lb1,lb2,lb3,lb4,lb5 = clr.white,clr.black,clr.black,clr.white,clr.black,clr.white,clr.black
end

local function disp()
gpu.setBackground(lf1)
term.clear()

gpu.setForeground(lf1)
gpu.setBackground(lb1)
term.setCursor (xCen-8, yCen-3)
print ("ArmkeeOS       ")
gpu.setBackground(lb2)
term.setCursor (xCen+2, yCen-3)
print (" ")
gpu.setBackground(lb3)
term.setCursor (xCen+3, yCen-3)
print (" ")
gpu.setBackground(lb4)
term.setCursor (xCen+4, yCen-3)
print (" ")
gpu.setBackground(lb5)
term.setCursor (xCen+5, yCen-3)
print (" ")
gpu.setBackground(lb1)
term.setCursor (xCen+6, yCen-3)
print ("  ")
gpu.setForeground(lf2)
gpu.setBackground(lf1)
term.setCursor (xCen-8, yCen-2)
print ("║1 Скачать...  ║")
term.setCursor (xCen-8, yCen-1)
print ("║2 Проводник   ║")
term.setCursor (xCen-8, yCen)
print ("║3 Скрипты     ║")
term.setCursor (xCen-8, yCen+1)
print ("║0 Терминал    ║")
term.setCursor (xCen-8, yCen+2)
print ("╚══════════════╝")
term.setCursor (xCen - (string.len(linedwn)/2)+2, yScr)
print (string.sub(linedwn,1,xScr-9).." 2021")
shell.execute("cd //")
end
os.sleep(0.1)
disp()
os.sleep(0.1)
while true do
disp()
local eventname, _, char, code = event.pull('key_down')
    if eventname == 'key_down' then
      if code == keys.nol then
	   term.clear()
       os.exit()
	   elseif code == keys.one then
	   shell.execute("ethernet.lua")
	   elseif code == keys.two then
	   shell.execute("filemanager.lua")
	   elseif code == keys.tri then
	   shell.execute("help.lua")
       end
	 end
end
