select
  t1.id as investor_id,
  CONCAT(
    t1.first_name,
    ' ',
    t1.last_name
  ) as full_name
from investors t1
