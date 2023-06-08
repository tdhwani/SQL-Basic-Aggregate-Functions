select 
  product_id, 
  round(sum_price / sum_units, 2) as average_price 
from 
  (
    select 
      T1.product_id, 
      sum(units * price) as sum_price, 
      sum(units) as sum_units 
    from 
      UnitsSold as T1 
      join Prices as T2 
    where 
      T1.product_id = T2.product_id 
      and T1.purchase_date >= T2.start_date 
      and T1.purchase_date <= T2.end_date 
    group by 
      product_id
  ) as q1;
