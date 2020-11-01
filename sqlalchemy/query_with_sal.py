import sqlalchemy
import psycopg2
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Date


'''
result_set = conn.execute("SELECT * FROM person")
for r in result_set:
    print(r)
'''
