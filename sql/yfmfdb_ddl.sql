create database yfmfdb
;

use yfmfdb
;

create table mf_prices (
   fund_symbol varchar(8),
   price_date date,
   nav_per_share numeric (18,2),
   primary key (fund_symbol, price_date)
)
;

create table etf_prices (
    fund_symbol varchar(8),
    price_date date,
    open numeric(18.2),
    high numeric(18,2),
    low numeric(18,2),
    close numeric(18,2),
    adj_close numeric(18,2),
    volume  int,
    primary key (fund_symbol, price_date)
)
;

create table mf_basic (
    fund_symbol varchar(8),
    quote_type varchar(64),
    region char(2),
    fund_short_name varchar(256),
    fund_long_name varchar(256),
    currency char(3),
    initial_investment numeric(18,2),
    subsequent_investment numeric(18,2),
    fund_category varchar(64),
    fund_family varchar(64),
    exchange_code varchar(8),
    exchange_name varchar(64),
    exchange_timezone varchar(64),
    management_name varchar(64),
    management_bio varchar(1024),
    management_start_date date,
    total_net_assets numeric(18,2),
    year_to_date_return numeric(18,6),
    day50_moving_average numeric(18,6),
    day200_moving_average numeric(18,6),
    investment_strategy varchar(1024),
    fund_yield numeric(18,6),
    morningstar_overall_rating int,
    morningstar_risk_rating int,
    inception_date date,
    last_dividend numeric(18,6),
    last_cap_gain int,
    annual_holdings_turnover numeric(18,6),
    investment_type varchar(8),
    size_type varchar(8),
    top10_holdings varchar(4096),
    top10_holdings_total_assets numeric(18,6),
    morningstar_return_rating int,
    sustainability_score numeric(18,2),
    sustainability_rank int,
    esg_peer_group varchar(64),
    esg_peer_count int,
    esg_score numeric(18,2),
    peer_esg_min numeric(18,2),
    peer_esg_avg numeric(18,2),
    peer_esg_max numeric(18,2),
    environment_score numeric(18,2),
    peer_environment_min numeric(18,2),
    peer_environment_avg numeric(18,2),
    peer_environment_max numeric(18,2),
    social_score numeric(18,2),
    peer_social_min numeric(18,2),
    peer_social_avg numeric(18,2),
    peer_social_max numeric(18,2),
    governance_score numeric(18,2),
    peer_governance_min numeric(18,2),
    peer_governance_avg numeric(18,2),
    peer_governance_max numeric(18,2),
    primary key (fund_symbol)
)
;

create table mf_detail (
    fund_symbol varchar(8),
    item_category varchar(64),
    item_desc varchar(64),
    value numeric (18,6),
    shard(fund_symbol, item_category)
)
;
