#--tableau views--#
Create view executive_kpi_view as 
select count(*) total_customers, 
sum(case when Churn = 'Yes' then 1 else 0 end) churned_customers,
round(100 * sum(case when Churn = 'Yes' then 1 else 0 end),2) churn_rate,
round(avg(MonthlyCharges), 2) avg_monthly_charge,
round(avg(tenure),2) avg_tenure,
round(sum(TotalCharges), 2) total_revenue
from customer_churn;


select * from executive_kpi_view;


create view churn_analysis_view as
select Contract, InternetService, PaymentMethod, count(*) total_customers,
sum(case when Churn = 'Yes' then 1 else 0 end) churned_customers,
round(100 * sum(case when Churn = 'Yes' then 1 else 0 end),2) churn_rate
from customer_churn
group by Contract, InternetService, PaymentMethod;

create view customer_risk_view as 
select customerID, gender, SeniorCitizen, tenure, MonthlyCharges, TotalCharges, Contract, InternetService, PaymentMethod, Churn,
case 
	 when Contract = 'Month-to-month' and tenure < 12 and MonthlyCharges > 70 then 'High Risk'
    when Contract = 'Month-to-month' and tenure < 24 then 'Medium Risk'
    else 'Low Risk'
end risk_category
from customer_churn;

show full tables 
where table_type = 'VIEW';
