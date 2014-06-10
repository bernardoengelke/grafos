# encoding: utf-8
load "grafo.rb"
require 'set'

grafo = Grafo.new

grafo.adicionaVertice "v1"
grafo.adicionaVertice "v2"
grafo.adicionaVertice "v3"
grafo.adicionaVertice "v4"
grafo.adicionaVertice "v5"

grafo.conectar "v1","v2", 15
grafo.conectar "v1","v3", 12
grafo.conectar "v2","v3", 6
grafo.conectar "v2","v4", 13
grafo.conectar "v2","v5", 5
grafo.conectar "v3","v4", 6


#Retorna a árvore geradora mínima
puts "Árvore geradora mínima:"

class Kruskal
# Algoritmo de Kruskal para arvore geradora de custo minimo

	def initialize
		#Criação da floresta
		arvore = Grafo.new
		
		#Conjunto dos vértices
		vertices = []
		grafo.vertices.each{ |v| vertices.push(Set.new [v])}
	end

	def kruskal(grafo)
		grafo = Grafo.new
		#Arestas ordenadas por peso
		arestas = grafo.arestas
		arestas_ordenadas = arestas.sort_by{|aresta,custo| custo}
		while vertices.size > 1 do
			# Escolha uma aresta (v,w) em E/Q de menor custo
			# Apague (v,w) em E/Q
			aresta = arestas_ordenadas.shift
			v = aresta[0][0]
			w = aresta[0][1]
			peso = aresta[1]
			conjunto_v = Set.new
			conjunto_w = Set.new
			vertices.each{ |conjunto|
				if conjunto.include?(v)
					conjunto_v = conjunto
				end

				if conjunto.include?(w)
					conjunto_w = conjunto
				end
			}

			if conjunto_v != conjunto_w
			     conjunto_novo = conjunto_v + conjunto_w
			     vertices.push conjunto_novo
			     vertices.delete conjunto_v
			     vertices.delete conjunto_w
			     arvore.adicionaVertice v
			     arvore.adicionaVertice w
			     arvore.conectar(v,w,peso)
			 end
		end
		return arvore
	end
end
