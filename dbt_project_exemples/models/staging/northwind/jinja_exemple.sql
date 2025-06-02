select * 
from vendas 
where data_vendas >= '2023-09-01'

-- query com jinja 

select *
from vendas 
where data_vendas >= '{{ var("data_venda") }}'

-- quey com jinja 2 

select *
from vendas 
where data_vendas >= '{{ (execute_at | as_timestamp).strftime("%Y-%m-01") }}'

-- loop com jinja

select 
    cliente_id,
    {% for mes in range(1, 13) %}
        sum(case when extract(month from data_vendas) = {{ mes }} then valor end) as valor_mes_{{ mes }} {% if not loop.last %}
    ,{% endfor %}


-- condição com jinja 

select *
from vendas 
where 
    {% if flag_ativo = true %}
        data_venda >= current_date  interval '30' day
    {% else %}
        data_venda IS NOT NULL 
    {% endif %}