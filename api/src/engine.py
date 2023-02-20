import os
from sqlalchemy import create_engine
from typing import List, Optional, Dict
from sqlalchemy.sql import text
from sqlalchemy.exc import DisconnectionError, OperationalError, InternalError


class Engine:
    def __init__(self):
        self.engine = create_engine(os.getenv('DATABASE_URL'))

    def get_engine(self):
        return self.engine

    def dispose(self):
        self.engine.dispose()


class Connection:
    def __init__(self, engine):
        self.engine = engine
        self.conn = engine.get_engine().connect()

    def execute(self, sql) -> List[Optional[Dict]]:
        try:
            result = self.conn.execute(text(sql))
            self.conn.commit()
            rows = result.fetchall()
            return [dict(zip(result.keys(), row)) for row in rows]
        except (DisconnectionError, OperationalError, InternalError):
            self.conn = self.engine.get_engine().connect()
            result = self.conn.execute(text(sql))
            self.conn.commit()
            rows = result.fetchall()
            return [dict(zip(result.keys(), row)) for row in rows]

    def execute_no_result(self, sql):
        try:
            self.conn.execute(text(sql))
            self.conn.commit()
        except (DisconnectionError, OperationalError, InternalError):
            self.conn = self.engine.get_engine().connect()
            self.conn.execute(text(sql))
            self.conn.commit()

    def close(self):
        self.conn.close()


eng = Engine()
conn = Connection(eng)
