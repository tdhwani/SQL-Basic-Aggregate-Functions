select 
  round(
    count(distinct t2.player_id)/ count(distinct t1.player_id), 
    2
  ) as fraction 
from 
  (
    select 
      player_id, 
      min(event_date) as first_login 
    from 
      Activity 
    group by 
      player_id
  ) as t1 
  left join Activity as t2 on t1.player_id = t2.player_id 
  and t1.first_login = t2.event_date - 1;
