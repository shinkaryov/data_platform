from sales.sales_schema import Sale
from engine import conn
from sqlalchemy.exc import IntegrityError


def get_all_sales():
    row = "SELECT * FROM sale;"
    return conn.execute(row)


def get_sale_by_id(sale_id):
    row = f"SELECT * FROM sale WHERE sale_id = '{sale_id}';"
    result = conn.execute(row)
    if len(result) != 0:
        return result
    else:
        return 'Such sale does not exist'


def get_last_sale():
    try:
        return conn.execute("SELECT * FROM sale OFFSET ((SELECT COUNT(*) FROM sale)-1);")
    except:
        return 'Table is empty'


def new_sale(sale: Sale):
    try:
        sql = f"INSERT INTO sale VALUES (gen_random_uuid (), " + \
            f"'{sale.amount}', '{sale.date_sale}', '{sale.product_id}', '{sale.user_id}', '{sale.store_id}');"
        conn.execute_no_result(sql)
        return conn.execute("SELECT * FROM sale OFFSET ((SELECT COUNT(*) FROM sale)-1);")
    except IntegrityError:
        return 'Insert Error: Such product, user or store does not exist'


def update_sale(sale: Sale):
    sql1 = f"SELECT 1 FROM sale WHERE sale_id = '{sale.sale_id}';"
    if len(conn.execute(sql1)) != 0:
        try:
            sql2 = f"UPDATE sale SET amount = '{sale.amount}', date_sale = '{sale.date_sale}', " + \
            f"product_id = '{sale.product_id}', user_id = '{sale.user_id}', store_id = '{sale.store_id}' " + \
            f"WHERE sale_id = '{sale.sale_id}';"
            conn.execute_no_result(sql2)
            return get_sale_by_id(sale.sale_id)
        except IntegrityError:
            return 'Update Error: Such product, user or store does not exist'
    else:
        return 'Update Error: Such sale does not exist'


def delete_sale(sale_id):
    sql1 = f"SELECT * FROM sale WHERE sale_id = '{sale_id}';"
    result = conn.execute(sql1)
    if len(result) != 0:
        try:
            sql2 = f"DELETE FROM sale WHERE sale_id = '{sale_id}';"
            conn.execute_no_result(sql2)
            return "Successfully deleted"
        except IntegrityError:
            return 'Delete Error: Such sale is used in other tables'
    else:
        return 'Delete Error: Such sale does not exist'
