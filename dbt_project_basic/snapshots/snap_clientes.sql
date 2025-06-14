{% snapshot pedido_snapshot %}
    {{ 
        config(
            unique_key='id',
            strategy='timestamp',
            updated_at='data_registro',
        ) 
    }}
    
    select
        id
        , nome
        , email
        , telefone
        , data_registro
    from pedidos

{% endsnapshot %}
