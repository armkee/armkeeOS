local shell = require("shell")
shell.execute("cd //")
local success, reason = pcall(loadfile("/gui.lua")); if not success then print("Ошибка: " .. tostring(reason)) end