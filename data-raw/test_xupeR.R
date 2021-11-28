#加载包
library(xupeR)
#建立传话管理器
xpr = xp_session()
#检验是否存在
xp_key = xp_checkPrivateKey(session = xpr,key_path = "data-raw/cfg/")
xp_key
#检验余额
bal_count = xp_getBalance(session = xpr,key_path = "data-raw/cfg/",password = '123456')
bal_count;
bal_status = xp_checkBalance(session  = xpr,key_path = "data-raw/cfg/",password = '123456')
bal_status


xp_downloadCert(session = xpr,key_path = "data-raw/cfg/",txtId = '5974108e7624f1f8c955ad170eeb84862c6322cb295a6ab354b4f4d6323c135d',password = '123456',cert_dir = 'bbc.pdf')

file_info =xp_QueryFile(session = xpr,key_path = "data-raw/cfg/",txtId = '5974108e7624f1f8c955ad170eeb84862c6322cb295a6ab354b4f4d6323c135d',password = '123456')
file_info
