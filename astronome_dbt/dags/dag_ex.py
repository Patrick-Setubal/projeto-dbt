from cosmos import DbtDag, ProjectConfig, ProfileConfig, ExecutionConfig
from datatime import datetime
import os 

my_dbt_dag = DbtDag(


    project_config=ProjectConfig("/home/patrick-setubal/projeto-dbt/astronomer/dags/dbt/dbt_project_real"),
    profile_config=ProfileConfig(
        profile_name="dbt_project_real",
        target_name="dev",
        profiles_yml_filepath="/home/patrick-setubal/projeto-dbt/astronomer/dags/dbt/dbt_project_real/profiles.yml"
    ),
    execution_config=ExecutionConfig(
        dbt_executable_path=f"{os.environ.get('AIRFLOW_HOME')}/dbt_venv/bin/dbt",
    ),
    schedule_interval="@daily",
    start_date=datetime(2023, 1, 1),
    catchup=False,
    dag_id="dbt_project_real",
)
