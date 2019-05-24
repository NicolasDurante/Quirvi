-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local contador=0

local fondo = display.newImageRect( "fondo.png", 360, 570 )
fondo.x = display.contentCenterX
fondo.y = display.contentCenterY

local tapTexto= display.newText(contador,20,-5,native.systemFont,40)
tapTexto:setFillColor(249,112,0,1)

local plataforma = display.newImageRect( "plataforma.png", 300, 50 )
plataforma.x = display.contentCenterX
plataforma.y = display.contentHeight-25

local quirvi = display.newImageRect("noEsKirby.png",112,112)
quirvi.x=display.contentCenterX
quirvi.y=display.contentCenterY
quirvi.alpha=0.8

local fisicas= require("physics")
fisicas.start()

fisicas.addBody(plataforma,"static")
fisicas.addBody(quirvi,"dynamic",{radius=55,bounce=0.3})

local function empujarGlobo()
	quirvi:applyLinearImpulse(0,-0.75,quirvi.x,quirvi.y)
	contador=contador+1
	tapTexto.text=contador
end

quirvi:addEventListener("tap",empujarGlobo)
