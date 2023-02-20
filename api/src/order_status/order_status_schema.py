from pydantic import BaseModel, validator
from engine import conn


class Order(BaseModel):
    order_status_id: str = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
    update_at: str = '2023-02-03 00:00:00.000000'
    sale_id: str = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
    status_name_id: int

    @validator('update_at')
    def check_date_format(cls, v):
        from datetime import datetime
        try:
            datetime.strptime(v, '%Y-%m-%d %H:%M:%S.%f')
        except ValueError:
            raise ValueError("Incorrect data format, should be YYYY-MM-DD HH:MM:SS.mmmmmm")
        return v

    @validator('status_name_id')
    def status_name_id_must_be_positive(cls, v):
        if v <= 0:
            raise ValueError('status_name_id must be positive')
        return v
