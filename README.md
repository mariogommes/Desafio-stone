# Desafio

## Descrição

Resolução do desafio para o Programa de Formação em Elixir, descrito no link abaixo:
https://gist.github.com/programa-elixir/1bd50a6d97909f2daa5809c7bb5b9a8a

## Como utilizar

1 - Usando o prompt de comando navegar até a pasta "desafio"
2 - Abrir o iex com o mix carregado, utilizar esse comando no prompt: iex -S mix
3 - Existem duas formas de inicializar essa solução:
    3.1 - Inicializar com as listas da pasta "desafio/listas".
      Os itens da lista de itens no arquivo "items.txt" está no formato "item;quantidade;Preço por unidade/peso/pacote de cada item", um em cada linha, os preços devem ser inteiros e representam centavos.
      Os emails estão no arquivo "emails.txt", um email em cada linha.
    Esses arquivos podem ser editados com as listas que o usuário achar melhor, respeitando o formato delas. 

    Para inicializar dessa forma, uma vez no iex, digitar: "Desafio.main". A saída será um mapa, coforme o desafio.

    3.2 - Inicializar com listas geradas programaticamente, inicializando o programa dessa ele irá gerar uma lista de itens e uma lista de emails de forma padrão e menos customizavél do que usando os arquivos. 

    Para inicializar dessa forma, uma vez no iex, digitar: Desafio.main(item_list_size, email_list_size, show_lists), onde:
    item_list_size ~> Um numero inteiro que determina o numero de itens na lista de itens criada gerada.
    email_list_size ~> Um numero inteiro que determina o numero de emails na lista de emails criada gerada.
    show_lists ~> uma variável booleana(true ou false) que determina se as listas geradas programaticamente são mostradas ou não antes do mapa. Como o desafio pede como saída apenas o mapa, esse paramêtro por padrão é false, caso o usuário deseje ver as listas que foram geradas, passar elas como true.
    Exemplo mostrando as listas: Desafio.main(5, 2, true)
    Exemplo não mostrando as listas: Desafio.main(5, 2)

## Como testar

Alguns testes automatizados foram criados para esse desafio, a seguir como roda-los.

1 - Usando o prompt de comando navegar até a pasta "desafio"
2 - Digitar: mix test
