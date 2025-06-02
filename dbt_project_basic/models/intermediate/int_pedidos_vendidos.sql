{{
    config(
        tags = ['vendas']
    )
}}

WITH pedidos        AS ( SELECT * FROM {{ ref('stg_pedidos')        }}
),   clientes       AS ( SELECT * FROM {{ ref('stg_clientes')       }}
),   itens_pedidos   AS ( SELECT * FROM {{ ref('stg_itens_pedidos')   }}
),   produtos       AS ( SELECT * FROM {{ ref('stg_produtos')       }}
),   pagamentos     AS ( SELECT * FROM {{ ref('stg_pagamentos')     }}
),   categorias     AS ( SELECT * FROM {{ ref('stg_categorias')     }}
), joined as (
    select 
        pedidos.data_pedido
        , clientes.nome
        , clientes.email
        , pagamentos.valor
        , pagamentos.metodo
        , pagamentos.status
        , pagamentos.data_pagamento
        , produtos.nome as nome_produto
        , categorias.nome as caregoria_produto
        , itens_pedidos.quantidade
        , itens_pedidos.preco_unitario
    from pedidos
    left join clientes on pedidos.cliente_id = clientes.id
    left join pagamentos  on pedidos.id = pagamentos.pedido_id
    left join itens_pedidos on pedidos.id = itens_pedidos.pedido_id
    left join produtos on itens_pedidos.produto_id = produtos.id
    left join categorias on produtos.categoria_id = categorias.id
)
select * from joined
itens_pedidos