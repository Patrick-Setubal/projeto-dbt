{{
    config(
        materialized: 'incremental',
    )
}}

with source as (
    select
        *
    from {{ source('ecomerce', 'pedidos') }}
)
select * 
from source

-- Quando rodar esse codigo so sera lido da source os dados novos.
-- Atualizando Apenas se tiver novos dados na tabela source.
{% if is_incremental() %}
    where data_pedido >= (select max(data_pedido) from {{ this }})
{% endif %}
