#Dados de Novembro de 1998 ate Marco 2019

#1. Em qual ano houve mais lançamentos de títulos
select year(release_date) as ano, count(appid) as qt
from steam
group by ano
order by qt desc;

#2. Quais os 10 Developers que produziram mais títulos
select developer, count(name) as quant_titulos
from steam
group by developer
order by quant_titulos desc
limit 10;

#3. Quais são as 10 editora(publishers) que lançaram mais títulos
select publisher, count(name) as quant_titulos
from steam
group by publisher
order by quant_titulos desc
limit 10;

#4. Pra quais sistemas operacionais existem mais titulos
select count(name) as numero_jogos, platforms
from steam
group by platforms
order by numero_jogos desc;

#5 Quantidade de jogos apenas single player
select count(name) as jogos, categories
from steam
where categories like 'Single-player'
group by categories
order by jogos desc;

#6. Quantidade de jogos apenas Multi-Player
select count(name) as jogos, categories
from steam
where categories like 'Multi-Player'
group by categories
order by jogos desc;

#7. Quais são os estilos de jogos
select count(name) as jogos, genres
from steam
group by genres
order by jogos desc;


#8 Quantidade de titulos para maiorea de 18 anos
select required_age, count(name) from steam
group by required_age
having required_age >= 18; 
select * from steamspy_tag_data;

#9 Os titulos estao disponiveis a partir de qual valor 
select distinct price as Preco, name
from steam
where price > 0
order by Preco asc;

#10. Quais jogos de 2019 possuem assistencia completa ao cliente.
select appid, name, website, support_url, support_email, release_date
from steam
inner join steam_support_info
on steam.appid = steam_support_info.steam_appid
where website <> '' && support_url <> '' && support_email <> '' && year(release_date) = 2019;

#11. Qual jogo possuem um número maior de jogadores
select name, max(owners)
from steam
group by name
limit 5;

#12 Qual jogo possui o maior e numero de ratings positivos
select name as Jogo, max(positive_ratings) as Avaliação_Positiva
from steam
group by Jogo
order by Avaliação_Positiva desc;
limit 10;

#13 Qual jogo possui o menor e numero de ratings positivos
select name as Jogo, max(positive_ratings) as Avaliação_Positiva
from steam
group by Jogo
order by Avaliação_Positiva;
limit 10;

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

#16 Jogos que  possuem mais jogadores (ownners)
select name, owners, price
from steam
order by owners desc
limit 5;