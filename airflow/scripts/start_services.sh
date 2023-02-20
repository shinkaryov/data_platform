# scripts for launch webserver only

airflow db upgrade
airflow users create \
          --username $_AIRFLOW_WWW_USER_USERNAME \
          --password $_AIRFLOW_WWW_USER_PASSWORD \
          --firstname $_AIRFLOW_WWW_USER_FIRSTNAME \
          --lastname $_AIRFLOW_WWW_USER_LASTNAME \
          --role Admin \
          --email $_AIRFLOW_WWW_USER_EMAIL

airflow webserver
