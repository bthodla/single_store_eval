# Possible queries on the dataset
# Query 1: Prices for a list of funds for a given date range
select *
from mf_prices
where price_date between '20200501' and '20200531'
and fund_symbol in ('ADYFX', 'BTIAX', 'CARLX', 'GTVMX', 'MRCVX', 'PJEAX', 'SNJLX')
order by fund_symbol, price_date
;

# [2022-03-21 15:42:06] 140 rows retrieved starting from 1 in 1 s 825 ms (execution: 1 s 693 ms, fetching: 132 ms)
# Total row count 75,657,739

# Query 2: Average price for a list of funds
select fund_symbol, avg(nav_per_share) as avg_nav
from mf_prices
where fund_symbol in ('ADYFX', 'BTIAX', 'CARLX', 'GTVMX', 'MRCVX', 'PJEAX', 'SNJLX')
group by fund_symbol
order by fund_symbol
;

# [2022-03-21 15:42:42] 7 rows retrieved starting from 1 in 439 ms (execution: 396 ms, fetching: 43 ms)

# Query 3: Two table_join with filters on both tables and aggregate function
select mb.fund_category, avg(mp.nav_per_share) as avg_nav
from mf_basic mb inner join mf_prices mp on mb.fund_symbol = mp.fund_symbol
and mp.price_date between '19991101' and '19991130'
and mb.fund_family = 'Morgan Stanley'
group by 1
order by 1
;

# [2022-03-21 15:43:10] 6 rows retrieved starting from 1 in 4 s 34 ms (execution: 3 s 997 ms, fetching: 37 ms)

# Query 4: Three table-join with filters on all tables
select mb.fund_symbol, md.item_category, md.item_desc, md.value, mp.nav_per_share, mp.price_date
from mf_basic mb inner join mf_detail md on mb.fund_symbol = md.fund_symbol
    inner join mf_prices mp on mb.fund_symbol = mp.fund_symbol
where mb.fund_family = 'American Funds'
and md.item_category = 'Alpha/Beta'
and md.item_desc = 'fund_stdev_3years'
and mp.price_date between '19991101' and '19991130'
order by 1, 5;

# [2022-03-21 15:48:50] 500 rows retrieved starting from 1 in 4 s 360 ms (execution: 4 s 250 ms, fetching: 110 ms)

# Common table expression query
with mf_data as (
    select mb.fund_symbol, md.item_category
    from mf_basic mb inner join mf_detail md on mb.fund_symbol = md.fund_symbol
)
select mf.fund_symbol, mf.item_category, avg(mp.nav_per_share) as avg_nav
from mf_data mf inner join mf_prices mp on mf.fund_symbol = mp.fund_symbol
where mp.price_date between '19930601' and '19930630'
group by 1, 2
order by 1, 2
;

# [2022-03-21 15:50:20] 500 rows retrieved starting from 1 in 4 s 421 ms (execution: 4 s 374 ms, fetching: 47 ms)

