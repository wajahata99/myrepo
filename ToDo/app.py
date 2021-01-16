from flask import Flask, request           # import flask
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Date

app = Flask(__name__)             # create an app instance

Base = declarative_base()

DATABASE_URI = 'postgres+psycopg2://postgres:Maple#105@localhost:5432/test'
conn = create_engine(DATABASE_URI)
Base.metadata.create_all(conn)

class Book(Base):
    __tablename__ = 'todo'
    id = Column(Integer, primary_key=True)
    title = Column(String)
    author = Column(String)
    pages = Column(Integer)
    published = Column(Date)

    def __repr__(self):
        return "<Book(title='{}', author='{}', pages={}, published={})>"\
                .format(self.title, self.author, self.pages, self.published)

@app.route("/todo", methods=["POST"])
def create_todo():
    return ToDoService().create(request.get_json())
    
if __name__ == "__main__":
    #Schema()
    app.run(debug=True)
