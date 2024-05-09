-- General_Payments
CREATE TABLE cis_4400_group_3.Dim_Covered_Recipient (
    dim_Covered_Recipient_ID INT64 NOT NULL,
    Covered_Recipient_First_Name STRING,
    Covered_Recipient_Middle_Name STRING,
    Covered_Recipient_Last_Name STRING,
    Covered_Recipient_Primary_Type_1 STRING,
    Covered_Recipient_Specialty_1 STRING,
    Covered_Recipient_License_State_code1 STRING
);

CREATE TABLE cis_4400_group_3.Dim_Payment_detail (
    dim_Paymnet_detail_ID INT64 NOT NULL,
    Date_of_Payment DATE,
    Program_Year DATE,
    Payment_Publication_Date DATE,
    Form_of_Payement_or_Transfer_of_Value STRING,
    Nature_of_Payment_or_Transfer_of_Value STRING
);

CREATE TABLE cis_4400_group_3.Dim_Teaching_Hospital (
    dim_Teaching_Hospital_ID INT64 NOT NULL,
    Teaching_Hospital_ID INT64,
    Teaching_Hospital_Name STRING,
    Recipient_Primary_Business_Street_Address_Line1 STRING,
    Recipient_City STRING,
    Recipient_State STRING,
    Recipient_Zip_Code STRING
);


CREATE TABLE cis_4400_group_3.Fact_General_Payments (
    Fact_id BIGINT NOT NULL,
    Total_Amount_of_Payment_USDollars NUMERIC,
    Number_of_Payments_Included_in_Total_Amount NUMERIC,
    Physician_Ownership_Indicator STRING,
    dim_covered_recipient_ID BIGINT,
    dim_payment_ID BIGINT,
    dim_teaching_hospital BIGINT
);

--ownership payments
CREATE TABLE cis_4400_group_3.Dim_Physicians (
    Physician_Profile_ID BIGINT NOT NULL,
    Physician_First_Name STRING,
    Physician_Last_Name STRING,
    Physician_Primary_Type STRING,
    Physician_Specialty STRING
);

CREATE TABLE cis_4400_group_3.Dim_Payent_Details (
    Record_ID INT64 NOT NULL,
    Program_Year INT64
);

CREATE TABLE cis_4400_group_3.Fact_Ownership_Payments (
    Record_ID BIGINT NOT NULL,
    Physician_Profile_ID BIGINT NOT NULL,
    Total_Amount_Invested_USDollars NUMERIC,
    Value_of_Interest NUMERIC,
    Terms_of_Interest STRING,
    Submitting_Applicable_Manufacturer STRING,
    Applicable_Manufacturer_Payment_ID STRING,
    Applicable_Manufacturer_Name STRING,
    Applicable_Manufacturer_State STRING,
    Applicable_Manufacturer_Country STRING,
    Dispute_Status_for_Publication STRING,
    Interest_Held_by_Physician STRING,
    Payment_Publication_Date DATE
);

--research payments
CREATE TABLE cis_4400_group_3.Dim_Covered_Recipients (
    Covered_Recipient_Profile_ID STRING NOT NULL,
    Covered_Recipient_Type STRING,
    Covered_Recipient_First_Name STRING,
    Covered_Recipient_Middle_Name STRING,
    Covered_Recipient_Last_Name STRING,
    Covered_Recipient_Primary_Type STRING,
    Covered_Recipient_Specialty STRING
);

CREATE TABLE cis_4400_group_3.Dim_Principal_Investigators (
    Principal_Investigator_Profile_ID STRING NOT NULL,
    Principal_Investigator_Covered_Recipient_Type STRING,
    Principal_Investigator_First_Name STRING,
    Principal_Investigator_Last_Name STRING,
    Principal_Investigator_Business_Street_Address STRING,
    Principal_Investigator_City STRING,
    Principal_Investigator_State STRING,
    Principal_Investigator_Zip_Code STRING,
    Principal_Investigator_Primary_Type STRING,
    Principal_Investigator_Specialty STRING
);

CREATE TABLE cis_4400_group_3.Dim_Payment_Details (
    Applicable_GPO_Name STRING,
    Applicable_GPO_Making_Payment_ID STRING NOT NULL,
    Applicable_GPO_Making_Payment_Name STRING,
    Applicable_GPO_Making_Payment_State STRING,
    Applicable_GPO_Making_Payment_Country STRING
);

CREATE TABLE cis_4400_group_3.Fact_Research_Payments (
    Covered_Recipient_Profile_ID STRING NOT NULL,
    Teaching_Hospital_ID STRING NOT NULL,
    Principal_Investigator_Profile_ID STRING NOT NULL,
    Total_Amount_of_Payment_USDollars NUMERIC,
    Date_of_Payment DATE,
    Form_of_Payment_or_transfer_of_value STRING,
    Applicable_GPO_Making_Payment STRING NOT NULL
);


