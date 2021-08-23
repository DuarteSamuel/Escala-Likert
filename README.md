# Escala Likert

# 1.	Objetivo
Ao criar esse material tenho como objetivo explorar a Escala Likert no R, assim tendo uma noção do que é essa escala e como usa-lá na linguagem para possiveis aplicações no futuro.
<p>
  
# 2.	Escala Likert
A escala Likert é muito utilizada para mensurar/entender atidudes ou comportamentos do publico alvo de uma pesquisa, Surgindo na década de 30 nos Estados Unidos, a Escala tem como objetivo, diferentemente de uma resposta dicotomica (Sim ou não, Concordo ou Discordo…) apresentar uma serie de niveis que contemplam de um extremo a outro as possiveis respostas, tentando assim, mensurar a intensidade da concordancia ou de rejeição. Atualmente a adesão por meios digitais para coleta de dados como: Google Forms, SurveyMonkey ou qualquer outra ferramenta de criação de questionarios, pontecializou o uso da escala, sendo de facil aplicação e manuseio para o pesquisador e também sendo algo facil para quem responde, assimilar o tipo de questão. a aplicação da escala pode ser pensada como uma tabela assim onde será marcado a resposta que expressa a intensidade sobre a questão

![Capturar3](https://user-images.githubusercontent.com/89361213/130378823-d6bbe57a-1786-4ed9-9915-a9aa5fbeb279.JPG)
<p>
 é importante os niveis ficarem bem definidos com o que se deseja saber. a quantidade de pontos pode ser variada, sendo mais comum 5 pontos; Para a escolha de quantos pontos, fica a criterio totalmente do pesquisador, porém é interessante ter em mente que menos pontos torna a questão mais facil para o respondente, visto que ele não precisa avaliar tanto um grau de intensidade de concordancia ou rejeição, porém, se aumentarmos os pontos, ganhamos consistência psicométrica (psicometria é o conjunto de métodos quantitativos de psicologia, dando uma ideia muito superficial), assim conseguimos compreender melhor a intensidade de concordancia ou discordancia sobre a questão, aumentar os pontos então parece ser o ideial não é? porém, dificultando a resposta, podemos ter o fator de perda do interesse do respondente, ou seja, existe a possibilidade de que, o que foi respondido não ser a resposta verdadeira, e com isso temos uma tendência do respondente se tornar indiferente, não optando por nenhum dos extremos ou nenhum grau de vizinhança dos extremos, a parte neutra é mais perigosa para essa escala, pois não teremos nossa questão respondida, se o item que está questão é aceito ou rejeitado; vale lembrar que ter poucos pontos também não é garantia de que isso não ocorra, porém deixa o possivel questionario mais dinamico (digo possivel, pois pode ser só a questão com a escala likert, como uma avaliação de aplicativo, ou qualquer outro exemplo que você possa pensar), diminuindo a possibilidade desse problema, então é de extrema importancia, formular a questão de forma sucinta e clara, evitando qualquer tipo de vies, com os niveis bem definidos, a formulação desse tipo de questão é algo bem complexa, mas o importante é ter em mente objetivo da pergunta, os niveis estarão respondendo a sua dúvida? a uma discussão bem extensa sobre essas questões que você pode pesquisar mais a fundo, seja a quantidade certa de pontos ou como descrever os rotulos dos niveis, descrever a zona neutra de maneira que o respondente esteja ciente do que significa marcar aquela opção, acho valido ter noção dessas ideias e também fica a dica de pesquisar mais essa topicos, mas vamos agora para a aplicação no R da escala.
 
# 3.	Banco de dados
Podemos verificar no pacote Likert (usando a função help(likert)) um exemplo com o Data(pisaitems) que é um banco de opiniões sobre o quanto essas pessoas utilizam/leem de Jornais, Magazines, Comic Books, etc. para essa aplicação, queria utlizar outro banco para testar a ferramenta, realizei uma busca rapida e não encontrei nenhum banco relacionado a opinões de consumidores ou clientes que me agradace, então preferi simular uma pesquisa, criei um cenario que acredito que na pratica é bem mais utilizado, um pesquisa de opinião relacionada a qualidade do serviço prestado, no caso imaginei uma rede de 4 hoteis, em que 60 clientes de cada hotel, totalizando 240 clientes responderam uma sequencia de 7 perguntas, a pergunta era definida como 1=Ruim, 2=Regular, 3=Bom, 4=Muito Bom e 5=Excelente, depois de formular essa ideia, fui para o Excel e defini as seguintes colunas que seriam: o Hotel que a pessoa estava respondendo e as outras 7 as perguntas para utilizar a escala:
1.	Serviço de quarto
2.	Atendimento
3.	Programação do Hotel
4.	Estruturas de Ambientes de lazer
5.	Estrutura do Refeitorio
6.	Limpeza dos ambientes
7.	Classificação geral do Hotel
Daí no Excel, utilizei a função =ALEATÓRIAENTRE(1;5) para todas as celulas, percebi que os dados estavam uniformes (nada relacionado a distribuição, não fiz nenhum teste, mas estava bem proporcional os 5 numeros possiveis), todos as frequencias estavam bem proximas, então dei uma “bagunçada”, em alguns momentos do banco definia a função entre 1 até 3 ou 3 até 5, assim conseguiria ver algo mais interessante, para a aplicação.
o banco pode ser achado em: [link do github com o banco]
# 4.	Código
Indo ao código no R, vamos precisar do pacote likert que tem uma função com o mesmo nome que é para Análise e visualização da escala Likert, além disso coloquei o plyr para conseguir plotar as porcentagens. outra coisa que acho valido comentar é a estrutura do banco, as questões e suas respostas estão nas colunas, e cada resposta deve ser um fator.
<p>
<i>library(readxl)</i> # carregar o banco <p>
<i>library(likert)</i> # Usar os graficos Likert <p>
<i>library(plyr)</i> <p>

<i>banco <- read_excel("Opinioes_hotel.xlsx")</i>
<i>head(banco)</i>
![imagem_2021-08-22_225611](https://user-images.githubusercontent.com/89361213/130379703-081d445a-1469-4ba1-b177-0dab5fcb84f3.png)
<p>
![Capturar](https://user-images.githubusercontent.com/89361213/130380177-d5459b71-8137-4dee-916a-54c910da2615.JPG)

uma coisa que percebi durante esse processo é que os fatores devem estar bem definidos. para isso a função lapply, que pega uma lista, aplica uma determinada função desejada e retorna novamente uma lista, a função que implementei foi a factor a função recebe um x, que no nosso caso é o banco de dados, somente nas colunas de 2 a 8, e também definimos os niveis(levels) que são os elementos presentes no banco, e os rotúlos(labels) associados aos niveis, com isso nosso banco fica bem definido para usar a função likert, isso pode variar de acordo com maneira de leitura e/ou das informações do banco. Mas no meu caso, se fez necessario.
<p>

<i>banco[ ,2:8]<-lapply(banco[ ,2:8], function(x){factor(x, <p> </i>
<i>&emsp;levels = c("1","2","3","4","5"), <p> </i>
<i>&emsp;labels = c("Ruim","Regular","Bom","Muito Bom","Excelente"))})</i>
<p>

Depois utilizamos a função likert, ela recebe o data frame com as colunas que estão com os fatores bem definidos, a função likert tem a seguinte estrutura, que pode ser encontrada no help da função: <p>

<i>likert(Data.frame, summary, grouping = NULL, factors = NULL, importance, nlevels = length(levels(items[, 1]))) </i>
<p>

todos esses parametros podem ser encontrados na função help(likert) com a explicação dos argumentos, mas com o data frame bem definido, podemos utilzar diretamente. <p>
  <p>
<i>lik<-likert(as.data.frame(banco[ ,2:8])) <p></i>

A função likert estrutura dessa forma: <p>
![lik](https://user-images.githubusercontent.com/89361213/130380382-899c7ec0-b1c3-46a3-9784-42e070f38f39.jpg)

<p>
  
Podemos fazer uma sumarização do objeto lik, caso não seja de interesse usar uma ferremanta grafica <p>
  <i>summary(lik)</i> <p>
  
![Capturar1](https://user-images.githubusercontent.com/89361213/130380509-938651e0-a2a3-4c86-8ded-c135c2b06222.JPG)

  <p>
Uma coisa muito legal do pacote e que ele utiliza diretamente o plot do R e retorna um grafico muito legal, simples e bonito. o argumento plot.percentes é do pacote plyr, low.color para definir as cores dos niveis da região esquerda, e high.color para as cores dos niveis das regiões a direita. na coluna y, temos as questões e na x temos os fatores, as porcentagens nas laterais, representam os dois niveis abaixo e acima do fator neutro, no nosso caso o fator neutro é o regular <p>(ps:. ficou uma bandeirinha da italia simpatica :D) <p>
  
![likert-plot](https://user-images.githubusercontent.com/89361213/130380884-6dc9fce7-bd05-4ddf-84f6-6d358b2d9dc5.jpg) 
  
<p>
podemos variar o tipo de plot alterando o argumento type dos que pesquisei e só encontrei com o Heatmap e a densidade se encontrarem outros tipos me contem, mas acho que tem, podemos definir aqui também a low.color e high.color, sendo que aqui ela não vai representar um nivel e sim a frequencia que a resposta aparece, eu particularmente gosto muito de heatmap’s, pelo grau de informação que eles trazem e também pela beleza <p>
  <i> plot(lik, type="heat") </i><p>
<p> 
  
![Rplot](https://user-images.githubusercontent.com/89361213/130381038-08c018ec-a7e4-4174-8001-443b501f6f27.png) 

e também com uma densidade das perguntas para as 5 categorias, porém aqui <p>
  <i>plot(lik, type="density")</i><p>
  
![Rplot02](https://user-images.githubusercontent.com/89361213/130380986-6abf4133-a4fd-49d7-adc1-3a46f735d71c.png)


