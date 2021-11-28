#' 上传可信存证
#'
#' @param sesseion 会话
#' @param key_path private.key所在目录
#' @param password  安全码
#' @param filePath  文件路径
#' @param fileName  文件名
#' @param companyPrefix 公司前缀
#'
#' @return 返回值
#' @export
#'
#' @examples
#' xp_upload()
xp_uploadFile <- function(session = xp_session(),
                      key_path = 'data-raw/cfg',
                      password ="123456",
                      filePath="/home/ubuntu/xuper/porsche.jpg",
                      fileName="netStore2.jp",
                      companyPrefix="棱星数据"

                      ) {
  key_status = xp_checkPrivateKey(session = session,key_path = key_path)
  bal_stauts = xp_checkBalance(session = session,key_path = key_path,password = password)
  if(key_status){
    #private key 存在
    if(bal_stauts){
      crossTransfer = saas$crossTransfer(key_path,
                                         password,filePath,fileName,companyPrefix)
      txt_crossTransfer =  as.character(crossTransfer)
      res =  rjson::fromJSON(txt_crossTransfer)

    }else{
      res = list(code = -2,msg='可用存证余量不足,请后台购买',data='')
    }


  }else{
    #private key不存在
    res = list(code = -1,msg='privateKey目录不存在',data='')
  }
  return(res)

}



#' 查询可信存证
#'
#' @param key_path private.key所在目录
#' @param session 会话管理员
#' @param txtId 文件类型
#' @param password  安全码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' xp_upload()
xp_QueryFile <- function(session = xp_session(),
                          key_path = 'data-raw/cfg',
                          password ="123456",
                          txtId ='5974108e7624f1f8c955ad170eeb84862c6322cb295a6ab354b4f4d6323c135d'


) {
  info = session$queryDetail( txtId, key_path, password);
  txt_info = as.character(info)
  res_info = rjson::fromJSON(txt_info)
  if(res_info$code == 0){
    #存在的情况下
    res_info$data$desc = rjson::fromJSON(res_info$data$desc)
  }else if(res_info$code == 1) {
    res_info$msg = '文件不存在,请查收存证hash值!'
    res_info$data =''

  }
  return(res_info)

}

