from flask import Flask, render_template, request, jsonify, session, redirect
import dbConnection # import dbConnection.py file
app = Flask(__name__)

# dashboard
@app.route('/dashboard')
def dashboard():
  return render_template("dashboard.html")

# branch
@app.route('/branch')
def branch():
  response = dbConnection.getBranch()
  return render_template("branch.html", branch=response)

@app.route('/create-branch', methods = ['POST', 'GET'])
def createBranch():
  if(request.method == "POST"):
    branch_id = request.form["branch_id"]
    branch_name = request.form["branch_name"]
    branch_location = request.form["branch_location"]
    branch_phone = request.form["branch_phone"]
    response = dbConnection.createBranch(branch_id, branch_name, branch_location, branch_phone)
    return "Success"

@app.route('/delete-branch', methods = ['POST', 'GET'])
def deleteBranch():
  if(request.method == "POST"):
    branch_id = request.form["branch_id"]
    response = dbConnection.deleteBranch(branch_id)
    return "Success"

# employee
@app.route('/employee')
def employee():
  response = dbConnection.getEmployee()
  return render_template("employee.html", employee=response)

@app.route('/create-employee', methods = ['POST', 'GET'])
def createEmployee():
  if(request.method == "POST"):
    emp_id = request.form["emp_id"]
    email_id = request.form["email_id"]
    branch_id = request.form["branch_id"]
    phone = request.form["phone"]
    pps = request.form["pps"]
    name = request.form["name"]
    address = request.form["address"]
    position = request.form["position"]
    monthly_salary = request.form["monthly_salary"]
    permission_level = request.form["permission_level"]
    response = dbConnection.createEmployee(emp_id, branch_id, name, address, phone, pps, email_id, position, monthly_salary, permission_level)
    return "Success"

@app.route('/delete-employee', methods = ['POST', 'GET'])
def deleteEmployee():
  if(request.method == "POST"):
    emp_id = request.form["emp_id"]
    response = dbConnection.deleteEmployee(emp_id)
    return "Success"

# customer
@app.route('/customer')
def customer():
  response = dbConnection.getCustomer()
  return render_template("customer.html", customer=response)

@app.route('/create-customer', methods = ['POST', 'GET'])
def createCustomer():
  if(request.method == "POST"):
    customer_id = request.form["customer_id"]
    customer_name = request.form["customer_name"]
    customer_address = request.form["customer_address"]
    customer_city = request.form["customer_city"]
    customer_phone = request.form["customer_phone"]
    customer_email = request.form["customer_email"]
    customer_type = request.form["customer_type"]
    response = dbConnection.createCustomer(customer_id, customer_name, customer_address, customer_city, customer_phone, customer_email, customer_type)
    return "Success"

@app.route('/delete-customer', methods = ['POST', 'GET'])
def deleteCustomer():
  if(request.method == "POST"):
    customer_id = request.form["customer_id"]
    response = dbConnection.deleteCustomer(customer_id)
    return "Success"

# transaction
@app.route('/transaction')
def transaction():
  response = dbConnection.getTransaction()
  return render_template("transaction.html", transaction=response)

# product
@app.route('/product')
def product():
  response = dbConnection.getProduct()
  return render_template("product.html", product=response)

# menu
@app.route('/menu')
def menu():
  response = dbConnection.getMenu()
  return render_template("menu.html", menu=response)

# payment
@app.route('/payment')
def payment():
  response = dbConnection.getPayment()
  return render_template("payment.html", payment=response)

# supplier
@app.route('/supplier')
def supplier():
  response = dbConnection.getSupplier()
  return render_template("supplier.html", supplier=response)

# order
@app.route('/order')
def order():
  response = dbConnection.getOrder()
  return render_template("order.html", order=response)

if __name__ == "__main__":
  app.run(debug=True)