from pendulum import now, yesterday

from airflow import DAG

from helpers.default_args import default_args
from airflow.providers.postgres.operators.postgres import PostgresOperator

with DAG(dag_id='Create_tables',
         description='Creates empty tables',
         schedule_interval=None,
         start_date=yesterday(),
         tags=['create_tables'],
         default_args=default_args,
         catchup=False) as dag:
    create_empty_tables = PostgresOperator(task_id='Create_empty_tables',
                                           sql='sql_scripts/create_tables.sql',
                                           postgres_conn_id='sales')

    create_empty_tables
