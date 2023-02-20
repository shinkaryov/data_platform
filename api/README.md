# Prioritized way to test


    1. Create db using airflow
    2. Start API
    3. Check workability of dt filter without table order_status_stats
    4. Check CRUDs (try craziest variants - need to crack validators)
    5. Trigger DAG with creation and fullfilling order_status_stats
    6. Check workability of dt filter
