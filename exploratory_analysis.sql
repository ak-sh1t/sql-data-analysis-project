




#--churned vs non-churned customers through various aspects--#
select churn, count(*) customers, 
round(100 * count(*) / (select count(*) from customer_churn), 2) percentage
from customer_churn
group by churn;


select contract, count(*) total_customers,
sum(case when churn = 'Yes' then 1 else 0 end) churned_customers,
round(100 * sum(case when churn = 'Yes' then 1 else 0 end) / count(*),2) churn_rate
from customer_churn
group by Contract
order by churn_rate desc;


select  Churn, round(avg(MonthlyCharges), 2) avg_monthly_charge,
round(avg(TotalCharges), 2) avg_total_charge from customer_churn
group by Churn;


Select case
when tenure < 12 then 'New Customer'
when tenure between 12 and 48 then 'Regular Customer'
else 'Loyal Customer'
end customer_segment,

count(*) total_customers,
sum(case when Churn = 'Yes' then 1 else 0
end) churned_customers,
round(100 * sum(case when Churn = 'Yes' then 1 else 0 end) / count(*),2) churn_rate from customer_churn
group by customer_segment
order by churn_rate desc;




select InternetService, count(*) total_customers,
sum(case when Churn = 'Yes' then 1 else 0 end) churned_customers,
round(100 * sum(case when Churn = 'Yes' then 1 else 0 end) / count(*), 2) churn_rate from customer_churn
group by InternetService
order by churn_rate desc;


select PaymentMethod, count(*) total_customers,
sum(case when Churn = 'Yes' then 1 else 0 end) churned_customers,
round(100 * sum(case when Churn = 'Yes' then 1 else 0 end) / count(*),2) churn_rate from customer_churn
group by PaymentMethod
order by churn_rate desc;


select Contract, count(*) total_customers,
round(sum(TotalCharges), 2) total_revenue,
round(avg(TotalCharges), 2) avg_revenue_per_customer from customer_churn
group by Contract
order by total_revenue desc;



select Contract, count(*) total_customers,
sum(case when Churn = 'Yes' then 1 else 0 end) churned_customers,
round(100 * sum(case when Churn = 'Yes' then 1 else 0 end) / count(*) ,2) churn_rate,
rank() over(order by round(100 * sum(case when Churn = 'Yes' then 1 else 0 end) / count(*) ,2) desc) churn_rank
from customer_churn
group by Contract;


select customerID, Contract, tenure, MonthlyCharges, Churn, 
case 
    when Contract = 'Month-to-month' and tenure < 12 and MonthlyCharges > 70 then 'High Risk'
    when Contract = 'Month-to-month' and tenure < 24 then 'Medium Risk'
    else 'Low Risk'
end risk_category
from customer_churn;


