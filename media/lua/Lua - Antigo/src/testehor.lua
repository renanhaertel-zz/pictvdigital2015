local dx, dy = canvas:attrSize() 
local y = 0
local x = 0
---------------------------------------------------------------------------------------------------------------------

linhas = {}

ponto = {
  nome = {}, id = {}
}

linha = {
	nome = {}, id = {}
}

rota = {
	id = {}, idl = {}, idp = {}
}

line = 0
i = 1
j=1
h=1
count = 0
lnome = ''
pnome = ''
---------------------------------------------------------------------------------------------------------------------

--Processamento das informações encontradas no arquivo
nomeArquivo = "pontos.txt"
pontos = assert(io.open(nomeArquivo, "r"), "Arquivo não pode ser criado") --assert é uma função que apresenta erro se ocorrer problemas
pontos:seek("set") --busca o início do arquivo
counter = 1
for line in io.lines("pontos.txt") do
  linhas[counter] = pontos:read('*line')
  pos = string.find(linhas[counter], ';')
  ponto.id[counter] = string.sub(linhas[counter],i, pos-1)
  ponto.nome[counter] = string.sub(linhas[counter],pos+1, -1)
  counter = counter  + 1
end
nomeArquivo = "linhas.txt"
onibus = assert(io.open(nomeArquivo, "r"), "Arquivo não pode ser criado") --assert é uma função que apresenta erro se ocorrer problemas
onibus:seek("set") --busca o início do arquivo
counter = 1
for line in io.lines("linhas.txt") do
  linhas[counter] = onibus:read('*line')
  pos = string.find(linhas[counter], ';')
  linha.id[counter] = string.sub(linhas[counter],i, pos-1)
  linha.nome[counter] = string.sub(linhas[counter],pos+1, -1)
  counter = counter  + 1
end
nomeArquivo = "horarios.txt"
rotas = assert(io.open(nomeArquivo, "r"), "Arquivo não pode ser criado") --assert é uma função que apresenta erro se ocorrer problemas
rotas:seek("set") --busca o início do arquivo
counter = 1
for line in io.lines("horarios.txt") do
  linhas[counter] = rotas:read('*line')
  pos = string.find(linhas[counter], ';')
  rota.id[counter] = string.sub(linhas[counter],1, 6)
  rota.idl[counter] = string.sub(linhas[counter],7,7)
  --io.write(rota.idl[counter])
  rota.idp[counter] = string.sub(linhas[counter], 18, -1)
  counter = counter  + 1
end


function LuaNCL (evt)
  if evt.class =='ncl' and evt.type == 'presentation' and evt.action == 'start' then
    canvas:attrColor ('black')
    canvas:drawRect('fill',20,0,dx,dy)
    canvas:attrColor ('white')
    canvas:attrFont ('arial', 10, 'bold')
    canvas:drawText (30,y,"Linha - Ponto")
    canvas:drawLine(30, 20, 200, 20)
    y = y + 20    
    s = 30
    for x=1, #rota.id do
		h=1
		j=1
	    while (rota.idl[x] ~= linha.id[h]) do
		  h = h+1
		end
		canvas:drawText (s,y, linha.nome[h] .. ' ' .. rota.idp[x])
	    if y == 220 then 
    		y = 0
    		s = s + 120
    	end
    	y = y + 20
	end

      
      canvas:drawLine(30, y, x, y)
      canvas:flush()
      event.post {
        class = 'ncl',
        type = 'presentation',
        action = 'start'
      }
    end
    
    y = 0
    canvas:drawText (300,y,"Ponto:")
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

event.register(LuaNCL)

arquivo:flush()
io.close(pontos)
io.close(onibus)
io.close(rotas)
