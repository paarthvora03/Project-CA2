from flask import Flask, render_template, request, jsonify, session, redirect
app = Flask(__name__)

# branch
@app.route('/')
def branch():
    return render_template("branch.html")

if __name__ == "__main__":
  app.run()


@app.route('/dashboard')
def dashboard():
    return render_template("dashboard.html")

if __name__ == "__main__":
  app.run()

@app.route('/customer')
def customer():
    return render_template("customer.html")

if __name__ == "__main__":
  app.run()