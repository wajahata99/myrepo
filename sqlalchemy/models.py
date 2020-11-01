### models.py ###
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Date

Base = declarative_base()
class Book(Base):
    __tablename__ = 'books'
    id = Column(Integer, primary_key=True)
    title = Column(String)
    author = Column(String)
    pages = Column(Integer)
    published = Column(Date)

    def __repr__(self):
        return "<Book(title='{}', author='{}', pages={}, published={})>"\
                .format(self.title, self.author, self.pages, self.published)


DATABASE_URI = 'postgres+psycopg2://postgres:Maple#105@localhost:5432/test'

conn = create_engine(DATABASE_URI)

Base.metadata.create_all(conn)
