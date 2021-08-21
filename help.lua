local event = require("event")
local component = require("component")
local computer = require("computer")
local gpu = component.gpu
local term = require("term")
local shell = require("shell")

local keys = {
  enter = 28,
  up = 200,
  down = 208,
}

local indexed = {
{"print"," - функция вывода на экран, чтоб выводить текст по определенным координатам надо задавать их командой term.setCursor(x,y). Предварительно надо указать в программе term = require(`term`)"},
{"while do"," - цикл повторения while true do (тело программы) end - будет беспрерывно повторять программу пока не будет использована команда выхода os.exit() либо условие выхода"},
{"if else"," - оператор ветвления, если-условие-то-выполнить, пример написания if a==1 or c<a then b=1 else b=2 end"},
{"for do"," - цикл повторения for i = 1,3 print(i) end - повторит цикл 3 раза и выведет на экран построчно 1 2 3. end  в конце указывает на заврешение цикла оператора, можно использовать для определенного количества повторений операции, например при обработке массивов данных."},
{"io.read()"," - функция считывания клавиатуры, можно задать переменную вида name = io.read() в этом случае данные в переменную name будут записаны пользователем непосроедственно при выполнений программы"},
{"shell"," - команда shell.execute(`reboot`) запустит консоль со строкой reboot и перезапустит пк, таким образом можно пользоваться консолью из программы. Предварительно надо указать в программе shell = require(`shell`). Вместо reboot можно использовать любые консольные команды pastebin, resolution, cd, dir и пр."},
{""," - "},
{""," - "},
{""," - "},
{"пример 1"," \n a = 1 \n b = 2 \n print(a+b) \n - выводит на экран 3 \n \n a = io.read() \n b = io.read() \n print(a) \n print(b) \n - после того как пользователь введет две переменные а и б, выведет построчно их на экране"},
{"пример 2"," \n print(`напишите ваш рост в сантиметрах`) \n local rost = tonumber(io.read()) \n if rost > 180 then \n print(`вы ростом с великана`) \n elseif rost < 120 then \n print(`вы ростом с хоббита`) \n else \n print(`вы ростом с эльфа`) \n end \n - пример ветвления, при вводе пользователем данных функция tonumber сразу переводит символьное значение в цифровое, чтоб в условии срабатывало сравнение больше, меньше.  "},
{"exit"," - "},
}
st = 1

function sett()
 term.setCursor(3,3+st)
 print(">>")
end

function menu()
 term.clear()
 for i = 1,#indexed do
  term.setCursor(7,3+i)
  print (indexed[i][1])
 end
 sett()
end

while true do
 menu()
local eventname, _, char, code = event.pull('key_down')
    if eventname == 'key_down' then
      if code == keys.enter then
	   if st == 12 then
	    term.clear()
        os.exit()
	else
	 term.clear()
	 print(indexed[st][1]..indexed[st][2])
	 os.sleep(0.5)
	 local eventname, _, char, code = event.pull('key_down')
     if eventname == 'key_down' then
     menu()
	 end
	end
	   elseif code == keys.up then
	    if st == 1 then
		 st = 12
		else
		 st = st - 1
		end
	   elseif code == keys.down then
	    if st == 12 then
		 st = 1
		else
		 st = st + 1
		end
       end
	 end
end
 
