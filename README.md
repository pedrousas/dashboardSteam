## Índice

1. [Sobre o projeto](#sobre-o-projeto)
2. [Tecnologias Utilizadas](#tecnologia-utilizada)
3. [Análise de dados - Explorando a base](#análise-de-dados)
4. [Perguntas](#perguntas)
    - [Pergunta 1](#pergunta-1)
    - [Pergunta 2](#pergunta-2)
    - [Pergunta 3](#pergunta-3)
    - [Pergunta 4](#pergunta-4)
    - [Pergunta 5](#pergunta-5)
    - [Pergunta 6](#pergunta-6)
    - [Pergunta 7](#pergunta-7)
    - [Pergunta 8](#pergunta-8)
    - [Pergunta 9](#pergunta-9)
    - [Pergunta 10](#pergunta-10)
    - [Pergunta 11](#pergunta-11)
    - [Pergunta 12](#pergunta-12)
    - [Pergunta 13](#pergunta-13)
    - [Pergunta 14](#pergunta-14)
    - [Pergunta 15](#pergunta-15)
    - [Pergunta 16](#pergunta-16)
5. [Contribuintes](#contribuintes)
    
## Sobre o projeto

Este é um projeto utilizando ferramentas de análise e tratamento de dados como MySQL workbench, metabase e referências externas, dentro das informações disponíveis pela STEAM (https://store- steampowered.com/app/353380/Steam_Link/)

## Tecnologia Utilizada

Utilizamos um banco de dados sql para carregar os dados fornecidos em um documento csv e a partir dele montamos as query utilizando o MySQL Workbench, depois carregamos as query no MetaBase fornecido pela resilia

- MySql Workbench
- MetaBase
- MySQL

# Análise de dados
As análises abordadas aqui, envolvem o banco de dados de +27K linhas em relação as perguntas abaixo:

# Perguntas
### Pergunta 1 
- Ano com maior numero de títulos lançados 

```sql
select max(Ano), sum(s) as total from
(
SELECT YEAR(release_date) as Ano, count(name) as s FROM steam GROUP By release_date
) as t
group by Ano
having Ano  = 2018
order by total desc;
```
### Pergunta 2 
- Quais os 10 Developers que produziram mais títulos

```sql
select developer, count(name) as quant_titulos
from steam
group by developer
order by quant_titulos desc
limit 10;
```
### Pergunta 3
- Quais são as 10 editora(publishers) que lançaram mais títulos

```sql
select publisher, count(name) as quant_titulos
from steam
group by publisher
order by quant_titulos desc
limit 10;
```
### Pergunta 4
- Pra quais sistemas operacionais existem mais titulos

```sql
select count(name) as numero_jogos, platforms
from steam
group by platforms
order by numero_jogos desc;

```
### Pergunta 5 
- Quantidade de jogos apenas single player

```sql
select count(name) as jogos, categories
from steam
where categories like 'Single-player'
group by categories
order by jogos desc;
```
### Pergunta 6
- Quantidade de jogos apenas Multi-Player

```sql
select count(name) as jogos, categories
from steam
where categories like 'Multi-Player'
group by categories
order by jogos desc;
```
### Pergunta 7
- Todos os estilos de jogos

```sql
select count(name) as jogos, genres
from steam
group by genres
order by jogos desc;
```
### Pergunta 8
- Quantidade de título para maiores de 18 anos

```sql
select required_age, count(name) from steam
group by required_age
having required_age >= 18; 
select * from steamspy_tag_data;
```
### Pergunta 9
- Títulos disponível pelos valores

```sql
select distinct price as Preco, name
from steam
where price > 0
order by Preco asc;
```
### Pergunta 10
- Quais jogos de 2019 possuem assistencia completa ao cliente.

```sql
select appid, name, website, support_url, support_email, release_date
from steam
inner join steam_support_info
on steam.appid = steam_support_info.steam_appid
where website <> '' && support_url <> '' && support_email <> '' && year(release_date) = 2019
```
### Pergunta 11
- Qual jogo possuem um número maior de jogadores

```sql
select name, max(owners)
from steam
group by name
limit 5;
```
### Pergunta 12
- Qual jogo possui o maior e numero de ratings positivos

```sql
select name as Jogo, max(positive_ratings) as Avaliação_Positiva
from steam
group by Jogo
order by Avaliação_Positiva desc;
limit 10;
```
### Pergunta 13
- Qual jogo possui o menor e numero de ratings positivos

```sql
select name as Jogo, max(positive_ratings) as Avaliação_Positiva
from steam
group by Jogo
order by Avaliação_Positiva;
limit 10;
```
### Pergunta 14
- Quais os 3 jogos que possuem maior tempo medio de playtime

```sql
select name as game, average_playtime as playtime
from steam
order by playtime desc
limit 3;
```
### Pergunta 15
- Quais são os 10 títulos mais caros

```sql
select * from steam;
select name, max(price)
from steam
group by name
order by max(price) desc
limit 5;
```
### Pergunta 16
- Jogos que  possuem mais jogadores (ownners)
teste

```sql
select name, owners, price
from steam
order by owners desc
limit 5;
```

# Contribuintes

Os devs que contribuiram para esse projeto podem ser encontrados pelos links:

- [Andrey Nithack]()
- [Luciano Paiva ]()
- [Lucas Nicoleti]()
- [Pedro alves]()
