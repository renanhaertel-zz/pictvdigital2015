local dx, dy = canvas:attrSize() -- tamanho do canvas
local acad
local y = 0
local x = 0

acad = {}
acad[1] = "1053940 ANDERSON PEREIRA DE SOUZA"
acad[2] = "1055400 RENAN HAERTEL"
acad[3] = "1055477 AYLA TAYNA FELIPE QUADRELLI"
acad[4] = "1055645 ANA CAROLINA URIAS MACHADO"
acad[5] = "1055749 CAMILA CONEGLIAN FREITAS"
acad[6] = "Andre Ricard"
acad[7] = "Vitor Correa"
acad[8] = "Leonardo Comar"
acad[9] = "Igor Fugimoto"

function LuaNCL (evt)
  if evt.class =='ncl' and evt.type == 'presentation' and evt.action == 'start' then
    canvas:attrColor ('black')
    canvas:drawRect('fill',20,0,dx,dy)
    for var=1, #acad do
      canvas:attrColor ('white')
      canvas:attrFont ('calibri', 20, 'bold')
      canvas:drawText (30,y, "Academicos: "..acad[var])
      y = y + 20
      canvas:flush()
      event.post {
        class = 'ncl',
        type = 'presentation',
        action = 'start'
      }
    end
  end
end

function LuaNCL1 (evt)
  if evt.class =='ncl' and evt.type == 'presentation' and evt.action == 'stop' then
    event.post {
      class = 'ncl',
      type = 'presentation',
      action = 'stop'
    }
  end
end

event.register(LuaNCL)