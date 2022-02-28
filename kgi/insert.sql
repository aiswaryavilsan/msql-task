import pymysql

connection = pymysql.connect(host="localhost",user="root",passwd="",database="kgi_client")
cursor = connection.cursor()

cursor.execute( """INSERT INTO CLIENT_ORDER_HISTORY (symbol, acc_no, price, settlement_currency, exchange, rejection_message, stage, status, placed_at, qty,filled_qty, average_price, order_id, exchange_order_id, order_type, expiry_date, validity,order_action,fis_order_no,fis_exch_order_no,tran_type, updated_at, order_source, user_id, user_type, build,primary_id,msg_seq_no ) VALUES ('new', '1500', 1500, 'exch5','reject5','open','stat6','2021,03,14',1,1,1300,23456,76231,'cash on delivery','2021,05,05','2021,09,09','order6',56124,9864,'upi','2021,09,17','tghj','order6',45678,'user6','build6',23456,23443)""")

rows=cursor.fetchall()
connection.commit()
cursor.close()
connection.close()
