package rds;
// 定义包名,如果是直接在java中调试，建议去掉
// 作者信息
// authors:zhangxin@sqc;lishun@sqc;hulilei@rds
// createDate:2021-11-27
// modifyDate:2021-11-28
import com.baidu.xchain.saas.SaasJavaManager;
// 引用于百度的jar包
// 相关依赖
// saas-java-linux-core.jar
// libSaasJavaSDK.so
// private.key

public class InvCer {
	 static final String bcname = "evidence_chain_cross";//链名,一般用此默认值
	 static final String host = "106.12.78.203:37101";//存证链的地址 ,一般用词默认值
     //提交证书生成的请求地址,一般用以下默认值
	 static final String certUrl = "https://xuper.baidu.com/saas/api/gencert";
     //服务调用入口，通过SaasJavaManager这个类提供的方法进行存证等操作
     static SaasJavaManager s;
     static{
    	 s= new SaasJavaManager();
     }
     // 设置libSaasJavaSDK.so 所在的路径
     public static void setLibPath(String libPath)
     {
         s.setLibraryPath(libPath);
     }
    // 判断private.key在指定目录中是否存在
     
     public static String isExist(String path)
     {
    	 return s.isAddressExist(path);
     }
     // 上传存证
     public static String crossTransfer(String path,
    		 String password,String filePath,
    		 String fileName,String companyPrefix)
     {
     
	     String fileHashJson=s.getFileHash(filePath);
	     String[] data=fileHashJson.split(":");
	     String fileHash=data[3];
	     int length=fileHash.length();
	     fileHash=fileHash.substring(0, length-1);
	     //desc 用户可以自定义，但必填的字段得有，并且必须是字符串类型的json
	     String desc = "{\"hashAlg\":\"SM3\",\"fileName\":\""
	             +fileName+"\",\"fileHash\":"
	    		 +fileHash+",\"companyPrefix\":\""
	             + companyPrefix+"\"}";
	    return  s.crossTransfer(bcname, desc, path, password, host);
     }
     //根据txtId查询存证信息
     public static String queryDetail(String txtid,
    		 String path, String password)
     {
    	return  s.queryTx(bcname, host, txtid, path, password);
     }
      public static String queryTx(String txtid,
                 String path, String password)
     {
        return  s.queryTx(bcname, host, txtid, path, password);
     }
     //获取证书为pdf格式
     public static String getCert(String txtid,
    		 String path,  String password){
    	return s.genCert(certUrl, txtid, path, password);
     }
     //查询词法存证余额
      public static String getBalance(String path,  String password){
        return s.getBalanceForSpecificChain(host, bcname, path, password);
     }
     //获取文件hash
      public static String getFileHash(String filePath){
        return s.getFileHash(filePath);
     }
     //验证本地文本是否一致

      public static String verifyEvidence(String txtid,String path,String password,String filePath){
        return s.verifyEvidence(bcname, host, txtid, path, password, filePath);
     }
     //根据txtId查询跨链情况
      public static String crossInfo(String txtid,String path,String password){
        return s.crossInfo(txtid,path, password);
     }




}

