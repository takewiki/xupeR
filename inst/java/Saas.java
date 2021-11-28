import com.baidu.xchain.saas.SaasJavaManager;

public class Saas {
	 static final String bcname = "evidence_chain_cross";//链名,一般用此默认值
	 static final String host = "106.12.78.203:37101";//存证链的地址 ,一般用词默认值
     //提交证书生成的请求地址,一般用以下默认值
	 static final String certUrl = "https://xuper.baidu.com/saas/api/gencert";
     //服务调用入口，通过SaasJavaManager这个类提供的方法进行存证等操作
     static SaasJavaManager s;
     static{
    	 s= new SaasJavaManager();
     }
     
     public static void setLibPath(String libPath)
     {
         s.setLibraryPath(libPath);
     }
    
     
     public static String isExist(String path)
     {
    	 return s.isAddressExist(path);
     }
     
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
     
     public static String queryTxid(String txid,
    		 String path, String password)
     {
    	return  s.queryTx(bcname, host, txid, path, password);
     }
     public static String getCert(String txid,
    		 String path,  String password){
    	return s.genCert(certUrl, txid, path, password);
     }
     


}

