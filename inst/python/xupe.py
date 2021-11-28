import jpype
import os
jvmPath = jpype.getDefaultJVMPath()
jarpath_xuper = '/home/hulilei/xuper_rds/saas-java-linux-core.jar'
jarpath_saas = '/home/hulilei/xuper_rds/rds-invcer.jar'

jpype.startJVM(jvmPath,'-ea', classpath=[jarpath_xuper,jarpath_saas])
print(jpype.java.lang.System.getProperty('java.class.path'))   
 
xuper = jpype.JClass("com.baidu.xchain.saas.SaasJavaManager")
saas = jpype.JClass("rds.InvCer")

libPath = "/home/ubuntu/xuper/libSaasJavaSDK.so";
saas.setLibPath(libPath);

path="/home/ubuntu/xuper/";
isExist = saas.isExist(path);
isExist;



