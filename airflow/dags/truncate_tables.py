from pendulum import now, yesterday

from airflow import DAG

from helpers.default_args import default_args
from airflow.providers.postgres.operators.postgres import PostgresOperator

with DAG(dag_id='Truncate_tables',
         description='Truncate all  tables',
         schedule_interval=None,
         start_date=yesterday(),
         tags=['truncate_tables'],
         default_args=default_args,
         catchup=False) as dag:
    truncate_tables = PostgresOperator(task_id='Truncate_all_tables',
                                       sql='sql_scripts/truncate_tables.sql',
                                       postgres_conn_id='sales')

    truncate_tables
