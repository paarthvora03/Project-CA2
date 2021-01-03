USE Restaurant_Mgmt
GO

CREATE PROCEDURE GetAllEmployees
AS
SELECT * FROM tbl_Employee 

EXEC GetAllEmployees


ALTER PROCEDURE SearchItemSupplierMusgrave
AS
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

SELECT @ITEMS2.query('/record[@recordName="Cheese"]/Code[Code="CH9990"]')
GO

EXEC SearchItemSupplierMusgrave


USE Restaurant_Mgmt
GO 
SELECT * FROM tbl_Supplier