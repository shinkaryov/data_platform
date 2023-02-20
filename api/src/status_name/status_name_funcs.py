from status_name.status_name_schema import StatusName
from engine import conn
from sqlalchemy.exc import IntegrityError


def get_all_status_names():
    row = "SELECT * FROM status_name;"
    return conn.execute(row)


def get_status_name_by_id(status_name_id):
    row = f"SELECT * FROM status_name WHERE status_name_id = '{status_name_id}';"
    result = conn.execute(row)
    if len(result) != 0:
        return result
    else:
        return 'Such status_name does not exist'


def get_last_status_name():
    try:
        return conn.execute("SELECT * FROM status_name OFFSET ((SELECT COUNT(*) FROM status_name)-1);")
    except:
        return 'Table is empty'


def new_status_name(status_name: StatusName):
    try:
        sql = f"INSERT INTO status_name VALUES ({status_name.status_name_id}, " + \
            f"'{status_name.status_name}');"
        conn.execute_no_result(sql)
        return conn.execute("SELECT * FROM status_name OFFSET ((SELECT COUNT(*) FROM status_name)-1);")
    except IntegrityError:
        return 'Insert Error: Such status_name already exists'


def update_status_name(status_name: StatusName):
    sql1 = f"SELECT 1 FROM status_name WHERE status_name_id = '{status_name.status_name_id}';"
    if len(conn.execute(sql1)) != 0:
        sql2 = f"UPDATE status_name SET status_name = '{status_name.status_name}' " + \
        f"WHERE status_name_id = '{status_name.status_name_id}';"
        conn.execute_no_result(sql2)
        return get_status_name_by_id(status_name.status_name_id)
    else:
        return 'Update Error: Such status_name does not exist'


def delete_status_name(status_name_id):
    sql1 = f"SELECT 1 FROM status_name WHERE status_name_id = '{status_name_id}';"
    result = conn.execute(sql1)
    if len(result) != 0:
        try:
            sql2 = f"DELETE FROM status_name WHERE status_name_id = '{status_name_id}';"
            conn.execute_no_result(sql2)
            return "Successfully deleted"
        except IntegrityError:
            return 'Delete Error: Such sale is used in other tables'
    else:
        return 'Delete Error: Such sale does not exist'