--LUCIANO--

#14 Quais os 3 jogos que possuem maior tempo medio de playtime
select name as game, average_playtime as playtime
from steam
order by playtime desc
limit 3;

#15 Quais são os 10 títulos mais caros
#Mais Caros
select * from steam;
select name, max(price)
from steam
group by name
order by max(price) desc
limit 5;

#Quai jogo possui mais jogadores (ownners)
select name, owners, price
from steam
order by owners desc
limit 5;

#17 Os titulos estao disponiveis a partir de qual valor 
select distinct price as Preco, name
from steam
where price > 0
order by Preco asc;


#Quantidade de titulos para maiorea de 18 anos
select required_age, count(name) from steam
group by required_age
having required_age >= 18; 

select * from steamspy_tag_data;

#Porcentagem de jogos para maiores de 18 e menores de 18 anos
#qt de titulos = 2166
#qt de titulos para maiores de 18 = 81
#qt de titulos para menores de 18 = 2085
select required_age as idade, count(name)
from steam
group by idade
having required_age >=18;

#Quantidade de jogos por faixa etaria
select required_age as idade, count(name)
from steam
group by idade
order by required_age desc;

select * 
from steam
where name = 6120;

#4. Pra quais sistemas operacionais existem mais titulos
select count(name) as numero_jogos, platforms
from steam
group by platforms
order by numero_jogos desc;

#Apenas um unico jogo foi desenvolvido apenas para linux
select *
from steam
where platforms like 'linux';


#6. Quais são os estilos de jogos
select count(name) as jogos, genres
from steam
group by genres
order by jogos desc;