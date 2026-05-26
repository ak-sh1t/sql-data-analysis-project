#--advanced analysis--#
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
