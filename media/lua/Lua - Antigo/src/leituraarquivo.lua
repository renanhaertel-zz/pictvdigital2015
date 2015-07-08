local texto
local y = 0

nomearquivo = "teste.txt"
arquivo = assert(io.open(nomearquivo, "w"),"Arquivo não pode ser encontrado") -- Modo R - Leitura, Modo A - Anexo, Modo W - Escrita, Modo R+ A+ e W+ preserva os dados anteriores
arquivo:write("arquivo teste\n")
arquivo:flush()
io.close(arquivo)


texto = {}
texto[1]="Projeto de Iniciacao Cientifica - PIC TV Digital - Realizado"
texto[2]="pela UNIPAR - Universidade Paranaense para implementacao"
texto[3]="de horarios de linhas de onibus urbano no canal TV UP."

function LuaNCL (evt)
  if evt.class =='ncl' and evt.type == 'presentation' and evt.action == 'start' then
    canvas:attrColor ('black')
    canvas:drawRect('fill',20,0,600,200)
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
