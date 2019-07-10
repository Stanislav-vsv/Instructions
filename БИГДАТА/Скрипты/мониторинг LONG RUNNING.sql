select
  err_wf.type,
  err_wf.app_name,
  err_wf.start_time,
  err_wf.end_time, 
  p1.app_name as parent1_app_name,
  p2.app_name as parent2_app_name,
  err_wf.status,
  CONCAT('http://bda21node04.moscow.alfaintra.net:8888/oozie/list_oozie_workflow/',  err_wf.id) as url
from
(select 
SUBSTRING_INDEX(SUBSTRING(app_path, POSITION('oozie_workflows' IN app_path) + 16), '/', 1) as type,
j.*
from oozie.WF_JOBS j
where status in ('RUNNING') and 
   start_time <= NOW()-INTERVAL 12 HOUR and
   user_name = 'tech_oozie') err_wf
left join oozie.WF_JOBS p1
  on err_wf.parent_id = p1.id
left join oozie.WF_JOBS p2
  on p1.parent_id = p2.id
  where
   SUBSTRING_INDEX(SUBSTRING(p1.app_path, POSITION('oozie_workflows' IN p1.app_path) + 16), '/', 1) <> 'man' and
   SUBSTRING_INDEX(SUBSTRING(p2.app_path, POSITION('oozie_workflows' IN p2.app_path) + 16), '/', 1) <> 'man'
 