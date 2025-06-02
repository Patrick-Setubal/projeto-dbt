{% snapshot vendas_snapshot %}
    {{
        config(
            unique_key='id_pedido',
            strategy='check', -- Compara todas ou algumas colunas
            check_cols='all', -- Colunas que serão comparadas
            updated_at='data_venda'
        )
    }}

    select
        id_pedido,
        data_venda,
        valor_total,
        cliente_id,
        produto_id
    from {{ ref('vendas') }}
    
{% endsnapshot %}