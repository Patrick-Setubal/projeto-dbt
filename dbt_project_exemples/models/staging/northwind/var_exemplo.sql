select * 
from vendas
where data_venda >= '{{ var("data_minima", "2025-01-01") }}'

--
{{
    config(
        schema = var('schema_nome', 'desenvolvimento_schema'),
    )
}}