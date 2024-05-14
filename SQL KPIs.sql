
select * from finance_1;
select * from finance_2;

-- KPI 1-- 
select (right(issue_d,2)) as year_wise,sum(loan_amnt) as loan from finance_1
group by year_wise
order by year_wise;

-- KPI 2-- 
select grade,sum(revol_bal) from finance_1 inner join finance_2 
on finance_1.id = finance_2.id 
group by grade
order by grade;

select sub_grade,sum(revol_bal) from finance_1 inner join finance_2 
on finance_1.id = finance_2.id 
group by sub_grade
order by sub_grade;

-- KPI 3-- 
select verification_status,round(sum(total_pymnt)) from finance_1 inner join finance_2
on finance_1.id = finance_2.id 
group by verification_status;

-- KPI 4-- 
select addr_state,loan_status,count(finance_2.last_credit_pull_d) from finance_1 inner join finance_2
on finance_1.id = finance_2.id
group by loan_status,addr_state
order by addr_state;

-- KPI 5-- 
select home_ownership,count(last_pymnt_d) from finance_1 inner join finance_2 on
finance_1.id = finance_2.id
group by home_ownership;