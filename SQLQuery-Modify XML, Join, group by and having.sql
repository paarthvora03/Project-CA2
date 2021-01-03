SELECT * FROM tbl_Product_Ingredient

DECLARE @ITEMS XML
SET @ITEMS = ('
    <record recordName="Veggie Burger" >
	   <Code>VG966Z</Code>
       <Item>Vegan Pulled oats Veggie burger FZN</Item>
       <Specification>1.6kg</Specification>
       <Price>170.00</Price>
    </record>
	<record recordName="Onion Ring" recordID="2">
	   <Code>VG739Z</Code>
       <Item>Beer battered Onion Ring</Item>
       <Specification>6kg per case</Specification>
       <Price>58.50</Price>
    </record>
	<record recordName="Crisps" recordID="3">
	   <Code>VX739Z</Code>
       <Item>Crisps</Item>
       <Specification>48 per case</Specification>
       <Price>10.20</Price>
    </record>
	<record recordName="Fries" recordID="4">
	   <Code>VP223Z</Code>
       <Item>Fries skin on</Item>
       <Specification>9x94x2.5kg per case</Specification>
       <Price>25.40</Price>
    </record>
	<record recordName="Fries" recordID="5">
	   <Code>VP224Z</Code>
       <Item>Fries regular</Item>
       <Specification>9x94x2.5kg per case</Specification>
       <Price>22.00</Price>
    </record>')


Use Restaurant_Mgmt
GO


--MODIFYING XML

SELECT list_products from tbl_Supplier WHERE  list_products.value('(record/recordID)[1]','varchar(max)')=4
GO

UPDATE tbl_Supplier
SET list_products.modify('replace value of (/recordID/@Price)[1] with "5"')
WHERE list_products.value('(record/recordID)[1]','varchar(max)')=4


UPDATE tbl_Supplier
SET list_products.modify('replace value of (/recordID/@Price)[1] with "5"')
WHERE supplier_id=7001


--[@recordID="1"]



SELECT * FROM tbl_Supplier

SELECT @ITEMS.query('/record[@recordID="1"]')
GO


INSERT INTO tbl_Supplier VALUES (7001, 'Meats, dairy, dry foods', 'Pallas', 'Newcastle West, Limerick, Ireland', 'Limerick, Ireland', 'Jeremy Glick', 0839488541, @ITEMS)
GO

--ALTER TABLE tbl_Supplier  ALTER COLUMN supplier_address VARCHAR(60)
--ALTER TABLE tbl_Supplier  ALTER COLUMN supplier_type VARCHAR(60)


DECLARE @ITEMS2 XML
SET @ITEMS2 = ('
<record recordName="Bun">
		<Code>496188</Code>
		<Item>N WAY Burger Buns</Item>
		<Specification>48x75 GM</Specification>
		<Price>45</Price>
	</record>
	<record recordName="Bun">
		<Code>31298</Code>
		<Item>Eurobuns Side Slice Hot Dog Roll </Item>
		<Specification>6.5" 1x48 FROZEN</Specification>
		<Price>45</Price>
	</record>
	<record recordName="Ice cream">
		<Code>32195</Code>
		<Item>Brakes Dairy Vanilla Ice Cream </Item>
		<Specification>1x4 LT</Specification>
		<Price>32</Price>
	</record>
	<record recordName="Fish">
		<Code>FS951Z</Code>
		<Item>Battered cod fillets skinless </Item>
		<Specification>140-170g 24 per Case</Specification>
		<Price>79</Price>
	</record>
	<record recordName="Chicken">
		<Code>C411</Code>
		<Item>Chicken Fillet Skinless </Item>
		<Specification>230g+Halal 2x5KG Chilled</Specification>
		<Price>58</Price>
	</record>
	<record recordName="Burger">
		<Code>496059</Code>
		<Item>N WAY Handmade Style Burger </Item>
		<Specification>72x100 GM</Specification>
		<Price>190.9</Price>
	</record>
	<record recordName="Cheese">
		<Code>CH1630</Code>
		<Item>Kerrymaid Burger Cheese Slices </Item>
		<Specification>1x1.4 KG CS</Specification>
		<Price>9.95</Price>
	</record>
	<record recordName="Cheese">
		<Code>CH9990</Code>
		<Item>American Cheese</Item>
		<Specification>1.4 kg - 112 slices per pack </Specification>
		<Price>8.85</Price>
	</record>')

SELECT @ITEMS2.query('/record[@recordName=""]')
GO

INSERT INTO tbl_Supplier VALUES (7002, 'Meats, dairy, dry foods', 'Lynas', 'Musgrave House, Ballycurreen, Airport Road, Cork, T12 TN99', 'Cork, Ireland', 'Thomas Jefferson', 0899476540, @ITEMS2)
GO

DECLARE @ITEMS3 XML
SET @ITEMS3 = ('
<record>
		<Code>96189</Code>
		<Item>Still water</Item>
		<Specification>1x24 per case</Specification>
		<Price>5.50</Price>
	</record>
	<record>
		<Code>81297</Code>
		<Item>Coke</Item>
		<Specification>Bottles, 500ml, 1x24</Specification>
		<Price>10.10</Price>
	</record>
	<record>
		<Code>92197</Code>
		<Item>Fanta</Item>
		<Specification>Bottles, 500mo, 1x24</Specification>
		<Price>9.10</Price>
	</record>
	<record>
		<Code>88951</Code>
		<Item>Sprite</Item>
		<Specification>Bottles, 500ml, 1x24</Specification>
		<Price>10.10</Price>
	</record>
	<record>
		<Code>41190</Code>
			<Item>Sparkling water</Item>
			<Specification>Bottles, 500ml, 1x24</Specification>
			<Price>7.5</Price>
	</record>')

SELECT @ITEMS3.query('/record/Code[@Code="96189"]')
GO

INSERT INTO tbl_Supplier VALUES (7003, 'Drinks', 'Coca-Cola', '2 Ballsbridge Park. Ballsbridge. Dublin, D04 YW83', 'Dublin, Ireland', 'Maria Thompson', 0893478588, @ITEMS3)
GO




SELECT * FROM tbl_Supplier


--JOIN OF TABLES BRANCH AND EMPLOYEE

SELECT * FROM tbl_Branch
SELECT * FROM tbl_Employee

SELECT eb.*, ec.branch_name
FROM tbl_Employee as eb
Left Join tbl_Branch ec on eb.branch_id=eb.branch_id
WHERE ec.branch_name='Unit 1'

-- GROUP BY AND HAVING

SELECT emp_position, MIN(emp_monthly_salary), COUNT(emp_monthly_salary)
FROM tbl_Employee
GROUP BY emp_position
HAVING MIN(emp_monthly_salary)<2000