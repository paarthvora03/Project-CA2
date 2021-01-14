import pypyodbc

# DB connection
def connectDB():
    connection = pypyodbc.connect('Driver={SQL Server};Server=PAARTH-VORA\SQLEXPRESS;Database=Restaurant_Mgmt;') # Creating Cursor  
    return connection

# Get
def getBranch():
    connection = connectDB()
    cursor = connection.cursor()
    cursor.execute("select * from tbl_Branch")
    return cursor

def createBranch(branch_id, branch_name, branch_location, branch_phone):
    connection = connectDB()
    cursor = connection.cursor()
    insert_query = "INSERT into tbl_Branch (branch_id, branch_name, branch_location, branch_phone) values (" + branch_id + ", '" + branch_name + "', '" + branch_location + "', '" + branch_phone + "')"
    # print (insert_query)
    cursor.execute(insert_query)
    connection.commit()

def deleteBranch(branch_id):
    connection = connectDB()
    cursor = connection.cursor()
    delete_query = "DELETE FROM tbl_Branch WHERE branch_id = " + branch_id
    # print (delete_query)
    cursor.execute(delete_query)
    connection.commit()

# Get Employees
def getEmployee():
    connection = connectDB()
    cursor = connection.cursor()
    cursor.execute("select * from tbl_Employee")
    return cursor

def createEmployee(emp_id, branch_id, name, address, phone, pps, email_id, position, monthly_salary, permission_level):
    connection = connectDB()
    cursor = connection.cursor()
    insert_query = "INSERT into tbl_Employee (emp_id, branch_id, emp_name, emp_address, emp_phone, emp_PPS, emp_email, emp_position, emp_monthly_salary, emp_permission_level) values (" + emp_id + ", '" + branch_id + "', '" + name + "', '" + address + "', '" + phone + "', '" + pps + "', '" + email_id + "', '" + position + "', '" + monthly_salary + "', '" + permission_level + "')"
    # print (insert_query)
    cursor.execute(insert_query)
    connection.commit()

def deleteEmployee(emp_id):
    connection = connectDB()
    cursor = connection.cursor()
    delete_query = "DELETE FROM tbl_Employee WHERE emp_id = " + emp_id
    # print (delete_query)
    cursor.execute(delete_query)
    connection.commit()   

# Get Customer
def getCustomer():
    connection = connectDB()
    cursor = connection.cursor()
    cursor.execute("select * from tbl_Customer")
    return cursor

def createCustomer(customer_id, customer_name, customer_address, customer_city, customer_phone, customer_email, customer_type):
    connection = connectDB()
    cursor = connection.cursor()
    insert_query = "INSERT into tbl_Customer (customer_id, customer_name, customer_address, customer_city, customer_phone, customer_email, customer_type) values (" + customer_id + ", '" + customer_name + "', '" + customer_address + "', '" + customer_city + "', '" + customer_phone + "', '" + customer_email + "', '" + customer_type + "')"
    # print (insert_query)
    cursor.execute(insert_query)
    connection.commit()

def deleteCustomer(customer_id):
    connection = connectDB()
    cursor = connection.cursor()
    delete_query = "DELETE FROM tbl_Customer WHERE customer_id = " + customer_id
    # print (delete_query)
    cursor.execute(delete_query)
    connection.commit()

# Get Menu
def getMenu():
    connection = connectDB()
    cursor = connection.cursor()
    cursor.execute("select * from tbl_MenuItem")
    return cursor

# Get Product
def getProduct():
    connection = connectDB()
    cursor = connection.cursor()
    cursor.execute("select * from tbl_Product_Ingredient")
    return cursor

# Get Supplier
def getSupplier():
    connection = connectDB()
    cursor = connection.cursor()
    cursor.execute("select * from tbl_Supplier")
    return cursor

# Get Transaction
def getTransaction():
    connection = connectDB()
    cursor = connection.cursor()
    cursor.execute("select * from tbl_Transaction")
    return cursor

# Get Order
def getOrder():
    connection = connectDB()
    cursor = connection.cursor()
    cursor.execute("select * from tbl_Order")
    return cursor

# Get Payment
def getPayment():
    connection = connectDB()
    cursor = connection.cursor()
    cursor.execute("select * from tbl_Payment")
    return cursor
