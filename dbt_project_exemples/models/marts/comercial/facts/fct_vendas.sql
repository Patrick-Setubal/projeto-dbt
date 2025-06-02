{{ 
    config(
        tags = ['comercial']
    ) 
}}

with vendas as (
    select 
        mes
        , ano
        , total_frete
    from {{ref('int_vendas')}}
)
select * from vendas