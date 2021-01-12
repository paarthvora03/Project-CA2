import pypyodbc

# DB connection
def connectDB():
    connection = pypyodbc.connect('Driver={SQL Server};Server=DESKTOP-7JP4QEK\SQLEXPRESS;Database=master;') # Creating Cursor  
    return connection

# Get
def getBranch():
    connection = connectDB()
    cursor = connection.cursor()
    cursor.execute("select * from tbl_Branch")
    return cursor

# Get Employees
def getEmployee():
    connection = connectDB()
    cursor = connection.cursor()
    cursor.execute("select * from tbl_Employee")
    return cursor

def createEmployee(emp_id, branch_id, name, address, phone, pps, email_id, position, monthly_salary, permission_level):
    connection = connectDB()
    cursor = connection.cursor()
    insert_query = "INSERT into tbl_Employee (emp_id, branch_id, emp_name, emp_address, emp_phone, emp_PPS, emp_email, emp_position, emp_monthly_salary, emp_permission_level) values ('" + emp_id + "', '" + branch_id + "', '" + name + "', '" + address + "', '" + phone + "', '" + pps + "', '" + email_id + "', '" + position + "', '" + monthly_salary + "', '" + permission_level + "')"
    print (insert_query)
    cursor.execute(insert_query)

# Get Customer
def getCustomer():
    connection = connectDB()
    cursor = connection.cursor()
    cursor.execute("select * from tbl_Customer")
    return cursor

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
