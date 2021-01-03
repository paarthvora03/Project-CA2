--MODIFYING XML

SELECT list_products from tbl_Supplier WHERE  list_products.value('(record/recordID)[1]','varchar(max)')=4
GO

UPDATE tbl_Supplier
SET list_products.modify('replace value of (/recordID/@Price)[1] with "5"')
WHERE list_products.value('(record/recordID)[1]','varchar(max)')=4


UPDATE tbl_Supplier
SET list_products.modify('replace value of (/recordID/@Price)[1] with "5"')
WHERE supplier_id=7001