select
 t1.column_name
,t1.disp_no
,t1.pkey
,t2.column_name
,t2.disp_no
,t2.pkey
,t3.column_name
,t3.disp_no
,t3.pkey
from col_def_001 t1
full outer join col_def_002 t2
   on t1.column_name = t2.column_name
  --and t1.disp_no = t2.disp_no
full outer join col_def_003 t3
   on t1.column_name = t3.column_name
  --and t1.disp_no = t3.disp_no
order by
  t1.disp_no
 ,t2.disp_no
 ,t3.disp_no
-- ,t1.column_name
-- ,t2.column_name
-- ,t3.column_name
;