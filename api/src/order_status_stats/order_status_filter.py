from engine import conn
from sqlalchemy.exc import NoSuchTableError
import logging



def get_order_status_stats_by_date(date_from, date_to):
    from datetime import datetime, date
    try:
        if date_from > date_to:
            return "date_from is greater than date_to"
    except TypeError:
        return "date_from and date_to must be datetime.date type"

    sql = f"SELECT * FROM order_status_stats WHERE dt BETWEEN '{date_from}' AND '{date_to}';"
    try:
        return conn.execute(sql)
    except NoSuchTableError:
        return "Table order_status_stats does not exist"
