-- ���-�� ������� � ��
select count(*) from DWS009_SV.V_CURR_TRANS009_MIRROR WHERE TO_DATE('20170101', 'YYYYMMDD') <= TRANS_DATE AND TRANS_DATE < TO_DATE('20180101', 'YYYYMMDD')
-- ���-�� ������� � BDA
SELECT count(*) FROM sv_v_curr_trans009_mirror where date_part >= 20170101 and date_part <=20171231


-- ���-�� ������� � �� � ������������ �� ����(1 ����)
select trunc(TRANS_DATE), count(*) from DWS009_SV.V_CURR_TRANS009_MIRROR WHERE TO_DATE('20170101', 'YYYYMMDD') <= TRANS_DATE AND TRANS_DATE < TO_DATE('20180101', 'YYYYMMDD')
group by trunc(TRANS_DATE)
order by trunc(TRANS_DATE)


--���-�� ������� � 1 ��������
select count(*) from DWS009_SV.V_CURR_TRANS009_MIRROR partition (P20150224)

