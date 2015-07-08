local dx, dy = canvas:attrSize()

local texto
local y = 0

texto = {}
texto[1]="Projeto de Iniciacao Cientifica - PIC TV Digital - Realizado"
texto[2]="pela UNIPAR - Universidade Paranaense para implementacao"
texto[3]="de horarios de linhas de onibus urbano no canal TV UP."

function LuaNCL (evt)
  if evt.class =='ncl' and evt.type == 'presentation' and evt.action == 'start' then
    canvas:attrColor ('black')
    canvas:drawRect('fill',20,0,dx,dy)
    for var=1, #texto do
      canvas:attrColor ('white')
      canvas:attrFont ('calibri', 20, 'bold')
      canvas:drawText (30,y, texto[var])
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