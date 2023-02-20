from pendulum import now, yesterday

from airflow import DAG

from helpers.default_args import default_args
from airflow.providers.postgres.operators.postgres import PostgresOperator

with DAG(dag_id='Fill_tables',
         description='Fills tables with random data',
         schedule_interval=None,
         start_date=yesterday(),
         tags=['fill_tables'],
         default_args=default_args,
         catchup=False) as dag:

    fill_tables = PostgresOperator(task_id='Fill_tables_with_random_values',
                                   sql='sql_scripts/fill_tables.sql',
                                   postgres_conn_id='sales')

    fill_tables
