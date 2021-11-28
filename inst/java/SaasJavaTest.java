// 	package saas;

import com.baidu.xchain.saas.SaasJavaManager;
import java.util.Scanner;

public class SaasJavaTest {
	public static void main(String[] args) {
		/**
		 * 如下是几个需要修改的参数:
		 * libPath:sdk包里面的libSaasJavaSDK.so所在的绝对值路径地址
		 * path:本地加密私钥文件所在的目录，会默认识别private.key
		 * password:成账号时设置的密码，用户自定义
		 * filePath:需要进行哈希比对的文件路径
		 * fileName:上链后的文件名
		 */
		// sdk包里面的libSaasJavaSDK.so所在的绝对值路径地址
		//例如: libPath = "/lib/libSaasJavaSDK.so";
		String libPath = "/home/ubuntu/xuper/libSaasJavaSDK.so";
		Saas.setLibPath(libPath);
		// SaasJavaManager.setLibraryPath(libPath);

		//本地加密私钥文件所在的目录，会默认识别private.key,
		//例如: path = "/home/acs/";
		String path="/home/ubuntu/xuper/";

		//生成账号时设置的密码，用户自定义
		//例如: password = "396283";
		String password ="396283";

		//需要进行哈希比对的文件路径,
		//例如:filePath = "/home/acs/b.txt";
		String filePath="/home/ubuntu/xuper/porsche.jpg";;

		//上链后的文件名,例如:fileName="test.txt"
		String fileName="porsche.jp";

		// 公司品牌名
		String companyPrefix="棱星";

		//可以根据已知的txid来查询证书相关信息，
		//例如：txid="53903a34d958ed8cc4828ac3127afaf9a7fde0ee7ed7b95839b6501d9960d7d5";
		//如果txid==null,表示查询正在上传的证书信息
		String txid = null;

		// 启动后，等待用户输入
		Scanner sc = new Scanner(System.in);
		while (true) {
			System.out.println("function list(enter the number and press the Enter key to get the function return result):");
			// 输入0,退出
			System.out.println("0. exit");
			// 输入1则会去校验private.key是否存在
			System.out.println("1. check whether an address is exist");
			// 输入2则会进行跨链存证，记得传入DESC，存证成功后会获取到txid,DESC里必备的字段如下：
			// （1）fileName：用户自定义的文件名，建议定义成用户系统能识别的
			// （2）fileHash：用户对存证原文做哈希运算后算出来的哈希内容，便于后续做数据比对用（存证不存原文，只存哈希值）
			// （3）hashAlg：对原文做哈希运算时所用的哈希算法，可以使用sdk本身提供的SHA256算法（MD5,SHA256等），便于后续按照约定的哈希算法做比对
			System.out.println("2. crossTransfer");
			// 输入3则根据txid获取到对应存证的信息
			System.out.println("3. query tx");
			// 输入4，并传入txid，则生成提交生成证书的任务；
			// 如果先前提交过，并且生成成功，则调用本api会返回证书url供用户下载
			// 注：证书服务只支持跨链存证，普通存证无法生成证书
			System.out.println("4. generate certification");

			String name = sc.nextLine();
			// 本地加密私钥文件所在的目录，会默认识别private.key
			int inputName=Integer.parseInt(name);
			while (inputName<0 || inputName>4)
			{
				System.out.println("输入错误，请重新输入：");
				name = sc.nextLine();
				inputName=Integer.parseInt(name);
			}
			if (name.equals("0")) {
				sc.close();
				return;
			}
			else if (name.equals("1")) {

				//Saas.setLibPath(libPath);
				String isExist = Saas.isExist(path);
				System.out.println("IsAddressExist : " + isExist); // 输出方法

			} else if (name.equals("2")) {
				//Saas.setLibPath()

				String crossTransfer = Saas.crossTransfer(path,
			    		 password,filePath,fileName,companyPrefix);
				System.out.println("crossTransfer : " + crossTransfer);

				if(txid==null)
				{
					String[] data = crossTransfer.split(":");
					txid = data[3];
					int length = txid.length();
					txid = txid.substring(1, length - 2);
				}
			} else if (name.equals("3")) {

				String querytx = Saas.queryTxid( txid, path, password);
				System.out.println("QueryTx : " + querytx);

			} else if (name.equals("4")) {

				String cert = Saas.getCert(txid, path, password);
				System.out.println("generate cert : " + cert);

			}
		}
	}
}

