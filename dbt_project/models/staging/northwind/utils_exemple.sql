select 
    id_cliente,
    dbt_utils.star(from = ref('clientes'), except = ['id_cliente'])
from {{ ref('clientes') }}
    
----


