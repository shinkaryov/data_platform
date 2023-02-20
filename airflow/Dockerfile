FROM apache/airflow:2.5.1-python3.10

WORKDIR /opt/airflow

COPY . .

USER root

RUN chmod +x /opt/airflow/scripts/start_services.sh

USER airflow
