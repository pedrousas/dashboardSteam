#Dados de Novembro de 1998 ate Marco 2019

#1. Em qual ano houve mais lançamentos de títulos
#2013
select year(release_date) as ano, count(appid) as qt
from steam
group by ano
order by qt desc;

#1A. Em qual ano houve mais lançamentos de títulos
#2013
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

#9. Quais jogos de 2019 possuem assistencia completa ao cliente.
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