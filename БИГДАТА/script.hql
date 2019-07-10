CREATE EXTERNAL TABLE u_m0xmu.D_PROD_CODES(
	prod_code string,
	prod_name string,
	BusinessBlock string,
	ClassByCode string,
	Type string,
	ProductByCode string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  '/user/u_m0xmu/db/D_PROD_CODES';
 