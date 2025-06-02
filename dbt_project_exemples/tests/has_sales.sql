{% test has_sales(movel, column_name)%}
    with cliente_sem_vendas as (
        select {{ column_name }} as id_cliente
        from {{ model }} as c
        left join {{ ref('sales') }} as s
        on c.{{ column_name }} = s.cliente_id
        where s.cliente_id is null
    )   
    select count(*) as negative_sales_count
    from cliente_sem_vendas

{% endtest %}