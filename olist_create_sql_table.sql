/*
this code creat the following tables:
1. olist_marketing_qualified_leads_dataset
2. olist_closed_deals_dataset
3. olist_order_items_dataset
4. product_category_name_translation
*/

create table olist.olist_marketing_qualified_leads_dataset (
	mql_id varchar(100),
	first_contact_date date,
	landing_page_id varchar(100),
	origin varchar (50));
	
--drop table if exists olist.olist_closed_deals_dataset;
create table olist.olist_closed_deals_dataset (
	mql_id varchar(100),
	seller_id varchar (100),
	sdr_id varchar(100),
	sr_id varchar (100),
	won_date date,
	business_segment varchar (50),
	lead_type varchar (50),
	lead_behaviour_profile varchar (50),
	has_company boolean,
	has_gtin boolean,
	average_stock varchar (50),
	business_type varchar (50),
	declared_product_catalog_size float,
	declared_monthly_revenue float );
	
create table olist.olist_order_items_dataset (
	order_id varchar (100),
	order_item_id int,
	product_id varchar (100),
	seller_id varchar (100),
	shipping_limit_date date,
	price float,
	freight_value float
	);
	
create table olist.product_category_name_translation (
	product_category_name varchar(100),
	product_category_name_english varchar(100)
	)
