from flask import Flask, render_template, request, jsonify, session, redirect
app = Flask(__name__)

# branch
@app.route('/')
def branch():
    return render_template("branch.html")

if __name__ == "__main__":
  app.run()

#dashboard
@app.route('/dashboard')
def dashboard():
    return render_template("dashboard.html")

if __name__ == "__main__":
  app.run()

#customers
@app.route('/customers')
def customers():
    return render_template("customers.html")

if __name__ == "__main__":
  app.run()

#payment
@app.route('/payment')
def payment():
    return render_template("payment.html")

if __name__ == "__main__":
  app.run()

#transaction
@app.route('/transaction')
def transaction():
    return render_template("transaction.html")

if __name__ == "__main__":
  app.run()

#product
@app.route('/product')
def product():
    return render_template("product.html")

if __name__ == "__main__":
  app.run()

#order
@app.route('/order')
def order():
    return render_template("order.html")

if __name__ == "__main__":
  app.run()

#supplier
@app.route('/supplier')
def supplier():
    return render_template("supplier.html")

if __name__ == "__main__":
  app.run()

#employee
@app.route('/employee')
def employee():
    return render_template("employee.html")

if __name__ == "__main__":
  app.run()

#menu
@app.route('/menu')
def menu():
    return render_template("menu.html")

if __name__ == "__main__":
  app.run()