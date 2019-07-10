
DECLARE

day_from date;
day_to date;

begin

    select 
            (case when (select to_char(max(START_TIME), 'D') 
                                from DQ_PARAMS_NEWDQ@DWMON 
                                where CTL_WORKFLOW_NAME in ('WF_CTL_DMFR_LOADING_AW_INCR', 'WF_CTL_DMFR_LOADING_FULL')) = 6
                then trunc(sysdate, 'IW') - 4 
                else trunc(sysdate)-3 end ) into day_from from dual;

    select 
             (case when (select to_char(max(START_TIME), 'D') 
                                from DQ_PARAMS_NEWDQ@DWMON 
                                where CTL_WORKFLOW_NAME in ('WF_CTL_DMFR_LOADING_AW_INCR', 'WF_CTL_DMFR_LOADING_FULL')) = 6
                then trunc(sysdate, 'IW') + 4 
                else trunc(sysdate)-2 end ) into day_to from dual;


INSERT INTO dqmon.DQ_DETAILJOURNAL_TRAN
(
column_name,
COLUMN_UK1, 
DEFAULTST_FLAG, 
DESCRIPTION, 
DQ_CONTROL_UK,
DQ_LEVEL_UK, 
ERROR_FLAG, 
RESULT_CHAR1, 
VALUE_DATE,
RULE_DESCRIPTION,
RESULT_CHAR5,
RESULT_CHAR6,
XK,
REPORT_TIME,
CONNECTION_SID,
PM_WORKFLOW_RUN_ID 
)
SELECT
'ALL', 
0, 
'N', 
case when cnt=0 then 'Отсутствуют записи за отчетную дату в ФВ' else 'ok' end, 
763, 
5, 
case when cnt=0 then 'Y' else 'N' end, 
tab, 
day,
'<a target="_blank" href="http://albertp1:8080/dq_NEWDQ/dit_revision.php?list_id=763">Детали>></a>' as RULE_DESCRIPTION,
'DMFR.IFRSBALANCE_STAT' as RESULT_CHAR5,
'ФВ' as RESULT_CHAR6,
sq_DQ_DETAILJOURNAL_TRAN.NEXTVAL,
REPORT_TIME_pre_calc,
CONNECTION_SID_pre_calc,
PM_WORKFLOW_RUN_ID_pre_calc 
FROM

(SELECT  clnd.day,
                 SUM(CASE WHEN B.BALANCE_RUR_AMT IS NULL THEN 0  ELSE 1 END) cnt,
                 'DMFR.IFRSBALANCE_STAT' tab
 FROM  DWH.PRDCALENDAR_SDIM@DW_ST_PROD clnd
                 LEFT JOIN
                    DMFR.IFRSBALANCE_STAT@DW_ST_PROD b
                 ON clnd.day = b.value_day
         WHERE day BETWEEN  
               day_from                        
          AND
              day_to  
      GROUP BY   clnd.day);
      
end;      

COMMIT; 
      
      
      
      
      
      
      
      