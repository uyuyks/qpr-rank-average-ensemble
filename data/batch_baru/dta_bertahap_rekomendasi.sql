-- ===== query001_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_returns_6_1333579789__K1_K9_K12_K8_K4] ON [dbo].[store_returns]
(
	[sr_returned_date_sk] ASC,
	[sr_reason_sk] ASC,
	[sr_return_amt] ASC,
	[sr_store_sk] ASC,
	[sr_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_8_9] ON [dbo].[store_returns]([sr_store_sk], [sr_reason_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_8_4_9] ON [dbo].[store_returns]([sr_store_sk], [sr_customer_sk], [sr_reason_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_4_9_12] ON [dbo].[store_returns]([sr_customer_sk], [sr_reason_sk], [sr_return_amt])
go

CREATE STATISTICS [_dta_stat_1333579789_12_8_1] ON [dbo].[store_returns]([sr_return_amt], [sr_store_sk], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_9_12_8_4] ON [dbo].[store_returns]([sr_reason_sk], [sr_return_amt], [sr_store_sk], [sr_customer_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_8_1_4_12] ON [dbo].[store_returns]([sr_store_sk], [sr_returned_date_sk], [sr_customer_sk], [sr_return_amt])
go

CREATE STATISTICS [_dta_stat_1333579789_9_12_8_1_4] ON [dbo].[store_returns]([sr_reason_sk], [sr_return_amt], [sr_store_sk], [sr_returned_date_sk], [sr_customer_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_949578421_2_4] ON [dbo].[customer_demographics]([cd_gender], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_4_2] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status], [cd_gender])
go

CREATE STATISTICS [_dta_stat_949578421_1_4_3] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_3_4_2_1] ON [dbo].[customer_demographics]([cd_marital_status], [cd_education_status], [cd_gender], [cd_demo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_14] ON [dbo].[customer]([c_customer_sk], [c_birth_year])
go

CREATE STATISTICS [_dta_stat_1269579561_14_13] ON [dbo].[customer]([c_birth_year], [c_birth_month])
go

CREATE STATISTICS [_dta_stat_1269579561_13_1_14] ON [dbo].[customer]([c_birth_month], [c_customer_sk], [c_birth_year])
go

CREATE STATISTICS [_dta_stat_1269579561_1_3_13] ON [dbo].[customer]([c_customer_sk], [c_current_cdemo_sk], [c_birth_month])
go

CREATE STATISTICS [_dta_stat_1269579561_2_14_13_1] ON [dbo].[customer]([c_customer_id], [c_birth_year], [c_birth_month], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_3_14_13_1_2] ON [dbo].[customer]([c_current_cdemo_sk], [c_birth_year], [c_birth_month], [c_customer_sk], [c_customer_id])
go

-- ===== query001_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_returns_6_1333579789__K8_K1_K3_K10_K4_K9_K12] ON [dbo].[store_returns]
(
	[sr_store_sk] ASC,
	[sr_returned_date_sk] ASC,
	[sr_item_sk] ASC,
	[sr_ticket_number] ASC,
	[sr_customer_sk] ASC,
	[sr_reason_sk] ASC,
	[sr_return_amt] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_3_8] ON [dbo].[store_returns]([sr_item_sk], [sr_store_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_10_8_1_9] ON [dbo].[store_returns]([sr_ticket_number], [sr_store_sk], [sr_returned_date_sk], [sr_reason_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_4_12_9_10] ON [dbo].[store_returns]([sr_customer_sk], [sr_return_amt], [sr_reason_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1333579789_8_12_9_10] ON [dbo].[store_returns]([sr_store_sk], [sr_return_amt], [sr_reason_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1333579789_1_12_9_10] ON [dbo].[store_returns]([sr_returned_date_sk], [sr_return_amt], [sr_reason_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1333579789_9_12_1_3] ON [dbo].[store_returns]([sr_reason_sk], [sr_return_amt], [sr_returned_date_sk], [sr_item_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_12_9_10_3_1] ON [dbo].[store_returns]([sr_return_amt], [sr_reason_sk], [sr_ticket_number], [sr_item_sk], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_9_8_1_3_10] ON [dbo].[store_returns]([sr_reason_sk], [sr_store_sk], [sr_returned_date_sk], [sr_item_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1333579789_12_10_3_8_1] ON [dbo].[store_returns]([sr_return_amt], [sr_ticket_number], [sr_item_sk], [sr_store_sk], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_12_9_10_3_8] ON [dbo].[store_returns]([sr_return_amt], [sr_reason_sk], [sr_ticket_number], [sr_item_sk], [sr_store_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_4_8_9_12_10] ON [dbo].[store_returns]([sr_customer_sk], [sr_store_sk], [sr_reason_sk], [sr_return_amt], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1333579789_1_3_10_4_9] ON [dbo].[store_returns]([sr_returned_date_sk], [sr_item_sk], [sr_ticket_number], [sr_customer_sk], [sr_reason_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_12_9_10_3_4_8] ON [dbo].[store_returns]([sr_return_amt], [sr_reason_sk], [sr_ticket_number], [sr_item_sk], [sr_customer_sk], [sr_store_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_12_3_10_1_9_4] ON [dbo].[store_returns]([sr_return_amt], [sr_item_sk], [sr_ticket_number], [sr_returned_date_sk], [sr_reason_sk], [sr_customer_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_9_12_8_1_3_10_4] ON [dbo].[store_returns]([sr_reason_sk], [sr_return_amt], [sr_store_sk], [sr_returned_date_sk], [sr_item_sk], [sr_ticket_number], [sr_customer_sk])
go

CREATE STATISTICS [_dta_stat_949578421_2_1] ON [dbo].[customer_demographics]([cd_gender], [cd_demo_sk])
go

-- ===== query001_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query001_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_returns_6_1333579789__K8_K1_K4_K12_K9_19] ON [dbo].[store_returns]
(
	[sr_store_sk] ASC,
	[sr_returned_date_sk] ASC,
	[sr_customer_sk] ASC,
	[sr_return_amt] ASC,
	[sr_reason_sk] ASC
)
INCLUDE ( 	[sr_store_credit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_8_9] ON [dbo].[store_returns]([sr_store_sk], [sr_reason_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_12_8_1] ON [dbo].[store_returns]([sr_return_amt], [sr_store_sk], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_4_9_8] ON [dbo].[store_returns]([sr_customer_sk], [sr_reason_sk], [sr_store_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_9_12_8] ON [dbo].[store_returns]([sr_reason_sk], [sr_return_amt], [sr_store_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_1_9_12_4] ON [dbo].[store_returns]([sr_returned_date_sk], [sr_reason_sk], [sr_return_amt], [sr_customer_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_12_9_8_1] ON [dbo].[store_returns]([sr_return_amt], [sr_reason_sk], [sr_store_sk], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_4_9_12_8_1] ON [dbo].[store_returns]([sr_customer_sk], [sr_reason_sk], [sr_return_amt], [sr_store_sk], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_949578421_4_3] ON [dbo].[customer_demographics]([cd_education_status], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_4_2] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status], [cd_gender])
go

CREATE STATISTICS [_dta_stat_949578421_1_4_3] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_4_2_3_1] ON [dbo].[customer_demographics]([cd_education_status], [cd_gender], [cd_marital_status], [cd_demo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_3_13] ON [dbo].[customer]([c_current_cdemo_sk], [c_birth_month])
go

CREATE STATISTICS [_dta_stat_1269579561_1_13] ON [dbo].[customer]([c_customer_sk], [c_birth_month])
go

CREATE STATISTICS [_dta_stat_1269579561_14_1] ON [dbo].[customer]([c_birth_year], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_13_14_3] ON [dbo].[customer]([c_birth_month], [c_birth_year], [c_current_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_3_13] ON [dbo].[customer]([c_customer_sk], [c_current_cdemo_sk], [c_birth_month])
go

CREATE STATISTICS [_dta_stat_1269579561_2_13_14_1] ON [dbo].[customer]([c_customer_id], [c_birth_month], [c_birth_year], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_13_14_1_3_2] ON [dbo].[customer]([c_birth_month], [c_birth_year], [c_customer_sk], [c_current_cdemo_sk], [c_customer_id])
go

-- ===== query001_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_returns_6_1333579789__K1_K9_K12_K8_K3_K10_K4_19] ON [dbo].[store_returns]
(
	[sr_returned_date_sk] ASC,
	[sr_reason_sk] ASC,
	[sr_return_amt] ASC,
	[sr_store_sk] ASC,
	[sr_item_sk] ASC,
	[sr_ticket_number] ASC,
	[sr_customer_sk] ASC
)
INCLUDE ( 	[sr_store_credit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_1_9_3] ON [dbo].[store_returns]([sr_returned_date_sk], [sr_reason_sk], [sr_item_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_3_1_8_12] ON [dbo].[store_returns]([sr_item_sk], [sr_returned_date_sk], [sr_store_sk], [sr_return_amt])
go

CREATE STATISTICS [_dta_stat_1333579789_9_3_8_10] ON [dbo].[store_returns]([sr_reason_sk], [sr_item_sk], [sr_store_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1333579789_12_3_10_1_8] ON [dbo].[store_returns]([sr_return_amt], [sr_item_sk], [sr_ticket_number], [sr_returned_date_sk], [sr_store_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_12_9_1_8_3] ON [dbo].[store_returns]([sr_return_amt], [sr_reason_sk], [sr_returned_date_sk], [sr_store_sk], [sr_item_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_9_1_8_3_10] ON [dbo].[store_returns]([sr_reason_sk], [sr_returned_date_sk], [sr_store_sk], [sr_item_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1333579789_1_8_4_12_9_3] ON [dbo].[store_returns]([sr_returned_date_sk], [sr_store_sk], [sr_customer_sk], [sr_return_amt], [sr_reason_sk], [sr_item_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_1_8_3_10_4_12] ON [dbo].[store_returns]([sr_returned_date_sk], [sr_store_sk], [sr_item_sk], [sr_ticket_number], [sr_customer_sk], [sr_return_amt])
go

CREATE STATISTICS [_dta_stat_1333579789_4_9_3_8_10_1] ON [dbo].[store_returns]([sr_customer_sk], [sr_reason_sk], [sr_item_sk], [sr_store_sk], [sr_ticket_number], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_10_1_8_12_9_3_4] ON [dbo].[store_returns]([sr_ticket_number], [sr_returned_date_sk], [sr_store_sk], [sr_return_amt], [sr_reason_sk], [sr_item_sk], [sr_customer_sk])
go

CREATE STATISTICS [_dta_stat_949578421_3_1] ON [dbo].[customer_demographics]([cd_marital_status], [cd_demo_sk])
go

-- ===== query001_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_12_10] ON [dbo].[store_returns]([sr_return_amt], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1333579789_4_9_10] ON [dbo].[store_returns]([sr_customer_sk], [sr_reason_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1333579789_9_12_1_3] ON [dbo].[store_returns]([sr_reason_sk], [sr_return_amt], [sr_returned_date_sk], [sr_item_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_4_8_9_10] ON [dbo].[store_returns]([sr_customer_sk], [sr_store_sk], [sr_reason_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1333579789_9_1_3_10_4] ON [dbo].[store_returns]([sr_reason_sk], [sr_returned_date_sk], [sr_item_sk], [sr_ticket_number], [sr_customer_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_4_8_9_12_3] ON [dbo].[store_returns]([sr_customer_sk], [sr_store_sk], [sr_reason_sk], [sr_return_amt], [sr_item_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_10_1_9_3_12_4] ON [dbo].[store_returns]([sr_ticket_number], [sr_returned_date_sk], [sr_reason_sk], [sr_item_sk], [sr_return_amt], [sr_customer_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_4_8_9_3_10_12] ON [dbo].[store_returns]([sr_customer_sk], [sr_store_sk], [sr_reason_sk], [sr_item_sk], [sr_ticket_number], [sr_return_amt])
go

CREATE STATISTICS [_dta_stat_949578421_2_1] ON [dbo].[customer_demographics]([cd_gender], [cd_demo_sk])
go

-- ===== query010_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K5_K1_K4_K22] ON [dbo].[web_sales]
(
	[ws_bill_customer_sk] ASC,
	[ws_sold_date_sk] ASC,
	[ws_item_sk] ASC,
	[ws_sales_price] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_5_22] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_sales_price])
go

CREATE STATISTICS [_dta_stat_1589580701_1_22_5] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_sales_price], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_22_4_5_1] ON [dbo].[web_sales]([ws_sales_price], [ws_item_sk], [ws_bill_customer_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13] ON [dbo].[item]([i_manager_id], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21_13] ON [dbo].[item]([i_item_sk], [i_manager_id], [i_category])
go

CREATE STATISTICS [_dta_stat_1653580929_4_14] ON [dbo].[store_sales]([ss_customer_sk], [ss_sales_price])
go

CREATE STATISTICS [_dta_stat_1653580929_3_14_4] ON [dbo].[store_sales]([ss_item_sk], [ss_sales_price], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_1_3] ON [dbo].[store_sales]([ss_customer_sk], [ss_sold_date_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_14_4_3] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_sales_price], [ss_customer_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_9] ON [dbo].[date_dim]([d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_9_1_7] ON [dbo].[date_dim]([d_moy], [d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_1621580815_1_16] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_22_1] ON [dbo].[catalog_sales]([cs_sales_price], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_22_16_1] ON [dbo].[catalog_sales]([cs_sales_price], [cs_item_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_917578307_8_1] ON [dbo].[customer_address]([ca_county], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_917578307_9_1_8] ON [dbo].[customer_address]([ca_state], [ca_address_sk], [ca_county])
go

CREATE STATISTICS [_dta_stat_949578421_3_2] ON [dbo].[customer_demographics]([cd_marital_status], [cd_gender])
go

CREATE STATISTICS [_dta_stat_949578421_1_3_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_marital_status], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_4_3_2] ON [dbo].[customer_demographics]([cd_education_status], [cd_marital_status], [cd_gender])
go

CREATE STATISTICS [_dta_stat_949578421_2_1_3_4_5_6_7_8] ON [dbo].[customer_demographics]([cd_gender], [cd_demo_sk], [cd_marital_status], [cd_education_status], [cd_purchase_estimate], [cd_credit_rating], [cd_dep_count], [cd_dep_employed_count])
go

CREATE STATISTICS [_dta_stat_949578421_4_5_6_7_8_9_3_2_1] ON [dbo].[customer_demographics]([cd_education_status], [cd_purchase_estimate], [cd_credit_rating], [cd_dep_count], [cd_dep_employed_count], [cd_dep_college_count], [cd_marital_status], [cd_gender], [cd_demo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_13_5] ON [dbo].[customer]([c_birth_month], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5_3] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk], [c_current_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_13_1_5] ON [dbo].[customer]([c_birth_month], [c_customer_sk], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_3_13_1_5] ON [dbo].[customer]([c_current_cdemo_sk], [c_birth_month], [c_customer_sk], [c_current_addr_sk])
go

-- ===== query010_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K8_K16_K1_K22] ON [dbo].[catalog_sales]
(
	[cs_ship_customer_sk] ASC,
	[cs_item_sk] ASC,
	[cs_sold_date_sk] ASC,
	[cs_sales_price] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_8_22_16] ON [dbo].[catalog_sales]([cs_ship_customer_sk], [cs_sales_price], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_22_1_8] ON [dbo].[catalog_sales]([cs_sales_price], [cs_sold_date_sk], [cs_ship_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_18_5] ON [dbo].[web_sales]([ws_order_number], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_5_4_18] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_item_sk], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_1589580701_1_4_18_5] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_item_sk], [ws_order_number], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_22_4_18_5_1] ON [dbo].[web_sales]([ws_sales_price], [ws_item_sk], [ws_order_number], [ws_bill_customer_sk], [ws_sold_date_sk])
go

-- ===== query010_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K13_K1_K5_K3] ON [dbo].[customer]
(
	[c_birth_month] ASC,
	[c_customer_sk] ASC,
	[c_current_addr_sk] ASC,
	[c_current_cdemo_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_22_16_18] ON [dbo].[catalog_sales]([cs_sales_price], [cs_item_sk], [cs_order_number])
go

CREATE STATISTICS [_dta_stat_1621580815_16_18_1_8] ON [dbo].[catalog_sales]([cs_item_sk], [cs_order_number], [cs_sold_date_sk], [cs_ship_customer_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_18_8_16_22_1] ON [dbo].[catalog_sales]([cs_order_number], [cs_ship_customer_sk], [cs_item_sk], [cs_sales_price], [cs_sold_date_sk])
go

-- ===== query010_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K21_K1] ON [dbo].[item]
(
	[i_category] ASC,
	[i_manager_id] ASC,
	[i_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query010_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K8_K1] ON [dbo].[customer_address]
(
	[ca_county] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_22_18] ON [dbo].[web_sales]([ws_sales_price], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_1589580701_1_18] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_981578535_19_1_7_9] ON [dbo].[date_dim]([d_following_holiday], [d_date_sk], [d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_1269579561_13_3_5] ON [dbo].[customer]([c_birth_month], [c_current_cdemo_sk], [c_current_addr_sk])
go

-- ===== query010_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K5_K1_K4_K22] ON [dbo].[web_sales]
(
	[ws_bill_customer_sk] ASC,
	[ws_sold_date_sk] ASC,
	[ws_item_sk] ASC,
	[ws_sales_price] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_1_22] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_sales_price])
go

CREATE STATISTICS [_dta_stat_1589580701_22_4_5] ON [dbo].[web_sales]([ws_sales_price], [ws_item_sk], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_22_5_1_4] ON [dbo].[web_sales]([ws_sales_price], [ws_bill_customer_sk], [ws_sold_date_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21] ON [dbo].[item]([i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13_1] ON [dbo].[item]([i_manager_id], [i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_14] ON [dbo].[store_sales]([ss_customer_sk], [ss_sales_price])
go

CREATE STATISTICS [_dta_stat_1653580929_4_1_3] ON [dbo].[store_sales]([ss_customer_sk], [ss_sold_date_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_14_4] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_sales_price], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_14_3_4_1] ON [dbo].[store_sales]([ss_sales_price], [ss_item_sk], [ss_customer_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_9] ON [dbo].[date_dim]([d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_9_1_7] ON [dbo].[date_dim]([d_moy], [d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_1621580815_1_16] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_1_22] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_sales_price])
go

CREATE STATISTICS [_dta_stat_1621580815_22_16_1] ON [dbo].[catalog_sales]([cs_sales_price], [cs_item_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_917578307_8_1] ON [dbo].[customer_address]([ca_county], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_917578307_9_1_8] ON [dbo].[customer_address]([ca_state], [ca_address_sk], [ca_county])
go

CREATE STATISTICS [_dta_stat_949578421_1_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_2_1_3] ON [dbo].[customer_demographics]([cd_gender], [cd_demo_sk], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_3_1_4] ON [dbo].[customer_demographics]([cd_marital_status], [cd_demo_sk], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_5_6_7_8_9_4_3_2] ON [dbo].[customer_demographics]([cd_purchase_estimate], [cd_credit_rating], [cd_dep_count], [cd_dep_employed_count], [cd_dep_college_count], [cd_education_status], [cd_marital_status], [cd_gender])
go

CREATE STATISTICS [_dta_stat_949578421_4_3_2_1_5_6_7_8_9] ON [dbo].[customer_demographics]([cd_education_status], [cd_marital_status], [cd_gender], [cd_demo_sk], [cd_purchase_estimate], [cd_credit_rating], [cd_dep_count], [cd_dep_employed_count], [cd_dep_college_count])
go

CREATE STATISTICS [_dta_stat_1269579561_13_5] ON [dbo].[customer]([c_birth_month], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_3_13_1] ON [dbo].[customer]([c_current_cdemo_sk], [c_birth_month], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_13_1_5] ON [dbo].[customer]([c_birth_month], [c_customer_sk], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5_3_13] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk], [c_current_cdemo_sk], [c_birth_month])
go

-- ===== query010_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K8_K16_K1_K22] ON [dbo].[catalog_sales]
(
	[cs_ship_customer_sk] ASC,
	[cs_item_sk] ASC,
	[cs_sold_date_sk] ASC,
	[cs_sales_price] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_1_22_8] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_sales_price], [cs_ship_customer_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_22_8_16_1] ON [dbo].[catalog_sales]([cs_sales_price], [cs_ship_customer_sk], [cs_item_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_22_18] ON [dbo].[web_sales]([ws_sales_price], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_1589580701_5_18] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_1589580701_5_4] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_18] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_1589580701_4_18_5] ON [dbo].[web_sales]([ws_item_sk], [ws_order_number], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_18_4_1_5] ON [dbo].[web_sales]([ws_order_number], [ws_item_sk], [ws_sold_date_sk], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_22_18_5_1] ON [dbo].[web_sales]([ws_item_sk], [ws_sales_price], [ws_order_number], [ws_bill_customer_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_949578421_2_3] ON [dbo].[customer_demographics]([cd_gender], [cd_marital_status])
go

-- ===== query010_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K13_K1_K5_K3] ON [dbo].[customer]
(
	[c_birth_month] ASC,
	[c_customer_sk] ASC,
	[c_current_addr_sk] ASC,
	[c_current_cdemo_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_8_18] ON [dbo].[catalog_sales]([cs_ship_customer_sk], [cs_order_number])
go

CREATE STATISTICS [_dta_stat_1621580815_1_18] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_order_number])
go

CREATE STATISTICS [_dta_stat_1621580815_18_16_1] ON [dbo].[catalog_sales]([cs_order_number], [cs_item_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_22_18_16] ON [dbo].[catalog_sales]([cs_sales_price], [cs_order_number], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_8_16_18_1] ON [dbo].[catalog_sales]([cs_ship_customer_sk], [cs_item_sk], [cs_order_number], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_18_8_22_1] ON [dbo].[catalog_sales]([cs_item_sk], [cs_order_number], [cs_ship_customer_sk], [cs_sales_price], [cs_sold_date_sk])
go

-- ===== query010_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K21_K1] ON [dbo].[item]
(
	[i_category] ASC,
	[i_manager_id] ASC,
	[i_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query010_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K8_K1] ON [dbo].[customer_address]
(
	[ca_county] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_981578535_19_1_7_9] ON [dbo].[date_dim]([d_following_holiday], [d_date_sk], [d_year], [d_moy])
go

-- ===== query013_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K23_K14_K6_K7_K8_K5_11_16_17] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_net_profit] ASC,
	[ss_sales_price] ASC,
	[ss_hdemo_sk] ASC,
	[ss_addr_sk] ASC,
	[ss_store_sk] ASC,
	[ss_cdemo_sk] ASC
)
INCLUDE ( 	[ss_quantity],
	[ss_ext_sales_price],
	[ss_ext_wholesale_cost]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_6_23] ON [dbo].[store_sales]([ss_hdemo_sk], [ss_net_profit])
go

CREATE STATISTICS [_dta_stat_1653580929_23_14_6] ON [dbo].[store_sales]([ss_net_profit], [ss_sales_price], [ss_hdemo_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_14_6_7_1_8] ON [dbo].[store_sales]([ss_sales_price], [ss_hdemo_sk], [ss_addr_sk], [ss_sold_date_sk], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_8_23_14_6_7] ON [dbo].[store_sales]([ss_store_sk], [ss_net_profit], [ss_sales_price], [ss_hdemo_sk], [ss_addr_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_5_23_14_6_7_1] ON [dbo].[store_sales]([ss_cdemo_sk], [ss_net_profit], [ss_sales_price], [ss_hdemo_sk], [ss_addr_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_6_7_1_8_5_23] ON [dbo].[store_sales]([ss_hdemo_sk], [ss_addr_sk], [ss_sold_date_sk], [ss_store_sk], [ss_cdemo_sk], [ss_net_profit])
go

CREATE STATISTICS [_dta_stat_1653580929_7_23_14_6_1_8_5] ON [dbo].[store_sales]([ss_addr_sk], [ss_net_profit], [ss_sales_price], [ss_hdemo_sk], [ss_sold_date_sk], [ss_store_sk], [ss_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1365579903_1_4] ON [dbo].[household_demographics]([hd_demo_sk], [hd_dep_count])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_917578307_1_9] ON [dbo].[customer_address]([ca_address_sk], [ca_state])
go

CREATE STATISTICS [_dta_stat_917578307_11_1] ON [dbo].[customer_address]([ca_country], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_917578307_11_9_1] ON [dbo].[customer_address]([ca_country], [ca_state], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_949578421_3_1] ON [dbo].[customer_demographics]([cd_marital_status], [cd_demo_sk])
go

CREATE STATISTICS [_dta_stat_949578421_1_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_3_4_1] ON [dbo].[customer_demographics]([cd_marital_status], [cd_education_status], [cd_demo_sk])
go

-- ===== query013_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K11_K9_K1] ON [dbo].[customer_address]
(
	[ca_country] ASC,
	[ca_state] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_1_14] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_sales_price])
go

CREATE STATISTICS [_dta_stat_1653580929_5_14] ON [dbo].[store_sales]([ss_cdemo_sk], [ss_sales_price])
go

CREATE STATISTICS [_dta_stat_1653580929_8_14] ON [dbo].[store_sales]([ss_store_sk], [ss_sales_price])
go

CREATE STATISTICS [_dta_stat_1653580929_14_23_8_7] ON [dbo].[store_sales]([ss_sales_price], [ss_net_profit], [ss_store_sk], [ss_addr_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_23_7_8_6_1] ON [dbo].[store_sales]([ss_net_profit], [ss_addr_sk], [ss_store_sk], [ss_hdemo_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_14_23_1_7_8] ON [dbo].[store_sales]([ss_sales_price], [ss_net_profit], [ss_sold_date_sk], [ss_addr_sk], [ss_store_sk])
go

-- ===== query013_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_demographics_6_949578421__K4_K3_1] ON [dbo].[customer_demographics]
(
	[cd_education_status] ASC,
	[cd_marital_status] ASC
)
INCLUDE ( 	[cd_demo_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query013_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_7_14] ON [dbo].[store_sales]([ss_addr_sk], [ss_sales_price])
go

CREATE STATISTICS [_dta_stat_1653580929_5_14_23_8_6_7] ON [dbo].[store_sales]([ss_cdemo_sk], [ss_sales_price], [ss_net_profit], [ss_store_sk], [ss_hdemo_sk], [ss_addr_sk])
go

-- ===== query013_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K23_K14_K7_K6_K8_K5_11_16_17] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_net_profit] ASC,
	[ss_sales_price] ASC,
	[ss_addr_sk] ASC,
	[ss_hdemo_sk] ASC,
	[ss_store_sk] ASC,
	[ss_cdemo_sk] ASC
)
INCLUDE ( 	[ss_quantity],
	[ss_ext_sales_price],
	[ss_ext_wholesale_cost]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_5_23] ON [dbo].[store_sales]([ss_cdemo_sk], [ss_net_profit])
go

CREATE STATISTICS [_dta_stat_1653580929_6_23] ON [dbo].[store_sales]([ss_hdemo_sk], [ss_net_profit])
go

CREATE STATISTICS [_dta_stat_1653580929_8_23] ON [dbo].[store_sales]([ss_store_sk], [ss_net_profit])
go

CREATE STATISTICS [_dta_stat_1653580929_23_14_6] ON [dbo].[store_sales]([ss_net_profit], [ss_sales_price], [ss_hdemo_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_23_14_1_7] ON [dbo].[store_sales]([ss_net_profit], [ss_sales_price], [ss_sold_date_sk], [ss_addr_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_7_23_14_6_1] ON [dbo].[store_sales]([ss_addr_sk], [ss_net_profit], [ss_sales_price], [ss_hdemo_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_14_7_6_1_8] ON [dbo].[store_sales]([ss_sales_price], [ss_addr_sk], [ss_hdemo_sk], [ss_sold_date_sk], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_23_14_5_7_6_1] ON [dbo].[store_sales]([ss_net_profit], [ss_sales_price], [ss_cdemo_sk], [ss_addr_sk], [ss_hdemo_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_7_6_1_8_5_23] ON [dbo].[store_sales]([ss_addr_sk], [ss_hdemo_sk], [ss_sold_date_sk], [ss_store_sk], [ss_cdemo_sk], [ss_net_profit])
go

CREATE STATISTICS [_dta_stat_1653580929_23_14_8_7_6_1_5] ON [dbo].[store_sales]([ss_net_profit], [ss_sales_price], [ss_store_sk], [ss_addr_sk], [ss_hdemo_sk], [ss_sold_date_sk], [ss_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1365579903_4_1] ON [dbo].[household_demographics]([hd_dep_count], [hd_demo_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_917578307_11_1] ON [dbo].[customer_address]([ca_country], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_917578307_11_9] ON [dbo].[customer_address]([ca_country], [ca_state])
go

CREATE STATISTICS [_dta_stat_917578307_1_9_11] ON [dbo].[customer_address]([ca_address_sk], [ca_state], [ca_country])
go

CREATE STATISTICS [_dta_stat_949578421_3_4] ON [dbo].[customer_demographics]([cd_marital_status], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_3] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_4_1_3] ON [dbo].[customer_demographics]([cd_education_status], [cd_demo_sk], [cd_marital_status])
go

-- ===== query013_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K11_K9_K1] ON [dbo].[customer_address]
(
	[ca_country] ASC,
	[ca_state] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_5_14] ON [dbo].[store_sales]([ss_cdemo_sk], [ss_sales_price])
go

CREATE STATISTICS [_dta_stat_1653580929_1_14] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_sales_price])
go

CREATE STATISTICS [_dta_stat_1653580929_23_7_6_8] ON [dbo].[store_sales]([ss_net_profit], [ss_addr_sk], [ss_hdemo_sk], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_14_23_5_7_6_8] ON [dbo].[store_sales]([ss_sales_price], [ss_net_profit], [ss_cdemo_sk], [ss_addr_sk], [ss_hdemo_sk], [ss_store_sk])
go

-- ===== query014_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K12_K3_11_13] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_item_sk] ASC
)
INCLUDE ( 	[ss_quantity],
	[ss_list_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_1_3] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_12_1] ON [dbo].[store_sales]([ss_item_sk], [ss_wholesale_cost], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_8_10] ON [dbo].[item]([i_brand_id], [i_class_id])
go

CREATE STATISTICS [_dta_stat_1173579219_13_8_10_12] ON [dbo].[item]([i_category], [i_brand_id], [i_class_id], [i_category_id])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13_8_10] ON [dbo].[item]([i_manager_id], [i_category], [i_brand_id], [i_class_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_8_10_12_21] ON [dbo].[item]([i_item_sk], [i_brand_id], [i_class_id], [i_category_id], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21_13_8_10] ON [dbo].[item]([i_item_sk], [i_manager_id], [i_category], [i_brand_id], [i_class_id])
go

CREATE STATISTICS [_dta_stat_1173579219_12_8_10_21_13_1] ON [dbo].[item]([i_category_id], [i_brand_id], [i_class_id], [i_manager_id], [i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_20] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1589580701_4_20] ON [dbo].[web_sales]([ws_item_sk], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1589580701_1_4_20] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_item_sk], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_981578535_5_1] ON [dbo].[date_dim]([d_week_seq], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_9_1_7] ON [dbo].[date_dim]([d_moy], [d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_7_5_9] ON [dbo].[date_dim]([d_year], [d_week_seq], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_5_10_7_9] ON [dbo].[date_dim]([d_week_seq], [d_dom], [d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_10_1_7_5] ON [dbo].[date_dim]([d_dom], [d_date_sk], [d_year], [d_week_seq])
go

CREATE STATISTICS [_dta_stat_981578535_1_7_5_9_10] ON [dbo].[date_dim]([d_date_sk], [d_year], [d_week_seq], [d_moy], [d_dom])
go

CREATE STATISTICS [_dta_stat_1621580815_1_16] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_16] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1_16] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk], [cs_item_sk])
go

-- ===== query014_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K20_K1_19_21] ON [dbo].[catalog_sales]
(
	[cs_wholesale_cost] ASC,
	[cs_sold_date_sk] ASC
)
INCLUDE ( 	[cs_quantity],
	[cs_list_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_1_12_8] ON [dbo].[item]([i_item_sk], [i_category_id], [i_brand_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21_13_12_8] ON [dbo].[item]([i_item_sk], [i_manager_id], [i_category], [i_category_id], [i_brand_id])
go

CREATE STATISTICS [_dta_stat_1173579219_13_1_8_10_12] ON [dbo].[item]([i_category], [i_item_sk], [i_brand_id], [i_class_id], [i_category_id])
go

-- ===== query014_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K4_K20_K1_19_21] ON [dbo].[web_sales]
(
	[ws_item_sk] ASC,
	[ws_wholesale_cost] ASC,
	[ws_sold_date_sk] ASC
)
INCLUDE ( 	[ws_quantity],
	[ws_list_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_1_10] ON [dbo].[item]([i_item_sk], [i_class_id])
go

-- ===== query014_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K21_K13_K1_K8_K10_K12] ON [dbo].[item]
(
	[i_manager_id] ASC,
	[i_category] ASC,
	[i_item_sk] ASC,
	[i_brand_id] ASC,
	[i_class_id] ASC,
	[i_category_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_21_13_8_12] ON [dbo].[item]([i_manager_id], [i_category], [i_brand_id], [i_category_id])
go

CREATE STATISTICS [_dta_stat_1589580701_20_19] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_quantity])
go

CREATE STATISTICS [_dta_stat_1589580701_19_21_20_4] ON [dbo].[web_sales]([ws_quantity], [ws_list_price], [ws_wholesale_cost], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_1_19_21] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_sold_date_sk], [ws_quantity], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1653580929_11_13_1] ON [dbo].[store_sales]([ss_quantity], [ss_list_price], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_1_11_13] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_sold_date_sk], [ss_quantity], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1653580929_11_13_3_1] ON [dbo].[store_sales]([ss_quantity], [ss_list_price], [ss_item_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_19_21] ON [dbo].[catalog_sales]([cs_quantity], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_20_19_21_16] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_quantity], [cs_list_price], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_1_16_20_19] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_item_sk], [cs_wholesale_cost], [cs_quantity])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1_19_21_16] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk], [cs_quantity], [cs_list_price], [cs_item_sk])
go

-- ===== query014_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K20_K1_19_21] ON [dbo].[web_sales]
(
	[ws_wholesale_cost] ASC,
	[ws_sold_date_sk] ASC
)
INCLUDE ( 	[ws_quantity],
	[ws_list_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_21_1_8_10] ON [dbo].[item]([i_manager_id], [i_item_sk], [i_brand_id], [i_class_id])
go

-- ===== query014_0 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query014_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K12_K3_11_13] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_item_sk] ASC
)
INCLUDE ( 	[ss_quantity],
	[ss_list_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_3_12] ON [dbo].[store_sales]([ss_item_sk], [ss_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1653580929_1_3] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_1_3] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_sold_date_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_12_8] ON [dbo].[item]([i_category_id], [i_brand_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_8_12] ON [dbo].[item]([i_item_sk], [i_brand_id], [i_category_id])
go

CREATE STATISTICS [_dta_stat_1173579219_13_8_10_12] ON [dbo].[item]([i_category], [i_brand_id], [i_class_id], [i_category_id])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13_8_10] ON [dbo].[item]([i_manager_id], [i_category], [i_brand_id], [i_class_id])
go

CREATE STATISTICS [_dta_stat_1173579219_8_10_12_21] ON [dbo].[item]([i_brand_id], [i_class_id], [i_category_id], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21_13_8_12] ON [dbo].[item]([i_item_sk], [i_manager_id], [i_category], [i_brand_id], [i_category_id])
go

CREATE STATISTICS [_dta_stat_1173579219_8_10_12_1_21] ON [dbo].[item]([i_brand_id], [i_class_id], [i_category_id], [i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13_8_12_10_1] ON [dbo].[item]([i_manager_id], [i_category], [i_brand_id], [i_category_id], [i_class_id], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_4] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_1] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_20_1] ON [dbo].[web_sales]([ws_item_sk], [ws_wholesale_cost], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_5] ON [dbo].[date_dim]([d_date_sk], [d_week_seq])
go

CREATE STATISTICS [_dta_stat_981578535_7_5_9] ON [dbo].[date_dim]([d_year], [d_week_seq], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_9_1_7] ON [dbo].[date_dim]([d_moy], [d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_5_10_7_9] ON [dbo].[date_dim]([d_week_seq], [d_dom], [d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_10_1_7_5] ON [dbo].[date_dim]([d_dom], [d_date_sk], [d_year], [d_week_seq])
go

CREATE STATISTICS [_dta_stat_981578535_1_7_5_9_10] ON [dbo].[date_dim]([d_date_sk], [d_year], [d_week_seq], [d_moy], [d_dom])
go

CREATE STATISTICS [_dta_stat_1621580815_1_16] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_16] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1_16] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk], [cs_item_sk])
go

-- ===== query014_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K20_K1_19_21] ON [dbo].[catalog_sales]
(
	[cs_wholesale_cost] ASC,
	[cs_sold_date_sk] ASC
)
INCLUDE ( 	[cs_quantity],
	[cs_list_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_10_1_8] ON [dbo].[item]([i_class_id], [i_item_sk], [i_brand_id])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13_1_8_10] ON [dbo].[item]([i_manager_id], [i_category], [i_item_sk], [i_brand_id], [i_class_id])
go

CREATE STATISTICS [_dta_stat_1173579219_13_1_8_10_12] ON [dbo].[item]([i_category], [i_item_sk], [i_brand_id], [i_class_id], [i_category_id])
go

-- ===== query014_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K4_K20_K1_19_21] ON [dbo].[web_sales]
(
	[ws_item_sk] ASC,
	[ws_wholesale_cost] ASC,
	[ws_sold_date_sk] ASC
)
INCLUDE ( 	[ws_quantity],
	[ws_list_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_12_10] ON [dbo].[item]([i_category_id], [i_class_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_12_10] ON [dbo].[item]([i_item_sk], [i_category_id], [i_class_id])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13_12_10] ON [dbo].[item]([i_manager_id], [i_category], [i_category_id], [i_class_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21_13_12_10] ON [dbo].[item]([i_item_sk], [i_manager_id], [i_category], [i_category_id], [i_class_id])
go

-- ===== query014_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K21_K13_K1_K8_K10_K12] ON [dbo].[item]
(
	[i_manager_id] ASC,
	[i_category] ASC,
	[i_item_sk] ASC,
	[i_brand_id] ASC,
	[i_class_id] ASC,
	[i_category_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_19_21] ON [dbo].[web_sales]([ws_quantity], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_20_1_19_21] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_sold_date_sk], [ws_quantity], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_20_19_21_4] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_quantity], [ws_list_price], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_1_11] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_sold_date_sk], [ss_quantity])
go

CREATE STATISTICS [_dta_stat_1653580929_11_13_1_12] ON [dbo].[store_sales]([ss_quantity], [ss_list_price], [ss_sold_date_sk], [ss_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1653580929_11_13_3_1] ON [dbo].[store_sales]([ss_quantity], [ss_list_price], [ss_item_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_19] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_quantity])
go

CREATE STATISTICS [_dta_stat_1621580815_19_21_20_16] ON [dbo].[catalog_sales]([cs_quantity], [cs_list_price], [cs_wholesale_cost], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_16_1_19_21] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_item_sk], [cs_sold_date_sk], [cs_quantity], [cs_list_price])
go

-- ===== query014_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K10_K7_K1_K5_K9] ON [dbo].[date_dim]
(
	[d_dom] ASC,
	[d_year] ASC,
	[d_date_sk] ASC,
	[d_week_seq] ASC,
	[d_moy] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_21_1_8_10] ON [dbo].[item]([i_manager_id], [i_item_sk], [i_brand_id], [i_class_id])
go

-- ===== query014_1 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K12_K3] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_981578535_5_10_9] ON [dbo].[date_dim]([d_week_seq], [d_dom], [d_moy])
go

-- ===== query018_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K20_K4_K16_K5_19_21_22_28_34] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_wholesale_cost] ASC,
	[cs_bill_customer_sk] ASC,
	[cs_item_sk] ASC,
	[cs_bill_cdemo_sk] ASC
)
INCLUDE ( 	[cs_quantity],
	[cs_list_price],
	[cs_sales_price],
	[cs_coupon_amt],
	[cs_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_16_20] ON [dbo].[catalog_sales]([cs_item_sk], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1_4] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_5_20_4_16] ON [dbo].[catalog_sales]([cs_bill_cdemo_sk], [cs_wholesale_cost], [cs_bill_customer_sk], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_4_16_1_5] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_item_sk], [cs_sold_date_sk], [cs_bill_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_4_20_16_1_5] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_wholesale_cost], [cs_item_sk], [cs_sold_date_sk], [cs_bill_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_2_13] ON [dbo].[item]([i_item_id], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_1_13_2] ON [dbo].[item]([i_item_sk], [i_category], [i_item_id])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_19_1_7] ON [dbo].[date_dim]([d_following_holiday], [d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_917578307_11_9_8] ON [dbo].[customer_address]([ca_country], [ca_state], [ca_county])
go

CREATE STATISTICS [_dta_stat_917578307_1_9_11_8] ON [dbo].[customer_address]([ca_address_sk], [ca_state], [ca_country], [ca_county])
go

CREATE STATISTICS [_dta_stat_949578421_2_1] ON [dbo].[customer_demographics]([cd_gender], [cd_demo_sk])
go

CREATE STATISTICS [_dta_stat_949578421_1_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_2_4_1] ON [dbo].[customer_demographics]([cd_gender], [cd_education_status], [cd_demo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_13_1] ON [dbo].[customer]([c_birth_month], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_5_13_1] ON [dbo].[customer]([c_current_addr_sk], [c_birth_month], [c_customer_sk])
go

-- ===== query018_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K13_K1_K5_14] ON [dbo].[customer]
(
	[c_birth_month] ASC,
	[c_customer_sk] ASC,
	[c_current_addr_sk] ASC
)
INCLUDE ( 	[c_birth_year]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_5_20_4_1] ON [dbo].[catalog_sales]([cs_bill_cdemo_sk], [cs_wholesale_cost], [cs_bill_customer_sk], [cs_sold_date_sk])
go

-- ===== query018_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K1_K2] ON [dbo].[item]
(
	[i_category] ASC,
	[i_item_sk] ASC,
	[i_item_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query018_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9_K1_K11_K8] ON [dbo].[customer_address]
(
	[ca_state] ASC,
	[ca_address_sk] ASC,
	[ca_country] ASC,
	[ca_county] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query018_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query018_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K20_K16_K4_K5_19_21_22_28_34] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_wholesale_cost] ASC,
	[cs_item_sk] ASC,
	[cs_bill_customer_sk] ASC,
	[cs_bill_cdemo_sk] ASC
)
INCLUDE ( 	[cs_quantity],
	[cs_list_price],
	[cs_sales_price],
	[cs_coupon_amt],
	[cs_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_20_4_1] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_bill_customer_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_1_16_4_5] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_item_sk], [cs_bill_customer_sk], [cs_bill_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_5_20_1_16] ON [dbo].[catalog_sales]([cs_bill_cdemo_sk], [cs_wholesale_cost], [cs_sold_date_sk], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_16_1_4_5] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_item_sk], [cs_sold_date_sk], [cs_bill_customer_sk], [cs_bill_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_2_13] ON [dbo].[item]([i_item_id], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_13_1_2] ON [dbo].[item]([i_category], [i_item_sk], [i_item_id])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_917578307_11_9_8] ON [dbo].[customer_address]([ca_country], [ca_state], [ca_county])
go

CREATE STATISTICS [_dta_stat_917578307_9_1_11_8] ON [dbo].[customer_address]([ca_state], [ca_address_sk], [ca_country], [ca_county])
go

CREATE STATISTICS [_dta_stat_949578421_1_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_4_2] ON [dbo].[customer_demographics]([cd_education_status], [cd_gender])
go

CREATE STATISTICS [_dta_stat_949578421_2_1_4] ON [dbo].[customer_demographics]([cd_gender], [cd_demo_sk], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_13] ON [dbo].[customer]([c_customer_sk], [c_birth_month])
go

CREATE STATISTICS [_dta_stat_1269579561_13_5_1] ON [dbo].[customer]([c_birth_month], [c_current_addr_sk], [c_customer_sk])
go

-- ===== query018_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K13_K1_K5_14] ON [dbo].[customer]
(
	[c_birth_month] ASC,
	[c_customer_sk] ASC,
	[c_current_addr_sk] ASC
)
INCLUDE ( 	[c_birth_year]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_4_20_16] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_wholesale_cost], [cs_item_sk])
go

-- ===== query018_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K1_K2] ON [dbo].[item]
(
	[i_category] ASC,
	[i_item_sk] ASC,
	[i_item_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_5_20_4_16] ON [dbo].[catalog_sales]([cs_bill_cdemo_sk], [cs_wholesale_cost], [cs_bill_customer_sk], [cs_item_sk])
go

-- ===== query018_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query018_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9_K1_K11_K8] ON [dbo].[customer_address]
(
	[ca_state] ASC,
	[ca_address_sk] ASC,
	[ca_country] ASC,
	[ca_county] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query018_1 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K20_K16_K4_K1_K5_19_21_22_28_34] ON [dbo].[catalog_sales]
(
	[cs_wholesale_cost] ASC,
	[cs_item_sk] ASC,
	[cs_bill_customer_sk] ASC,
	[cs_sold_date_sk] ASC,
	[cs_bill_cdemo_sk] ASC
)
INCLUDE ( 	[cs_quantity],
	[cs_list_price],
	[cs_sales_price],
	[cs_coupon_amt],
	[cs_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query019_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K12_K4_K3_K8_16] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_customer_sk] ASC,
	[ss_item_sk] ASC,
	[ss_store_sk] ASC
)
INCLUDE ( 	[ss_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_12_4] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_1_4] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_sold_date_sk], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_3_1_8] ON [dbo].[store_sales]([ss_customer_sk], [ss_item_sk], [ss_sold_date_sk], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_8_12_4_3] ON [dbo].[store_sales]([ss_store_sk], [ss_wholesale_cost], [ss_customer_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_12_4_1_8] ON [dbo].[store_sales]([ss_item_sk], [ss_wholesale_cost], [ss_customer_sk], [ss_sold_date_sk], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_9_8_14_15_13] ON [dbo].[item]([i_brand], [i_brand_id], [i_manufact_id], [i_manufact], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_1_13_9_8_14_15] ON [dbo].[item]([i_item_sk], [i_category], [i_brand], [i_brand_id], [i_manufact_id], [i_manufact])
go

CREATE STATISTICS [_dta_stat_981578535_9_1] ON [dbo].[date_dim]([d_moy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_7_9_1] ON [dbo].[date_dim]([d_year], [d_moy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_19_1_7_9] ON [dbo].[date_dim]([d_following_holiday], [d_date_sk], [d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_917578307_1_9] ON [dbo].[customer_address]([ca_address_sk], [ca_state])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_13_5] ON [dbo].[customer]([c_birth_month], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_13_5] ON [dbo].[customer]([c_customer_sk], [c_birth_month], [c_current_addr_sk])
go

-- ===== query019_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K13_K5] ON [dbo].[customer]
(
	[c_birth_month] ASC,
	[c_current_addr_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_12_8_4_1] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_store_sk], [ss_customer_sk], [ss_sold_date_sk])
go

-- ===== query019_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9_1_10] ON [dbo].[customer_address]
(
	[ca_state] ASC
)
INCLUDE ( 	[ca_address_sk],
	[ca_zip]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query019_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K9_K7_K1] ON [dbo].[date_dim]
(
	[d_moy] ASC,
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query019_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K1_K9_K8_K14_K15] ON [dbo].[item]
(
	[i_category] ASC,
	[i_item_sk] ASC,
	[i_brand] ASC,
	[i_brand_id] ASC,
	[i_manufact_id] ASC,
	[i_manufact] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query019_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K12_K4_K8_K3_16] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_customer_sk] ASC,
	[ss_store_sk] ASC,
	[ss_item_sk] ASC
)
INCLUDE ( 	[ss_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_4_12] ON [dbo].[store_sales]([ss_customer_sk], [ss_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1653580929_12_1_4] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_sold_date_sk], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_8_1_3] ON [dbo].[store_sales]([ss_customer_sk], [ss_store_sk], [ss_sold_date_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_3_4_8] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_item_sk], [ss_customer_sk], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_8_4_1_3] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_store_sk], [ss_customer_sk], [ss_sold_date_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_9_8_14_15_13] ON [dbo].[item]([i_brand], [i_brand_id], [i_manufact_id], [i_manufact], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_1_13_9_8_14_15] ON [dbo].[item]([i_item_sk], [i_category], [i_brand], [i_brand_id], [i_manufact_id], [i_manufact])
go

CREATE STATISTICS [_dta_stat_981578535_7_9] ON [dbo].[date_dim]([d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_9_1_7] ON [dbo].[date_dim]([d_moy], [d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_917578307_9_1] ON [dbo].[customer_address]([ca_state], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_13_1] ON [dbo].[customer]([c_birth_month], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_5_1] ON [dbo].[customer]([c_current_addr_sk], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_13_5_1] ON [dbo].[customer]([c_birth_month], [c_current_addr_sk], [c_customer_sk])
go

-- ===== query019_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K13_K5] ON [dbo].[customer]
(
	[c_birth_month] ASC,
	[c_current_addr_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query019_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9_1_10] ON [dbo].[customer_address]
(
	[ca_state] ASC
)
INCLUDE ( 	[ca_address_sk],
	[ca_zip]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query019_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K1_K9_K8_K14_K15] ON [dbo].[item]
(
	[i_category] ASC,
	[i_item_sk] ASC,
	[i_brand] ASC,
	[i_brand_id] ASC,
	[i_manufact_id] ASC,
	[i_manufact] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query019_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K9_K7_K1] ON [dbo].[date_dim]
(
	[d_moy] ASC,
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_1_12_8_3] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_wholesale_cost], [ss_store_sk], [ss_item_sk])
go

-- ===== query023_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K12_K3_K4_11_14] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_item_sk] ASC,
	[ss_customer_sk] ASC
)
INCLUDE ( 	[ss_quantity],
	[ss_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_12_4] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_1_4] ON [dbo].[store_sales]([ss_item_sk], [ss_sold_date_sk], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_4_12] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_customer_sk], [ss_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1653580929_12_1_3_4] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_sold_date_sk], [ss_item_sk], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21] ON [dbo].[item]([i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13_1] ON [dbo].[item]([i_manager_id], [i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_4] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_5_20_4] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_wholesale_cost], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_20_5] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_wholesale_cost], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_18_20] ON [dbo].[web_sales]([ws_item_sk], [ws_order_number], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1589580701_5_4_1_20_18] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_item_sk], [ws_sold_date_sk], [ws_wholesale_cost], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_981578535_9_1] ON [dbo].[date_dim]([d_moy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_9] ON [dbo].[date_dim]([d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_3_7_9] ON [dbo].[date_dim]([d_date], [d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_1_7_3] ON [dbo].[date_dim]([d_date_sk], [d_year], [d_date])
go

CREATE STATISTICS [_dta_stat_981578535_1_7_9_3] ON [dbo].[date_dim]([d_date_sk], [d_year], [d_moy], [d_date])
go

CREATE STATISTICS [_dta_stat_1621580815_4_20] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_4_16_1] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_item_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_16_4] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_item_sk], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1_4_16] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk], [cs_bill_customer_sk], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_14] ON [dbo].[customer]([c_customer_sk], [c_birth_year])
go

-- ===== query023_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K4_K12_K3_K1_11_14] ON [dbo].[store_sales]
(
	[ss_customer_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_item_sk] ASC,
	[ss_sold_date_sk] ASC
)
INCLUDE ( 	[ss_quantity],
	[ss_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_3_4] ON [dbo].[store_sales]([ss_item_sk], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_4_3] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_customer_sk], [ss_item_sk])
go

-- ===== query023_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K14_K1] ON [dbo].[customer]
(
	[c_birth_year] ASC,
	[c_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_13_1] ON [dbo].[item]([i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_12] ON [dbo].[store_sales]([ss_item_sk], [ss_wholesale_cost])
go

-- ===== query023_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query023_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1_K3_K9] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC,
	[d_date] ASC,
	[d_moy] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query023_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K12_K3_K4_11_14] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_item_sk] ASC,
	[ss_customer_sk] ASC
)
INCLUDE ( 	[ss_quantity],
	[ss_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_1_4] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_12_1] ON [dbo].[store_sales]([ss_customer_sk], [ss_wholesale_cost], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_1_4] ON [dbo].[store_sales]([ss_item_sk], [ss_sold_date_sk], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21] ON [dbo].[item]([i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_13_21_1] ON [dbo].[item]([i_category], [i_manager_id], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_4] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_20_5] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_wholesale_cost], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_5_4_1] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_item_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_5_4_1] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_bill_customer_sk], [ws_item_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_9_1] ON [dbo].[date_dim]([d_moy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_9] ON [dbo].[date_dim]([d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_3_7_9] ON [dbo].[date_dim]([d_date], [d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_1_7_3] ON [dbo].[date_dim]([d_date_sk], [d_year], [d_date])
go

CREATE STATISTICS [_dta_stat_981578535_7_1_9_3] ON [dbo].[date_dim]([d_year], [d_date_sk], [d_moy], [d_date])
go

CREATE STATISTICS [_dta_stat_1621580815_4_20] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1_4] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_4_16_1] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_item_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_18_20] ON [dbo].[catalog_sales]([cs_item_sk], [cs_order_number], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_20_16_4_1_18] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_item_sk], [cs_bill_customer_sk], [cs_sold_date_sk], [cs_order_number])
go

CREATE STATISTICS [_dta_stat_1269579561_14_1] ON [dbo].[customer]([c_birth_year], [c_customer_sk])
go

-- ===== query023_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K4_K12_K3_K1_11_14] ON [dbo].[store_sales]
(
	[ss_customer_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_item_sk] ASC,
	[ss_sold_date_sk] ASC
)
INCLUDE ( 	[ss_quantity],
	[ss_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_3_4_12] ON [dbo].[store_sales]([ss_item_sk], [ss_customer_sk], [ss_wholesale_cost])
go

-- ===== query023_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K14_K1] ON [dbo].[customer]
(
	[c_birth_year] ASC,
	[c_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_13_1] ON [dbo].[item]([i_category], [i_item_sk])
go

-- ===== query023_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K9_1_3] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_moy] ASC
)
INCLUDE ( 	[d_date_sk],
	[d_date]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query025_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K3_K8_K10_K4_23] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_item_sk] ASC,
	[ss_store_sk] ASC,
	[ss_ticket_number] ASC,
	[ss_customer_sk] ASC
)
INCLUDE ( 	[ss_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_8_3] ON [dbo].[store_sales]([ss_store_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_3_8_1] ON [dbo].[store_sales]([ss_customer_sk], [ss_item_sk], [ss_store_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_10_4_3_8_1] ON [dbo].[store_sales]([ss_ticket_number], [ss_customer_sk], [ss_item_sk], [ss_store_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_1_3_10] ON [dbo].[store_returns]([sr_returned_date_sk], [sr_item_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1333579789_10_4_1] ON [dbo].[store_returns]([sr_ticket_number], [sr_customer_sk], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_4_1_3_10] ON [dbo].[store_returns]([sr_customer_sk], [sr_returned_date_sk], [sr_item_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1173579219_2_5] ON [dbo].[item]([i_item_id], [i_item_desc])
go

CREATE STATISTICS [_dta_stat_1173579219_1_2_5] ON [dbo].[item]([i_item_sk], [i_item_id], [i_item_desc])
go

CREATE STATISTICS [_dta_stat_981578535_9_1] ON [dbo].[date_dim]([d_moy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_9] ON [dbo].[date_dim]([d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_1_7_9] ON [dbo].[date_dim]([d_date_sk], [d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_1621580815_1_16] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_4_1_16] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_sold_date_sk], [cs_item_sk])
go

-- ===== query025_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_returns_6_1333579789__K1_K3_K10_K4_20] ON [dbo].[store_returns]
(
	[sr_returned_date_sk] ASC,
	[sr_item_sk] ASC,
	[sr_ticket_number] ASC,
	[sr_customer_sk] ASC
)
INCLUDE ( 	[sr_net_loss]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_4_16] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_item_sk])
go

-- ===== query025_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K1_K2_K5] ON [dbo].[item]
(
	[i_item_sk] ASC,
	[i_item_id] ASC,
	[i_item_desc] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query025_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K16_K4_K1_34] ON [dbo].[catalog_sales]
(
	[cs_item_sk] ASC,
	[cs_bill_customer_sk] ASC,
	[cs_sold_date_sk] ASC
)
INCLUDE ( 	[cs_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query025_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_4_16_34] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC
)
INCLUDE ( 	[cs_bill_customer_sk],
	[cs_item_sk],
	[cs_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query025_0 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K9_1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_moy] ASC
)
INCLUDE ( 	[d_date_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_4_3_10] ON [dbo].[store_returns]([sr_customer_sk], [sr_item_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1653580929_8_10_4] ON [dbo].[store_sales]([ss_store_sk], [ss_ticket_number], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_10_4_3] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_ticket_number], [ss_customer_sk], [ss_item_sk])
go

-- ===== query025_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K3_K8_K10_K4_23] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_item_sk] ASC,
	[ss_store_sk] ASC,
	[ss_ticket_number] ASC,
	[ss_customer_sk] ASC
)
INCLUDE ( 	[ss_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_8_3] ON [dbo].[store_sales]([ss_store_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_3_8_1] ON [dbo].[store_sales]([ss_customer_sk], [ss_item_sk], [ss_store_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_10_4_3_8_1] ON [dbo].[store_sales]([ss_ticket_number], [ss_customer_sk], [ss_item_sk], [ss_store_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_1_3_10] ON [dbo].[store_returns]([sr_returned_date_sk], [sr_item_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1333579789_10_4_1] ON [dbo].[store_returns]([sr_ticket_number], [sr_customer_sk], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_4_1_3_10] ON [dbo].[store_returns]([sr_customer_sk], [sr_returned_date_sk], [sr_item_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1173579219_2_5] ON [dbo].[item]([i_item_id], [i_item_desc])
go

CREATE STATISTICS [_dta_stat_1173579219_1_2_5] ON [dbo].[item]([i_item_sk], [i_item_id], [i_item_desc])
go

CREATE STATISTICS [_dta_stat_981578535_9_1] ON [dbo].[date_dim]([d_moy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_9] ON [dbo].[date_dim]([d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_1_7_9] ON [dbo].[date_dim]([d_date_sk], [d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_1621580815_1_16] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_4_1_16] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_sold_date_sk], [cs_item_sk])
go

-- ===== query025_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_returns_6_1333579789__K1_K3_K4_K10_20] ON [dbo].[store_returns]
(
	[sr_returned_date_sk] ASC,
	[sr_item_sk] ASC,
	[sr_customer_sk] ASC,
	[sr_ticket_number] ASC
)
INCLUDE ( 	[sr_net_loss]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_8_4_10] ON [dbo].[store_sales]([ss_store_sk], [ss_customer_sk], [ss_ticket_number])
go

CREATE STATISTICS [_dta_stat_1653580929_1_4_10_3] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_customer_sk], [ss_ticket_number], [ss_item_sk])
go

-- ===== query025_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K1_K2_K5] ON [dbo].[item]
(
	[i_item_sk] ASC,
	[i_item_id] ASC,
	[i_item_desc] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query025_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K16_K4_K1_34] ON [dbo].[catalog_sales]
(
	[cs_item_sk] ASC,
	[cs_bill_customer_sk] ASC,
	[cs_sold_date_sk] ASC
)
INCLUDE ( 	[cs_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query025_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K16_K4_34] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_item_sk] ASC,
	[cs_bill_customer_sk] ASC
)
INCLUDE ( 	[cs_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query025_1 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K9_1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_moy] ASC
)
INCLUDE ( 	[d_date_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_4_3_10] ON [dbo].[store_returns]([sr_customer_sk], [sr_item_sk], [sr_ticket_number])
go

-- ===== query027_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K3_K5_K8_K1_11_13_14_20] ON [dbo].[store_sales]
(
	[ss_item_sk] ASC,
	[ss_cdemo_sk] ASC,
	[ss_store_sk] ASC,
	[ss_sold_date_sk] ASC
)
INCLUDE ( 	[ss_quantity],
	[ss_list_price],
	[ss_sales_price],
	[ss_coupon_amt]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_1_5] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_5_8_1] ON [dbo].[store_sales]([ss_cdemo_sk], [ss_store_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_2_13] ON [dbo].[item]([i_item_id], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_13_1_2] ON [dbo].[item]([i_category], [i_item_sk], [i_item_id])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_949578421_3_1] ON [dbo].[customer_demographics]([cd_marital_status], [cd_demo_sk])
go

CREATE STATISTICS [_dta_stat_949578421_2_3] ON [dbo].[customer_demographics]([cd_gender], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_4_3] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_4_3_2] ON [dbo].[customer_demographics]([cd_education_status], [cd_marital_status], [cd_gender])
go

CREATE STATISTICS [_dta_stat_949578421_1_2_3_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_gender], [cd_marital_status], [cd_education_status])
go

-- ===== query027_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_demographics_6_949578421__K4_K3_K2] ON [dbo].[customer_demographics]
(
	[cd_education_status] ASC,
	[cd_marital_status] ASC,
	[cd_gender] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_3_8] ON [dbo].[store_sales]([ss_item_sk], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_8_3] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_store_sk], [ss_item_sk])
go

-- ===== query027_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K1_K2] ON [dbo].[item]
(
	[i_category] ASC,
	[i_item_sk] ASC,
	[i_item_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_949578421_2_1_4] ON [dbo].[customer_demographics]([cd_gender], [cd_demo_sk], [cd_education_status])
go

-- ===== query027_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query027_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K8_K5_K1_K3_11_13_14_20] ON [dbo].[store_sales]
(
	[ss_store_sk] ASC,
	[ss_cdemo_sk] ASC,
	[ss_sold_date_sk] ASC,
	[ss_item_sk] ASC
)
INCLUDE ( 	[ss_quantity],
	[ss_list_price],
	[ss_sales_price],
	[ss_coupon_amt]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_1_5] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_5_1] ON [dbo].[store_sales]([ss_item_sk], [ss_cdemo_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_2_13] ON [dbo].[item]([i_item_id], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_1_13_2] ON [dbo].[item]([i_item_sk], [i_category], [i_item_id])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_949578421_3_1] ON [dbo].[customer_demographics]([cd_marital_status], [cd_demo_sk])
go

CREATE STATISTICS [_dta_stat_949578421_4_3] ON [dbo].[customer_demographics]([cd_education_status], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_2_3_4] ON [dbo].[customer_demographics]([cd_gender], [cd_marital_status], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_4_3] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_2_1_3_4] ON [dbo].[customer_demographics]([cd_gender], [cd_demo_sk], [cd_marital_status], [cd_education_status])
go

-- ===== query027_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_demographics_6_949578421__K4_K3_K2] ON [dbo].[customer_demographics]
(
	[cd_education_status] ASC,
	[cd_marital_status] ASC,
	[cd_gender] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_3_1] ON [dbo].[store_sales]([ss_item_sk], [ss_sold_date_sk])
go

-- ===== query027_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K1_K2] ON [dbo].[item]
(
	[i_category] ASC,
	[i_item_sk] ASC,
	[i_item_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_949578421_2_1_4] ON [dbo].[customer_demographics]([cd_gender], [cd_demo_sk], [cd_education_status])
go

-- ===== query027_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query030_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K21] ON [dbo].[item]
(
	[i_manager_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_21_1] ON [dbo].[item]([i_manager_id], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_1_16] ON [dbo].[web_returns]([wr_returned_date_sk], [wr_return_amt])
go

CREATE STATISTICS [_dta_stat_1557580587_11_16] ON [dbo].[web_returns]([wr_returning_addr_sk], [wr_return_amt])
go

CREATE STATISTICS [_dta_stat_1557580587_16_13_1] ON [dbo].[web_returns]([wr_return_amt], [wr_reason_sk], [wr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_8_13_11] ON [dbo].[web_returns]([wr_returning_customer_sk], [wr_reason_sk], [wr_returning_addr_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_13_1_3] ON [dbo].[web_returns]([wr_reason_sk], [wr_returned_date_sk], [wr_item_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_16_13_11_1] ON [dbo].[web_returns]([wr_return_amt], [wr_reason_sk], [wr_returning_addr_sk], [wr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_8_16_13_1_3] ON [dbo].[web_returns]([wr_returning_customer_sk], [wr_return_amt], [wr_reason_sk], [wr_returned_date_sk], [wr_item_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_1_3_11_8_16] ON [dbo].[web_returns]([wr_returned_date_sk], [wr_item_sk], [wr_returning_addr_sk], [wr_returning_customer_sk], [wr_return_amt])
go

CREATE STATISTICS [_dta_stat_1557580587_16_13_8_11_1] ON [dbo].[web_returns]([wr_return_amt], [wr_reason_sk], [wr_returning_customer_sk], [wr_returning_addr_sk], [wr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_3_16_13_1_11_8] ON [dbo].[web_returns]([wr_item_sk], [wr_return_amt], [wr_reason_sk], [wr_returned_date_sk], [wr_returning_addr_sk], [wr_returning_customer_sk])
go

CREATE STATISTICS [_dta_stat_917578307_9_1] ON [dbo].[customer_address]([ca_state], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_5_14] ON [dbo].[customer]([c_current_addr_sk], [c_birth_year])
go

CREATE STATISTICS [_dta_stat_1269579561_2_8_9_10_11_12_13] ON [dbo].[customer]([c_customer_id], [c_salutation], [c_first_name], [c_last_name], [c_preferred_cust_flag], [c_birth_day], [c_birth_month])
go

CREATE STATISTICS [_dta_stat_1269579561_14_2_8_9_10_11_12_13_15_16_17_18_1] ON [dbo].[customer]([c_birth_year], [c_customer_id], [c_salutation], [c_first_name], [c_last_name], [c_preferred_cust_flag], [c_birth_day], [c_birth_month], [c_birth_country], [c_login], [c_email_address], [c_last_review_date_sk], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_14_1_5_2_8_9_10_11_12_13_15_16_17_18] ON [dbo].[customer]([c_birth_year], [c_customer_sk], [c_current_addr_sk], [c_customer_id], [c_salutation], [c_first_name], [c_last_name], [c_preferred_cust_flag], [c_birth_day], [c_birth_month], [c_birth_country], [c_login], [c_email_address], [c_last_review_date_sk])
go

-- ===== query030_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_returns_6_1557580587__K13_K1_K3_K16_K11_K8] ON [dbo].[web_returns]
(
	[wr_reason_sk] ASC,
	[wr_returned_date_sk] ASC,
	[wr_item_sk] ASC,
	[wr_return_amt] ASC,
	[wr_returning_addr_sk] ASC,
	[wr_returning_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query030_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9_K1] ON [dbo].[customer_address]
(
	[ca_state] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1557580587_14_1_3] ON [dbo].[web_returns]([wr_order_number], [wr_returned_date_sk], [wr_item_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_11_16_13_3] ON [dbo].[web_returns]([wr_returning_addr_sk], [wr_return_amt], [wr_reason_sk], [wr_item_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_3_16_13_14_1] ON [dbo].[web_returns]([wr_item_sk], [wr_return_amt], [wr_reason_sk], [wr_order_number], [wr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_16_13_3_14_11] ON [dbo].[web_returns]([wr_return_amt], [wr_reason_sk], [wr_item_sk], [wr_order_number], [wr_returning_addr_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_16_3_14_1_11] ON [dbo].[web_returns]([wr_return_amt], [wr_item_sk], [wr_order_number], [wr_returned_date_sk], [wr_returning_addr_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_16_13_3_8_11] ON [dbo].[web_returns]([wr_return_amt], [wr_reason_sk], [wr_item_sk], [wr_returning_customer_sk], [wr_returning_addr_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_8_13_16_3_14_1] ON [dbo].[web_returns]([wr_returning_customer_sk], [wr_reason_sk], [wr_return_amt], [wr_item_sk], [wr_order_number], [wr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_13_1_3_16_11_14] ON [dbo].[web_returns]([wr_reason_sk], [wr_returned_date_sk], [wr_item_sk], [wr_return_amt], [wr_returning_addr_sk], [wr_order_number])
go

CREATE STATISTICS [_dta_stat_1557580587_1_3_11_14_8_16] ON [dbo].[web_returns]([wr_returned_date_sk], [wr_item_sk], [wr_returning_addr_sk], [wr_order_number], [wr_returning_customer_sk], [wr_return_amt])
go

CREATE STATISTICS [_dta_stat_1557580587_16_13_3_14_8_11_1] ON [dbo].[web_returns]([wr_return_amt], [wr_reason_sk], [wr_item_sk], [wr_order_number], [wr_returning_customer_sk], [wr_returning_addr_sk], [wr_returned_date_sk])
go

-- ===== query030_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K21] ON [dbo].[item]
(
	[i_manager_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_21_1] ON [dbo].[item]([i_manager_id], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_13_1] ON [dbo].[web_returns]([wr_reason_sk], [wr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_8_16] ON [dbo].[web_returns]([wr_returning_customer_sk], [wr_return_amt])
go

CREATE STATISTICS [_dta_stat_1557580587_1_16] ON [dbo].[web_returns]([wr_returned_date_sk], [wr_return_amt])
go

CREATE STATISTICS [_dta_stat_1557580587_3_16] ON [dbo].[web_returns]([wr_item_sk], [wr_return_amt])
go

CREATE STATISTICS [_dta_stat_1557580587_16_13_3] ON [dbo].[web_returns]([wr_return_amt], [wr_reason_sk], [wr_item_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_11_16_13_1] ON [dbo].[web_returns]([wr_returning_addr_sk], [wr_return_amt], [wr_reason_sk], [wr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_8_13_11_16] ON [dbo].[web_returns]([wr_returning_customer_sk], [wr_reason_sk], [wr_returning_addr_sk], [wr_return_amt])
go

CREATE STATISTICS [_dta_stat_1557580587_16_13_8_11_1] ON [dbo].[web_returns]([wr_return_amt], [wr_reason_sk], [wr_returning_customer_sk], [wr_returning_addr_sk], [wr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_8_13_16_1_3] ON [dbo].[web_returns]([wr_returning_customer_sk], [wr_reason_sk], [wr_return_amt], [wr_returned_date_sk], [wr_item_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_16_13_1_3_11] ON [dbo].[web_returns]([wr_return_amt], [wr_reason_sk], [wr_returned_date_sk], [wr_item_sk], [wr_returning_addr_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_1_3_11_8_16_13] ON [dbo].[web_returns]([wr_returned_date_sk], [wr_item_sk], [wr_returning_addr_sk], [wr_returning_customer_sk], [wr_return_amt], [wr_reason_sk])
go

CREATE STATISTICS [_dta_stat_917578307_9_1] ON [dbo].[customer_address]([ca_state], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_5_14] ON [dbo].[customer]([c_current_addr_sk], [c_birth_year])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_2_8_9_10_11_12_13_14_15_16_17_18] ON [dbo].[customer]([c_customer_id], [c_salutation], [c_first_name], [c_last_name], [c_preferred_cust_flag], [c_birth_day], [c_birth_month], [c_birth_year], [c_birth_country], [c_login], [c_email_address], [c_last_review_date_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_14_2_8_9_10_11_12_13_15_16_17_18] ON [dbo].[customer]([c_customer_sk], [c_birth_year], [c_customer_id], [c_salutation], [c_first_name], [c_last_name], [c_preferred_cust_flag], [c_birth_day], [c_birth_month], [c_birth_country], [c_login], [c_email_address], [c_last_review_date_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_14_5_2_8_9_10_11_12_13_15_16_17_18] ON [dbo].[customer]([c_customer_sk], [c_birth_year], [c_current_addr_sk], [c_customer_id], [c_salutation], [c_first_name], [c_last_name], [c_preferred_cust_flag], [c_birth_day], [c_birth_month], [c_birth_country], [c_login], [c_email_address], [c_last_review_date_sk])
go

-- ===== query030_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_returns_6_1557580587__K13_K1_K3_K16_K11_K8] ON [dbo].[web_returns]
(
	[wr_reason_sk] ASC,
	[wr_returned_date_sk] ASC,
	[wr_item_sk] ASC,
	[wr_return_amt] ASC,
	[wr_returning_addr_sk] ASC,
	[wr_returning_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1557580587_8_13_11_1] ON [dbo].[web_returns]([wr_returning_customer_sk], [wr_reason_sk], [wr_returning_addr_sk], [wr_returned_date_sk])
go

-- ===== query030_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9_K1] ON [dbo].[customer_address]
(
	[ca_state] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1557580587_14_1_3] ON [dbo].[web_returns]([wr_order_number], [wr_returned_date_sk], [wr_item_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_11_16_13_3] ON [dbo].[web_returns]([wr_returning_addr_sk], [wr_return_amt], [wr_reason_sk], [wr_item_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_16_13_3_14_11] ON [dbo].[web_returns]([wr_return_amt], [wr_reason_sk], [wr_item_sk], [wr_order_number], [wr_returning_addr_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_16_3_14_1_11] ON [dbo].[web_returns]([wr_return_amt], [wr_item_sk], [wr_order_number], [wr_returned_date_sk], [wr_returning_addr_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_3_16_13_14_1] ON [dbo].[web_returns]([wr_item_sk], [wr_return_amt], [wr_reason_sk], [wr_order_number], [wr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_16_13_3_8_11] ON [dbo].[web_returns]([wr_return_amt], [wr_reason_sk], [wr_item_sk], [wr_returning_customer_sk], [wr_returning_addr_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_1_3_11_14_8_16] ON [dbo].[web_returns]([wr_returned_date_sk], [wr_item_sk], [wr_returning_addr_sk], [wr_order_number], [wr_returning_customer_sk], [wr_return_amt])
go

CREATE STATISTICS [_dta_stat_1557580587_13_1_3_16_11_14] ON [dbo].[web_returns]([wr_reason_sk], [wr_returned_date_sk], [wr_item_sk], [wr_return_amt], [wr_returning_addr_sk], [wr_order_number])
go

CREATE STATISTICS [_dta_stat_1557580587_8_13_16_3_14_1] ON [dbo].[web_returns]([wr_returning_customer_sk], [wr_reason_sk], [wr_return_amt], [wr_item_sk], [wr_order_number], [wr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_16_13_3_14_8_11_1] ON [dbo].[web_returns]([wr_return_amt], [wr_reason_sk], [wr_item_sk], [wr_order_number], [wr_returning_customer_sk], [wr_returning_addr_sk], [wr_returned_date_sk])
go

-- ===== query031_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K7_K13_K1_K3_16] ON [dbo].[store_sales]
(
	[ss_addr_sk] ASC,
	[ss_list_price] ASC,
	[ss_sold_date_sk] ASC,
	[ss_item_sk] ASC
)
INCLUDE ( 	[ss_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_1_13] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1653580929_13_3_1] ON [dbo].[store_sales]([ss_list_price], [ss_item_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_7_3_13] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_addr_sk], [ss_item_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1173579219_1_18] ON [dbo].[item]([i_item_sk], [i_color])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21] ON [dbo].[item]([i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_18_21_1] ON [dbo].[item]([i_color], [i_manager_id], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_21_1] ON [dbo].[web_sales]([ws_list_price], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_21_8_1] ON [dbo].[web_sales]([ws_list_price], [ws_bill_addr_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_21_1] ON [dbo].[web_sales]([ws_item_sk], [ws_list_price], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_4_8_21] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_item_sk], [ws_bill_addr_sk], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_11_1] ON [dbo].[date_dim]([d_qoy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_11_1] ON [dbo].[date_dim]([d_year], [d_qoy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_917578307_8_1] ON [dbo].[customer_address]([ca_county], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_917578307_9_8] ON [dbo].[customer_address]([ca_state], [ca_county])
go

CREATE STATISTICS [_dta_stat_917578307_1_9_8] ON [dbo].[customer_address]([ca_address_sk], [ca_state], [ca_county])
go

-- ===== query031_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K13_K3_K7_16] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_list_price] ASC,
	[ss_item_sk] ASC,
	[ss_addr_sk] ASC
)
INCLUDE ( 	[ss_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_13_7_3] ON [dbo].[store_sales]([ss_list_price], [ss_addr_sk], [ss_item_sk])
go

-- ===== query031_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K21_K8_K1_K4_24] ON [dbo].[web_sales]
(
	[ws_list_price] ASC,
	[ws_bill_addr_sk] ASC,
	[ws_sold_date_sk] ASC,
	[ws_item_sk] ASC
)
INCLUDE ( 	[ws_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query031_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9_K8_K1] ON [dbo].[customer_address]
(
	[ca_state] ASC,
	[ca_county] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query031_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K13_K3_K7_16] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_list_price] ASC,
	[ss_item_sk] ASC,
	[ss_addr_sk] ASC
)
INCLUDE ( 	[ss_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_13_7_1] ON [dbo].[store_sales]([ss_list_price], [ss_addr_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_3_7] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_item_sk], [ss_addr_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_13_1_7] ON [dbo].[store_sales]([ss_item_sk], [ss_list_price], [ss_sold_date_sk], [ss_addr_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_18_21] ON [dbo].[item]([i_color], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21] ON [dbo].[item]([i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_18_21] ON [dbo].[item]([i_item_sk], [i_color], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1589580701_1_21] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_21_8_4] ON [dbo].[web_sales]([ws_list_price], [ws_bill_addr_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_21_1] ON [dbo].[web_sales]([ws_item_sk], [ws_list_price], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_1_8_21] ON [dbo].[web_sales]([ws_item_sk], [ws_sold_date_sk], [ws_bill_addr_sk], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_981578535_7_11] ON [dbo].[date_dim]([d_year], [d_qoy])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_11_1_7] ON [dbo].[date_dim]([d_qoy], [d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_917578307_8_1] ON [dbo].[customer_address]([ca_county], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_917578307_8_9] ON [dbo].[customer_address]([ca_county], [ca_state])
go

CREATE STATISTICS [_dta_stat_917578307_1_9_8] ON [dbo].[customer_address]([ca_address_sk], [ca_state], [ca_county])
go

-- ===== query031_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K18_K21_K1] ON [dbo].[item]
(
	[i_color] ASC,
	[i_manager_id] ASC,
	[i_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_13_3_7] ON [dbo].[store_sales]([ss_list_price], [ss_item_sk], [ss_addr_sk])
go

-- ===== query031_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9_K8_K1] ON [dbo].[customer_address]
(
	[ca_state] ASC,
	[ca_county] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query031_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K11] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_qoy] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_21_1_8] ON [dbo].[web_sales]([ws_list_price], [ws_sold_date_sk], [ws_bill_addr_sk])
go

-- ===== query031_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K1_K21_K8_K4_24] ON [dbo].[web_sales]
(
	[ws_sold_date_sk] ASC,
	[ws_list_price] ASC,
	[ws_bill_addr_sk] ASC,
	[ws_item_sk] ASC
)
INCLUDE ( 	[ws_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query032_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K21_K23_K22_K16] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_list_price] ASC,
	[cs_ext_discount_amt] ASC,
	[cs_sales_price] ASC,
	[cs_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_21_22] ON [dbo].[catalog_sales]([cs_list_price], [cs_sales_price])
go

CREATE STATISTICS [_dta_stat_1621580815_1_23] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_ext_discount_amt])
go

CREATE STATISTICS [_dta_stat_1621580815_16_21_23] ON [dbo].[catalog_sales]([cs_item_sk], [cs_list_price], [cs_ext_discount_amt])
go

CREATE STATISTICS [_dta_stat_1621580815_1_16_21] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_item_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_22_16_1] ON [dbo].[catalog_sales]([cs_sales_price], [cs_item_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_21_23_22_16] ON [dbo].[catalog_sales]([cs_list_price], [cs_ext_discount_amt], [cs_sales_price], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_1_21_22] ON [dbo].[catalog_sales]([cs_item_sk], [cs_sold_date_sk], [cs_list_price], [cs_sales_price])
go

CREATE STATISTICS [_dta_stat_1621580815_23_16_1_21_22] ON [dbo].[catalog_sales]([cs_ext_discount_amt], [cs_item_sk], [cs_sold_date_sk], [cs_list_price], [cs_sales_price])
go

CREATE STATISTICS [_dta_stat_1173579219_1_14] ON [dbo].[item]([i_item_sk], [i_manufact_id])
go

CREATE STATISTICS [_dta_stat_1173579219_14_21] ON [dbo].[item]([i_manufact_id], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_21_1_14] ON [dbo].[item]([i_manager_id], [i_item_sk], [i_manufact_id])
go

CREATE STATISTICS [_dta_stat_981578535_3_1] ON [dbo].[date_dim]([d_date], [d_date_sk])
go

-- ===== query032_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K3_K1] ON [dbo].[date_dim]
(
	[d_date] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_21_22_16] ON [dbo].[catalog_sales]([cs_list_price], [cs_sales_price], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_1_22_21] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_sales_price], [cs_list_price])
go

-- ===== query032_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K21_K23_K22_16] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_list_price] ASC,
	[cs_ext_discount_amt] ASC,
	[cs_sales_price] ASC
)
INCLUDE ( 	[cs_item_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_21_22] ON [dbo].[catalog_sales]([cs_list_price], [cs_sales_price])
go

CREATE STATISTICS [_dta_stat_1621580815_16_21] ON [dbo].[catalog_sales]([cs_item_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_22_16_21] ON [dbo].[catalog_sales]([cs_sales_price], [cs_item_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_21_23_22] ON [dbo].[catalog_sales]([cs_list_price], [cs_ext_discount_amt], [cs_sales_price])
go

CREATE STATISTICS [_dta_stat_1621580815_1_23_16_21] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_ext_discount_amt], [cs_item_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_16_1_21_22] ON [dbo].[catalog_sales]([cs_item_sk], [cs_sold_date_sk], [cs_list_price], [cs_sales_price])
go

CREATE STATISTICS [_dta_stat_1621580815_16_23_21_22] ON [dbo].[catalog_sales]([cs_item_sk], [cs_ext_discount_amt], [cs_list_price], [cs_sales_price])
go

CREATE STATISTICS [_dta_stat_1621580815_1_21_23_22_16] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_list_price], [cs_ext_discount_amt], [cs_sales_price], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_14_21] ON [dbo].[item]([i_manufact_id], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_14_21] ON [dbo].[item]([i_item_sk], [i_manufact_id], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_981578535_3_1] ON [dbo].[date_dim]([d_date], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_19_1_3] ON [dbo].[date_dim]([d_following_holiday], [d_date_sk], [d_date])
go

-- ===== query032_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K14_K21] ON [dbo].[item]
(
	[i_manufact_id] ASC,
	[i_manager_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_21_1] ON [dbo].[item]([i_manager_id], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_22_23] ON [dbo].[catalog_sales]([cs_item_sk], [cs_sales_price], [cs_ext_discount_amt])
go

CREATE STATISTICS [_dta_stat_1621580815_1_22_23] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_sales_price], [cs_ext_discount_amt])
go

-- ===== query032_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K3_K1] ON [dbo].[date_dim]
(
	[d_date] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query032_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K21] ON [dbo].[item]
(
	[i_manager_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query032_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K16_K22_K21_K1_23] ON [dbo].[catalog_sales]
(
	[cs_item_sk] ASC,
	[cs_sales_price] ASC,
	[cs_list_price] ASC,
	[cs_sold_date_sk] ASC
)
INCLUDE ( 	[cs_ext_discount_amt]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query038_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K13_K12_K4] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_list_price] ASC,
	[ss_wholesale_cost] ASC,
	[ss_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_13_12] ON [dbo].[store_sales]([ss_list_price], [ss_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1653580929_12_1_13] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_sold_date_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1653580929_1_4_13] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_customer_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1653580929_4_13_12_1] ON [dbo].[store_sales]([ss_customer_sk], [ss_list_price], [ss_wholesale_cost], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_5_21] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_1_21] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_20_1] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_5_21] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_bill_customer_sk], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_21_20_1] ON [dbo].[web_sales]([ws_list_price], [ws_wholesale_cost], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_21_20_5_1] ON [dbo].[web_sales]([ws_list_price], [ws_wholesale_cost], [ws_bill_customer_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_4] ON [dbo].[date_dim]([d_date_sk], [d_month_seq])
go

CREATE STATISTICS [_dta_stat_981578535_3_1] ON [dbo].[date_dim]([d_date], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_4_3_1] ON [dbo].[date_dim]([d_month_seq], [d_date], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_4_21] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_1_21] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_1_4_21] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_bill_customer_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_21_20_4] ON [dbo].[catalog_sales]([cs_list_price], [cs_wholesale_cost], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1_21_4] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk], [cs_list_price], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_13_9] ON [dbo].[customer]([c_birth_month], [c_first_name])
go

CREATE STATISTICS [_dta_stat_1269579561_13_10] ON [dbo].[customer]([c_birth_month], [c_last_name])
go

CREATE STATISTICS [_dta_stat_1269579561_10_9_1] ON [dbo].[customer]([c_last_name], [c_first_name], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_13_9] ON [dbo].[customer]([c_customer_sk], [c_birth_month], [c_first_name])
go

CREATE STATISTICS [_dta_stat_1269579561_10_9_13_1] ON [dbo].[customer]([c_last_name], [c_first_name], [c_birth_month], [c_customer_sk])
go

-- ===== query038_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K4_K21_K20_K1] ON [dbo].[catalog_sales]
(
	[cs_bill_customer_sk] ASC,
	[cs_list_price] ASC,
	[cs_wholesale_cost] ASC,
	[cs_sold_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_4_12] ON [dbo].[store_sales]([ss_customer_sk], [ss_wholesale_cost])
go

-- ===== query038_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K21_K20_K5_K1] ON [dbo].[web_sales]
(
	[ws_list_price] ASC,
	[ws_wholesale_cost] ASC,
	[ws_bill_customer_sk] ASC,
	[ws_sold_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_20_1_5] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_sold_date_sk], [ws_bill_customer_sk])
go

-- ===== query038_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K13_K10_K9_K1] ON [dbo].[customer]
(
	[c_birth_month] ASC,
	[c_last_name] ASC,
	[c_first_name] ASC,
	[c_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1269579561_1_13_10] ON [dbo].[customer]([c_customer_sk], [c_birth_month], [c_last_name])
go

CREATE STATISTICS [_dta_stat_1589580701_5_20] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_4_20] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_wholesale_cost])
go

-- ===== query038_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K4_K3] ON [dbo].[date_dim]
(
	[d_month_seq] ASC,
	[d_date] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_20_21_4] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_list_price], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_18_20_21] ON [dbo].[web_sales]([ws_item_sk], [ws_order_number], [ws_wholesale_cost], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_21_1_20_5_4_18] ON [dbo].[web_sales]([ws_list_price], [ws_sold_date_sk], [ws_wholesale_cost], [ws_bill_customer_sk], [ws_item_sk], [ws_order_number])
go

-- ===== query038_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K13_K12_K4] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_list_price] ASC,
	[ss_wholesale_cost] ASC,
	[ss_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_13_12] ON [dbo].[store_sales]([ss_list_price], [ss_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1653580929_12_1_13] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_sold_date_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1653580929_1_4_13] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_customer_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1653580929_4_13_12_1] ON [dbo].[store_sales]([ss_customer_sk], [ss_list_price], [ss_wholesale_cost], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_5_21] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_1_21] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_20_1] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_5_21] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_bill_customer_sk], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_21_20_1] ON [dbo].[web_sales]([ws_list_price], [ws_wholesale_cost], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_21_20_5_1] ON [dbo].[web_sales]([ws_list_price], [ws_wholesale_cost], [ws_bill_customer_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_4] ON [dbo].[date_dim]([d_date_sk], [d_month_seq])
go

CREATE STATISTICS [_dta_stat_981578535_3_1] ON [dbo].[date_dim]([d_date], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_4_3_1] ON [dbo].[date_dim]([d_month_seq], [d_date], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_4_21] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_1_21] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_1_4_21] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_bill_customer_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_21_20_4] ON [dbo].[catalog_sales]([cs_list_price], [cs_wholesale_cost], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1_21_4] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk], [cs_list_price], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_13_9] ON [dbo].[customer]([c_birth_month], [c_first_name])
go

CREATE STATISTICS [_dta_stat_1269579561_13_10] ON [dbo].[customer]([c_birth_month], [c_last_name])
go

CREATE STATISTICS [_dta_stat_1269579561_10_9_1] ON [dbo].[customer]([c_last_name], [c_first_name], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_13_9] ON [dbo].[customer]([c_customer_sk], [c_birth_month], [c_first_name])
go

CREATE STATISTICS [_dta_stat_1269579561_10_9_13_1] ON [dbo].[customer]([c_last_name], [c_first_name], [c_birth_month], [c_customer_sk])
go

-- ===== query038_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K4_K21_K20_K1] ON [dbo].[catalog_sales]
(
	[cs_bill_customer_sk] ASC,
	[cs_list_price] ASC,
	[cs_wholesale_cost] ASC,
	[cs_sold_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query038_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K1_K21_K20_K5] ON [dbo].[web_sales]
(
	[ws_sold_date_sk] ASC,
	[ws_list_price] ASC,
	[ws_wholesale_cost] ASC,
	[ws_bill_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_20_1_5] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_sold_date_sk], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_12] ON [dbo].[store_sales]([ss_customer_sk], [ss_wholesale_cost])
go

-- ===== query038_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K13_K10_K9_K1] ON [dbo].[customer]
(
	[c_birth_month] ASC,
	[c_last_name] ASC,
	[c_first_name] ASC,
	[c_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_5_20] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_4_20] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_wholesale_cost])
go

-- ===== query038_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K4_K3] ON [dbo].[date_dim]
(
	[d_month_seq] ASC,
	[d_date] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_20_21_4] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_list_price], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_18_20_21] ON [dbo].[web_sales]([ws_item_sk], [ws_order_number], [ws_wholesale_cost], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_20_21_5_1_4_18] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_list_price], [ws_bill_customer_sk], [ws_sold_date_sk], [ws_item_sk], [ws_order_number])
go

-- ===== query039_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_inventory_6_1493580359__K2_K4_K3_K1] ON [dbo].[inventory]
(
	[inv_item_sk] ASC,
	[inv_quantity_on_hand] ASC,
	[inv_warehouse_sk] ASC,
	[inv_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1493580359_3_4] ON [dbo].[inventory]([inv_warehouse_sk], [inv_quantity_on_hand])
go

CREATE STATISTICS [_dta_stat_1493580359_3_2] ON [dbo].[inventory]([inv_warehouse_sk], [inv_item_sk])
go

CREATE STATISTICS [_dta_stat_1493580359_4_2_3] ON [dbo].[inventory]([inv_quantity_on_hand], [inv_item_sk], [inv_warehouse_sk])
go

CREATE STATISTICS [_dta_stat_1493580359_1_4_3_2] ON [dbo].[inventory]([inv_date_sk], [inv_quantity_on_hand], [inv_warehouse_sk], [inv_item_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_1_13] ON [dbo].[item]([i_item_sk], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_21_1] ON [dbo].[item]([i_manager_id], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13_1] ON [dbo].[item]([i_manager_id], [i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_9] ON [dbo].[date_dim]([d_date_sk], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_7_9] ON [dbo].[date_dim]([d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_1_7_9] ON [dbo].[date_dim]([d_date_sk], [d_year], [d_moy])
go

-- ===== query039_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_inventory_6_1493580359__K1_K4_K3_K2] ON [dbo].[inventory]
(
	[inv_date_sk] ASC,
	[inv_quantity_on_hand] ASC,
	[inv_warehouse_sk] ASC,
	[inv_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query039_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K21_K1] ON [dbo].[item]
(
	[i_category] ASC,
	[i_manager_id] ASC,
	[i_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query039_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K9_K7_K1] ON [dbo].[date_dim]
(
	[d_moy] ASC,
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query039_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_inventory_6_1493580359__K2_K4_K3_K1] ON [dbo].[inventory]
(
	[inv_item_sk] ASC,
	[inv_quantity_on_hand] ASC,
	[inv_warehouse_sk] ASC,
	[inv_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1493580359_3_4] ON [dbo].[inventory]([inv_warehouse_sk], [inv_quantity_on_hand])
go

CREATE STATISTICS [_dta_stat_1493580359_4_1_3] ON [dbo].[inventory]([inv_quantity_on_hand], [inv_date_sk], [inv_warehouse_sk])
go

CREATE STATISTICS [_dta_stat_1493580359_4_2_3] ON [dbo].[inventory]([inv_quantity_on_hand], [inv_item_sk], [inv_warehouse_sk])
go

CREATE STATISTICS [_dta_stat_1493580359_3_2_1_4] ON [dbo].[inventory]([inv_warehouse_sk], [inv_item_sk], [inv_date_sk], [inv_quantity_on_hand])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13] ON [dbo].[item]([i_manager_id], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21] ON [dbo].[item]([i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_13_21] ON [dbo].[item]([i_item_sk], [i_category], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_981578535_1_9] ON [dbo].[date_dim]([d_date_sk], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_7_9] ON [dbo].[date_dim]([d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_1_7_9] ON [dbo].[date_dim]([d_date_sk], [d_year], [d_moy])
go

-- ===== query039_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_inventory_6_1493580359__K1_K4_K3_K2] ON [dbo].[inventory]
(
	[inv_date_sk] ASC,
	[inv_quantity_on_hand] ASC,
	[inv_warehouse_sk] ASC,
	[inv_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query039_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K21_K1] ON [dbo].[item]
(
	[i_category] ASC,
	[i_manager_id] ASC,
	[i_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query039_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K9_K7_K1] ON [dbo].[date_dim]
(
	[d_moy] ASC,
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query040_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K20_K15_K16_K18_22] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_wholesale_cost] ASC,
	[cs_warehouse_sk] ASC,
	[cs_item_sk] ASC,
	[cs_order_number] ASC
)
INCLUDE ( 	[cs_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_15_20] ON [dbo].[catalog_sales]([cs_warehouse_sk], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1_15] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk], [cs_warehouse_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_16_15_1] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_item_sk], [cs_warehouse_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_18_20_15_1] ON [dbo].[catalog_sales]([cs_order_number], [cs_wholesale_cost], [cs_warehouse_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_15_1_16_18_20] ON [dbo].[catalog_sales]([cs_warehouse_sk], [cs_sold_date_sk], [cs_item_sk], [cs_order_number], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1525580473_16_17] ON [dbo].[catalog_returns]([cr_reason_sk], [cr_order_number])
go

CREATE STATISTICS [_dta_stat_1525580473_16_3] ON [dbo].[catalog_returns]([cr_reason_sk], [cr_item_sk])
go

CREATE STATISTICS [_dta_stat_1525580473_3_17_16] ON [dbo].[catalog_returns]([cr_item_sk], [cr_order_number], [cr_reason_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_1_13] ON [dbo].[item]([i_item_sk], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21] ON [dbo].[item]([i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_2_13_21] ON [dbo].[item]([i_item_id], [i_category], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13_1_2] ON [dbo].[item]([i_manager_id], [i_category], [i_item_sk], [i_item_id])
go

CREATE STATISTICS [_dta_stat_981578535_1_3] ON [dbo].[date_dim]([d_date_sk], [d_date])
go

-- ===== query040_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_returns_6_1525580473__K16_K17_K3_24] ON [dbo].[catalog_returns]
(
	[cr_reason_sk] ASC,
	[cr_order_number] ASC,
	[cr_item_sk] ASC
)
INCLUDE ( 	[cr_refunded_cash]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query040_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K3_K1] ON [dbo].[date_dim]
(
	[d_date] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query040_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K21_K1_K2] ON [dbo].[item]
(
	[i_category] ASC,
	[i_manager_id] ASC,
	[i_item_sk] ASC,
	[i_item_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query040_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K20_K15_K16_K18_22] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_wholesale_cost] ASC,
	[cs_warehouse_sk] ASC,
	[cs_item_sk] ASC,
	[cs_order_number] ASC
)
INCLUDE ( 	[cs_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_15_20] ON [dbo].[catalog_sales]([cs_warehouse_sk], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1_15] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk], [cs_warehouse_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_16_15_1] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_item_sk], [cs_warehouse_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_18_20_15_1] ON [dbo].[catalog_sales]([cs_order_number], [cs_wholesale_cost], [cs_warehouse_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_15_1_16_18_20] ON [dbo].[catalog_sales]([cs_warehouse_sk], [cs_sold_date_sk], [cs_item_sk], [cs_order_number], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1525580473_16_17] ON [dbo].[catalog_returns]([cr_reason_sk], [cr_order_number])
go

CREATE STATISTICS [_dta_stat_1525580473_16_3] ON [dbo].[catalog_returns]([cr_reason_sk], [cr_item_sk])
go

CREATE STATISTICS [_dta_stat_1525580473_3_17_16] ON [dbo].[catalog_returns]([cr_item_sk], [cr_order_number], [cr_reason_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_1_13] ON [dbo].[item]([i_item_sk], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21] ON [dbo].[item]([i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_2_13_21] ON [dbo].[item]([i_item_id], [i_category], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13_1_2] ON [dbo].[item]([i_manager_id], [i_category], [i_item_sk], [i_item_id])
go

CREATE STATISTICS [_dta_stat_981578535_1_3] ON [dbo].[date_dim]([d_date_sk], [d_date])
go

-- ===== query040_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_returns_6_1525580473__K16_K17_K3_24] ON [dbo].[catalog_returns]
(
	[cr_reason_sk] ASC,
	[cr_order_number] ASC,
	[cr_item_sk] ASC
)
INCLUDE ( 	[cr_refunded_cash]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query040_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K3_K1] ON [dbo].[date_dim]
(
	[d_date] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query040_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K21_K1_K2] ON [dbo].[item]
(
	[i_category] ASC,
	[i_manager_id] ASC,
	[i_item_sk] ASC,
	[i_item_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query050_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K8_K1_K3_K10_K4] ON [dbo].[store_sales]
(
	[ss_store_sk] ASC,
	[ss_sold_date_sk] ASC,
	[ss_item_sk] ASC,
	[ss_ticket_number] ASC,
	[ss_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_3_10_4_8] ON [dbo].[store_sales]([ss_item_sk], [ss_ticket_number], [ss_customer_sk], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_3_10_4_8] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_item_sk], [ss_ticket_number], [ss_customer_sk], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_3_10_4_8] ON [dbo].[store_returns]([sr_item_sk], [sr_ticket_number], [sr_customer_sk], [sr_store_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_8_1_3_10_4] ON [dbo].[store_returns]([sr_store_sk], [sr_returned_date_sk], [sr_item_sk], [sr_ticket_number], [sr_customer_sk])
go

CREATE STATISTICS [_dta_stat_981578535_9_8] ON [dbo].[date_dim]([d_moy], [d_dow])
go

CREATE STATISTICS [_dta_stat_981578535_1_9] ON [dbo].[date_dim]([d_date_sk], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_1_8_9] ON [dbo].[date_dim]([d_date_sk], [d_dow], [d_moy])
go

-- ===== query050_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_returns_6_1333579789__K1_K8_K10_K3_K4] ON [dbo].[store_returns]
(
	[sr_returned_date_sk] ASC,
	[sr_store_sk] ASC,
	[sr_ticket_number] ASC,
	[sr_item_sk] ASC,
	[sr_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query050_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K9_K1_3] ON [dbo].[date_dim]
(
	[d_moy] ASC,
	[d_date_sk] ASC
)
INCLUDE ( 	[d_date]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query050_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K8_K1_K9_3] ON [dbo].[date_dim]
(
	[d_dow] ASC,
	[d_date_sk] ASC,
	[d_moy] ASC
)
INCLUDE ( 	[d_date]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query050_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K8_K1_K3_K10_K4] ON [dbo].[store_sales]
(
	[ss_store_sk] ASC,
	[ss_sold_date_sk] ASC,
	[ss_item_sk] ASC,
	[ss_ticket_number] ASC,
	[ss_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_3_10_4_8] ON [dbo].[store_sales]([ss_item_sk], [ss_ticket_number], [ss_customer_sk], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_3_10_4_8] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_item_sk], [ss_ticket_number], [ss_customer_sk], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_3_10_4_8] ON [dbo].[store_returns]([sr_item_sk], [sr_ticket_number], [sr_customer_sk], [sr_store_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_8_1_3_10_4] ON [dbo].[store_returns]([sr_store_sk], [sr_returned_date_sk], [sr_item_sk], [sr_ticket_number], [sr_customer_sk])
go

CREATE STATISTICS [_dta_stat_981578535_9_8] ON [dbo].[date_dim]([d_moy], [d_dow])
go

CREATE STATISTICS [_dta_stat_981578535_1_9] ON [dbo].[date_dim]([d_date_sk], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_1_8_9] ON [dbo].[date_dim]([d_date_sk], [d_dow], [d_moy])
go

-- ===== query050_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_returns_6_1333579789__K1_K8_K10_K3_K4] ON [dbo].[store_returns]
(
	[sr_returned_date_sk] ASC,
	[sr_store_sk] ASC,
	[sr_ticket_number] ASC,
	[sr_item_sk] ASC,
	[sr_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_10_3_4_1] ON [dbo].[store_returns]([sr_ticket_number], [sr_item_sk], [sr_customer_sk], [sr_returned_date_sk])
go

-- ===== query050_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K9_K1_3] ON [dbo].[date_dim]
(
	[d_moy] ASC,
	[d_date_sk] ASC
)
INCLUDE ( 	[d_date]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query050_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K8_K1_K9_3] ON [dbo].[date_dim]
(
	[d_dow] ASC,
	[d_date_sk] ASC,
	[d_moy] ASC
)
INCLUDE ( 	[d_date]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query054_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K4_K12_K1_16] ON [dbo].[store_sales]
(
	[ss_customer_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_sold_date_sk] ASC
)
INCLUDE ( 	[ss_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_12_1] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_1_12] ON [dbo].[store_sales]([ss_customer_sk], [ss_sold_date_sk], [ss_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1173579219_1_13] ON [dbo].[item]([i_item_sk], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_1_11] ON [dbo].[item]([i_item_sk], [i_class])
go

CREATE STATISTICS [_dta_stat_1173579219_13_11_1] ON [dbo].[item]([i_category], [i_class], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_1] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_20_1] ON [dbo].[web_sales]([ws_item_sk], [ws_wholesale_cost], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_5_20_4] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_bill_customer_sk], [ws_wholesale_cost], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_981578535_4_7] ON [dbo].[date_dim]([d_month_seq], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_9_4] ON [dbo].[date_dim]([d_moy], [d_month_seq])
go

CREATE STATISTICS [_dta_stat_981578535_1_7_9] ON [dbo].[date_dim]([d_date_sk], [d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_1_4_7] ON [dbo].[date_dim]([d_date_sk], [d_month_seq], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_7_9_4_1] ON [dbo].[date_dim]([d_year], [d_moy], [d_month_seq], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_1_4_20] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_bill_customer_sk], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_16_20_1_4] ON [dbo].[catalog_sales]([cs_item_sk], [cs_wholesale_cost], [cs_sold_date_sk], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_917578307_1_9] ON [dbo].[customer_address]([ca_address_sk], [ca_state])
go

CREATE STATISTICS [_dta_stat_917578307_9_8_1] ON [dbo].[customer_address]([ca_state], [ca_county], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_14_1] ON [dbo].[customer]([c_birth_year], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5_14] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk], [c_birth_year])
go

-- ===== query054_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K11_K13_K1] ON [dbo].[item]
(
	[i_class] ASC,
	[i_category] ASC,
	[i_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query054_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K9_K4] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_moy] ASC,
	[d_month_seq] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query054_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K4_K20_K16] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_bill_customer_sk] ASC,
	[cs_wholesale_cost] ASC,
	[cs_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query054_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K1_K20_K4_K5] ON [dbo].[web_sales]
(
	[ws_sold_date_sk] ASC,
	[ws_wholesale_cost] ASC,
	[ws_item_sk] ASC,
	[ws_bill_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_1_4] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_5_4] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_bill_customer_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_1] ON [dbo].[catalog_sales]([cs_item_sk], [cs_sold_date_sk])
go

-- ===== query054_0 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K14_K1_K5] ON [dbo].[customer]
(
	[c_birth_year] ASC,
	[c_customer_sk] ASC,
	[c_current_addr_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_5_4] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_4] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_4_16_20] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_item_sk], [cs_wholesale_cost])
go

-- ===== query054_0 / iter_07 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K20_K4_K16] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_wholesale_cost] ASC,
	[cs_bill_customer_sk] ASC,
	[cs_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query054_0 / iter_08 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K1_K9_K8] ON [dbo].[customer_address]
(
	[ca_address_sk] ASC,
	[ca_state] ASC,
	[ca_county] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query054_0 / iter_09 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K1_K4] ON [dbo].[date_dim]
(
	[d_date_sk] ASC,
	[d_month_seq] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query054_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K4_K12_K1_16] ON [dbo].[store_sales]
(
	[ss_customer_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_sold_date_sk] ASC
)
INCLUDE ( 	[ss_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_12_1] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_1_12] ON [dbo].[store_sales]([ss_customer_sk], [ss_sold_date_sk], [ss_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1173579219_1_13] ON [dbo].[item]([i_item_sk], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_1_11] ON [dbo].[item]([i_item_sk], [i_class])
go

CREATE STATISTICS [_dta_stat_1173579219_13_11_1] ON [dbo].[item]([i_category], [i_class], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_1] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_20_1] ON [dbo].[web_sales]([ws_item_sk], [ws_wholesale_cost], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_5_20_4] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_bill_customer_sk], [ws_wholesale_cost], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_981578535_4_7] ON [dbo].[date_dim]([d_month_seq], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_9_4] ON [dbo].[date_dim]([d_moy], [d_month_seq])
go

CREATE STATISTICS [_dta_stat_981578535_1_7_9] ON [dbo].[date_dim]([d_date_sk], [d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_1_4_7] ON [dbo].[date_dim]([d_date_sk], [d_month_seq], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_7_9_4_1] ON [dbo].[date_dim]([d_year], [d_moy], [d_month_seq], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_1_4_20] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_bill_customer_sk], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_16_20_1_4] ON [dbo].[catalog_sales]([cs_item_sk], [cs_wholesale_cost], [cs_sold_date_sk], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_917578307_1_9] ON [dbo].[customer_address]([ca_address_sk], [ca_state])
go

CREATE STATISTICS [_dta_stat_917578307_9_8_1] ON [dbo].[customer_address]([ca_state], [ca_county], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_14_1] ON [dbo].[customer]([c_birth_year], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5_14] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk], [c_birth_year])
go

-- ===== query054_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K11_K13_K1] ON [dbo].[item]
(
	[i_class] ASC,
	[i_category] ASC,
	[i_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query054_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K9_K4] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_moy] ASC,
	[d_month_seq] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query054_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K4_K20_K16] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_bill_customer_sk] ASC,
	[cs_wholesale_cost] ASC,
	[cs_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query054_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K1_K20_K4_K5] ON [dbo].[web_sales]
(
	[ws_sold_date_sk] ASC,
	[ws_wholesale_cost] ASC,
	[ws_item_sk] ASC,
	[ws_bill_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_1_4] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_5_4] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_bill_customer_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_1] ON [dbo].[catalog_sales]([cs_item_sk], [cs_sold_date_sk])
go

-- ===== query054_1 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K14_K1_K5] ON [dbo].[customer]
(
	[c_birth_year] ASC,
	[c_customer_sk] ASC,
	[c_current_addr_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_5_4] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_4] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_4_16_20] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_item_sk], [cs_wholesale_cost])
go

-- ===== query054_1 / iter_07 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K20_K4_K16] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_wholesale_cost] ASC,
	[cs_bill_customer_sk] ASC,
	[cs_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query054_1 / iter_08 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K1_K4] ON [dbo].[date_dim]
(
	[d_date_sk] ASC,
	[d_month_seq] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query058_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K1_K21_K5_K4_K18_24] ON [dbo].[web_sales]
(
	[ws_sold_date_sk] ASC,
	[ws_list_price] ASC,
	[ws_bill_customer_sk] ASC,
	[ws_item_sk] ASC,
	[ws_order_number] ASC
)
INCLUDE ( 	[ws_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_18_4_21] ON [dbo].[web_sales]([ws_order_number], [ws_item_sk], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_5_21_1] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_list_price], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_21_1] ON [dbo].[web_sales]([ws_item_sk], [ws_list_price], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_5_4_21_18] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_bill_customer_sk], [ws_item_sk], [ws_list_price], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21] ON [dbo].[item]([i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_2_21] ON [dbo].[item]([i_item_id], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_2] ON [dbo].[item]([i_item_sk], [i_item_id])
go

CREATE STATISTICS [_dta_stat_1173579219_21_2_1] ON [dbo].[item]([i_manager_id], [i_item_id], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_13_3] ON [dbo].[store_sales]([ss_list_price], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_13_3] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_list_price], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_13_4_3] ON [dbo].[store_sales]([ss_list_price], [ss_customer_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_1_4_13] ON [dbo].[store_sales]([ss_item_sk], [ss_sold_date_sk], [ss_customer_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_981578535_3_1] ON [dbo].[date_dim]([d_date], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_3_4_1] ON [dbo].[date_dim]([d_date], [d_month_seq], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_21] ON [dbo].[catalog_sales]([cs_item_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_16_1_4] ON [dbo].[catalog_sales]([cs_item_sk], [cs_sold_date_sk], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_4_21_16] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_list_price], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_21_1_16_4] ON [dbo].[catalog_sales]([cs_list_price], [cs_sold_date_sk], [cs_item_sk], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_14_1] ON [dbo].[customer]([c_birth_year], [c_customer_sk])
go

-- ===== query058_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K14_K1] ON [dbo].[customer]
(
	[c_birth_year] ASC,
	[c_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_21_5_4] ON [dbo].[web_sales]([ws_list_price], [ws_bill_customer_sk], [ws_item_sk])
go

-- ===== query058_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K21_K1_K2] ON [dbo].[item]
(
	[i_manager_id] ASC,
	[i_item_sk] ASC,
	[i_item_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_1_13_4] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_list_price], [ss_customer_sk])
go

-- ===== query058_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K3_K4_K1] ON [dbo].[date_dim]
(
	[d_date] ASC,
	[d_month_seq] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query058_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K21_K16_K4_24] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_list_price] ASC,
	[cs_item_sk] ASC,
	[cs_bill_customer_sk] ASC
)
INCLUDE ( 	[cs_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query058_0 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K4_K3_K1] ON [dbo].[date_dim]
(
	[d_month_seq] ASC,
	[d_date] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query058_0 / iter_07 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K13_K4_K3_16] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_list_price] ASC,
	[ss_customer_sk] ASC,
	[ss_item_sk] ASC
)
INCLUDE ( 	[ss_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_1_21_4] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_list_price], [cs_bill_customer_sk])
go

-- ===== query058_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K1_K21_K4_K5_24] ON [dbo].[web_sales]
(
	[ws_sold_date_sk] ASC,
	[ws_list_price] ASC,
	[ws_item_sk] ASC,
	[ws_bill_customer_sk] ASC
)
INCLUDE ( 	[ws_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_21_4] ON [dbo].[web_sales]([ws_list_price], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_4_5] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_item_sk], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_5_21_1_4] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_list_price], [ws_sold_date_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_1_2] ON [dbo].[item]([i_item_sk], [i_item_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21] ON [dbo].[item]([i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_2_21_1] ON [dbo].[item]([i_item_id], [i_manager_id], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_13] ON [dbo].[store_sales]([ss_item_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1653580929_4_13_3] ON [dbo].[store_sales]([ss_customer_sk], [ss_list_price], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_1_4] ON [dbo].[store_sales]([ss_item_sk], [ss_sold_date_sk], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_13_1_3_4] ON [dbo].[store_sales]([ss_list_price], [ss_sold_date_sk], [ss_item_sk], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_3] ON [dbo].[date_dim]([d_date_sk], [d_date])
go

CREATE STATISTICS [_dta_stat_981578535_4_3_1] ON [dbo].[date_dim]([d_month_seq], [d_date], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_21] ON [dbo].[catalog_sales]([cs_item_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_16_1_4] ON [dbo].[catalog_sales]([cs_item_sk], [cs_sold_date_sk], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_21_4_16] ON [dbo].[catalog_sales]([cs_list_price], [cs_bill_customer_sk], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_21_1_16_4] ON [dbo].[catalog_sales]([cs_list_price], [cs_sold_date_sk], [cs_item_sk], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_14_1] ON [dbo].[customer]([c_birth_year], [c_customer_sk])
go

-- ===== query058_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K14_K1] ON [dbo].[customer]
(
	[c_birth_year] ASC,
	[c_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query058_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K13_K4_K3_16] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_list_price] ASC,
	[ss_customer_sk] ASC,
	[ss_item_sk] ASC
)
INCLUDE ( 	[ss_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query058_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K21_K2_K1] ON [dbo].[item]
(
	[i_manager_id] ASC,
	[i_item_id] ASC,
	[i_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_21_4_5] ON [dbo].[web_sales]([ws_list_price], [ws_item_sk], [ws_bill_customer_sk])
go

-- ===== query058_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K4_K3_K1] ON [dbo].[date_dim]
(
	[d_month_seq] ASC,
	[d_date] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query058_1 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K21_K16_K4_24] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_list_price] ASC,
	[cs_item_sk] ASC,
	[cs_bill_customer_sk] ASC
)
INCLUDE ( 	[cs_ext_sales_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query058_1 / iter_07 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K3_K4_K1] ON [dbo].[date_dim]
(
	[d_date] ASC,
	[d_month_seq] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_1_21_4] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_list_price], [cs_bill_customer_sk])
go

-- ===== query059_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K14] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_sales_price] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_8_14] ON [dbo].[store_sales]([ss_store_sk], [ss_sales_price])
go

CREATE STATISTICS [_dta_stat_1653580929_8_1_14] ON [dbo].[store_sales]([ss_store_sk], [ss_sold_date_sk], [ss_sales_price])
go

CREATE STATISTICS [_dta_stat_981578535_5_4] ON [dbo].[date_dim]([d_week_seq], [d_month_seq])
go

CREATE STATISTICS [_dta_stat_981578535_1_5] ON [dbo].[date_dim]([d_date_sk], [d_week_seq])
go

CREATE STATISTICS [_dta_stat_981578535_1_4_5] ON [dbo].[date_dim]([d_date_sk], [d_month_seq], [d_week_seq])
go

-- ===== query059_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K14_K3_K10_K8_13] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_sales_price] ASC,
	[ss_item_sk] ASC,
	[ss_ticket_number] ASC,
	[ss_store_sk] ASC
)
INCLUDE ( 	[ss_list_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_8_3] ON [dbo].[store_sales]([ss_store_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_10_8_1] ON [dbo].[store_sales]([ss_ticket_number], [ss_store_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_3_10] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_item_sk], [ss_ticket_number])
go

CREATE STATISTICS [_dta_stat_1653580929_8_1_3] ON [dbo].[store_sales]([ss_store_sk], [ss_sold_date_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_14_3_10_1] ON [dbo].[store_sales]([ss_sales_price], [ss_item_sk], [ss_ticket_number], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_8_14_1_3] ON [dbo].[store_sales]([ss_store_sk], [ss_sales_price], [ss_sold_date_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_10_8_1_14] ON [dbo].[store_sales]([ss_item_sk], [ss_ticket_number], [ss_store_sk], [ss_sold_date_sk], [ss_sales_price])
go

-- ===== query059_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K4_K5_K1_15] ON [dbo].[date_dim]
(
	[d_month_seq] ASC,
	[d_week_seq] ASC,
	[d_date_sk] ASC
)
INCLUDE ( 	[d_day_name]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query059_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K8_K1_K14] ON [dbo].[store_sales]
(
	[ss_store_sk] ASC,
	[ss_sold_date_sk] ASC,
	[ss_sales_price] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_8_14] ON [dbo].[store_sales]([ss_store_sk], [ss_sales_price])
go

CREATE STATISTICS [_dta_stat_1653580929_1_14] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_sales_price])
go

CREATE STATISTICS [_dta_stat_981578535_5_4] ON [dbo].[date_dim]([d_week_seq], [d_month_seq])
go

CREATE STATISTICS [_dta_stat_981578535_1_5] ON [dbo].[date_dim]([d_date_sk], [d_week_seq])
go

CREATE STATISTICS [_dta_stat_981578535_1_4_5] ON [dbo].[date_dim]([d_date_sk], [d_month_seq], [d_week_seq])
go

-- ===== query064_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K12_K4_K6_K3_K10_K9_K8_K5_K7_13_20] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_customer_sk] ASC,
	[ss_hdemo_sk] ASC,
	[ss_item_sk] ASC,
	[ss_ticket_number] ASC,
	[ss_promo_sk] ASC,
	[ss_store_sk] ASC,
	[ss_cdemo_sk] ASC,
	[ss_addr_sk] ASC
)
INCLUDE ( 	[ss_list_price],
	[ss_coupon_amt]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_4_12] ON [dbo].[store_sales]([ss_customer_sk], [ss_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1653580929_6_12_4] ON [dbo].[store_sales]([ss_hdemo_sk], [ss_wholesale_cost], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_3_4_6] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_item_sk], [ss_customer_sk], [ss_hdemo_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_9_4_6_3] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_promo_sk], [ss_customer_sk], [ss_hdemo_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_10_12_4_6_3_9_1] ON [dbo].[store_sales]([ss_ticket_number], [ss_wholesale_cost], [ss_customer_sk], [ss_hdemo_sk], [ss_item_sk], [ss_promo_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_5_12_4_6_3_10_9_1] ON [dbo].[store_sales]([ss_cdemo_sk], [ss_wholesale_cost], [ss_customer_sk], [ss_hdemo_sk], [ss_item_sk], [ss_ticket_number], [ss_promo_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_7_12_4_6_3_10_9_1_8] ON [dbo].[store_sales]([ss_addr_sk], [ss_wholesale_cost], [ss_customer_sk], [ss_hdemo_sk], [ss_item_sk], [ss_ticket_number], [ss_promo_sk], [ss_sold_date_sk], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_6_3_10_9_1_8_5_7] ON [dbo].[store_sales]([ss_customer_sk], [ss_hdemo_sk], [ss_item_sk], [ss_ticket_number], [ss_promo_sk], [ss_sold_date_sk], [ss_store_sk], [ss_cdemo_sk], [ss_addr_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_8_12_4_6_3_10_9_1_5_7] ON [dbo].[store_sales]([ss_store_sk], [ss_wholesale_cost], [ss_customer_sk], [ss_hdemo_sk], [ss_item_sk], [ss_ticket_number], [ss_promo_sk], [ss_sold_date_sk], [ss_cdemo_sk], [ss_addr_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_22_6] ON [dbo].[item]([i_product_name], [i_current_price])
go

CREATE STATISTICS [_dta_stat_1173579219_6_1_22] ON [dbo].[item]([i_current_price], [i_item_sk], [i_product_name])
go

CREATE STATISTICS [_dta_stat_1429580131_10_12] ON [dbo].[promotion]([p_channel_email], [p_channel_tv])
go

CREATE STATISTICS [_dta_stat_1429580131_12_1] ON [dbo].[promotion]([p_channel_tv], [p_promo_sk])
go

CREATE STATISTICS [_dta_stat_1429580131_10_13_12] ON [dbo].[promotion]([p_channel_email], [p_channel_radio], [p_channel_tv])
go

CREATE STATISTICS [_dta_stat_1429580131_13_1_10] ON [dbo].[promotion]([p_channel_radio], [p_promo_sk], [p_channel_email])
go

CREATE STATISTICS [_dta_stat_1429580131_1_10_12_13] ON [dbo].[promotion]([p_promo_sk], [p_channel_email], [p_channel_tv], [p_channel_radio])
go

CREATE STATISTICS [_dta_stat_1365579903_1_2] ON [dbo].[household_demographics]([hd_demo_sk], [hd_income_band_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_16] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_18_20_16] ON [dbo].[catalog_sales]([cs_order_number], [cs_wholesale_cost], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_917578307_3_4_7_10_9] ON [dbo].[customer_address]([ca_street_number], [ca_street_name], [ca_city], [ca_zip], [ca_state])
go

CREATE STATISTICS [_dta_stat_917578307_1_3_4_7_10] ON [dbo].[customer_address]([ca_address_sk], [ca_street_number], [ca_street_name], [ca_city], [ca_zip])
go

CREATE STATISTICS [_dta_stat_917578307_9_1_3_4_7_10] ON [dbo].[customer_address]([ca_state], [ca_address_sk], [ca_street_number], [ca_street_name], [ca_city], [ca_zip])
go

CREATE STATISTICS [_dta_stat_949578421_1_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_3] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_3_4_1] ON [dbo].[customer_demographics]([cd_marital_status], [cd_education_status], [cd_demo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_4_1] ON [dbo].[customer]([c_current_hdemo_sk], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_6_7_1_5] ON [dbo].[customer]([c_first_shipto_date_sk], [c_first_sales_date_sk], [c_customer_sk], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_3_1_5_4_6] ON [dbo].[customer]([c_current_cdemo_sk], [c_customer_sk], [c_current_addr_sk], [c_current_hdemo_sk], [c_first_shipto_date_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5_4_6_7_3] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk], [c_current_hdemo_sk], [c_first_shipto_date_sk], [c_first_sales_date_sk], [c_current_cdemo_sk])
go

-- ===== query064_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_returns_6_1525580473__K3_K17_24_25_26] ON [dbo].[catalog_returns]
(
	[cr_item_sk] ASC,
	[cr_order_number] ASC
)
INCLUDE ( 	[cr_refunded_cash],
	[cr_reversed_charge],
	[cr_store_credit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query064_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K6] ON [dbo].[item]
(
	[i_current_price] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_12_9_4_3_10] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_promo_sk], [ss_customer_sk], [ss_item_sk], [ss_ticket_number])
go

CREATE STATISTICS [_dta_stat_1653580929_12_5_4_3_10_6_9_8] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_cdemo_sk], [ss_customer_sk], [ss_item_sk], [ss_ticket_number], [ss_hdemo_sk], [ss_promo_sk], [ss_store_sk])
go

-- ===== query064_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K20_K16_K18_26] ON [dbo].[catalog_sales]
(
	[cs_wholesale_cost] ASC,
	[cs_item_sk] ASC,
	[cs_order_number] ASC
)
INCLUDE ( 	[cs_ext_list_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query064_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K16_K20_K18_26] ON [dbo].[catalog_sales]
(
	[cs_item_sk] ASC,
	[cs_wholesale_cost] ASC,
	[cs_order_number] ASC
)
INCLUDE ( 	[cs_ext_list_price]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query064_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K12_K4_K9_K5_K1_K3_K10_K7_K6_K8_13_20] ON [dbo].[store_sales]
(
	[ss_wholesale_cost] ASC,
	[ss_customer_sk] ASC,
	[ss_promo_sk] ASC,
	[ss_cdemo_sk] ASC,
	[ss_sold_date_sk] ASC,
	[ss_item_sk] ASC,
	[ss_ticket_number] ASC,
	[ss_addr_sk] ASC,
	[ss_hdemo_sk] ASC,
	[ss_store_sk] ASC
)
INCLUDE ( 	[ss_list_price],
	[ss_coupon_amt]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_9_12] ON [dbo].[store_sales]([ss_promo_sk], [ss_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1653580929_5_12_9] ON [dbo].[store_sales]([ss_cdemo_sk], [ss_wholesale_cost], [ss_promo_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_12_9_5] ON [dbo].[store_sales]([ss_item_sk], [ss_wholesale_cost], [ss_promo_sk], [ss_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_3_10_9_5] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_item_sk], [ss_ticket_number], [ss_promo_sk], [ss_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_1_9_5_3_10_4] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_sold_date_sk], [ss_promo_sk], [ss_cdemo_sk], [ss_item_sk], [ss_ticket_number], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_6_9_5_1_3_10_4] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_hdemo_sk], [ss_promo_sk], [ss_cdemo_sk], [ss_sold_date_sk], [ss_item_sk], [ss_ticket_number], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_9_5_1_3_10_4_7_6_8] ON [dbo].[store_sales]([ss_promo_sk], [ss_cdemo_sk], [ss_sold_date_sk], [ss_item_sk], [ss_ticket_number], [ss_customer_sk], [ss_addr_sk], [ss_hdemo_sk], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_8_9_5_1_3_10_4_7] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_store_sk], [ss_promo_sk], [ss_cdemo_sk], [ss_sold_date_sk], [ss_item_sk], [ss_ticket_number], [ss_customer_sk], [ss_addr_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_7_9_5_1_3_10_4_6_8] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_addr_sk], [ss_promo_sk], [ss_cdemo_sk], [ss_sold_date_sk], [ss_item_sk], [ss_ticket_number], [ss_customer_sk], [ss_hdemo_sk], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_1_6] ON [dbo].[item]([i_item_sk], [i_current_price])
go

CREATE STATISTICS [_dta_stat_1173579219_22_6_1] ON [dbo].[item]([i_product_name], [i_current_price], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1429580131_10_12] ON [dbo].[promotion]([p_channel_email], [p_channel_tv])
go

CREATE STATISTICS [_dta_stat_1429580131_10_1] ON [dbo].[promotion]([p_channel_email], [p_promo_sk])
go

CREATE STATISTICS [_dta_stat_1429580131_12_1_10] ON [dbo].[promotion]([p_channel_tv], [p_promo_sk], [p_channel_email])
go

CREATE STATISTICS [_dta_stat_1429580131_13_12_10] ON [dbo].[promotion]([p_channel_radio], [p_channel_tv], [p_channel_email])
go

CREATE STATISTICS [_dta_stat_1429580131_1_13_12_10] ON [dbo].[promotion]([p_promo_sk], [p_channel_radio], [p_channel_tv], [p_channel_email])
go

CREATE STATISTICS [_dta_stat_1365579903_2_1] ON [dbo].[household_demographics]([hd_income_band_sk], [hd_demo_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_16_18] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_item_sk], [cs_order_number])
go

CREATE STATISTICS [_dta_stat_917578307_3_4_7_10_9] ON [dbo].[customer_address]([ca_street_number], [ca_street_name], [ca_city], [ca_zip], [ca_state])
go

CREATE STATISTICS [_dta_stat_917578307_1_3_4_7_10] ON [dbo].[customer_address]([ca_address_sk], [ca_street_number], [ca_street_name], [ca_city], [ca_zip])
go

CREATE STATISTICS [_dta_stat_917578307_9_1_3_4_7_10] ON [dbo].[customer_address]([ca_state], [ca_address_sk], [ca_street_number], [ca_street_name], [ca_city], [ca_zip])
go

CREATE STATISTICS [_dta_stat_949578421_1_3] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_4_1] ON [dbo].[customer_demographics]([cd_education_status], [cd_demo_sk])
go

CREATE STATISTICS [_dta_stat_949578421_3_4_1] ON [dbo].[customer_demographics]([cd_marital_status], [cd_education_status], [cd_demo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_6_7_5_1] ON [dbo].[customer]([c_first_shipto_date_sk], [c_first_sales_date_sk], [c_current_addr_sk], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_3_5_1_6_7] ON [dbo].[customer]([c_current_cdemo_sk], [c_current_addr_sk], [c_customer_sk], [c_first_shipto_date_sk], [c_first_sales_date_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_4_5_1_3_6_7] ON [dbo].[customer]([c_current_hdemo_sk], [c_current_addr_sk], [c_customer_sk], [c_current_cdemo_sk], [c_first_shipto_date_sk], [c_first_sales_date_sk])
go

-- ===== query064_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K6_K7_K5_K1_K3_K4] ON [dbo].[customer]
(
	[c_first_shipto_date_sk] ASC,
	[c_first_sales_date_sk] ASC,
	[c_current_addr_sk] ASC,
	[c_customer_sk] ASC,
	[c_current_cdemo_sk] ASC,
	[c_current_hdemo_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query069_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K13_K4] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_list_price] ASC,
	[ss_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_4_13] ON [dbo].[store_sales]([ss_customer_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1653580929_4_1] ON [dbo].[store_sales]([ss_customer_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_13_1_4] ON [dbo].[store_sales]([ss_list_price], [ss_sold_date_sk], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_21_5] ON [dbo].[web_sales]([ws_list_price], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_21_1] ON [dbo].[web_sales]([ws_list_price], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_5_1_21] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_sold_date_sk], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_981578535_9_1] ON [dbo].[date_dim]([d_moy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_7_9_1] ON [dbo].[date_dim]([d_year], [d_moy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_8_1] ON [dbo].[catalog_sales]([cs_ship_customer_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_1_21] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_8_21_1] ON [dbo].[catalog_sales]([cs_ship_customer_sk], [cs_list_price], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_917578307_9_1] ON [dbo].[customer_address]([ca_state], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_949578421_1_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_2_3_4_5_6] ON [dbo].[customer_demographics]([cd_gender], [cd_marital_status], [cd_education_status], [cd_purchase_estimate], [cd_credit_rating])
go

CREATE STATISTICS [_dta_stat_949578421_4_3_1_2_5_6] ON [dbo].[customer_demographics]([cd_education_status], [cd_marital_status], [cd_demo_sk], [cd_gender], [cd_purchase_estimate], [cd_credit_rating])
go

CREATE STATISTICS [_dta_stat_1269579561_3_1] ON [dbo].[customer]([c_current_cdemo_sk], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_5_1_3] ON [dbo].[customer]([c_current_addr_sk], [c_customer_sk], [c_current_cdemo_sk])
go

-- ===== query069_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K21_K8] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_list_price] ASC,
	[cs_ship_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query069_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K1_K21_K5] ON [dbo].[web_sales]
(
	[ws_sold_date_sk] ASC,
	[ws_list_price] ASC,
	[ws_bill_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_949578421_3_1] ON [dbo].[customer_demographics]([cd_marital_status], [cd_demo_sk])
go

-- ===== query069_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K9_1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_moy] ASC
)
INCLUDE ( 	[d_date_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query069_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K5_K1_K3] ON [dbo].[customer]
(
	[c_current_addr_sk] ASC,
	[c_customer_sk] ASC,
	[c_current_cdemo_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query069_0 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9] ON [dbo].[customer_address]
(
	[ca_state] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query069_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K13_K4] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_list_price] ASC,
	[ss_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_13_4] ON [dbo].[store_sales]([ss_list_price], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_1] ON [dbo].[store_sales]([ss_customer_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_21_1] ON [dbo].[web_sales]([ws_list_price], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_5_1] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_21_5_1] ON [dbo].[web_sales]([ws_list_price], [ws_bill_customer_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_9_1] ON [dbo].[date_dim]([d_moy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_9] ON [dbo].[date_dim]([d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_981578535_1_7_9] ON [dbo].[date_dim]([d_date_sk], [d_year], [d_moy])
go

CREATE STATISTICS [_dta_stat_1621580815_8_1] ON [dbo].[catalog_sales]([cs_ship_customer_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_21_1] ON [dbo].[catalog_sales]([cs_list_price], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_21_8_1] ON [dbo].[catalog_sales]([cs_list_price], [cs_ship_customer_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_917578307_1_9] ON [dbo].[customer_address]([ca_address_sk], [ca_state])
go

CREATE STATISTICS [_dta_stat_949578421_1_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_3] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_2_3_4_5_6] ON [dbo].[customer_demographics]([cd_gender], [cd_marital_status], [cd_education_status], [cd_purchase_estimate], [cd_credit_rating])
go

CREATE STATISTICS [_dta_stat_949578421_3_4_1_2_5_6] ON [dbo].[customer_demographics]([cd_marital_status], [cd_education_status], [cd_demo_sk], [cd_gender], [cd_purchase_estimate], [cd_credit_rating])
go

CREATE STATISTICS [_dta_stat_1269579561_5_1] ON [dbo].[customer]([c_current_addr_sk], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_3_5] ON [dbo].[customer]([c_customer_sk], [c_current_cdemo_sk], [c_current_addr_sk])
go

-- ===== query069_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K21_K8] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_list_price] ASC,
	[cs_ship_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query069_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K1_K21_K5] ON [dbo].[web_sales]
(
	[ws_sold_date_sk] ASC,
	[ws_list_price] ASC,
	[ws_bill_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query069_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_demographics_6_949578421__K4_K3_K1_K2_K5_K6] ON [dbo].[customer_demographics]
(
	[cd_education_status] ASC,
	[cd_marital_status] ASC,
	[cd_demo_sk] ASC,
	[cd_gender] ASC,
	[cd_purchase_estimate] ASC,
	[cd_credit_rating] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query069_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K3_K1_K5] ON [dbo].[customer]
(
	[c_current_cdemo_sk] ASC,
	[c_customer_sk] ASC,
	[c_current_addr_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query069_1 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9] ON [dbo].[customer_address]
(
	[ca_state] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query069_1 / iter_07 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K9_1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_moy] ASC
)
INCLUDE ( 	[d_date_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query072_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K5_K20_K6_K1_K16_K3_K17_19] ON [dbo].[catalog_sales]
(
	[cs_bill_cdemo_sk] ASC,
	[cs_wholesale_cost] ASC,
	[cs_bill_hdemo_sk] ASC,
	[cs_sold_date_sk] ASC,
	[cs_item_sk] ASC,
	[cs_ship_date_sk] ASC,
	[cs_promo_sk] ASC
)
INCLUDE ( 	[cs_quantity]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_20_5] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_bill_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_6_5_1] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_bill_hdemo_sk], [cs_bill_cdemo_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_1_3_20_6_5] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_ship_date_sk], [cs_wholesale_cost], [cs_bill_hdemo_sk], [cs_bill_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_17_6_5_1_16] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_promo_sk], [cs_bill_hdemo_sk], [cs_bill_cdemo_sk], [cs_sold_date_sk], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_6_5_1_16_3_17] ON [dbo].[catalog_sales]([cs_bill_hdemo_sk], [cs_bill_cdemo_sk], [cs_sold_date_sk], [cs_item_sk], [cs_ship_date_sk], [cs_promo_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_20_6_5_1_3_17] ON [dbo].[catalog_sales]([cs_item_sk], [cs_wholesale_cost], [cs_bill_hdemo_sk], [cs_bill_cdemo_sk], [cs_sold_date_sk], [cs_ship_date_sk], [cs_promo_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_5_13] ON [dbo].[item]([i_item_desc], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_13_1_5] ON [dbo].[item]([i_category], [i_item_sk], [i_item_desc])
go

CREATE STATISTICS [_dta_stat_1365579903_1_3] ON [dbo].[household_demographics]([hd_demo_sk], [hd_buy_potential])
go

CREATE STATISTICS [_dta_stat_981578535_5_7] ON [dbo].[date_dim]([d_week_seq], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_3_1_5] ON [dbo].[date_dim]([d_date], [d_date_sk], [d_week_seq])
go

CREATE STATISTICS [_dta_stat_981578535_7_3_1] ON [dbo].[date_dim]([d_year], [d_date], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_3_5] ON [dbo].[date_dim]([d_year], [d_date], [d_week_seq])
go

CREATE STATISTICS [_dta_stat_981578535_1_5_7_3] ON [dbo].[date_dim]([d_date_sk], [d_week_seq], [d_year], [d_date])
go

CREATE STATISTICS [_dta_stat_1493580359_3_2] ON [dbo].[inventory]([inv_warehouse_sk], [inv_item_sk])
go

CREATE STATISTICS [_dta_stat_949578421_7_3] ON [dbo].[customer_demographics]([cd_dep_count], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_7] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_dep_count])
go

CREATE STATISTICS [_dta_stat_949578421_3_1_7] ON [dbo].[customer_demographics]([cd_marital_status], [cd_demo_sk], [cd_dep_count])
go

-- ===== query072_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_inventory_6_1493580359__K2_K3_K1_4] ON [dbo].[inventory]
(
	[inv_item_sk] ASC,
	[inv_warehouse_sk] ASC,
	[inv_date_sk] ASC
)
INCLUDE ( 	[inv_quantity_on_hand]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1493580359_1_3] ON [dbo].[inventory]([inv_date_sk], [inv_warehouse_sk])
go

CREATE STATISTICS [_dta_stat_1365579903_4_1_3] ON [dbo].[household_demographics]([hd_dep_count], [hd_demo_sk], [hd_buy_potential])
go

CREATE STATISTICS [_dta_stat_1621580815_20_3] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_16_5] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_item_sk], [cs_bill_cdemo_sk])
go

-- ===== query072_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_demographics_6_949578421__K3_K7_K1] ON [dbo].[customer_demographics]
(
	[cd_marital_status] ASC,
	[cd_dep_count] ASC,
	[cd_demo_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_16_19] ON [dbo].[catalog_sales]([cs_item_sk], [cs_quantity])
go

CREATE STATISTICS [_dta_stat_1621580815_5_20_1] ON [dbo].[catalog_sales]([cs_bill_cdemo_sk], [cs_wholesale_cost], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_20_1_5] ON [dbo].[catalog_sales]([cs_item_sk], [cs_wholesale_cost], [cs_sold_date_sk], [cs_bill_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1_3_5_16] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk], [cs_ship_date_sk], [cs_bill_cdemo_sk], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_6_1_5_16_19] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_bill_hdemo_sk], [cs_sold_date_sk], [cs_bill_cdemo_sk], [cs_item_sk], [cs_quantity])
go

CREATE STATISTICS [_dta_stat_1621580815_20_16_19_1_5_3_6] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_item_sk], [cs_quantity], [cs_sold_date_sk], [cs_bill_cdemo_sk], [cs_ship_date_sk], [cs_bill_hdemo_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_1_5_16_19_3_6_17] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_bill_cdemo_sk], [cs_item_sk], [cs_quantity], [cs_ship_date_sk], [cs_bill_hdemo_sk], [cs_promo_sk])
go

CREATE STATISTICS [_dta_stat_1493580359_2_4] ON [dbo].[inventory]([inv_item_sk], [inv_quantity_on_hand])
go

CREATE STATISTICS [_dta_stat_1493580359_3_2_4] ON [dbo].[inventory]([inv_warehouse_sk], [inv_item_sk], [inv_quantity_on_hand])
go

-- ===== query072_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K1_K5] ON [dbo].[item]
(
	[i_category] ASC,
	[i_item_sk] ASC,
	[i_item_desc] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_20_17_1_5_16_19_3] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_promo_sk], [cs_sold_date_sk], [cs_bill_cdemo_sk], [cs_item_sk], [cs_quantity], [cs_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_1493580359_1_2_4] ON [dbo].[inventory]([inv_date_sk], [inv_item_sk], [inv_quantity_on_hand])
go

-- ===== query072_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_inventory_6_1493580359__K2_K4_K1_K3] ON [dbo].[inventory]
(
	[inv_item_sk] ASC,
	[inv_quantity_on_hand] ASC,
	[inv_date_sk] ASC,
	[inv_warehouse_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query072_0 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1_K5_3] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC,
	[d_week_seq] ASC
)
INCLUDE ( 	[d_date]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query072_0 / iter_07 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K1_K5_K7_3] ON [dbo].[date_dim]
(
	[d_date_sk] ASC,
	[d_week_seq] ASC,
	[d_year] ASC
)
INCLUDE ( 	[d_date]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query072_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K20_K1_K3_K17_K6_K16_K5_19] ON [dbo].[catalog_sales]
(
	[cs_wholesale_cost] ASC,
	[cs_sold_date_sk] ASC,
	[cs_ship_date_sk] ASC,
	[cs_promo_sk] ASC,
	[cs_bill_hdemo_sk] ASC,
	[cs_item_sk] ASC,
	[cs_bill_cdemo_sk] ASC
)
INCLUDE ( 	[cs_quantity]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_20_3] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_6] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_bill_hdemo_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_1_3] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_17_6_3] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_promo_sk], [cs_bill_hdemo_sk], [cs_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_16_17_6_3] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_item_sk], [cs_promo_sk], [cs_bill_hdemo_sk], [cs_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_17_6_3_1_16_5] ON [dbo].[catalog_sales]([cs_promo_sk], [cs_bill_hdemo_sk], [cs_ship_date_sk], [cs_sold_date_sk], [cs_item_sk], [cs_bill_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_5_20_17_6_3_1] ON [dbo].[catalog_sales]([cs_bill_cdemo_sk], [cs_wholesale_cost], [cs_promo_sk], [cs_bill_hdemo_sk], [cs_ship_date_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_5_13] ON [dbo].[item]([i_item_desc], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_1_13_5] ON [dbo].[item]([i_item_sk], [i_category], [i_item_desc])
go

CREATE STATISTICS [_dta_stat_1365579903_1_3] ON [dbo].[household_demographics]([hd_demo_sk], [hd_buy_potential])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_1_5] ON [dbo].[date_dim]([d_date_sk], [d_week_seq])
go

CREATE STATISTICS [_dta_stat_981578535_5_7_1] ON [dbo].[date_dim]([d_week_seq], [d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1493580359_3_2] ON [dbo].[inventory]([inv_warehouse_sk], [inv_item_sk])
go

CREATE STATISTICS [_dta_stat_949578421_3_7] ON [dbo].[customer_demographics]([cd_marital_status], [cd_dep_count])
go

CREATE STATISTICS [_dta_stat_949578421_1_3] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_7_3] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_dep_count], [cd_marital_status])
go

-- ===== query072_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_demographics_6_949578421__K3_K7_1] ON [dbo].[customer_demographics]
(
	[cd_marital_status] ASC,
	[cd_dep_count] ASC
)
INCLUDE ( 	[cd_demo_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_16_20_17_6_3_5] ON [dbo].[catalog_sales]([cs_item_sk], [cs_wholesale_cost], [cs_promo_sk], [cs_bill_hdemo_sk], [cs_ship_date_sk], [cs_bill_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1493580359_1_3] ON [dbo].[inventory]([inv_date_sk], [inv_warehouse_sk])
go

-- ===== query072_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K1_K5] ON [dbo].[item]
(
	[i_category] ASC,
	[i_item_sk] ASC,
	[i_item_desc] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query072_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K5_K1_3] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_week_seq] ASC,
	[d_date_sk] ASC
)
INCLUDE ( 	[d_date]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query075_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_returns_6_1333579789__K9_3_10_11_12] ON [dbo].[store_returns]
(
	[sr_reason_sk] ASC
)
INCLUDE ( 	[sr_item_sk],
	[sr_ticket_number],
	[sr_return_quantity],
	[sr_return_amt]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_3_9_10] ON [dbo].[store_returns]([sr_item_sk], [sr_reason_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1525580473_16_3_17] ON [dbo].[catalog_returns]([cr_reason_sk], [cr_item_sk], [cr_order_number])
go

CREATE STATISTICS [_dta_stat_1173579219_8_10_12_14_13] ON [dbo].[item]([i_brand_id], [i_class_id], [i_category_id], [i_manufact_id], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_13_1_8_10_12_14] ON [dbo].[item]([i_category], [i_item_sk], [i_brand_id], [i_class_id], [i_category_id], [i_manufact_id])
go

CREATE STATISTICS [_dta_stat_1589580701_4_22] ON [dbo].[web_sales]([ws_item_sk], [ws_sales_price])
go

CREATE STATISTICS [_dta_stat_1589580701_22_1_4] ON [dbo].[web_sales]([ws_sales_price], [ws_sold_date_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_18_1] ON [dbo].[web_sales]([ws_item_sk], [ws_order_number], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_18_22_1] ON [dbo].[web_sales]([ws_item_sk], [ws_order_number], [ws_sales_price], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_14_1] ON [dbo].[store_sales]([ss_sales_price], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_14_1] ON [dbo].[store_sales]([ss_item_sk], [ss_sales_price], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_14_3_10] ON [dbo].[store_sales]([ss_sales_price], [ss_item_sk], [ss_ticket_number])
go

CREATE STATISTICS [_dta_stat_1653580929_1_3_10_14] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_item_sk], [ss_ticket_number], [ss_sales_price])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_1621580815_16_22] ON [dbo].[catalog_sales]([cs_item_sk], [cs_sales_price])
go

CREATE STATISTICS [_dta_stat_1621580815_16_18_1] ON [dbo].[catalog_sales]([cs_item_sk], [cs_order_number], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_22_1_16] ON [dbo].[catalog_sales]([cs_sales_price], [cs_sold_date_sk], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_18_22_1] ON [dbo].[catalog_sales]([cs_item_sk], [cs_order_number], [cs_sales_price], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_3_13_14] ON [dbo].[web_returns]([wr_item_sk], [wr_reason_sk], [wr_order_number])
go

-- ===== query075_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K8_K10_K12_K14_K13_1] ON [dbo].[item]
(
	[i_brand_id] ASC,
	[i_class_id] ASC,
	[i_category_id] ASC,
	[i_manufact_id] ASC,
	[i_category] ASC
)
INCLUDE ( 	[i_item_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query075_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_returns_6_1525580473__K16_K3_K17_18_19] ON [dbo].[catalog_returns]
(
	[cr_reason_sk] ASC,
	[cr_item_sk] ASC,
	[cr_order_number] ASC
)
INCLUDE ( 	[cr_return_quantity],
	[cr_return_amount]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_10_14_8] ON [dbo].[item]([i_class_id], [i_manufact_id], [i_brand_id])
go

CREATE STATISTICS [_dta_stat_1173579219_12_1_13_8] ON [dbo].[item]([i_category_id], [i_item_sk], [i_category], [i_brand_id])
go

CREATE STATISTICS [_dta_stat_1173579219_13_8_10_12] ON [dbo].[item]([i_category], [i_brand_id], [i_class_id], [i_category_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_10_14_8_12] ON [dbo].[item]([i_item_sk], [i_class_id], [i_manufact_id], [i_brand_id], [i_category_id])
go

CREATE STATISTICS [_dta_stat_1173579219_14_1_13_8_10] ON [dbo].[item]([i_manufact_id], [i_item_sk], [i_category], [i_brand_id], [i_class_id])
go

-- ===== query075_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_returns_6_1557580587__K13_3_14_15_16] ON [dbo].[web_returns]
(
	[wr_reason_sk] ASC
)
INCLUDE ( 	[wr_item_sk],
	[wr_order_number],
	[wr_return_quantity],
	[wr_return_amt]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_10_1_13] ON [dbo].[item]([i_class_id], [i_item_sk], [i_category])
go

-- ===== query075_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K1_K8_K10_K12_K14] ON [dbo].[item]
(
	[i_category] ASC,
	[i_item_sk] ASC,
	[i_brand_id] ASC,
	[i_class_id] ASC,
	[i_category_id] ASC,
	[i_manufact_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_13_8_10_12] ON [dbo].[item]([i_category], [i_brand_id], [i_class_id], [i_category_id])
go

CREATE STATISTICS [_dta_stat_1173579219_8_10_12_14_13] ON [dbo].[item]([i_brand_id], [i_class_id], [i_category_id], [i_manufact_id], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_1_13_8_10_12_14] ON [dbo].[item]([i_item_sk], [i_category], [i_brand_id], [i_class_id], [i_category_id], [i_manufact_id])
go

CREATE STATISTICS [_dta_stat_1333579789_3_9_10] ON [dbo].[store_returns]([sr_item_sk], [sr_reason_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1525580473_16_17] ON [dbo].[catalog_returns]([cr_reason_sk], [cr_order_number])
go

CREATE STATISTICS [_dta_stat_1525580473_16_3_17] ON [dbo].[catalog_returns]([cr_reason_sk], [cr_item_sk], [cr_order_number])
go

CREATE STATISTICS [_dta_stat_1589580701_22_4_18] ON [dbo].[web_sales]([ws_sales_price], [ws_item_sk], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_1589580701_1_22_4] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_sales_price], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_18_1_22] ON [dbo].[web_sales]([ws_item_sk], [ws_order_number], [ws_sold_date_sk], [ws_sales_price])
go

CREATE STATISTICS [_dta_stat_1653580929_3_10_1] ON [dbo].[store_sales]([ss_item_sk], [ss_ticket_number], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_14_1_3] ON [dbo].[store_sales]([ss_sales_price], [ss_sold_date_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_14_3_10_1] ON [dbo].[store_sales]([ss_sales_price], [ss_item_sk], [ss_ticket_number], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_22_18] ON [dbo].[catalog_sales]([cs_sales_price], [cs_order_number])
go

CREATE STATISTICS [_dta_stat_1621580815_1_22_16] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_sales_price], [cs_item_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_22_16_18] ON [dbo].[catalog_sales]([cs_sales_price], [cs_item_sk], [cs_order_number])
go

CREATE STATISTICS [_dta_stat_1621580815_1_16_18_22] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_item_sk], [cs_order_number], [cs_sales_price])
go

CREATE STATISTICS [_dta_stat_1557580587_3_13_14] ON [dbo].[web_returns]([wr_item_sk], [wr_reason_sk], [wr_order_number])
go

-- ===== query075_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_returns_6_1333579789__K9_3_10_11_12] ON [dbo].[store_returns]
(
	[sr_reason_sk] ASC
)
INCLUDE ( 	[sr_item_sk],
	[sr_ticket_number],
	[sr_return_quantity],
	[sr_return_amt]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_10_14_8] ON [dbo].[item]([i_class_id], [i_manufact_id], [i_brand_id])
go

CREATE STATISTICS [_dta_stat_1173579219_14_13_1_8_10] ON [dbo].[item]([i_manufact_id], [i_category], [i_item_sk], [i_brand_id], [i_class_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_10_14_8_12] ON [dbo].[item]([i_item_sk], [i_class_id], [i_manufact_id], [i_brand_id], [i_category_id])
go

-- ===== query075_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_returns_6_1525580473__K16_K3_K17_18_19] ON [dbo].[catalog_returns]
(
	[cr_reason_sk] ASC,
	[cr_item_sk] ASC,
	[cr_order_number] ASC
)
INCLUDE ( 	[cr_return_quantity],
	[cr_return_amount]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_10_13_1] ON [dbo].[item]([i_class_id], [i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_12_13_1_8] ON [dbo].[item]([i_category_id], [i_category], [i_item_sk], [i_brand_id])
go

-- ===== query075_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_returns_6_1557580587__K13_3_14_15_16] ON [dbo].[web_returns]
(
	[wr_reason_sk] ASC
)
INCLUDE ( 	[wr_item_sk],
	[wr_order_number],
	[wr_return_quantity],
	[wr_return_amt]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_1_22_18] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_sales_price], [cs_order_number])
go

-- ===== query080_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K12_K8_K3_K9_K10_16_23] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_store_sk] ASC,
	[ss_item_sk] ASC,
	[ss_promo_sk] ASC,
	[ss_ticket_number] ASC
)
INCLUDE ( 	[ss_ext_sales_price],
	[ss_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_8_12_3] ON [dbo].[store_sales]([ss_store_sk], [ss_wholesale_cost], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_8_3_9_1_10] ON [dbo].[store_sales]([ss_store_sk], [ss_item_sk], [ss_promo_sk], [ss_sold_date_sk], [ss_ticket_number])
go

CREATE STATISTICS [_dta_stat_1653580929_12_3_10_8_9] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_item_sk], [ss_ticket_number], [ss_store_sk], [ss_promo_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_9_12_8_3_1_10] ON [dbo].[store_sales]([ss_promo_sk], [ss_wholesale_cost], [ss_store_sk], [ss_item_sk], [ss_sold_date_sk], [ss_ticket_number])
go

CREATE STATISTICS [_dta_stat_1333579789_12_3_10] ON [dbo].[store_returns]([sr_return_amt], [sr_item_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1525580473_19_3_17] ON [dbo].[catalog_returns]([cr_return_amount], [cr_item_sk], [cr_order_number])
go

CREATE STATISTICS [_dta_stat_1461580245_1_2] ON [dbo].[catalog_page]([cp_catalog_page_sk], [cp_catalog_page_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_6] ON [dbo].[item]([i_item_sk], [i_current_price])
go

CREATE STATISTICS [_dta_stat_1173579219_13_1] ON [dbo].[item]([i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_6_13_1] ON [dbo].[item]([i_current_price], [i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1429580131_13_1_10] ON [dbo].[promotion]([p_channel_radio], [p_promo_sk], [p_channel_email])
go

CREATE STATISTICS [_dta_stat_1429580131_14_1_10_12] ON [dbo].[promotion]([p_channel_press], [p_promo_sk], [p_channel_email], [p_channel_tv])
go

CREATE STATISTICS [_dta_stat_1429580131_10_12_13_14] ON [dbo].[promotion]([p_channel_email], [p_channel_tv], [p_channel_radio], [p_channel_press])
go

CREATE STATISTICS [_dta_stat_1429580131_1_12_13_14_15] ON [dbo].[promotion]([p_promo_sk], [p_channel_tv], [p_channel_radio], [p_channel_press], [p_channel_event])
go

CREATE STATISTICS [_dta_stat_1429580131_12_13_14_15_10] ON [dbo].[promotion]([p_channel_tv], [p_channel_radio], [p_channel_press], [p_channel_event], [p_channel_email])
go

CREATE STATISTICS [_dta_stat_1429580131_15_1_10_12_13] ON [dbo].[promotion]([p_channel_event], [p_promo_sk], [p_channel_email], [p_channel_tv], [p_channel_radio])
go

CREATE STATISTICS [_dta_stat_1429580131_1_10_12_13_14_15] ON [dbo].[promotion]([p_promo_sk], [p_channel_email], [p_channel_tv], [p_channel_radio], [p_channel_press], [p_channel_event])
go

CREATE STATISTICS [_dta_stat_1589580701_20_17] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_promo_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_20_17] ON [dbo].[web_sales]([ws_item_sk], [ws_wholesale_cost], [ws_promo_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_14_20_17_1] ON [dbo].[web_sales]([ws_web_site_sk], [ws_wholesale_cost], [ws_promo_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_18_20_17_1] ON [dbo].[web_sales]([ws_item_sk], [ws_order_number], [ws_wholesale_cost], [ws_promo_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_17_1_4_14_18] ON [dbo].[web_sales]([ws_promo_sk], [ws_sold_date_sk], [ws_item_sk], [ws_web_site_sk], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_1589580701_1_20_17_4_14_18] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_wholesale_cost], [ws_promo_sk], [ws_item_sk], [ws_web_site_sk], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_981578535_1_3] ON [dbo].[date_dim]([d_date_sk], [d_date])
go

CREATE STATISTICS [_dta_stat_1621580815_17_20] ON [dbo].[catalog_sales]([cs_promo_sk], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_1_20_13] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_wholesale_cost], [cs_catalog_page_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_20_13_17] ON [dbo].[catalog_sales]([cs_item_sk], [cs_wholesale_cost], [cs_catalog_page_sk], [cs_promo_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_18_20_13_17] ON [dbo].[catalog_sales]([cs_item_sk], [cs_order_number], [cs_wholesale_cost], [cs_catalog_page_sk], [cs_promo_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_13_17_1_16_18] ON [dbo].[catalog_sales]([cs_catalog_page_sk], [cs_promo_sk], [cs_sold_date_sk], [cs_item_sk], [cs_order_number])
go

CREATE STATISTICS [_dta_stat_1621580815_20_13_17_1_16_18] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_catalog_page_sk], [cs_promo_sk], [cs_sold_date_sk], [cs_item_sk], [cs_order_number])
go

CREATE STATISTICS [_dta_stat_1557580587_16_3_14] ON [dbo].[web_returns]([wr_return_amt], [wr_item_sk], [wr_order_number])
go

-- ===== query080_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K20_K17_K16_K13_K18_24_34] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_wholesale_cost] ASC,
	[cs_promo_sk] ASC,
	[cs_item_sk] ASC,
	[cs_catalog_page_sk] ASC,
	[cs_order_number] ASC
)
INCLUDE ( 	[cs_ext_sales_price],
	[cs_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_16_20_17] ON [dbo].[catalog_sales]([cs_item_sk], [cs_wholesale_cost], [cs_promo_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_18_20_17_1] ON [dbo].[catalog_sales]([cs_item_sk], [cs_order_number], [cs_wholesale_cost], [cs_promo_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_14_20_17_4] ON [dbo].[web_sales]([ws_web_site_sk], [ws_wholesale_cost], [ws_promo_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_9_8_1] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_promo_sk], [ss_store_sk], [ss_sold_date_sk])
go

-- ===== query080_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K1_K20_K17_K4_K14_K18_24_34] ON [dbo].[web_sales]
(
	[ws_sold_date_sk] ASC,
	[ws_wholesale_cost] ASC,
	[ws_promo_sk] ASC,
	[ws_item_sk] ASC,
	[ws_web_site_sk] ASC,
	[ws_order_number] ASC
)
INCLUDE ( 	[ws_ext_sales_price],
	[ws_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query080_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K3_K1] ON [dbo].[date_dim]
(
	[d_date] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_3_1_6_13] ON [dbo].[item]([i_rec_start_date], [i_item_sk], [i_current_price], [i_category])
go

-- ===== query080_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K12_K9_K3_K8_K10_16_23] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_promo_sk] ASC,
	[ss_item_sk] ASC,
	[ss_store_sk] ASC,
	[ss_ticket_number] ASC
)
INCLUDE ( 	[ss_ext_sales_price],
	[ss_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_12_1] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_12_9] ON [dbo].[store_sales]([ss_item_sk], [ss_wholesale_cost], [ss_promo_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_12_8_9_1] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_store_sk], [ss_promo_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_9_1_3_8_10] ON [dbo].[store_sales]([ss_promo_sk], [ss_sold_date_sk], [ss_item_sk], [ss_store_sk], [ss_ticket_number])
go

CREATE STATISTICS [_dta_stat_1653580929_3_10_12_9_1] ON [dbo].[store_sales]([ss_item_sk], [ss_ticket_number], [ss_wholesale_cost], [ss_promo_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_9_12_1_3_8_10] ON [dbo].[store_sales]([ss_promo_sk], [ss_wholesale_cost], [ss_sold_date_sk], [ss_item_sk], [ss_store_sk], [ss_ticket_number])
go

CREATE STATISTICS [_dta_stat_1333579789_12_3_10] ON [dbo].[store_returns]([sr_return_amt], [sr_item_sk], [sr_ticket_number])
go

CREATE STATISTICS [_dta_stat_1525580473_19_3_17] ON [dbo].[catalog_returns]([cr_return_amount], [cr_item_sk], [cr_order_number])
go

CREATE STATISTICS [_dta_stat_1461580245_2_1] ON [dbo].[catalog_page]([cp_catalog_page_id], [cp_catalog_page_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_1_6] ON [dbo].[item]([i_item_sk], [i_current_price])
go

CREATE STATISTICS [_dta_stat_1173579219_13_6_1] ON [dbo].[item]([i_category], [i_current_price], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1429580131_13_1_10] ON [dbo].[promotion]([p_channel_radio], [p_promo_sk], [p_channel_email])
go

CREATE STATISTICS [_dta_stat_1429580131_14_1_10_12] ON [dbo].[promotion]([p_channel_press], [p_promo_sk], [p_channel_email], [p_channel_tv])
go

CREATE STATISTICS [_dta_stat_1429580131_12_13_14_15] ON [dbo].[promotion]([p_channel_tv], [p_channel_radio], [p_channel_press], [p_channel_event])
go

CREATE STATISTICS [_dta_stat_1429580131_10_12_13_14_15] ON [dbo].[promotion]([p_channel_email], [p_channel_tv], [p_channel_radio], [p_channel_press], [p_channel_event])
go

CREATE STATISTICS [_dta_stat_1429580131_15_1_10_12_13] ON [dbo].[promotion]([p_channel_event], [p_promo_sk], [p_channel_email], [p_channel_tv], [p_channel_radio])
go

CREATE STATISTICS [_dta_stat_1429580131_1_12_13_14_15] ON [dbo].[promotion]([p_promo_sk], [p_channel_tv], [p_channel_radio], [p_channel_press], [p_channel_event])
go

CREATE STATISTICS [_dta_stat_1429580131_1_10_12_13_14_15] ON [dbo].[promotion]([p_promo_sk], [p_channel_email], [p_channel_tv], [p_channel_radio], [p_channel_press], [p_channel_event])
go

CREATE STATISTICS [_dta_stat_1589580701_17_20] ON [dbo].[web_sales]([ws_promo_sk], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1589580701_4_20_17] ON [dbo].[web_sales]([ws_item_sk], [ws_wholesale_cost], [ws_promo_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_14_17_1] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_web_site_sk], [ws_promo_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_17_1_4_14_18] ON [dbo].[web_sales]([ws_promo_sk], [ws_sold_date_sk], [ws_item_sk], [ws_web_site_sk], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_1589580701_20_4_18_17_1] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_item_sk], [ws_order_number], [ws_promo_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_20_17_4_14_18] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_wholesale_cost], [ws_promo_sk], [ws_item_sk], [ws_web_site_sk], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_981578535_3_1] ON [dbo].[date_dim]([d_date], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_17_20] ON [dbo].[catalog_sales]([cs_promo_sk], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_13_20] ON [dbo].[catalog_sales]([cs_catalog_page_sk], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_1_20_17] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_wholesale_cost], [cs_promo_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_13_17_20_1] ON [dbo].[catalog_sales]([cs_catalog_page_sk], [cs_promo_sk], [cs_wholesale_cost], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_17_1_16_13_18] ON [dbo].[catalog_sales]([cs_promo_sk], [cs_sold_date_sk], [cs_item_sk], [cs_catalog_page_sk], [cs_order_number])
go

CREATE STATISTICS [_dta_stat_1621580815_16_18_20_17_1] ON [dbo].[catalog_sales]([cs_item_sk], [cs_order_number], [cs_wholesale_cost], [cs_promo_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_16_20_17_1_13_18] ON [dbo].[catalog_sales]([cs_item_sk], [cs_wholesale_cost], [cs_promo_sk], [cs_sold_date_sk], [cs_catalog_page_sk], [cs_order_number])
go

CREATE STATISTICS [_dta_stat_1557580587_16_3_14] ON [dbo].[web_returns]([wr_return_amt], [wr_item_sk], [wr_order_number])
go

-- ===== query080_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K20_K17_K16_K13_K18_24_34] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_wholesale_cost] ASC,
	[cs_promo_sk] ASC,
	[cs_item_sk] ASC,
	[cs_catalog_page_sk] ASC,
	[cs_order_number] ASC
)
INCLUDE ( 	[cs_ext_sales_price],
	[cs_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_14_20_17_4] ON [dbo].[web_sales]([ws_web_site_sk], [ws_wholesale_cost], [ws_promo_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_12_8] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_wholesale_cost], [ss_store_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_12_8_9] ON [dbo].[store_sales]([ss_item_sk], [ss_wholesale_cost], [ss_store_sk], [ss_promo_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_10_12_8_9] ON [dbo].[store_sales]([ss_item_sk], [ss_ticket_number], [ss_wholesale_cost], [ss_store_sk], [ss_promo_sk])
go

-- ===== query080_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K1_K20_K17_K4_K14_K18_24_34] ON [dbo].[web_sales]
(
	[ws_sold_date_sk] ASC,
	[ws_wholesale_cost] ASC,
	[ws_promo_sk] ASC,
	[ws_item_sk] ASC,
	[ws_web_site_sk] ASC,
	[ws_order_number] ASC
)
INCLUDE ( 	[ws_ext_sales_price],
	[ws_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_13_1] ON [dbo].[item]([i_category], [i_item_sk])
go

-- ===== query080_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K3_K1] ON [dbo].[date_dim]
(
	[d_date] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_3_1_6_13] ON [dbo].[item]([i_rec_start_date], [i_item_sk], [i_current_price], [i_category])
go

-- ===== query081_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_returns_6_1525580473__K1_K8_K11_21] ON [dbo].[catalog_returns]
(
	[cr_returned_date_sk] ASC,
	[cr_returning_customer_sk] ASC,
	[cr_returning_addr_sk] ASC
)
INCLUDE ( 	[cr_return_amt_inc_tax]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1525580473_8_1] ON [dbo].[catalog_returns]([cr_returning_customer_sk], [cr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1525580473_11_8_1] ON [dbo].[catalog_returns]([cr_returning_addr_sk], [cr_returning_customer_sk], [cr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_917578307_9_3_4_5_6_7_8_10_11_12] ON [dbo].[customer_address]([ca_state], [ca_street_number], [ca_street_name], [ca_street_type], [ca_suite_number], [ca_city], [ca_county], [ca_zip], [ca_country], [ca_gmt_offset])
go

CREATE STATISTICS [_dta_stat_917578307_3_4_5_6_7_8_10_11_12_13_9] ON [dbo].[customer_address]([ca_street_number], [ca_street_name], [ca_street_type], [ca_suite_number], [ca_city], [ca_county], [ca_zip], [ca_country], [ca_gmt_offset], [ca_location_type], [ca_state])
go

CREATE STATISTICS [_dta_stat_917578307_1_9_3_4_5_6_7_8_10_11_12_13] ON [dbo].[customer_address]([ca_address_sk], [ca_state], [ca_street_number], [ca_street_name], [ca_street_type], [ca_suite_number], [ca_city], [ca_county], [ca_zip], [ca_country], [ca_gmt_offset], [ca_location_type])
go

CREATE STATISTICS [_dta_stat_1269579561_2_8_9_10] ON [dbo].[customer]([c_customer_id], [c_salutation], [c_first_name], [c_last_name])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5_2_8_9_10] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk], [c_customer_id], [c_salutation], [c_first_name], [c_last_name])
go

-- ===== query081_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K1_K9] ON [dbo].[customer_address]
(
	[ca_address_sk] ASC,
	[ca_state] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query081_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K1_K5_K2_K8_K9_K10] ON [dbo].[customer]
(
	[c_customer_sk] ASC,
	[c_current_addr_sk] ASC,
	[c_customer_id] ASC,
	[c_salutation] ASC,
	[c_first_name] ASC,
	[c_last_name] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query081_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9_K1_K3_K4_K5_K6_K7_K8_K10_K11_K12_K13] ON [dbo].[customer_address]
(
	[ca_state] ASC,
	[ca_address_sk] ASC,
	[ca_street_number] ASC,
	[ca_street_name] ASC,
	[ca_street_type] ASC,
	[ca_suite_number] ASC,
	[ca_city] ASC,
	[ca_county] ASC,
	[ca_zip] ASC,
	[ca_country] ASC,
	[ca_gmt_offset] ASC,
	[ca_location_type] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query081_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query081_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_returns_6_1525580473__K1_K8_K11_21] ON [dbo].[catalog_returns]
(
	[cr_returned_date_sk] ASC,
	[cr_returning_customer_sk] ASC,
	[cr_returning_addr_sk] ASC
)
INCLUDE ( 	[cr_return_amt_inc_tax]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1525580473_8_1] ON [dbo].[catalog_returns]([cr_returning_customer_sk], [cr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1525580473_11_8_1] ON [dbo].[catalog_returns]([cr_returning_addr_sk], [cr_returning_customer_sk], [cr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_917578307_9_3_4_5_6_7_8_10_11_12] ON [dbo].[customer_address]([ca_state], [ca_street_number], [ca_street_name], [ca_street_type], [ca_suite_number], [ca_city], [ca_county], [ca_zip], [ca_country], [ca_gmt_offset])
go

CREATE STATISTICS [_dta_stat_917578307_3_4_5_6_7_8_10_11_12_13_9] ON [dbo].[customer_address]([ca_street_number], [ca_street_name], [ca_street_type], [ca_suite_number], [ca_city], [ca_county], [ca_zip], [ca_country], [ca_gmt_offset], [ca_location_type], [ca_state])
go

CREATE STATISTICS [_dta_stat_917578307_1_9_3_4_5_6_7_8_10_11_12_13] ON [dbo].[customer_address]([ca_address_sk], [ca_state], [ca_street_number], [ca_street_name], [ca_street_type], [ca_suite_number], [ca_city], [ca_county], [ca_zip], [ca_country], [ca_gmt_offset], [ca_location_type])
go

CREATE STATISTICS [_dta_stat_1269579561_2_8_9_10] ON [dbo].[customer]([c_customer_id], [c_salutation], [c_first_name], [c_last_name])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5_2_8_9_10] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk], [c_customer_id], [c_salutation], [c_first_name], [c_last_name])
go

-- ===== query081_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K1_K9] ON [dbo].[customer_address]
(
	[ca_address_sk] ASC,
	[ca_state] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query081_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K1_K5_K2_K8_K9_K10] ON [dbo].[customer]
(
	[c_customer_sk] ASC,
	[c_current_addr_sk] ASC,
	[c_customer_id] ASC,
	[c_salutation] ASC,
	[c_first_name] ASC,
	[c_last_name] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query081_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9_K1_K3_K4_K5_K6_K7_K8_K10_K11_K12_K13] ON [dbo].[customer_address]
(
	[ca_state] ASC,
	[ca_address_sk] ASC,
	[ca_street_number] ASC,
	[ca_street_name] ASC,
	[ca_street_type] ASC,
	[ca_suite_number] ASC,
	[ca_city] ASC,
	[ca_county] ASC,
	[ca_zip] ASC,
	[ca_country] ASC,
	[ca_gmt_offset] ASC,
	[ca_location_type] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query081_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query083_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_returns_6_1525580473__K16_K3_K19_K1_18] ON [dbo].[catalog_returns]
(
	[cr_reason_sk] ASC,
	[cr_item_sk] ASC,
	[cr_return_amount] ASC,
	[cr_returned_date_sk] ASC
)
INCLUDE ( 	[cr_return_quantity]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1525580473_3_19] ON [dbo].[catalog_returns]([cr_item_sk], [cr_return_amount])
go

CREATE STATISTICS [_dta_stat_1525580473_3_1_19] ON [dbo].[catalog_returns]([cr_item_sk], [cr_returned_date_sk], [cr_return_amount])
go

CREATE STATISTICS [_dta_stat_1525580473_1_19_16] ON [dbo].[catalog_returns]([cr_returned_date_sk], [cr_return_amount], [cr_reason_sk])
go

CREATE STATISTICS [_dta_stat_1525580473_19_16_3_1] ON [dbo].[catalog_returns]([cr_return_amount], [cr_reason_sk], [cr_item_sk], [cr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_1_12] ON [dbo].[store_returns]([sr_returned_date_sk], [sr_return_amt])
go

CREATE STATISTICS [_dta_stat_1333579789_9_3] ON [dbo].[store_returns]([sr_reason_sk], [sr_item_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_3_1_12] ON [dbo].[store_returns]([sr_item_sk], [sr_returned_date_sk], [sr_return_amt])
go

CREATE STATISTICS [_dta_stat_1333579789_12_9_1] ON [dbo].[store_returns]([sr_return_amt], [sr_reason_sk], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_3_12_9_1] ON [dbo].[store_returns]([sr_item_sk], [sr_return_amt], [sr_reason_sk], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13] ON [dbo].[item]([i_manager_id], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_13_2] ON [dbo].[item]([i_category], [i_item_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21_13] ON [dbo].[item]([i_item_sk], [i_manager_id], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_2_1_21] ON [dbo].[item]([i_item_id], [i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_2_21_13_1] ON [dbo].[item]([i_item_id], [i_manager_id], [i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_981578535_4_3] ON [dbo].[date_dim]([d_month_seq], [d_date])
go

CREATE STATISTICS [_dta_stat_981578535_1_3_4] ON [dbo].[date_dim]([d_date_sk], [d_date], [d_month_seq])
go

CREATE STATISTICS [_dta_stat_1557580587_1_16] ON [dbo].[web_returns]([wr_returned_date_sk], [wr_return_amt])
go

CREATE STATISTICS [_dta_stat_1557580587_13_3] ON [dbo].[web_returns]([wr_reason_sk], [wr_item_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_3_16_13] ON [dbo].[web_returns]([wr_item_sk], [wr_return_amt], [wr_reason_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_3_1_16] ON [dbo].[web_returns]([wr_item_sk], [wr_returned_date_sk], [wr_return_amt])
go

CREATE STATISTICS [_dta_stat_1557580587_16_13_1_3] ON [dbo].[web_returns]([wr_return_amt], [wr_reason_sk], [wr_returned_date_sk], [wr_item_sk])
go

-- ===== query083_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K21_K13_K2_K1] ON [dbo].[item]
(
	[i_manager_id] ASC,
	[i_category] ASC,
	[i_item_id] ASC,
	[i_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1525580473_16_1] ON [dbo].[catalog_returns]([cr_reason_sk], [cr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1525580473_1_3_16] ON [dbo].[catalog_returns]([cr_returned_date_sk], [cr_item_sk], [cr_reason_sk])
go

-- ===== query083_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K3_K1_K4] ON [dbo].[date_dim]
(
	[d_date] ASC,
	[d_date_sk] ASC,
	[d_month_seq] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query083_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_returns_6_1557580587__K1_K16_K13_K3_15] ON [dbo].[web_returns]
(
	[wr_returned_date_sk] ASC,
	[wr_return_amt] ASC,
	[wr_reason_sk] ASC,
	[wr_item_sk] ASC
)
INCLUDE ( 	[wr_return_quantity]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_981578535_1_4] ON [dbo].[date_dim]([d_date_sk], [d_month_seq])
go

-- ===== query083_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K4_K3_K1] ON [dbo].[date_dim]
(
	[d_month_seq] ASC,
	[d_date] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1557580587_13_3_1] ON [dbo].[web_returns]([wr_reason_sk], [wr_item_sk], [wr_returned_date_sk])
go

-- ===== query083_0 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K21_K2] ON [dbo].[item]
(
	[i_category] ASC,
	[i_manager_id] ASC,
	[i_item_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query083_0 / iter_07 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K1_K3] ON [dbo].[date_dim]
(
	[d_date_sk] ASC,
	[d_date] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_2_1_13] ON [dbo].[item]([i_item_id], [i_item_sk], [i_category])
go

-- ===== query083_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_returns_6_1525580473__K16_K3_K19_K1_18] ON [dbo].[catalog_returns]
(
	[cr_reason_sk] ASC,
	[cr_item_sk] ASC,
	[cr_return_amount] ASC,
	[cr_returned_date_sk] ASC
)
INCLUDE ( 	[cr_return_quantity]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1525580473_3_19] ON [dbo].[catalog_returns]([cr_item_sk], [cr_return_amount])
go

CREATE STATISTICS [_dta_stat_1525580473_3_1_19] ON [dbo].[catalog_returns]([cr_item_sk], [cr_returned_date_sk], [cr_return_amount])
go

CREATE STATISTICS [_dta_stat_1525580473_1_19_16] ON [dbo].[catalog_returns]([cr_returned_date_sk], [cr_return_amount], [cr_reason_sk])
go

CREATE STATISTICS [_dta_stat_1525580473_19_16_3_1] ON [dbo].[catalog_returns]([cr_return_amount], [cr_reason_sk], [cr_item_sk], [cr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_1_12] ON [dbo].[store_returns]([sr_returned_date_sk], [sr_return_amt])
go

CREATE STATISTICS [_dta_stat_1333579789_9_3] ON [dbo].[store_returns]([sr_reason_sk], [sr_item_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_3_1_12] ON [dbo].[store_returns]([sr_item_sk], [sr_returned_date_sk], [sr_return_amt])
go

CREATE STATISTICS [_dta_stat_1333579789_12_9_1] ON [dbo].[store_returns]([sr_return_amt], [sr_reason_sk], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1333579789_3_12_9_1] ON [dbo].[store_returns]([sr_item_sk], [sr_return_amt], [sr_reason_sk], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13] ON [dbo].[item]([i_manager_id], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_13_2] ON [dbo].[item]([i_category], [i_item_id])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21_13] ON [dbo].[item]([i_item_sk], [i_manager_id], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_2_1_21] ON [dbo].[item]([i_item_id], [i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_2_21_13_1] ON [dbo].[item]([i_item_id], [i_manager_id], [i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_981578535_4_3] ON [dbo].[date_dim]([d_month_seq], [d_date])
go

CREATE STATISTICS [_dta_stat_981578535_1_3_4] ON [dbo].[date_dim]([d_date_sk], [d_date], [d_month_seq])
go

CREATE STATISTICS [_dta_stat_1557580587_1_16] ON [dbo].[web_returns]([wr_returned_date_sk], [wr_return_amt])
go

CREATE STATISTICS [_dta_stat_1557580587_13_3] ON [dbo].[web_returns]([wr_reason_sk], [wr_item_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_3_16_13] ON [dbo].[web_returns]([wr_item_sk], [wr_return_amt], [wr_reason_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_3_1_16] ON [dbo].[web_returns]([wr_item_sk], [wr_returned_date_sk], [wr_return_amt])
go

CREATE STATISTICS [_dta_stat_1557580587_16_13_1_3] ON [dbo].[web_returns]([wr_return_amt], [wr_reason_sk], [wr_returned_date_sk], [wr_item_sk])
go

-- ===== query083_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K21_K13_K2_K1] ON [dbo].[item]
(
	[i_manager_id] ASC,
	[i_category] ASC,
	[i_item_id] ASC,
	[i_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1525580473_16_1] ON [dbo].[catalog_returns]([cr_reason_sk], [cr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1525580473_1_3_16] ON [dbo].[catalog_returns]([cr_returned_date_sk], [cr_item_sk], [cr_reason_sk])
go

-- ===== query083_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K3_K1_K4] ON [dbo].[date_dim]
(
	[d_date] ASC,
	[d_date_sk] ASC,
	[d_month_seq] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query083_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_returns_6_1557580587__K1_K16_K13_K3_15] ON [dbo].[web_returns]
(
	[wr_returned_date_sk] ASC,
	[wr_return_amt] ASC,
	[wr_reason_sk] ASC,
	[wr_item_sk] ASC
)
INCLUDE ( 	[wr_return_quantity]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_981578535_1_4] ON [dbo].[date_dim]([d_date_sk], [d_month_seq])
go

-- ===== query083_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K4_K3_K1] ON [dbo].[date_dim]
(
	[d_month_seq] ASC,
	[d_date] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1557580587_13_3_1] ON [dbo].[web_returns]([wr_reason_sk], [wr_item_sk], [wr_returned_date_sk])
go

-- ===== query083_1 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K21_K2] ON [dbo].[item]
(
	[i_category] ASC,
	[i_manager_id] ASC,
	[i_item_id] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query083_1 / iter_07 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K1_K3] ON [dbo].[date_dim]
(
	[d_date_sk] ASC,
	[d_date] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1173579219_2_1_13] ON [dbo].[item]([i_item_id], [i_item_sk], [i_category])
go

-- ===== query084_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_returns_6_1333579789__K5] ON [dbo].[store_returns]
(
	[sr_cdemo_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1365579903_1_2] ON [dbo].[household_demographics]([hd_demo_sk], [hd_income_band_sk])
go

CREATE STATISTICS [_dta_stat_917578307_7_1] ON [dbo].[customer_address]([ca_city], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_2] ON [dbo].[customer]([c_customer_id])
go

CREATE STATISTICS [_dta_stat_1269579561_5_4] ON [dbo].[customer]([c_current_addr_sk], [c_current_hdemo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_3_5_4_2] ON [dbo].[customer]([c_current_cdemo_sk], [c_current_addr_sk], [c_current_hdemo_sk], [c_customer_id])
go

-- ===== query084_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K5_K4_K3_K2_9_10] ON [dbo].[customer]
(
	[c_current_addr_sk] ASC,
	[c_current_hdemo_sk] ASC,
	[c_current_cdemo_sk] ASC,
	[c_customer_id] ASC
)
INCLUDE ( 	[c_first_name],
	[c_last_name]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_7_5] ON [dbo].[store_returns]([sr_addr_sk], [sr_cdemo_sk])
go

-- ===== query084_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K7_K1] ON [dbo].[customer_address]
(
	[ca_city] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1269579561_2_5] ON [dbo].[customer]([c_customer_id], [c_current_addr_sk])
go

-- ===== query084_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_household_demographics_6_1365579903__K1_K2] ON [dbo].[household_demographics]
(
	[hd_demo_sk] ASC,
	[hd_income_band_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query084_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_returns_6_1333579789__K5] ON [dbo].[store_returns]
(
	[sr_cdemo_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1365579903_1_2] ON [dbo].[household_demographics]([hd_demo_sk], [hd_income_band_sk])
go

CREATE STATISTICS [_dta_stat_917578307_7_1] ON [dbo].[customer_address]([ca_city], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_2] ON [dbo].[customer]([c_customer_id])
go

CREATE STATISTICS [_dta_stat_1269579561_5_4] ON [dbo].[customer]([c_current_addr_sk], [c_current_hdemo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_3_5_4_2] ON [dbo].[customer]([c_current_cdemo_sk], [c_current_addr_sk], [c_current_hdemo_sk], [c_customer_id])
go

-- ===== query084_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K5_K4_K3_K2_9_10] ON [dbo].[customer]
(
	[c_current_addr_sk] ASC,
	[c_current_hdemo_sk] ASC,
	[c_current_cdemo_sk] ASC,
	[c_customer_id] ASC
)
INCLUDE ( 	[c_first_name],
	[c_last_name]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_7_5] ON [dbo].[store_returns]([sr_addr_sk], [sr_cdemo_sk])
go

-- ===== query084_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K7_K1] ON [dbo].[customer_address]
(
	[ca_city] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1269579561_2_5] ON [dbo].[customer]([c_customer_id], [c_current_addr_sk])
go

-- ===== query085_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K34_K22_1_4_13_18_19] ON [dbo].[web_sales]
(
	[ws_net_profit] ASC,
	[ws_sales_price] ASC
)
INCLUDE ( 	[ws_sold_date_sk],
	[ws_item_sk],
	[ws_web_page_sk],
	[ws_order_number],
	[ws_quantity]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_13_34] ON [dbo].[web_sales]([ws_web_page_sk], [ws_net_profit])
go

CREATE STATISTICS [_dta_stat_1589580701_34_22_4] ON [dbo].[web_sales]([ws_net_profit], [ws_sales_price], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_34_22_4] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_net_profit], [ws_sales_price], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_18_34_22_1] ON [dbo].[web_sales]([ws_item_sk], [ws_order_number], [ws_net_profit], [ws_sales_price], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_22_4_18_1_13] ON [dbo].[web_sales]([ws_sales_price], [ws_item_sk], [ws_order_number], [ws_sold_date_sk], [ws_web_page_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_34_22_13_4_18] ON [dbo].[web_sales]([ws_net_profit], [ws_sales_price], [ws_web_page_sk], [ws_item_sk], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_1589580701_4_18_1_13_34_22] ON [dbo].[web_sales]([ws_item_sk], [ws_order_number], [ws_sold_date_sk], [ws_web_page_sk], [ws_net_profit], [ws_sales_price])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_1557580587_13_3] ON [dbo].[web_returns]([wr_reason_sk], [wr_item_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_7_3_14] ON [dbo].[web_returns]([wr_refunded_addr_sk], [wr_item_sk], [wr_order_number])
go

CREATE STATISTICS [_dta_stat_1557580587_5_9_3_14_13] ON [dbo].[web_returns]([wr_refunded_cdemo_sk], [wr_returning_cdemo_sk], [wr_item_sk], [wr_order_number], [wr_reason_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_9_3_14_13_7] ON [dbo].[web_returns]([wr_returning_cdemo_sk], [wr_item_sk], [wr_order_number], [wr_reason_sk], [wr_refunded_addr_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_3_14_13_7_5_9] ON [dbo].[web_returns]([wr_item_sk], [wr_order_number], [wr_reason_sk], [wr_refunded_addr_sk], [wr_refunded_cdemo_sk], [wr_returning_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_917578307_1_9] ON [dbo].[customer_address]([ca_address_sk], [ca_state])
go

CREATE STATISTICS [_dta_stat_917578307_11_9] ON [dbo].[customer_address]([ca_country], [ca_state])
go

CREATE STATISTICS [_dta_stat_917578307_1_11_9] ON [dbo].[customer_address]([ca_address_sk], [ca_country], [ca_state])
go

CREATE STATISTICS [_dta_stat_949578421_3_4] ON [dbo].[customer_demographics]([cd_marital_status], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_3_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_marital_status], [cd_education_status])
go

-- ===== query085_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_returns_6_1557580587__K3_K14_K13_K7_K5_K9_19_21] ON [dbo].[web_returns]
(
	[wr_item_sk] ASC,
	[wr_order_number] ASC,
	[wr_reason_sk] ASC,
	[wr_refunded_addr_sk] ASC,
	[wr_refunded_cdemo_sk] ASC,
	[wr_returning_cdemo_sk] ASC
)
INCLUDE ( 	[wr_fee],
	[wr_refunded_cash]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_1_22] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_sales_price])
go

CREATE STATISTICS [_dta_stat_1589580701_34_4_18_1] ON [dbo].[web_sales]([ws_net_profit], [ws_item_sk], [ws_order_number], [ws_sold_date_sk])
go

-- ===== query085_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K11_K9_K1] ON [dbo].[customer_address]
(
	[ca_country] ASC,
	[ca_state] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query085_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query085_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K34_K22_K1_K13_K4_K18_19] ON [dbo].[web_sales]
(
	[ws_net_profit] ASC,
	[ws_sales_price] ASC,
	[ws_sold_date_sk] ASC,
	[ws_web_page_sk] ASC,
	[ws_item_sk] ASC,
	[ws_order_number] ASC
)
INCLUDE ( 	[ws_quantity]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_1_34] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_net_profit])
go

CREATE STATISTICS [_dta_stat_1589580701_13_34] ON [dbo].[web_sales]([ws_web_page_sk], [ws_net_profit])
go

CREATE STATISTICS [_dta_stat_1589580701_34_22_4] ON [dbo].[web_sales]([ws_net_profit], [ws_sales_price], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_22_1_13_4_18] ON [dbo].[web_sales]([ws_sales_price], [ws_sold_date_sk], [ws_web_page_sk], [ws_item_sk], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_1589580701_4_18_34_22_1] ON [dbo].[web_sales]([ws_item_sk], [ws_order_number], [ws_net_profit], [ws_sales_price], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_13_4_18_34] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_web_page_sk], [ws_item_sk], [ws_order_number], [ws_net_profit])
go

CREATE STATISTICS [_dta_stat_1589580701_34_22_13_1_4_18] ON [dbo].[web_sales]([ws_net_profit], [ws_sales_price], [ws_web_page_sk], [ws_sold_date_sk], [ws_item_sk], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_13_3_14] ON [dbo].[web_returns]([wr_reason_sk], [wr_item_sk], [wr_order_number])
go

CREATE STATISTICS [_dta_stat_1557580587_5_9_3_14_7] ON [dbo].[web_returns]([wr_refunded_cdemo_sk], [wr_returning_cdemo_sk], [wr_item_sk], [wr_order_number], [wr_refunded_addr_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_9_3_14_7_13] ON [dbo].[web_returns]([wr_returning_cdemo_sk], [wr_item_sk], [wr_order_number], [wr_refunded_addr_sk], [wr_reason_sk])
go

CREATE STATISTICS [_dta_stat_1557580587_7_3_14_13_5_9] ON [dbo].[web_returns]([wr_refunded_addr_sk], [wr_item_sk], [wr_order_number], [wr_reason_sk], [wr_refunded_cdemo_sk], [wr_returning_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_917578307_1_9] ON [dbo].[customer_address]([ca_address_sk], [ca_state])
go

CREATE STATISTICS [_dta_stat_917578307_1_11] ON [dbo].[customer_address]([ca_address_sk], [ca_country])
go

CREATE STATISTICS [_dta_stat_917578307_9_11_1] ON [dbo].[customer_address]([ca_state], [ca_country], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_949578421_3_4] ON [dbo].[customer_demographics]([cd_marital_status], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_3_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_marital_status], [cd_education_status])
go

-- ===== query085_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_returns_6_1557580587__K3_K14_K13_K7_K5_K9_19_21] ON [dbo].[web_returns]
(
	[wr_item_sk] ASC,
	[wr_order_number] ASC,
	[wr_reason_sk] ASC,
	[wr_refunded_addr_sk] ASC,
	[wr_refunded_cdemo_sk] ASC,
	[wr_returning_cdemo_sk] ASC
)
INCLUDE ( 	[wr_fee],
	[wr_refunded_cash]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1557580587_5_9_3_14_13] ON [dbo].[web_returns]([wr_refunded_cdemo_sk], [wr_returning_cdemo_sk], [wr_item_sk], [wr_order_number], [wr_reason_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_18_22] ON [dbo].[web_sales]([ws_item_sk], [ws_order_number], [ws_sales_price])
go

CREATE STATISTICS [_dta_stat_1589580701_22_34_1_4] ON [dbo].[web_sales]([ws_sales_price], [ws_net_profit], [ws_sold_date_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_34_4_18_1] ON [dbo].[web_sales]([ws_net_profit], [ws_item_sk], [ws_order_number], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_13_22_34_4_18] ON [dbo].[web_sales]([ws_web_page_sk], [ws_sales_price], [ws_net_profit], [ws_item_sk], [ws_order_number])
go

-- ===== query085_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K11_K9_K1] ON [dbo].[customer_address]
(
	[ca_country] ASC,
	[ca_state] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query087_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K13_K12_K4] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_list_price] ASC,
	[ss_wholesale_cost] ASC,
	[ss_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_13_12] ON [dbo].[store_sales]([ss_list_price], [ss_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1653580929_4_13_12] ON [dbo].[store_sales]([ss_customer_sk], [ss_list_price], [ss_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1653580929_12_4_1] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_customer_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_1_13_12] ON [dbo].[store_sales]([ss_customer_sk], [ss_sold_date_sk], [ss_list_price], [ss_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1589580701_21_1] ON [dbo].[web_sales]([ws_list_price], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_5_20] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1589580701_1_5_21] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_bill_customer_sk], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_20_21_5] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_list_price], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_20_21_5] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_wholesale_cost], [ws_list_price], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_4] ON [dbo].[date_dim]([d_date_sk], [d_month_seq])
go

CREATE STATISTICS [_dta_stat_981578535_3_1] ON [dbo].[date_dim]([d_date], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_3_4_1] ON [dbo].[date_dim]([d_date], [d_month_seq], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_4_21] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_20_1] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_1_4_21] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_bill_customer_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_21_20_4] ON [dbo].[catalog_sales]([cs_list_price], [cs_wholesale_cost], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_1_21_20_4] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_list_price], [cs_wholesale_cost], [cs_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_14_9] ON [dbo].[customer]([c_birth_year], [c_first_name])
go

CREATE STATISTICS [_dta_stat_1269579561_10_9_1] ON [dbo].[customer]([c_last_name], [c_first_name], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_14_9] ON [dbo].[customer]([c_customer_sk], [c_birth_year], [c_first_name])
go

CREATE STATISTICS [_dta_stat_1269579561_14_10_9_1] ON [dbo].[customer]([c_birth_year], [c_last_name], [c_first_name], [c_customer_sk])
go

-- ===== query087_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K21_K20_K4] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_list_price] ASC,
	[cs_wholesale_cost] ASC,
	[cs_bill_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query087_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K20_K21_1_5] ON [dbo].[web_sales]
(
	[ws_wholesale_cost] ASC,
	[ws_list_price] ASC
)
INCLUDE ( 	[ws_sold_date_sk],
	[ws_bill_customer_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_4_20] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_wholesale_cost])
go

-- ===== query087_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K14_K10_K9] ON [dbo].[customer]
(
	[c_birth_year] ASC,
	[c_last_name] ASC,
	[c_first_name] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1269579561_1_14_10] ON [dbo].[customer]([c_customer_sk], [c_birth_year], [c_last_name])
go

CREATE STATISTICS [_dta_stat_1589580701_5_1_20] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_sold_date_sk], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1653580929_1_12] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_wholesale_cost])
go

-- ===== query087_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K4_K3] ON [dbo].[date_dim]
(
	[d_month_seq] ASC,
	[d_date] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query087_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K12_K13_K4] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_wholesale_cost] ASC,
	[ss_list_price] ASC,
	[ss_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_4_12] ON [dbo].[store_sales]([ss_customer_sk], [ss_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1653580929_13_4] ON [dbo].[store_sales]([ss_list_price], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_1_13] ON [dbo].[store_sales]([ss_customer_sk], [ss_sold_date_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1653580929_12_13_1] ON [dbo].[store_sales]([ss_wholesale_cost], [ss_list_price], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_13_12_4_1] ON [dbo].[store_sales]([ss_list_price], [ss_wholesale_cost], [ss_customer_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_21] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_21_1] ON [dbo].[web_sales]([ws_list_price], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_20_21] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_wholesale_cost], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_1_5_21] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_bill_customer_sk], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_5_20_21_1] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_wholesale_cost], [ws_list_price], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_4] ON [dbo].[date_dim]([d_date_sk], [d_month_seq])
go

CREATE STATISTICS [_dta_stat_981578535_3_1] ON [dbo].[date_dim]([d_date], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_4_3_1] ON [dbo].[date_dim]([d_month_seq], [d_date], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_1_20] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_21_1] ON [dbo].[catalog_sales]([cs_list_price], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_4_20] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_1_4_21] ON [dbo].[catalog_sales]([cs_sold_date_sk], [cs_bill_customer_sk], [cs_list_price])
go

CREATE STATISTICS [_dta_stat_1621580815_21_20_1] ON [dbo].[catalog_sales]([cs_list_price], [cs_wholesale_cost], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_20_21_4_1] ON [dbo].[catalog_sales]([cs_wholesale_cost], [cs_list_price], [cs_bill_customer_sk], [cs_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_14_10] ON [dbo].[customer]([c_birth_year], [c_last_name])
go

CREATE STATISTICS [_dta_stat_1269579561_1_14_10] ON [dbo].[customer]([c_customer_sk], [c_birth_year], [c_last_name])
go

CREATE STATISTICS [_dta_stat_1269579561_10_9_1] ON [dbo].[customer]([c_last_name], [c_first_name], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_10_9_14] ON [dbo].[customer]([c_last_name], [c_first_name], [c_birth_year])
go

CREATE STATISTICS [_dta_stat_1269579561_9_10_14_1] ON [dbo].[customer]([c_first_name], [c_last_name], [c_birth_year], [c_customer_sk])
go

-- ===== query087_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K1_K20_K21_K4] ON [dbo].[catalog_sales]
(
	[cs_sold_date_sk] ASC,
	[cs_wholesale_cost] ASC,
	[cs_list_price] ASC,
	[cs_bill_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query087_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K1_K20_K21_K5] ON [dbo].[web_sales]
(
	[ws_sold_date_sk] ASC,
	[ws_wholesale_cost] ASC,
	[ws_list_price] ASC,
	[ws_bill_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query087_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K14_K10_K9_K1] ON [dbo].[customer]
(
	[c_birth_year] ASC,
	[c_last_name] ASC,
	[c_first_name] ASC,
	[c_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1269579561_14_9] ON [dbo].[customer]([c_birth_year], [c_first_name])
go

CREATE STATISTICS [_dta_stat_1269579561_1_14_9] ON [dbo].[customer]([c_customer_sk], [c_birth_year], [c_first_name])
go

CREATE STATISTICS [_dta_stat_1589580701_5_21] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_list_price])
go

CREATE STATISTICS [_dta_stat_1589580701_5_1_20] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_sold_date_sk], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1621580815_4_1_20] ON [dbo].[catalog_sales]([cs_bill_customer_sk], [cs_sold_date_sk], [cs_wholesale_cost])
go

-- ===== query087_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K4_K3] ON [dbo].[date_dim]
(
	[d_month_seq] ASC,
	[d_date] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_4_1_12] ON [dbo].[store_sales]([ss_customer_sk], [ss_sold_date_sk], [ss_wholesale_cost])
go

-- ===== query091_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_returns_6_1525580473__K1_8_12_27] ON [dbo].[catalog_returns]
(
	[cr_returned_date_sk] ASC
)
INCLUDE ( 	[cr_returning_customer_sk],
	[cr_call_center_sk],
	[cr_net_loss]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1525580473_1_8] ON [dbo].[catalog_returns]([cr_returned_date_sk], [cr_returning_customer_sk])
go

CREATE STATISTICS [_dta_stat_1525580473_12_8_1] ON [dbo].[catalog_returns]([cr_call_center_sk], [cr_returning_customer_sk], [cr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1365579903_1_3] ON [dbo].[household_demographics]([hd_demo_sk], [hd_buy_potential])
go

CREATE STATISTICS [_dta_stat_981578535_9_1] ON [dbo].[date_dim]([d_moy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_7_9_1] ON [dbo].[date_dim]([d_year], [d_moy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_917578307_1_12] ON [dbo].[customer_address]([ca_address_sk], [ca_gmt_offset])
go

CREATE STATISTICS [_dta_stat_949578421_3_4] ON [dbo].[customer_demographics]([cd_marital_status], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_3] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_4_3] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_1269579561_4_1] ON [dbo].[customer]([c_current_hdemo_sk], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_3_1_4] ON [dbo].[customer]([c_current_cdemo_sk], [c_customer_sk], [c_current_hdemo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_5_1_4_3] ON [dbo].[customer]([c_current_addr_sk], [c_customer_sk], [c_current_hdemo_sk], [c_current_cdemo_sk])
go

-- ===== query091_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_demographics_6_949578421__K4_K3_1] ON [dbo].[customer_demographics]
(
	[cd_education_status] ASC,
	[cd_marital_status] ASC
)
INCLUDE ( 	[cd_demo_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1525580473_1_12] ON [dbo].[catalog_returns]([cr_returned_date_sk], [cr_call_center_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_3_4] ON [dbo].[customer]([c_current_cdemo_sk], [c_current_hdemo_sk])
go

-- ===== query091_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K1_3_4_5] ON [dbo].[customer]
(
	[c_customer_sk] ASC
)
INCLUDE ( 	[c_current_cdemo_sk],
	[c_current_hdemo_sk],
	[c_current_addr_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query091_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K12_K1] ON [dbo].[customer_address]
(
	[ca_gmt_offset] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query091_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K9_K7_K1] ON [dbo].[date_dim]
(
	[d_moy] ASC,
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query091_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_returns_6_1525580473__K1_8_12_27] ON [dbo].[catalog_returns]
(
	[cr_returned_date_sk] ASC
)
INCLUDE ( 	[cr_returning_customer_sk],
	[cr_call_center_sk],
	[cr_net_loss]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1525580473_12_1] ON [dbo].[catalog_returns]([cr_call_center_sk], [cr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1525580473_8_12_1] ON [dbo].[catalog_returns]([cr_returning_customer_sk], [cr_call_center_sk], [cr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1365579903_1_3] ON [dbo].[household_demographics]([hd_demo_sk], [hd_buy_potential])
go

CREATE STATISTICS [_dta_stat_981578535_9_1] ON [dbo].[date_dim]([d_moy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_7_9_1] ON [dbo].[date_dim]([d_year], [d_moy], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_917578307_1_12] ON [dbo].[customer_address]([ca_address_sk], [ca_gmt_offset])
go

CREATE STATISTICS [_dta_stat_949578421_1_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_3] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_3_4_1] ON [dbo].[customer_demographics]([cd_marital_status], [cd_education_status], [cd_demo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_4_5] ON [dbo].[customer]([c_current_hdemo_sk], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_4_5] ON [dbo].[customer]([c_customer_sk], [c_current_hdemo_sk], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_3_4_5_1] ON [dbo].[customer]([c_current_cdemo_sk], [c_current_hdemo_sk], [c_current_addr_sk], [c_customer_sk])
go

-- ===== query091_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K1_3_4_5] ON [dbo].[customer]
(
	[c_customer_sk] ASC
)
INCLUDE ( 	[c_current_cdemo_sk],
	[c_current_hdemo_sk],
	[c_current_addr_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query091_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K12_K1] ON [dbo].[customer_address]
(
	[ca_gmt_offset] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query091_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K9_K7_K1] ON [dbo].[date_dim]
(
	[d_moy] ASC,
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query091_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_demographics_6_949578421__K4_K3_1] ON [dbo].[customer_demographics]
(
	[cd_education_status] ASC,
	[cd_marital_status] ASC
)
INCLUDE ( 	[cd_demo_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query092_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K1_K20_K23_K4] ON [dbo].[web_sales]
(
	[ws_sold_date_sk] ASC,
	[ws_wholesale_cost] ASC,
	[ws_ext_discount_amt] ASC,
	[ws_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_23_1] ON [dbo].[web_sales]([ws_ext_discount_amt], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_23] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_ext_discount_amt])
go

CREATE STATISTICS [_dta_stat_1589580701_1_22_20] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_sales_price], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1589580701_4_20_23] ON [dbo].[web_sales]([ws_item_sk], [ws_wholesale_cost], [ws_ext_discount_amt])
go

CREATE STATISTICS [_dta_stat_1589580701_20_22_23_1] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_sales_price], [ws_ext_discount_amt], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_4_22_20] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_item_sk], [ws_sales_price], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1589580701_4_22_20_23] ON [dbo].[web_sales]([ws_item_sk], [ws_sales_price], [ws_wholesale_cost], [ws_ext_discount_amt])
go

CREATE STATISTICS [_dta_stat_1589580701_1_4_20_23_22] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_item_sk], [ws_wholesale_cost], [ws_ext_discount_amt], [ws_sales_price])
go

CREATE STATISTICS [_dta_stat_1173579219_1_14] ON [dbo].[item]([i_item_sk], [i_manufact_id])
go

CREATE STATISTICS [_dta_stat_1173579219_13_14_1] ON [dbo].[item]([i_category], [i_manufact_id], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_3] ON [dbo].[date_dim]([d_date_sk], [d_date])
go

-- ===== query092_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K1_K20_K23_K4] ON [dbo].[web_sales]
(
	[ws_sold_date_sk] ASC,
	[ws_wholesale_cost] ASC,
	[ws_ext_discount_amt] ASC,
	[ws_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_23_1] ON [dbo].[web_sales]([ws_ext_discount_amt], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_23] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_ext_discount_amt])
go

CREATE STATISTICS [_dta_stat_1589580701_1_22_20] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_sales_price], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1589580701_4_20_23] ON [dbo].[web_sales]([ws_item_sk], [ws_wholesale_cost], [ws_ext_discount_amt])
go

CREATE STATISTICS [_dta_stat_1589580701_20_22_23_1] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_sales_price], [ws_ext_discount_amt], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_4_22_20] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_item_sk], [ws_sales_price], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1589580701_4_22_20_23] ON [dbo].[web_sales]([ws_item_sk], [ws_sales_price], [ws_wholesale_cost], [ws_ext_discount_amt])
go

CREATE STATISTICS [_dta_stat_1589580701_1_4_20_23_22] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_item_sk], [ws_wholesale_cost], [ws_ext_discount_amt], [ws_sales_price])
go

CREATE STATISTICS [_dta_stat_1173579219_1_14] ON [dbo].[item]([i_item_sk], [i_manufact_id])
go

CREATE STATISTICS [_dta_stat_1173579219_13_14_1] ON [dbo].[item]([i_category], [i_manufact_id], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_3] ON [dbo].[date_dim]([d_date_sk], [d_date])
go

-- ===== query094_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K21_K18_K3_K14_K12_16_29_34] ON [dbo].[web_sales]
(
	[ws_list_price] ASC,
	[ws_order_number] ASC,
	[ws_ship_date_sk] ASC,
	[ws_web_site_sk] ASC,
	[ws_ship_addr_sk] ASC
)
INCLUDE ( 	[ws_warehouse_sk],
	[ws_ext_ship_cost],
	[ws_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_3_21_18] ON [dbo].[web_sales]([ws_ship_date_sk], [ws_list_price], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_1589580701_3_18_14_12] ON [dbo].[web_sales]([ws_ship_date_sk], [ws_order_number], [ws_web_site_sk], [ws_ship_addr_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_12_21_18_3] ON [dbo].[web_sales]([ws_ship_addr_sk], [ws_list_price], [ws_order_number], [ws_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_14_21_18_3_12] ON [dbo].[web_sales]([ws_web_site_sk], [ws_list_price], [ws_order_number], [ws_ship_date_sk], [ws_ship_addr_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_3] ON [dbo].[date_dim]([d_date_sk], [d_date])
go

CREATE STATISTICS [_dta_stat_1557580587_13_14] ON [dbo].[web_returns]([wr_reason_sk], [wr_order_number])
go

CREATE STATISTICS [_dta_stat_917578307_1_9] ON [dbo].[customer_address]([ca_address_sk], [ca_state])
go

-- ===== query094_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K18_16] ON [dbo].[web_sales]
(
	[ws_order_number] ASC
)
INCLUDE ( 	[ws_warehouse_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query094_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_returns_6_1557580587__K13] ON [dbo].[web_returns]
(
	[wr_reason_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_16_3] ON [dbo].[web_sales]([ws_warehouse_sk], [ws_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_18_16_3] ON [dbo].[web_sales]([ws_order_number], [ws_warehouse_sk], [ws_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_21_18_16_14] ON [dbo].[web_sales]([ws_list_price], [ws_order_number], [ws_warehouse_sk], [ws_web_site_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_3_18_14_16_12] ON [dbo].[web_sales]([ws_ship_date_sk], [ws_order_number], [ws_web_site_sk], [ws_warehouse_sk], [ws_ship_addr_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_21_18_16_12_3] ON [dbo].[web_sales]([ws_list_price], [ws_order_number], [ws_warehouse_sk], [ws_ship_addr_sk], [ws_ship_date_sk])
go

-- ===== query094_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9_K1] ON [dbo].[customer_address]
(
	[ca_state] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_3_21_16] ON [dbo].[web_sales]([ws_ship_date_sk], [ws_list_price], [ws_warehouse_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_12_21_16] ON [dbo].[web_sales]([ws_ship_addr_sk], [ws_list_price], [ws_warehouse_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_21_16_18_3] ON [dbo].[web_sales]([ws_list_price], [ws_warehouse_sk], [ws_order_number], [ws_ship_date_sk])
go

-- ===== query094_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K3_K1] ON [dbo].[date_dim]
(
	[d_date] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query094_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K3_K21_K18_K14_K12_16_29_34] ON [dbo].[web_sales]
(
	[ws_ship_date_sk] ASC,
	[ws_list_price] ASC,
	[ws_order_number] ASC,
	[ws_web_site_sk] ASC,
	[ws_ship_addr_sk] ASC
)
INCLUDE ( 	[ws_warehouse_sk],
	[ws_ext_ship_cost],
	[ws_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_21_18] ON [dbo].[web_sales]([ws_list_price], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_1589580701_3_18_14_12] ON [dbo].[web_sales]([ws_ship_date_sk], [ws_order_number], [ws_web_site_sk], [ws_ship_addr_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_12_21_18_3] ON [dbo].[web_sales]([ws_ship_addr_sk], [ws_list_price], [ws_order_number], [ws_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_14_21_18_3_12] ON [dbo].[web_sales]([ws_web_site_sk], [ws_list_price], [ws_order_number], [ws_ship_date_sk], [ws_ship_addr_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_3] ON [dbo].[date_dim]([d_date_sk], [d_date])
go

CREATE STATISTICS [_dta_stat_1557580587_13_14] ON [dbo].[web_returns]([wr_reason_sk], [wr_order_number])
go

CREATE STATISTICS [_dta_stat_917578307_1_9] ON [dbo].[customer_address]([ca_address_sk], [ca_state])
go

-- ===== query094_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K18_K14_K3_K12_K21_16_29_34] ON [dbo].[web_sales]
(
	[ws_order_number] ASC,
	[ws_web_site_sk] ASC,
	[ws_ship_date_sk] ASC,
	[ws_ship_addr_sk] ASC,
	[ws_list_price] ASC
)
INCLUDE ( 	[ws_warehouse_sk],
	[ws_ext_ship_cost],
	[ws_net_profit]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_21_18_12_14] ON [dbo].[web_sales]([ws_list_price], [ws_order_number], [ws_ship_addr_sk], [ws_web_site_sk])
go

-- ===== query094_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_returns_6_1557580587__K13_14] ON [dbo].[web_returns]
(
	[wr_reason_sk] ASC
)
INCLUDE ( 	[wr_order_number]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_12_21_16] ON [dbo].[web_sales]([ws_ship_addr_sk], [ws_list_price], [ws_warehouse_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_3_21_16] ON [dbo].[web_sales]([ws_ship_date_sk], [ws_list_price], [ws_warehouse_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_14_21_16_18] ON [dbo].[web_sales]([ws_web_site_sk], [ws_list_price], [ws_warehouse_sk], [ws_order_number])
go

CREATE STATISTICS [_dta_stat_1589580701_21_16_18_12_14] ON [dbo].[web_sales]([ws_list_price], [ws_warehouse_sk], [ws_order_number], [ws_ship_addr_sk], [ws_web_site_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_18_16_14_12_3] ON [dbo].[web_sales]([ws_order_number], [ws_warehouse_sk], [ws_web_site_sk], [ws_ship_addr_sk], [ws_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_21_16_18_3_14] ON [dbo].[web_sales]([ws_list_price], [ws_warehouse_sk], [ws_order_number], [ws_ship_date_sk], [ws_web_site_sk])
go

-- ===== query094_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9_K1] ON [dbo].[customer_address]
(
	[ca_state] ASC,
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query094_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K3_K1] ON [dbo].[date_dim]
(
	[d_date] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query099_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K15_K21_1_3_12_14] ON [dbo].[catalog_sales]
(
	[cs_warehouse_sk] ASC,
	[cs_list_price] ASC
)
INCLUDE ( 	[cs_sold_date_sk],
	[cs_ship_date_sk],
	[cs_call_center_sk],
	[cs_ship_mode_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_21_15] ON [dbo].[catalog_sales]([cs_list_price], [cs_warehouse_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_21_14_15] ON [dbo].[catalog_sales]([cs_list_price], [cs_ship_mode_sk], [cs_warehouse_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_15_12_14_3] ON [dbo].[catalog_sales]([cs_warehouse_sk], [cs_call_center_sk], [cs_ship_mode_sk], [cs_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_3_21_15_12] ON [dbo].[catalog_sales]([cs_ship_date_sk], [cs_list_price], [cs_warehouse_sk], [cs_call_center_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_12_21_15_14_3] ON [dbo].[catalog_sales]([cs_call_center_sk], [cs_list_price], [cs_warehouse_sk], [cs_ship_mode_sk], [cs_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_4_1] ON [dbo].[date_dim]([d_month_seq], [d_date_sk])
go

-- ===== query099_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K4_K1] ON [dbo].[date_dim]
(
	[d_month_seq] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_21_14_3] ON [dbo].[catalog_sales]([cs_list_price], [cs_ship_mode_sk], [cs_ship_date_sk])
go

-- ===== query099_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_catalog_sales_6_1621580815__K15_K21_1_3_12_14] ON [dbo].[catalog_sales]
(
	[cs_warehouse_sk] ASC,
	[cs_list_price] ASC
)
INCLUDE ( 	[cs_sold_date_sk],
	[cs_ship_date_sk],
	[cs_call_center_sk],
	[cs_ship_mode_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_21_14] ON [dbo].[catalog_sales]([cs_list_price], [cs_ship_mode_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_12_21_15] ON [dbo].[catalog_sales]([cs_call_center_sk], [cs_list_price], [cs_warehouse_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_15_14_12_3] ON [dbo].[catalog_sales]([cs_warehouse_sk], [cs_ship_mode_sk], [cs_call_center_sk], [cs_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_21_3_15_14] ON [dbo].[catalog_sales]([cs_list_price], [cs_ship_date_sk], [cs_warehouse_sk], [cs_ship_mode_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_21_15_14_12_3] ON [dbo].[catalog_sales]([cs_list_price], [cs_warehouse_sk], [cs_ship_mode_sk], [cs_call_center_sk], [cs_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_4] ON [dbo].[date_dim]([d_date_sk], [d_month_seq])
go

-- ===== query099_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K4_K1] ON [dbo].[date_dim]
(
	[d_month_seq] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1621580815_21_14_3] ON [dbo].[catalog_sales]([cs_list_price], [cs_ship_mode_sk], [cs_ship_date_sk])
go

CREATE STATISTICS [_dta_stat_1621580815_21_15_3_12] ON [dbo].[catalog_sales]([cs_list_price], [cs_warehouse_sk], [cs_ship_date_sk], [cs_call_center_sk])
go

-- ===== query100_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K1_K13_K10_K4_K3] ON [dbo].[store_sales]
(
	[ss_sold_date_sk] ASC,
	[ss_list_price] ASC,
	[ss_ticket_number] ASC,
	[ss_customer_sk] ASC,
	[ss_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_10_4] ON [dbo].[store_sales]([ss_ticket_number], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_13] ON [dbo].[store_sales]([ss_item_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1653580929_13_10_1] ON [dbo].[store_sales]([ss_list_price], [ss_ticket_number], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_13_4_1] ON [dbo].[store_sales]([ss_list_price], [ss_customer_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_13_10_3_4] ON [dbo].[store_sales]([ss_list_price], [ss_ticket_number], [ss_item_sk], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_13_10_4_1] ON [dbo].[store_sales]([ss_list_price], [ss_ticket_number], [ss_customer_sk], [ss_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_4_1_10_3_13] ON [dbo].[store_sales]([ss_customer_sk], [ss_sold_date_sk], [ss_ticket_number], [ss_item_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1173579219_21_1] ON [dbo].[item]([i_manager_id], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13] ON [dbo].[item]([i_manager_id], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_13_1_21] ON [dbo].[item]([i_category], [i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_949578421_1_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_4_3] ON [dbo].[customer_demographics]([cd_education_status], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_3_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_marital_status], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_2_1_3_4] ON [dbo].[customer_demographics]([cd_gender], [cd_demo_sk], [cd_marital_status], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_1269579561_3_5] ON [dbo].[customer]([c_current_cdemo_sk], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5_3] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk], [c_current_cdemo_sk])
go

-- ===== query100_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K13_K10_3] ON [dbo].[store_sales]
(
	[ss_list_price] ASC,
	[ss_ticket_number] ASC
)
INCLUDE ( 	[ss_item_sk]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_10_3_4] ON [dbo].[store_sales]([ss_ticket_number], [ss_item_sk], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_3_1] ON [dbo].[customer]([c_current_cdemo_sk], [c_customer_sk])
go

-- ===== query100_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_demographics_6_949578421__K4_K3] ON [dbo].[customer_demographics]
(
	[cd_education_status] ASC,
	[cd_marital_status] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query100_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K3_K1_K5] ON [dbo].[customer]
(
	[c_current_cdemo_sk] ASC,
	[c_customer_sk] ASC,
	[c_current_addr_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query100_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13] ON [dbo].[item]
(
	[i_category] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query100_0 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K1] ON [dbo].[customer_address]
(
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query100_0 / iter_07 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query100_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K13_K1_K10_K3_K4] ON [dbo].[store_sales]
(
	[ss_list_price] ASC,
	[ss_sold_date_sk] ASC,
	[ss_ticket_number] ASC,
	[ss_item_sk] ASC,
	[ss_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_4_13] ON [dbo].[store_sales]([ss_customer_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1653580929_3_13] ON [dbo].[store_sales]([ss_item_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1653580929_10_3_13] ON [dbo].[store_sales]([ss_ticket_number], [ss_item_sk], [ss_list_price])
go

CREATE STATISTICS [_dta_stat_1653580929_10_1_3] ON [dbo].[store_sales]([ss_ticket_number], [ss_sold_date_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_10_3_4] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_ticket_number], [ss_item_sk], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_13_10_3] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_list_price], [ss_ticket_number], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_13_10_4_1_3] ON [dbo].[store_sales]([ss_list_price], [ss_ticket_number], [ss_customer_sk], [ss_sold_date_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_21_1] ON [dbo].[item]([i_manager_id], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_13_1] ON [dbo].[item]([i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13_1] ON [dbo].[item]([i_manager_id], [i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_917578307_9_1] ON [dbo].[customer_address]([ca_state], [ca_address_sk])
go

CREATE STATISTICS [_dta_stat_949578421_1_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_3] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_marital_status])
go

CREATE STATISTICS [_dta_stat_949578421_3_4_1] ON [dbo].[customer_demographics]([cd_marital_status], [cd_education_status], [cd_demo_sk])
go

CREATE STATISTICS [_dta_stat_949578421_2_1_3_4] ON [dbo].[customer_demographics]([cd_gender], [cd_demo_sk], [cd_marital_status], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_1269579561_5_1] ON [dbo].[customer]([c_current_addr_sk], [c_customer_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_3_1_5] ON [dbo].[customer]([c_current_cdemo_sk], [c_customer_sk], [c_current_addr_sk])
go

-- ===== query100_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K1_K3_K5] ON [dbo].[customer]
(
	[c_customer_sk] ASC,
	[c_current_cdemo_sk] ASC,
	[c_current_addr_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_10_4] ON [dbo].[store_sales]([ss_ticket_number], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_13_4_3] ON [dbo].[store_sales]([ss_list_price], [ss_customer_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_13_10_3_4] ON [dbo].[store_sales]([ss_list_price], [ss_ticket_number], [ss_item_sk], [ss_customer_sk])
go

-- ===== query100_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13] ON [dbo].[item]
(
	[i_category] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query100_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query100_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K13_K10] ON [dbo].[store_sales]
(
	[ss_list_price] ASC,
	[ss_ticket_number] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query100_1 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K1] ON [dbo].[customer_address]
(
	[ca_address_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query101_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_returns_6_1333579789__K1_K3_K10] ON [dbo].[store_returns]
(
	[sr_returned_date_sk] ASC,
	[sr_item_sk] ASC,
	[sr_ticket_number] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_3_10_1] ON [dbo].[store_returns]([sr_item_sk], [sr_ticket_number], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_13_1] ON [dbo].[item]([i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_5] ON [dbo].[web_sales]([ws_item_sk], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_4_5] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_item_sk], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_10_4] ON [dbo].[store_sales]([ss_item_sk], [ss_ticket_number], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_14_10] ON [dbo].[store_sales]([ss_item_sk], [ss_sales_price], [ss_ticket_number])
go

CREATE STATISTICS [_dta_stat_1653580929_4_14_3_10] ON [dbo].[store_sales]([ss_customer_sk], [ss_sales_price], [ss_item_sk], [ss_ticket_number])
go

CREATE STATISTICS [_dta_stat_1365579903_1_2] ON [dbo].[household_demographics]([hd_demo_sk], [hd_income_band_sk])
go

CREATE STATISTICS [_dta_stat_1365579903_1_3] ON [dbo].[household_demographics]([hd_demo_sk], [hd_buy_potential])
go

CREATE STATISTICS [_dta_stat_1365579903_3_2_1] ON [dbo].[household_demographics]([hd_buy_potential], [hd_income_band_sk], [hd_demo_sk])
go

CREATE STATISTICS [_dta_stat_981578535_3_7] ON [dbo].[date_dim]([d_date], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_3_7] ON [dbo].[date_dim]([d_date_sk], [d_date], [d_year])
go

CREATE STATISTICS [_dta_stat_917578307_1_9] ON [dbo].[customer_address]([ca_address_sk], [ca_state])
go

CREATE STATISTICS [_dta_stat_1269579561_5_4] ON [dbo].[customer]([c_current_addr_sk], [c_current_hdemo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_4_1_5] ON [dbo].[customer]([c_current_hdemo_sk], [c_customer_sk], [c_current_addr_sk])
go

-- ===== query101_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K1_K5_K4_9_10] ON [dbo].[customer]
(
	[c_customer_sk] ASC,
	[c_current_addr_sk] ASC,
	[c_current_hdemo_sk] ASC
)
INCLUDE ( 	[c_first_name],
	[c_last_name]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_10_1] ON [dbo].[store_returns]([sr_ticket_number], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_14_10] ON [dbo].[store_sales]([ss_sales_price], [ss_ticket_number])
go

CREATE STATISTICS [_dta_stat_1653580929_14_4_10] ON [dbo].[store_sales]([ss_sales_price], [ss_customer_sk], [ss_ticket_number])
go

-- ===== query101_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K1] ON [dbo].[item]
(
	[i_category] ASC,
	[i_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query101_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_returns_6_1333579789__K1_K3_K10] ON [dbo].[store_returns]
(
	[sr_returned_date_sk] ASC,
	[sr_item_sk] ASC,
	[sr_ticket_number] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_3_10_1] ON [dbo].[store_returns]([sr_item_sk], [sr_ticket_number], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1173579219_13_1] ON [dbo].[item]([i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_4_5] ON [dbo].[web_sales]([ws_item_sk], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_4_5] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_item_sk], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_10_4] ON [dbo].[store_sales]([ss_item_sk], [ss_ticket_number], [ss_customer_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_3_14_10] ON [dbo].[store_sales]([ss_item_sk], [ss_sales_price], [ss_ticket_number])
go

CREATE STATISTICS [_dta_stat_1653580929_4_14_3_10] ON [dbo].[store_sales]([ss_customer_sk], [ss_sales_price], [ss_item_sk], [ss_ticket_number])
go

CREATE STATISTICS [_dta_stat_1365579903_1_2] ON [dbo].[household_demographics]([hd_demo_sk], [hd_income_band_sk])
go

CREATE STATISTICS [_dta_stat_1365579903_1_3] ON [dbo].[household_demographics]([hd_demo_sk], [hd_buy_potential])
go

CREATE STATISTICS [_dta_stat_1365579903_3_2_1] ON [dbo].[household_demographics]([hd_buy_potential], [hd_income_band_sk], [hd_demo_sk])
go

CREATE STATISTICS [_dta_stat_981578535_3_7] ON [dbo].[date_dim]([d_date], [d_year])
go

CREATE STATISTICS [_dta_stat_981578535_7_1] ON [dbo].[date_dim]([d_year], [d_date_sk])
go

CREATE STATISTICS [_dta_stat_981578535_1_3_7] ON [dbo].[date_dim]([d_date_sk], [d_date], [d_year])
go

CREATE STATISTICS [_dta_stat_917578307_1_9] ON [dbo].[customer_address]([ca_address_sk], [ca_state])
go

CREATE STATISTICS [_dta_stat_1269579561_5_4] ON [dbo].[customer]([c_current_addr_sk], [c_current_hdemo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_4_1_5] ON [dbo].[customer]([c_current_hdemo_sk], [c_customer_sk], [c_current_addr_sk])
go

-- ===== query101_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K1_K5_K4_9_10] ON [dbo].[customer]
(
	[c_customer_sk] ASC,
	[c_current_addr_sk] ASC,
	[c_current_hdemo_sk] ASC
)
INCLUDE ( 	[c_first_name],
	[c_last_name]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1333579789_10_1] ON [dbo].[store_returns]([sr_ticket_number], [sr_returned_date_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_14_10] ON [dbo].[store_sales]([ss_sales_price], [ss_ticket_number])
go

CREATE STATISTICS [_dta_stat_1653580929_14_4_10] ON [dbo].[store_sales]([ss_sales_price], [ss_customer_sk], [ss_ticket_number])
go

-- ===== query101_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K1] ON [dbo].[item]
(
	[i_category] ASC,
	[i_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query102_0 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K4_K1_K3_K11] ON [dbo].[store_sales]
(
	[ss_customer_sk] ASC,
	[ss_sold_date_sk] ASC,
	[ss_item_sk] ASC,
	[ss_quantity] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_11_1_3] ON [dbo].[store_sales]([ss_quantity], [ss_sold_date_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_3_4_11] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_item_sk], [ss_customer_sk], [ss_quantity])
go

CREATE STATISTICS [_dta_stat_1173579219_1_13] ON [dbo].[item]([i_item_sk], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21] ON [dbo].[item]([i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13_1] ON [dbo].[item]([i_manager_id], [i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_20] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1589580701_20_16_5] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_warehouse_sk], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_4_5_1] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_item_sk], [ws_bill_customer_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_5_1_16_4] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_sold_date_sk], [ws_warehouse_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_5_20_1_16_4] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_wholesale_cost], [ws_sold_date_sk], [ws_warehouse_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1365579903_1_5] ON [dbo].[household_demographics]([hd_demo_sk], [hd_vehicle_count])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_917578307_1_9] ON [dbo].[customer_address]([ca_address_sk], [ca_state])
go

CREATE STATISTICS [_dta_stat_1493580359_3_1] ON [dbo].[inventory]([inv_warehouse_sk], [inv_date_sk])
go

CREATE STATISTICS [_dta_stat_1493580359_4_1_2] ON [dbo].[inventory]([inv_quantity_on_hand], [inv_date_sk], [inv_item_sk])
go

CREATE STATISTICS [_dta_stat_1493580359_2_1_3_4] ON [dbo].[inventory]([inv_item_sk], [inv_date_sk], [inv_warehouse_sk], [inv_quantity_on_hand])
go

CREATE STATISTICS [_dta_stat_949578421_2_3_4] ON [dbo].[customer_demographics]([cd_gender], [cd_marital_status], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_2_3_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_gender], [cd_marital_status], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_1269579561_4_3] ON [dbo].[customer]([c_current_hdemo_sk], [c_current_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_3_5] ON [dbo].[customer]([c_customer_sk], [c_current_cdemo_sk], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_5_3_4_1] ON [dbo].[customer]([c_current_addr_sk], [c_current_cdemo_sk], [c_current_hdemo_sk], [c_customer_sk])
go

-- ===== query102_0 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K20_K16_K5_K1_K4] ON [dbo].[web_sales]
(
	[ws_wholesale_cost] ASC,
	[ws_warehouse_sk] ASC,
	[ws_bill_customer_sk] ASC,
	[ws_sold_date_sk] ASC,
	[ws_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1269579561_1_5] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk])
go

-- ===== query102_0 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K1_K3_K5_K4] ON [dbo].[customer]
(
	[c_customer_sk] ASC,
	[c_current_cdemo_sk] ASC,
	[c_current_addr_sk] ASC,
	[c_current_hdemo_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query102_0 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_demographics_6_949578421__K1_K2_K3_K4] ON [dbo].[customer_demographics]
(
	[cd_demo_sk] ASC,
	[cd_gender] ASC,
	[cd_marital_status] ASC,
	[cd_education_status] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query102_0 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K21_K1] ON [dbo].[item]
(
	[i_category] ASC,
	[i_manager_id] ASC,
	[i_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query102_0 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_address_6_917578307__K9] ON [dbo].[customer_address]
(
	[ca_state] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query102_0 / iter_07 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_1_3] ON [dbo].[date_dim]
(
	[d_year] ASC
)
INCLUDE ( 	[d_date_sk],
	[d_date]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query102_1 / iter_01 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_store_sales_6_1653580929__K4_K1_K3_K11] ON [dbo].[store_sales]
(
	[ss_customer_sk] ASC,
	[ss_sold_date_sk] ASC,
	[ss_item_sk] ASC,
	[ss_quantity] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1653580929_11_1_3] ON [dbo].[store_sales]([ss_quantity], [ss_sold_date_sk], [ss_item_sk])
go

CREATE STATISTICS [_dta_stat_1653580929_1_3_4_11] ON [dbo].[store_sales]([ss_sold_date_sk], [ss_item_sk], [ss_customer_sk], [ss_quantity])
go

CREATE STATISTICS [_dta_stat_1173579219_1_13] ON [dbo].[item]([i_item_sk], [i_category])
go

CREATE STATISTICS [_dta_stat_1173579219_1_21] ON [dbo].[item]([i_item_sk], [i_manager_id])
go

CREATE STATISTICS [_dta_stat_1173579219_21_13_1] ON [dbo].[item]([i_manager_id], [i_category], [i_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_1_20] ON [dbo].[web_sales]([ws_sold_date_sk], [ws_wholesale_cost])
go

CREATE STATISTICS [_dta_stat_1589580701_20_16_5] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_warehouse_sk], [ws_bill_customer_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_4_5_1] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_item_sk], [ws_bill_customer_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_5_1_16_4] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_sold_date_sk], [ws_warehouse_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_5_20_1_16_4] ON [dbo].[web_sales]([ws_bill_customer_sk], [ws_wholesale_cost], [ws_sold_date_sk], [ws_warehouse_sk], [ws_item_sk])
go

CREATE STATISTICS [_dta_stat_1365579903_1_5] ON [dbo].[household_demographics]([hd_demo_sk], [hd_vehicle_count])
go

CREATE STATISTICS [_dta_stat_981578535_1_7] ON [dbo].[date_dim]([d_date_sk], [d_year])
go

CREATE STATISTICS [_dta_stat_917578307_1_9] ON [dbo].[customer_address]([ca_address_sk], [ca_state])
go

CREATE STATISTICS [_dta_stat_1493580359_3_1] ON [dbo].[inventory]([inv_warehouse_sk], [inv_date_sk])
go

CREATE STATISTICS [_dta_stat_1493580359_4_1_2] ON [dbo].[inventory]([inv_quantity_on_hand], [inv_date_sk], [inv_item_sk])
go

CREATE STATISTICS [_dta_stat_1493580359_2_1_3_4] ON [dbo].[inventory]([inv_item_sk], [inv_date_sk], [inv_warehouse_sk], [inv_quantity_on_hand])
go

CREATE STATISTICS [_dta_stat_949578421_2_3_4] ON [dbo].[customer_demographics]([cd_gender], [cd_marital_status], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_949578421_1_2_3_4] ON [dbo].[customer_demographics]([cd_demo_sk], [cd_gender], [cd_marital_status], [cd_education_status])
go

CREATE STATISTICS [_dta_stat_1269579561_4_3] ON [dbo].[customer]([c_current_hdemo_sk], [c_current_cdemo_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_3_5] ON [dbo].[customer]([c_customer_sk], [c_current_cdemo_sk], [c_current_addr_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_5_3_4_1] ON [dbo].[customer]([c_current_addr_sk], [c_current_cdemo_sk], [c_current_hdemo_sk], [c_customer_sk])
go

-- ===== query102_1 / iter_02 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_web_sales_6_1589580701__K20_K1_K16_K4_K5] ON [dbo].[web_sales]
(
	[ws_wholesale_cost] ASC,
	[ws_sold_date_sk] ASC,
	[ws_warehouse_sk] ASC,
	[ws_item_sk] ASC,
	[ws_bill_customer_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1589580701_20_16_1] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_warehouse_sk], [ws_sold_date_sk])
go

CREATE STATISTICS [_dta_stat_1589580701_20_4_1_16] ON [dbo].[web_sales]([ws_wholesale_cost], [ws_item_sk], [ws_sold_date_sk], [ws_warehouse_sk])
go

CREATE STATISTICS [_dta_stat_1269579561_1_5] ON [dbo].[customer]([c_customer_sk], [c_current_addr_sk])
go

-- ===== query102_1 / iter_03 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_6_1269579561__K1_K3_K5_K4] ON [dbo].[customer]
(
	[c_customer_sk] ASC,
	[c_current_cdemo_sk] ASC,
	[c_current_addr_sk] ASC,
	[c_current_hdemo_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query102_1 / iter_04 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_customer_demographics_6_949578421__K1_K2_K3_K4] ON [dbo].[customer_demographics]
(
	[cd_demo_sk] ASC,
	[cd_gender] ASC,
	[cd_marital_status] ASC,
	[cd_education_status] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query102_1 / iter_05 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_item_6_1173579219__K13_K21_K1] ON [dbo].[item]
(
	[i_category] ASC,
	[i_manager_id] ASC,
	[i_item_sk] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- ===== query102_1 / iter_06 =====
use [DSB_SF10]
go

CREATE NONCLUSTERED INDEX [_dta_index_date_dim_6_981578535__K7_K1_3] ON [dbo].[date_dim]
(
	[d_year] ASC,
	[d_date_sk] ASC
)
INCLUDE ( 	[d_date]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go
