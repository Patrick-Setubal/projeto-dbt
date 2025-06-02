select 
    id_cliente,
    {{ to_snake_case('nome completo') }} as nome_completo,
from clientes 