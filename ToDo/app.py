from flask import Flask, request           # import flask

app = Flask(__name__)             # create an app instance

@app.route("/todo", methods=["POST"])
def create_todo():
    return ToDoService().create(request.get_json())
    
if __name__ == "__main__":
    Schema()
    app.run(debug=True)
