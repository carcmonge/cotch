---------------------------------------------
--COTCH V.Alpha - By: ANI-KIBA, cam-maker Team Delta Bit
--------------------------------------------
--[[
 * Cotch - The Game
 * Copyright 2016 Carlos Monge and ANI-KIBA
 * Licensed under MIT (https://github.com/carcmonge/cotch/blob/master/LICENSE)
]]--
---------------------------------------------
--Colores
--------------------------------------------
LimeGreen		= color.new(50,205,50)
blanco 			= color.new(255,255,255)
AliceBlue		= color.new(240,248,255)
LightSteelBlue 	= color.new(176,196,222)
negro 			= color.new(0,0,0)
LightSkyBlue 	= color.new(135,206,250)
---------------------------------------------
--Imagenes
--------------------------------------------
bola 			= {}
bola.roja 		= image.load("./bola.png")
bola.azul 		= image.load("./bola2.png")
bola.verde 		= image.load("./bola3.png")
bola.celeste 	= image.load("./bola4.png")
bola.arcoiris 	= image.load("./bola5.png")

canasta 		= image.load("./canasta.png")
---------------------------------------------
--Variables
--------------------------------------------
x 					 = {}
x.personaje			 = 50
y 					 = {}
y.bolaRoja			 = 0
y.bolaAzul 			 = 0
y.bolaVerde			 = 0
y.bolaCeleste 		 = 0
y.bolaArcoiris		 = 0

numRandom			 = {}
puntaje 		     = 0
ancho				 = {}
ancho.bolaRoja 		 = image.width(bola.roja) --x
ancho.bolaAzul		 = image.width(bola.azul) --x
ancho.bolaVerde		 = image.width(bola.azul) --x
ancho.bolaCeleste 	 = image.width(bola.azul) --x
ancho.bolaArcoiris 	 = image.width(bola.azul) --x
---------------------------------------------
--Sonidos
--------------------------------------------
take 	= sound.load("sonido2.wav")
--sonido 	= sound.load("fondo.mp3")
---------------------------------------------
--Funciones
--------------------------------------------
function numRamdonRojo()
	numRandom.bolaRoja = math.random (10,470)
	y.bolaRoja = 0
end
function numRamdonAzul()
	numRandom.bolaAzul = math.random (10,470)
	y.bolaAzul = 0
end
function numRamdonVerde()
	numRandom.bolaVerde = math.random (10,470)
	y.bolaVerde = 0
end
function numRamdonCeleste()
	numRandom.bolaCeleste = math.random (10,470)
	y.bolaCeleste = 0
end
function numRamdonArcoiris()
	numRandom.bolaArcoiris = math.random (10,470)
	y.bolaArcoiris = 0
end
numRamdonRojo()
numRamdonAzul()
numRamdonVerde()
numRamdonCeleste()
numRamdonArcoiris()
--sound.play(sonido,2)
while true do
	controls.read()
	draw.gradrect(0,0,480,272,LightSteelBlue,LightSteelBlue,AliceBlue,AliceBlue)
	y.bolaRoja = y.bolaRoja + 5
	y.bolaAzul = y.bolaAzul + 2
	y.bolaVerde = y.bolaVerde + 3
	y.bolaCeleste = y.bolaCeleste + 4
	y.bolaArcoiris = y.bolaArcoiris + 7
	if y.bolaRoja >= 280 then
		numRamdonRojo()
	end
	if y.bolaAzul >= 280 then
		numRamdonAzul()
	end
	if y.bolaVerde >= 280 then
		numRamdonVerde()
	end
	if y.bolaCeleste >= 280 then
		numRamdonCeleste()
	end
	if y.bolaArcoiris >= 280 then
		numRamdonArcoiris()
	end
	image.blit(numRandom.bolaRoja,y.bolaRoja,bola.roja)
	image.blit(numRandom.bolaAzul,y.bolaAzul,bola.azul)
	image.blit(numRandom.bolaVerde,y.bolaVerde,bola.verde)
	image.blit(numRandom.bolaCeleste,y.bolaCeleste,bola.celeste)
	image.blit(numRandom.bolaArcoiris,y.bolaArcoiris,bola.arcoiris)
	
	if x.personaje+18 >= numRandom.bolaRoja and x.personaje+18 <= ancho.bolaRoja+numRandom.bolaRoja and y.bolaRoja >= 230 and y.bolaRoja <= 242 then
		sound.play(take,1)
		puntaje = puntaje + 1
		numRamdonRojo()
	end
	if x.personaje+18 >= numRandom.bolaAzul and x.personaje+18 <= ancho.bolaAzul+numRandom.bolaAzul and y.bolaAzul >= 230 and y.bolaAzul <= 242 then
		sound.play(take,1)
		puntaje = puntaje + 1
		numRamdonAzul()
	end
	if x.personaje+18 >= numRandom.bolaVerde and x.personaje+18 <= ancho.bolaVerde+numRandom.bolaVerde and y.bolaVerde >= 230 and y.bolaVerde <= 242 then
		sound.play(take,1)
		puntaje = puntaje + 1
		numRamdonVerde()
	end
	if x.personaje+18 >= numRandom.bolaCeleste and x.personaje+18 <= ancho.bolaCeleste+numRandom.bolaCeleste and y.bolaCeleste >= 230 and y.bolaCeleste <= 242 then
		sound.play(take,1)
		puntaje = puntaje + 1
		numRamdonCeleste()
	end
	if x.personaje+18 >= numRandom.bolaArcoiris and x.personaje+18 <= ancho.bolaArcoiris+numRandom.bolaArcoiris and y.bolaArcoiris >= 230 and y.bolaArcoiris <= 242 then
		sound.play(take,1)
		puntaje = puntaje + 1
		numRamdonArcoiris()
	end
	image.blit(x.personaje,230,canasta)
	screen.print(10,10,"Puntaje: "..puntaje,1,negro,AliceBlue)
	screen.flip()
	if controls.right() then
		x.personaje = x.personaje + 6
	end
	if controls.left() then
		x.personaje = x.personaje - 6
	end
	if controls.select() then
		cam()
	end
end