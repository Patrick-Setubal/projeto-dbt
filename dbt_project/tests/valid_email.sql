{% test valid_email(model, column_name) %}

    with validation as (
        select {{ column_name }} as email
        from {{ model }}
        where {{ column_name }} NOT LIKE '%_@__%.__%'
    )   
    select count(*) as invalid_email_count
    from validation

{% endtest %}