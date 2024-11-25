require 'net/http'
require 'json'
require 'uri'

API_URL = 'http://localhost:3000/contatos'

# Solicita as informações do novo contato
puts "Digite o nome do contato:"
nome = gets.chomp
puts "Digite o telefone do contato:"
telefone = gets.chomp
puts "Digite o email do contato:"
email = gets.chomp

# Envia a requisição POST para criar o novo contato
contato = { nome: nome, telefone: telefone, email: email }
uri = URI(API_URL)
request = Net::HTTP::Post.new(uri, {'Content-Type' => 'application/json'})
request.body = contato.to_json
response = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(request) }

# Exibe o status da criação
puts response.code == "201" ? "Contato adicionado com sucesso!" : "Erro ao adicionar o contato."

# Lista todos os contatos
uri = URI(API_URL)
response = Net::HTTP.get(uri)
if response
  JSON.parse(response).each { |contato| puts "#{contato['nome']} - #{contato['telefone']} - #{contato['email']}" }
else
  puts "Não foi possível listar os contatos."
end
