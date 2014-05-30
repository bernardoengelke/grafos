# encoding: utf-8
# A acima permite usar caracteres especiais em strings para impressão (debug). Basicamente converte o arquivo em UTF-8.
# Ela deve ser especificada sempre na primeira linha do arquivo para ter efeito.

class Grafo
  def initialize
    # usuario deve passar argumento informando se o grafo é direcionado ou não?
    # atualmente o algoritimo é apenas para grafo simples
    @vertices = Hash.new
  end
  # "Adiciona um novo vértice em G"
  # G.adicionaVértice(v)
  def adicionaVertice(vertice)
    @vertices[vertice] = Hash.new	
  end
  # "Remove um vértice de G, juntamente com todas as conexões"
  # G.removeVértice(v)
  def removeVertice(vertice)
    # iterar sobre o vertice e ver quais vertices devem remover uma entrada dele;
    @vertices[vertice].keys.each{|v| @vertices[v].delete vertice}
    @vertices.delete vertice
  end
  # "Conecta os vértices v1 e v2 em G"
  # G.conecta(v1,v2)
  def conectar(vertice1,vertice2, peso)
    # se for usarmos dijkstra temos que passar peso positivo como parametro.
    @vertices[vertice1][vertice2] = peso
    @vertices[vertice2][vertice1] = peso
  end
  # "Desconecta os vértices v1 e v2 em G"
  # G.desconecta(v1,v2)
  def desconectar(vertice1, vertice2)
    @vertices[vertice1].delete vertice2
    @vertices[vertice2].delete vertice1	
  end
  # "Retorna o número de vértices de G"
  # G.ordem → Inteiro
  def ordem
    @vertices.size
  end
  # "Retorna um conjunto contendo os vértices de G"
  # G.vértices → Conjunto
  def vertices
    @vertices.keys
  end
  # "Retorna um vértice qualquer de G"
  # G.umVértice → Vertice
  def umVertice
    @vertices.keys[rand(@vertices.size)]
  end
  # "Retorna um conjunto contendo os vértices adjacentes a v em G"
  # G.adjacentes(v)Conjunto
  def adjacentes(vertice)
    @vertices[vertice].keys
  end
  # "Retorna o número de vértices adjacentes a v em G"
  # G.grau(v)Inteiro
  def grau(vertice)
    if @vertices[vertice][vertice]
      @vertices[vertice].size+1
    else
      @vertices[vertice]
    end
  end
  #Imprime o valor do peso de um vértice passado como parâmetro
  def printPeso(vertice)    
	#@vertices[vertice].each{|k,v| puts "#{v}"}
        @vertices[vertice]	
  end
  #Imprime todos os vértices com sesus respectivos valores
  def printAllPeso()
     @vertices.each do |key, value|
     puts "#{key} ' : ' #{value}"
     end
  end
  
  def dijkistra(verticeDaVez)
    #Variável contendo os vértices
    conjVertices = @vertices.keys
            
    #Vetores que irão armazenar as informações necesárias
    visitados = Array.new(@vertices.size)
    distancia = Array.new(@vertices.size)
    caminho = Array.new(@vertices.size)
     
    #O índice é subtraíddo de -1 para facilitar a leitura do código. Foi-se decidido que cada vértice pertencerá à posição de índice de mesmo valor.
    #Ou seja, cada posição dentro do array será de um vértice somente pois durante o processo será atualizado valores dentro do array.
    #Inicialização dos arrays para o estado inicial que é o vértice de origem.
    verticeDaVez = verticeDaVez.to_i
    visitados[verticeDaVez-1] = verticeDaVez
    distancia[verticeDaVez] = "0"
    caminho[verticeDaVez] = nil	   
    
    puts "Conjunto dos vértices do array: #{conjVertices}"    
    puts "Array contendo os vértices visitados: #{visitados}"    
    puts "---------------------------------------------------"
    puts "Vértices adjacentes à 1: #{adjacentes(conjVertices[0])}"
    puts "---------------------------------------------------"
    puts "Valor do peso da aresta que liga do vértice 1 à 2: #{printPeso(conjVertices[0])}"
    puts "Imprimindo o grafo inteiro juntamente com os pesos: "
    printAllPeso()   
   
 
    #Como se sabe que o array não está no estado "todos" nil iniciamos a variável com true;
    condicao = true;
    #Aqui vem o while
    while (condicao == true)
	    cont = 1
            #necessita pegar o peso de cada vértice!!! TA DANDO ERRO
	#@vertices.each{|key,value| value.each{|peso| p peso } }

		p @vertices[verticeDaVez.to_s].each{|key,value|  p value }
	    #@vertices[adjacentes(conjVertices[verticeDaVez-1])].keys.each do |key, value|
            puts "Eita diabo!"
	    puts key
            puts value

	        
	
		    #convertendo string to int
		    key = key.to_i   
		    distancia[key-1] = value
		    caminho[key-1] = visitados[(1)-1]
	    #end
	    
	    puts "imprimindo o array distância (#{cont} passagem): #{distancia.each{|k| puts "#{k}"}}"	
	    puts "imprimindo o array caminho (#{cont} passagem): #{caminho.each{|k| puts "#{k}"}}"	

	    #compara o menor peso entre os vértices adjacentes.
	    #atualiza a variável verticeDaVez com o vértice de menor peso.
            puts "Conjunto dos vértices do array: #{conjVertices}"
	    adjacentes(conjVertices[verticeDaVez]).each do |key, value|
		 puts key
                 puts value
		    menorPeso = 100000000
		    if(menorPeso < value)
		    	menorPeso = value
		    end

		    verticeDaVez = menorPeso   
	    end
	    #percorre o array e verifica se existe algum valor nil
	    visitados.each do |v|
		    if(v == nil)
		    	condicao = true
		    else
		        condicao = false
		    end
            end
    end     

  end
  
  
end


  #https://github.com/Nandolfrs/Dijkstra-Ruby/blob/master/dijkstra.rb
  #https://gist.github.com/yaraki/1730288
  #http://www.lcad.icmc.usp.br/~nonato/ED/Dijkstra/node84.html


grafo = Grafo.new

grafo.adicionaVertice("1")
grafo.adicionaVertice("2")
grafo.adicionaVertice("3")
grafo.adicionaVertice("4")
grafo.adicionaVertice("5")

grafo.conectar("1","2", 10)
grafo.conectar("2", "3", 3)
grafo.conectar("1", "3", 5)
grafo.conectar("2", "4", 1)
grafo.conectar("3", "4", 9)
grafo.conectar("4", "5", 6)

#grafo.conectar("v1","v3")
#grafo.conectar("v1","v6")

#grafo.conectar("v2","v1")
#grafo.conectar("v2","v3")
#grafo.conectar("v2","v4")

#grafo.conectar("v3","v1")
#grafo.conectar("v3","v2")
#grafo.conectar("v3","v4")
#grafo.conectar("v3","v6")

#grafo.conectar("v4","v2")
#grafo.conectar("v4","v3")
#grafo.conectar("v4","v5")

#grafo.conectar("v5","v4")
#grafo.conectar("v5","v6")

#grafo.conectar("v6","v1")
#grafo.conectar("v6","v3")
#grafo.conectar("v6","v5")

grafo.dijkistra("1")
=begin
puts "Tamanho do grafo"
puts grafo.ordem

puts "Vertices do grafo"
print grafo.vertices
puts ""

puts "vertices adjacentes a v1"
print grafo.adjacentes "v1"
puts ""

puts "vertices adjacentes a v2"
print grafo.adjacentes "v2"
puts ""

puts "vertices adjacentes a v3"
print grafo.adjacentes "v3"
puts ""

puts "vertices adjacentes a v4"
print grafo.adjacentes "v4"
puts ""

puts "vertices adjacentes a v5"
print grafo.adjacentes "v5"
puts ""

puts "grafo adjacentes a v6"
print grafo.adjacentes "v6"
puts ""
=end
