/*
this code creats a tables:
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