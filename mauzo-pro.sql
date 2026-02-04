SELECT 
    "SalesOrderEntity"."created" AS "SalesOrderEntity_created", 
    "SalesOrderEntity"."lastupdated" AS "SalesOrderEntity_lastupdated", 
    "SalesOrderEntity"."salesorderid" AS "SalesOrderEntity_salesorderid", 
    "SalesOrderEntity"."uid" AS "SalesOrderEntity_uid", 
    "SalesOrderEntity"."ordercode" AS "SalesOrderEntity_ordercode", 
    "SalesOrderEntity"."details" AS "SalesOrderEntity_details", 
    "SalesOrderEntity"."discount" AS "SalesOrderEntity_discount", 
    "SalesOrderEntity"."salesorderdate" AS "SalesOrderEntity_salesorderdate", 
    "SalesOrderEntity"."salesorderprice" AS "SalesOrderEntity_salesorderprice", 
    "SalesOrderEntity"."transportcost" AS "SalesOrderEntity_transportcost", 
    "SalesOrderEntity"."deliverycost" AS "SalesOrderEntity_deliverycost", 
    "SalesOrderEntity"."phone" AS "SalesOrderEntity_phone", 
    "SalesOrderEntity"."paymentmethod" AS "SalesOrderEntity_paymentmethod", 
    "SalesOrderEntity"."paymentstatus" AS "SalesOrderEntity_paymentstatus", 
    "SalesOrderEntity"."orderstatus" AS "SalesOrderEntity_orderstatus", 
    "SalesOrderEntity"."deleted" AS "SalesOrderEntity_deleted", 
    "SalesOrderEntity"."createdby" AS "SalesOrderEntity_createdby", 
    "SalesOrderEntity"."updatedby" AS "SalesOrderEntity_updatedby", 
    
    "SalesOrderEntity__SalesOrderEntity_products"."created" AS "SalesOrderEntity__SalesOrderEntity_products_created", 
    "SalesOrderEntity__SalesOrderEntity_products"."lastupdated" AS "SalesOrderEntity__SalesOrderEntity_products_lastupdated", 
    "SalesOrderEntity__SalesOrderEntity_products"."productid" AS "SalesOrderEntity__SalesOrderEntity_products_productid", 
    "SalesOrderEntity__SalesOrderEntity_products"."uid" AS "SalesOrderEntity__SalesOrderEntity_products_uid", 
    "SalesOrderEntity__SalesOrderEntity_products"."code" AS "SalesOrderEntity__SalesOrderEntity_products_code", 
    "SalesOrderEntity__SalesOrderEntity_products"."name" AS "SalesOrderEntity__SalesOrderEntity_products_name", 
    "SalesOrderEntity__SalesOrderEntity_products"."description" AS "SalesOrderEntity__SalesOrderEntity_products_description", 
    "SalesOrderEntity__SalesOrderEntity_products"."productimage" AS "SalesOrderEntity__SalesOrderEntity_products_productimage", 
    "SalesOrderEntity__SalesOrderEntity_products"."buyingprice" AS "SalesOrderEntity__SalesOrderEntity_products_buyingprice", 
    "SalesOrderEntity__SalesOrderEntity_products"."sellingprice" AS "SalesOrderEntity__SalesOrderEntity_products_sellingprice", 
    "SalesOrderEntity__SalesOrderEntity_products"."stock" AS "SalesOrderEntity__SalesOrderEntity_products_stock", 
    "SalesOrderEntity__SalesOrderEntity_products"."reorderstock" AS "SalesOrderEntity__SalesOrderEntity_products_reorderstock", 
    "SalesOrderEntity__SalesOrderEntity_products"."discontinued" AS "SalesOrderEntity__SalesOrderEntity_products_discontinued", 
    "SalesOrderEntity__SalesOrderEntity_products"."deleted" AS "SalesOrderEntity__SalesOrderEntity_products_deleted", 
    "SalesOrderEntity__SalesOrderEntity_products"."expirydate" AS "SalesOrderEntity__SalesOrderEntity_products_expirydate", 
    "SalesOrderEntity__SalesOrderEntity_products"."barcode" AS "SalesOrderEntity__SalesOrderEntity_products_barcode", 
    "SalesOrderEntity__SalesOrderEntity_products"."category" AS "SalesOrderEntity__SalesOrderEntity_products_category", 
    "SalesOrderEntity__SalesOrderEntity_products"."store" AS "SalesOrderEntity__SalesOrderEntity_products_store", 
    "SalesOrderEntity__SalesOrderEntity_products"."shipmenttracking" AS "SalesOrderEntity__SalesOrderEntity_products_shipmenttracking", 
    
    "c412779e0f0fda818c8824be0bf42d5be88b7c65"."created" AS "c412779e0f0fda818c8824be0bf42d5be88b7c65_created", 
    "c412779e0f0fda818c8824be0bf42d5be88b7c65"."lastupdated" AS "c412779e0f0fda818c8824be0bf42d5be88b7c65_lastupdated", 
    "c412779e0f0fda818c8824be0bf42d5be88b7c65"."productcategoryid" AS "c412779e0f0fda818c8824be0bf42d5be88b7c65_productcategoryid", 
    "c412779e0f0fda818c8824be0bf42d5be88b7c65"."uid" AS "c412779e0f0fda818c8824be0bf42d5be88b7c65_uid", 
    "c412779e0f0fda818c8824be0bf42d5be88b7c65"."code" AS "c412779e0f0fda818c8824be0bf42d5be88b7c65_code", 
    "c412779e0f0fda818c8824be0bf42d5be88b7c65"."name" AS "c412779e0f0fda818c8824be0bf42d5be88b7c65_name", 
    "c412779e0f0fda818c8824be0bf42d5be88b7c65"."description" AS "c412779e0f0fda818c8824be0bf42d5be88b7c65_description", 
    "c412779e0f0fda818c8824be0bf42d5be88b7c65"."deleted" AS "c412779e0f0fda818c8824be0bf42d5be88b7c65_deleted", 
    
    "SalesOrderEntity__createdby"."created" AS "SalesOrderEntity__createdby_created", 
    "SalesOrderEntity__createdby"."lastupdated" AS "SalesOrderEntity__createdby_lastupdated", 
    "SalesOrderEntity__createdby"."userid" AS "SalesOrderEntity__createdby_userid", 
    "SalesOrderEntity__createdby"."uid" AS "SalesOrderEntity__createdby_uid", 
    "SalesOrderEntity__createdby"."firstname" AS "SalesOrderEntity__createdby_firstname", 
    "SalesOrderEntity__createdby"."lastname" AS "SalesOrderEntity__createdby_lastname", 
    "SalesOrderEntity__createdby"."email" AS "SalesOrderEntity__createdby_email", 
    "SalesOrderEntity__createdby"."username" AS "SalesOrderEntity__createdby_username", 
    "SalesOrderEntity__createdby"."phone" AS "SalesOrderEntity__createdby_phone", 
    "SalesOrderEntity__createdby"."externalAuth" AS "SalesOrderEntity__createdby_externalAuth", 
    "SalesOrderEntity__createdby"."externalAuthid" AS "SalesOrderEntity__createdby_externalAuthid", 
    "SalesOrderEntity__createdby"."password" AS "SalesOrderEntity__createdby_password", 
    "SalesOrderEntity__createdby"."salt" AS "SalesOrderEntity__createdby_salt", 
    "SalesOrderEntity__createdby"."disabled" AS "SalesOrderEntity__createdby_disabled", 
    "SalesOrderEntity__createdby"."deleted" AS "SalesOrderEntity__createdby_deleted", 
    "SalesOrderEntity__createdby"."lastlogin" AS "SalesOrderEntity__createdby_lastlogin", 
    
    "SalesOrderEntity__createdby__userRoles"."created" AS "SalesOrderEntity__createdby__userRoles_created", 
    "SalesOrderEntity__createdby__userRoles"."lastupdated" AS "SalesOrderEntity__createdby__userRoles_lastupdated", 
    "SalesOrderEntity__createdby__userRoles"."userroleid" AS "SalesOrderEntity__createdby__userRoles_userroleid", 
    "SalesOrderEntity__createdby__userRoles"."uid" AS "SalesOrderEntity__createdby__userRoles_uid", 
    "SalesOrderEntity__createdby__userRoles"."code" AS "SalesOrderEntity__createdby__userRoles_code", 
    "SalesOrderEntity__createdby__userRoles"."name" AS "SalesOrderEntity__createdby__userRoles_name", 
    "SalesOrderEntity__createdby__userRoles"."description" AS "SalesOrderEntity__createdby__userRoles_description", 
    "SalesOrderEntity__createdby__userRoles"."deleted" AS "SalesOrderEntity__createdby__userRoles_deleted", 
    
    "SalesOrderEntity__createdby__userRoles__userAuthorities"."created" AS "SalesOrderEntity__createdby__userRoles__userAuthorities_created", 
    "SalesOrderEntity__createdby__userRoles__userAuthorities"."lastupdated" AS "01697dcef9efefcab165d8949216dc2e807f6e7d", 
    "SalesOrderEntity__createdby__userRoles__userAuthorities"."userauthorityid" AS "24811ca24f9869b0443a4a697857b3d73f4a0f71", 
    "SalesOrderEntity__createdby__userRoles__userAuthorities"."uid" AS "SalesOrderEntity__createdby__userRoles__userAuthorities_uid", 
    "SalesOrderEntity__createdby__userRoles__userAuthorities"."code" AS "SalesOrderEntity__createdby__userRoles__userAuthorities_code", 
    "SalesOrderEntity__createdby__userRoles__userAuthorities"."name" AS "SalesOrderEntity__createdby__userRoles__userAuthorities_name", 
    "SalesOrderEntity__createdby__userRoles__userAuthorities"."description" AS "a45033b7944c706a6768fa51075e6aca5058a9db", 
    "SalesOrderEntity__createdby__userRoles__userAuthorities"."deleted" AS "SalesOrderEntity__createdby__userRoles__userAuthorities_deleted", 
    
    "SalesOrderEntity__updatedby"."created" AS "SalesOrderEntity__updatedby_created", 
    "SalesOrderEntity__updatedby"."lastupdated" AS "SalesOrderEntity__updatedby_lastupdated", 
    "SalesOrderEntity__updatedby"."userid" AS "SalesOrderEntity__updatedby_userid", 
    "SalesOrderEntity__updatedby"."uid" AS "SalesOrderEntity__updatedby_uid", 
    "SalesOrderEntity__updatedby"."firstname" AS "SalesOrderEntity__updatedby_firstname", 
    "SalesOrderEntity__updatedby"."lastname" AS "SalesOrderEntity__updatedby_lastname", 
    "SalesOrderEntity__updatedby"."email" AS "SalesOrderEntity__updatedby_email", 
    "SalesOrderEntity__updatedby"."username" AS "SalesOrderEntity__updatedby_username", 
    "SalesOrderEntity__updatedby"."phone" AS "SalesOrderEntity__updatedby_phone", 
    "SalesOrderEntity__updatedby"."externalAuth" AS "SalesOrderEntity__updatedby_externalAuth", 
    "SalesOrderEntity__updatedby"."externalAuthid" AS "SalesOrderEntity__updatedby_externalAuthid", 
    "SalesOrderEntity__updatedby"."password" AS "SalesOrderEntity__updatedby_password", 
    "SalesOrderEntity__updatedby"."salt" AS "SalesOrderEntity__updatedby_salt", 
    "SalesOrderEntity__updatedby"."disabled" AS "SalesOrderEntity__updatedby_disabled", 
    "SalesOrderEntity__updatedby"."deleted" AS "SalesOrderEntity__updatedby_deleted", 
    "SalesOrderEntity__updatedby"."lastlogin" AS "SalesOrderEntity__updatedby_lastlogin", 
    
    "SalesOrderEntity__updatedby__userRoles"."created" AS "SalesOrderEntity__updatedby__userRoles_created", 
    "SalesOrderEntity__updatedby__userRoles"."lastupdated" AS "SalesOrderEntity__updatedby__userRoles_lastupdated", 
    "SalesOrderEntity__updatedby__userRoles"."userroleid" AS "SalesOrderEntity__updatedby__userRoles_userroleid", 
    "SalesOrderEntity__updatedby__userRoles"."uid" AS "SalesOrderEntity__updatedby__userRoles_uid", 
    "SalesOrderEntity__updatedby__userRoles"."code" AS "SalesOrderEntity__updatedby__userRoles_code", 
    "SalesOrderEntity__updatedby__userRoles"."name" AS "SalesOrderEntity__updatedby__userRoles_name", 
    "SalesOrderEntity__updatedby__userRoles"."description" AS "SalesOrderEntity__updatedby__userRoles_description", 
    "SalesOrderEntity__updatedby__userRoles"."deleted" AS "SalesOrderEntity__updatedby__userRoles_deleted", 
    
    "SalesOrderEntity__updatedby__userRoles__userAuthorities"."created" AS "SalesOrderEntity__updatedby__userRoles__userAuthorities_created", 
    "SalesOrderEntity__updatedby__userRoles__userAuthorities"."lastupdated" AS "a53badef0b163ec135de16150b38cb660f0a0f1a", 
    "SalesOrderEntity__updatedby__userRoles__userAuthorities"."userauthorityid" AS "d46a058102f8876d1b631c3d476f62ade413c65b", 
    "SalesOrderEntity__updatedby__userRoles__userAuthorities"."uid" AS "SalesOrderEntity__updatedby__userRoles__userAuthorities_uid", 
    "SalesOrderEntity__updatedby__userRoles__userAuthorities"."code" AS "SalesOrderEntity__updatedby__userRoles__userAuthorities_code", 
    "SalesOrderEntity__updatedby__userRoles__userAuthorities"."name" AS "SalesOrderEntity__updatedby__userRoles__userAuthorities_name", 
    "SalesOrderEntity__updatedby__userRoles__userAuthorities"."description" AS "4d8fbc5ab4f7a82aacbae05503a4d25ba0ed5e7e", 
    "SalesOrderEntity__updatedby__userRoles__userAuthorities"."deleted" AS "SalesOrderEntity__updatedby__userRoles__userAuthorities_deleted" 
FROM "salesorder" "SalesOrderEntity" 
LEFT JOIN "salesorderproducts" "SalesOrderEntity_SalesOrderEntity__SalesOrderEntity_products" 
    ON "SalesOrderEntity_SalesOrderEntity__SalesOrderEntity_products"."salesorderid"="SalesOrderEntity"."salesorderid" 
LEFT JOIN "products" "SalesOrderEntity__SalesOrderEntity_products" 
    ON "SalesOrderEntity__SalesOrderEntity_products"."productid"="SalesOrderEntity_SalesOrderEntity__SalesOrderEntity_products"."productid"  
LEFT JOIN "productcategory" "c412779e0f0fda818c8824be0bf42d5be88b7c65" 
    ON "c412779e0f0fda818c8824be0bf42d5be88b7c65"."productcategoryid"="SalesOrderEntity__SalesOrderEntity_products"."category"  
LEFT JOIN "stores" "c08fd08824b162a121f944b051aaa5797e86a07e" 
    ON "c08fd08824b162a121f944b051aaa5797e86a07e"."storeid"="SalesOrderEntity__SalesOrderEntity_products"."store"  
LEFT JOIN "users" "SalesOrderEntity__createdby" 
    ON "SalesOrderEntity__createdby"."userid"="SalesOrderEntity"."createdby"  
LEFT JOIN "userrolemembers" "66f30ef899c4e39f8c12af1ddb299a1c625d490a" 
    ON "66f30ef899c4e39f8c12af1ddb299a1c625d490a"."userid"="SalesOrderEntity__createdby"."userid" 
LEFT JOIN "userrole" "SalesOrderEntity__createdby__userRoles" 
    ON "SalesOrderEntity__createdby__userRoles"."userroleid"="66f30ef899c4e39f8c12af1ddb299a1c625d490a"."userroleid"  
LEFT JOIN "userauthoritymembers" "0935ac3b7357fd956b2a6d35e0b2eff5cb8d12dc" 
    ON "0935ac3b7357fd956b2a6d35e0b2eff5cb8d12dc"."userroleid"="SalesOrderEntity__createdby__userRoles"."userroleid" 
LEFT JOIN "userauthority" "SalesOrderEntity__createdby__userRoles__userAuthorities" 
    ON "SalesOrderEntity__createdby__userRoles__userAuthorities"."userauthorityid"="0935ac3b7357fd956b2a6d35e0b2eff5cb8d12dc"."userauthorityid"  
LEFT JOIN "users" "SalesOrderEntity__updatedby" 
    ON "SalesOrderEntity__updatedby"."userid"="SalesOrderEntity"."updatedby"  
LEFT JOIN "userrolemembers" "d762df0ff34b6e85c580a5427aacfc29b2db22c8" 
    ON "d762df0ff34b6e85c580a5427aacfc29b2db22c8"."userid"="SalesOrderEntity__updatedby"."userid" 
LEFT JOIN "userrole" "SalesOrderEntity__updatedby__userRoles" 
    ON "SalesOrderEntity__updatedby__userRoles"."userroleid"="d762df0ff34b6e85c580a5427aacfc29b2db22c8"."userroleid"  
LEFT JOIN "userauthoritymembers" "b51eb4b62c860dfaba9ccff2f7ced2d6102c540b" 
    ON "b51eb4b62c860dfaba9ccff2f7ced2d6102c540b"."userroleid"="SalesOrderEntity__updatedby__userRoles"."userroleid" 
LEFT JOIN "userauthority" "SalesOrderEntity__updatedby__userRoles__userAuthorities" 
    ON "SalesOrderEntity__updatedby__userRoles__userAuthorities"."userauthorityid"="b51eb4b62c860dfaba9ccff2f7ced2d6102c540b"."userauthorityid";
WHERE 
    (
        (
            (
                (
                    (
                        ("c08fd08824b162a121f944b051aaa5797e86a07e"."uid" IN ('BGHm0NT9wll'))
                    )
                ) 
                AND ("SalesOrderEntity"."deleted" = 'f')
            )
        ) 
    AND 
    (
        "SalesOrderEntity"."salesorderid" IN (
            85, 84, 83, 82, 81, 80, 79, 78, 77, 76, 
            75, 74, 73, 72, 71, 70, 69, 68, 67, 66, 
            65, 64, 63, 62, 61, 60, 59, 58, 57, 56, 
            55, 54, 53, 52, 51, 50, 49, 48, 47, 46, 
            45, 44, 43, 42, 41, 40, 39, 38, 37, 36
        )
    ) 
ORDER BY "SalesOrderEntity"."created" DESC



-- Improved sql query for salesOrder
SELECT
    so.created AS "so_created", 
    so.lastupdated AS "so_lastupdated", 
    so.salesorderid AS "so_salesorderid", 
    so.uid AS "so_uid", 
    so.ordercode AS "so_ordercode", 
    so.details AS "so_details", 
    so.discount AS "so_discount", 
    so.salesorderdate AS "so_salesorderdate", 
    so.salesorderprice AS "so_salesorderprice", 
    so.transportcost AS "so_transportcost", 
    so.deliverycost AS "so_deliverycost", 
    so.phone AS "so_phone", 
    so.paymentmethod AS "so_paymentmethod", 
    so.paymentstatus AS "so_paymentstatus", 
    so.orderstatus AS "so_orderstatus", 
    so.deleted AS "so_deleted",
    prod.uid AS "prod_uid",
    prod.name AS "prod_name",
    sopq.quantity AS "sopq_quantity",
    sopq.sellingprice AS "sopq_sellingprice",
    uc.firstname as "so_createdby_firstname",
    uc.lastname as "so_createdby_lastname",
    uc.username as "so_createdby_username",
    uc.uid as "so_createdby_uid",
    uu.firstname as "so_updatedby_firstname",
    uu.lastname as "so_updatedby_lastname",
    uu.username as "so_updatedby_username",
    uu.uid as "so_updatedby_uid"
FROM salesorder so
LEFT JOIN salesorderproducts sop ON sop.salesorderid = so.salesorderid 
LEFT JOIN products prod ON prod.productid = sop.productid
LEFT JOIN salesorderproductquantity sopq ON sopq.salesorderid = so.salesorderid
LEFT JOIN stores store ON store.storeid = prod.store  
LEFT JOIN users uc ON uc.userid = so.createdby
LEFT JOIN users uu ON uu.userid = so.updatedby
WHERE
    store.uid IN ('BGHm0NT9wll') AND
    so.deleted is false
ORDER BY so.created DESC
-- LIMIT :pageSize OFFSET :pageSize * (:page - 1)
LIMIT 3 OFFSET 10;



-- Improved sql query for expenses 
SELECT
    exp.created AS "exp_created", 
    exp.lastupdated AS "exp_lastupdated", 
    exp.uid AS "exp_uid",
    exp.expensedate AS "exp_expensedate",
    exp.category AS "exp_category",
    exp.subcategory AS "exp_subcategory",
    exp.details AS "exp_details",
    exp.deleted AS "exp_deleted",
    exp.paymentmethod AS "exp_paymentmethod",
    exp.amount AS "exp_amount",
    store.uid AS "store_uid",
    store.name AS "store_name",
    store.currency AS "store_currency",
    store.created AS "store_created",
    store.lastupdated AS "store_lastupdated"
FROM expenses exp
LEFT JOIN stores store ON store.storeid = exp.store
WHERE
    store.uid IN ('BGHm0NT9wll') AND
    exp.deleted is false
ORDER BY exp.created DESC
LIMIT 3 OFFSET 10;


-- Improved sql query for products 
SELECT
    prod.created AS "prod_created",
    prod.lastupdated AS "prod_lastupdated",
    prod.uid AS "prod_uid",
    prod.name AS "prod_name",
    prod.code AS "prod_code",
    prod.description AS "prod_description",
    prod.productimage AS "prod_productimage",
    prod.buyingprice AS "prod_buyingprice",
    prod.sellingprice AS "prod_sellingprice",
    prod.stock AS "prod_stock",
    prod.reorderstock AS "prod_reorderstock",
    prod.discontinued AS "prod_discontinued",
    prod.deleted AS "prod_deleted",
    prod.expirydate AS "prod_expirydate",
    prod.barcode AS "prod_barcode",
    cat.created AS "cat_created",
    cat.lastupdated AS "cat_lastupdated",
    cat.uid AS "cat_uid",
    cat.name AS "cat_name",
    cat.code AS "cat_code",
    cat.description AS "cat_description",
    store.created AS "store_created",
    store.lastupdated AS "store_lastupdated",
    store.uid AS "store_uid",
    store.name AS "store_name",
    store.currency AS "store_currency"
FROM products prod
LEFT JOIN productcategory cat ON cat.productcategoryid = prod.category
LEFT JOIN stores store ON store.storeid = prod.store
WHERE
    store.uid IN ('BGHm0NT9wll') AND
    prod.deleted is false
ORDER BY prod.created DESC
LIMIT 3 OFFSET 10;

