import pymysql
connection = pymysql.connect(host=str(input("host:")),user=str(input("user:")),passwd="",database=str(input("database:")))
table=str(input("table:"))

cursor1 = connection.cursor()
cursor2 = connection.cursor()

query1="CREATE TABLE CLIENT_ORDER_LOG_HISTORY AS SELECT symbol, acc_no, price, settlement_currency, exchange, rejection_message, stage, status, placed_at, qty, filled_qty, average_price, order_id, exchange_order_id, order_type, expiry_date, validity,order_action,fis_order_no, fis_exch_order_no,tran_type, updated_at, order_source, user_id, user_type, build,primary_id,msg_seq_no FROM kgi_client.CLIENT_ORDER_HISTORY WHERE DATE(updated_at) BETWEEN '2021-07-01' AND '2021-11-30' AND stage = 'OPEN' AND order_action like '%' AND symbol like '%' AND acc_no like '0080217' AND exchange like '%' ORDER BY placed_at DESC LIMIT 40 OFFSET 0 "
cursor1.execute(query1)
rows1=cursor1.fetchall()
for row1 in rows1:
    print(row1)

query2 = "SELECT distinct o.*,  a.tran_type, a.exchange FROM  kgi_client.CLIENT_ORDER_LOG_HISTORY o INNER JOIN kgi_client.CLIENT_ORDER_HISTORY a ON o.order_id = a.order_id WHERE o.primary_id = '20211129/0080217/363163001'ORDER BY o.msg_seq_no"
cursor2.execute(query2)
rows2=cursor2.fetchall()
for row2 in rows2:
    print(row2)
    
connection.commit()
connection.close()




