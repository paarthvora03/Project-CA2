from flask import Flask, render_template, request, jsonify, session, redirect
import dbConnection # import dbConnection.py file
app = Flask(__name__)

# dashboard
@app.route('/dashboard')
def dashboard():
  return render_template("dashboard.html")

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



