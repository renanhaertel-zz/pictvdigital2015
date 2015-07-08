local dx, dy = canvas:attrSize() 
local y = 0
local x = 0
---------------------------------------------------------------------------------------------------------------------
nomeArquivo = "lista.txt"
arquivo = assert(io.open(nomeArquivo, "r"), "Arquivo não pode ser criado") --assert é uma função que apresenta erro se ocorrer problemas
arquivo:seek("set") --busca o início do arquivo
linhas = {}

dados = {
  nome = {}, colunas = {}
}

line = 0
i = 1
counter = 1
count = 0
---------------------------------------------------------------------------------------------------------------------

--Processamento das informações encontradas no arquivo
for line in io.lines("lista.txt") do
  linhas[counter] = arquivo:read('*line')
  pos = string.find(linhas[counter], ';')
  dados.nome[counter] = string.sub(linhas[counter],i, pos-1)
  io.write(dados.nome[counter] .. '\n')
  dados.colunas[counter] = string.sub(linhas[counter],pos+1, -1)
  --io.write(dados.colunas[counter] .. '\n')
  init = 1
  col = string.find(dados.colunas[counter], ',')
  while col do
    text = string.sub(dados.colunas[counter], init, col-1)
    io.write(text .. '\n')
    init = col + 1
    col = string.find(dados.colunas[counter], ',', init + 1)
  end
  counter = counter  + 1
end

function LuaNCL (evt)
  if evt.class =='ncl' and evt.type == 'presentation' and evt.action == 'start' then
    canvas:attrColor ('black')
    canvas:drawRect('fill',20,0,dx,dy)
    canvas:attrColor ('white')
    canvas:attrFont ('arial', 14, 'bold')
    canvas:drawText (30,y,"Nomes:")
    canvas:drawLine(30, 20, 200, 20)
    y = y + 20
    for varNome=1, #dados.nome do
      canvas:drawText (30,y, dados.nome[varNome])
      tamanho = canvas:measureText(dados.nome[varNome])
      io.write("Tamanho do texto: "..tamanho.."\n")
      if x < tamanho then
        x = tamanho
        x = x + 20
        io.write("tamanho final de X:" ..x.."\n")
      end
      y = y + 20
      canvas:drawLine(30, y, x, y)
      canvas:flush()
      event.post {
        class = 'ncl',
        type = 'presentation',
        action = 'start'
      }
    end
    
    y = 0
    canvas:drawText (300,y,"Dados:")
    canvas:drawLine(300, 20, 500, 20)
    y = y + 20
    for varDados=1, #dados.colunas do
    canvas:drawText (300,y, dados.colunas[varDados])
      y = y + 20
      canvas:drawLine(300, y, 500, y)
      canvas:flush()
      event.post {
        class = 'ncl',
        type = 'presentation',
        action = 'start'
      }
    end
  end
end

event.register(LuaNCL)

arquivo:flush()
io.close(arquivo)
