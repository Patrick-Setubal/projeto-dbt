dbt_project:
  outputs:
    dev:
      dataset: dbt_dw
      keyfile: /home/patrick-setubal/.dbt/myproject-460020-9412a644d288.json
      method: service-account
      project: myproject-460020
      threads: 4
      type: bigquery
  target: dev
dbt_project_basic:
  outputs:
    dev:
      dataset: dbt_dw
      keyfile: /home/patrick-setubal/.dbt/myproject-460020-9412a644d288.json
      method: service-account
      project: myproject-460020
      threads: 4
      type: bigquery
  target: dev
dbt_project_real:
  outputs:
    dev:
      dataset: '1'
      job_execution_timeout_seconds: 1
      job_retries: 1
      keyfile: '1'
      location: EU
      method: service-account
      priority: interactive
      project: '1'
      threads: 1
      type: bigquery
  target: dev
