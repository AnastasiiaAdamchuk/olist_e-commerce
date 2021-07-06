-- tables:
-- SELECT * FROM olist.olist_products_dataset LIMIT 10	
-- SELECT * FROM olist.olist_order_items_dataset LIMIT 10	
-- SELECT * FROM olist.olist_marketing_qualified_leads_dataset LIMIT 10	
-- SELECT * FROM olist.olist_closed_deals_dataset LIMIT 10	

-- measures and dimentions:
-- sum, deduction, division
-- mqld olist.olist_marketing_qualified_leads_dataset --> mqld.mql_id, mqld.first_contact_date, mqld.origin
-- cdd olist.olist_closed_deals_dataset --> cdd.mql_id, cdd.seller_id, cdd.business_segment, cdd.sdr_id, cdd.sr_id, cdd.won_date
-- oid olist.olist_order_items_dataset --> oid.order_id, oid.order_item_id, oid.product_id, oid.seller_id, oid.price, oid.freight_value
-- pd olist.olist_products_dataset --> pd.product_id, pd.product_category_name, pd.product_weight_g


WITH olist_table AS (
SELECT 
	mqld.mql_id,
	cdd.sdr_id,
	cdd.sr_id,
	cdd.seller_id,
	mqld.first_contact_date,
	mqld.origin,
	cdd.business_segment,
	cdd.won_date,
	oid.order_id,
	oid.product_id,
	pd.product_category_name,
	ROUND((pd.product_weight_g / 1000.0),1) AS product_weight_kg,
	SUM(oid.order_item_id) AS total_order_item,
	SUM(oid.price) AS total_price,
	SUM(oid.freight_value) AS total_freight_value
FROM olist.olist_marketing_qualified_leads_dataset mqld 
LEFT JOIN olist.olist_closed_deals_dataset cdd ON mqld.mql_id = cdd.mql_id 
LEFT JOIN olist.olist_order_items_dataset oid ON cdd.seller_id = oid.seller_id
LEFT JOIN olist.olist_products_dataset pd ON oid.product_id = pd.product_id
GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12
)

SELECT 
	*,
	(total_price - total_freight_value) AS price_without_freight_value,
	product_weight_kg,
	CASE
		WHEN product_weight_kg <= 3 THEN 'small'
		WHEN product_weight_kg < 10 AND product_weight_kg > 3 THEN 'medium'
		WHEN product_weight_kg >= 10 THEN 'large' 
        END AS sizes
FROM olist_table


