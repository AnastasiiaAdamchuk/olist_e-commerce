-- tables:
-- SELECT * FROM olist.olist_products_dataset LIMIT 10	
-- SELECT * FROM olist.olist_order_items_dataset LIMIT 10	
-- SELECT * FROM olist.olist_marketing_qualified_leads_dataset LIMIT 10	
-- SELECT * FROM olist.olist_closed_deals_dataset LIMIT 10	

-- measures and dimentions:
-- 
-- mqld olist.olist_marketing_qualified_leads_dataset --> mqld.mql_id, mqld.first_contact_date, mqld.origin
-- cdd olist.olist_closed_deals_dataset --> cdd.mql_id, cdd.seller_id, cdd.business_segment, cdd.sdr_id, cdd.sr_id, cdd.won_date
-- oid olist.olist_order_items_dataset --> oid.order_id, oid.order_item_id, oid.product_id, oid.seller_id, oid.price, oid.freight_value
-- pd olist.olist_products_dataset --> pd.product_id, pd.product_category_name, pd.product_weight_g



