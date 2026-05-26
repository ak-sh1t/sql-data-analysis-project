describe customer_churn;
select * from customer_churn
limit 5;

select count(*) from customer_churn;


#--Modifying the columns datatype--#
alter table customer_churn
modify column SeniorCitizen int,
modify column tenure int,
modify column MonthlyCharges decimal(10,2);

select * from customer_churn
where TotalCharges = ' ';

update customer_churn
set TotalCharges = null
where TotalCharges = ' ';

alter table customer_churn
modify column TotalCharges decimal(10,2);

describe customer_churn;

#--checking for duplicates--#
select customerID, count(*) as duplicate_count from customer_churn
group by customerID 
having count(*) > 1;

#--checking for null values--#
select 
	sum(case when gender is null then 1 else 0
	end) as gender_nulls,
    sum(case when TotalCharges is null then 1 else 0 
    end) as TotalCharges_nulls from customer_churn;




