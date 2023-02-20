from pydantic import BaseModel, validator
from engine import conn


class StatusName(BaseModel):
    status_name_id: int
    status_name: str

    @validator('status_name_id')
    def status_name_id_must_be_positive(cls, v):
        if v <= 0:
            raise ValueError('status_name_id must be positive')
        return v
