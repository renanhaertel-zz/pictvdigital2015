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
  rota.id[counter] = string.sub(linhas[counter],i, pos-1)
  rota.idl[counter] = string.sub(linhas[counter],pos+1,1)
  --io.write(rota.idl[counter])
  rota.idp[counter] = string.sub(linhas[counter], pos+3, -1)
  counter = counter  + 1
end

for x=1, #rota.id do
h=1
j=1
    while (rota.idl[x] ~= linha.id[h]) do
	  h = h+1
	end
	while (rota.idp[x] ~= ponto.id[j]) do
	  j = j+1
	end
	io.write (rota.id[x] .. ' ' .. linha.nome[h] .. ' ' .. ponto.nome[j] .. '\n')
end
