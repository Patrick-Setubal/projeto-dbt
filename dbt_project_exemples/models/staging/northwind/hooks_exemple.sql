{{
    config(
        post_hook=[
            "CREATE TABLE IF NOT EXISTS temp_clientes AS SELECT * FROM clientes",
        ]
        post_hook=[
            "CREATE TABLE IF NOT EXISTS temp_clientes AS SELECT * FROM {{ this }}",
        ]
    )
}}