
with
wf_1 as
    (
    select WF_NAME_AFTER_RUN_1 from VS_SET_TIME_RUN_CHECK_RELIZ
    where LIST_ID = 1
    and TIME_SET_PARAM in (select max(TIME_SET_PARAM)  from VS_SET_TIME_RUN_CHECK_RELIZ where LIST_ID = 1)
    ),
wf_2 as
    (
    select WF_NAME_AFTER_RUN_2 from VS_SET_TIME_RUN_CHECK_RELIZ
    where LIST_ID = 1
    and TIME_SET_PARAM in (select max(TIME_SET_PARAM)  from VS_SET_TIME_RUN_CHECK_RELIZ where LIST_ID = 1)
    )
select 1 from  REP_DW_PROD.OPB_WFLOW_RUN@DW_INF_PROD
where SERVER_NAME='INT_DW_PROD'
and WORKFLOW_NAME in (( select WF_NAME_AFTER_RUN_1 from wf_1 ), ( select WF_NAME_AFTER_RUN_2 from wf_2))
and START_TIME >= sysdate-1 
and RUN_STATUS_CODE = 1
and (sysdate - END_TIME)*60*24 <= 5
;