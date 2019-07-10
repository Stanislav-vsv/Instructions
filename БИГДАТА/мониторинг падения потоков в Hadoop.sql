
select APP_NAME, APP_PATH, START_TIME, END_TIME, STATUS, USER_NAME, SITE from MONITORING.BDA_OOZIE_WF_JOBS 
where trunc(START_TIME) >  trunc(SYSDATE-7) --  trunc(END_TIME) in trunc(SYSDATE)
and USER_NAME in ('tech_oozie')
and STATUS not in ('SUCCEEDED', 'RUNNING') 
order by END_TIME desc
;