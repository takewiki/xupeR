library(rJava)
.jinit()        # JVM start
.jclassPath()   # get default class path
jarpath_xuper = system.file('java','saas-java-linux-core.jar',package = "xupeR")
.jaddClassPath(jarpath_xuper)
jarpath_saas = system.file('java','rds-invcer.jar',package = "xupeR")
.jaddClassPath(jarpath_saas)
.jclassPath()   # get class path with added path
xuper = .jnew("com.baidu.xchain.saas.SaasJavaManager")
saas = .jnew("rds.InvCer")
libPath =  system.file('java','libSaasJavaSDK.so',package = "xupeR");
saas$setLibPath(libPath)
saas$isExist('data-raw/cfg')



xpr = xp_session(package = 'rJava')


xpr$isExist('data-raw/cfg')

xp_checkPrivateKey(session = xpr,key_path ='data-raw/cfg' )
xp_getBalance(session = xpr,key_path ='data-raw/cfg' ,password = '396283')



bal = xpr$getBalance(key_path ='/home/hulilei/pkgs2020/xupeR/data-raw/cfg/' ,password = '396283')

bal





xp_checkBalance(session = xpr,key_path ='/home/hulilei/pkgs2020/xupeR/data-raw/cfg/' ,password = '396283')







#xpr$crossTransfer(key_path ='/home/hulilei/pkgs2020/xupeR/data-raw/cfg/',password = '396283',filePath = '/home/hulilei/pkgs2020/xupeR/bbc.pdf',fileName = 'bbc_test.pdf',companyPrefix = 'RDS' )

xp_uploadFile(session = xpr,key_path ='/home/hulilei/pkgs2020/xupeR/data-raw/cfg/',password = '396283',filePath = '/home/hulilei/pkgs2020/xupeR/bbc.pdf',fileName = 'bbc_test.pdf',companyPrefix = 'RDS' )

