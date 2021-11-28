#' 下载证书
#'
#' @param session 会话
#' @param key_path privatekey
#' @param txtId   文件ID
#' @param password 文件名
#' @param cert_dir  证书地址
#'
#' @return 返回值
#' @export
#'
#' @examples
#' xp_downloadCert()
xp_downloadCert <- function(session = xp_session(),
                      key_path = 'data-raw/cfg',
                      txtId = "5974108e7624f1f8c955ad170eeb84862c6322cb295a6ab354b4f4d6323c135d",
                      password ="123456",
                      cert_dir ='bbc.pdf'
                     ){

  cert = session$getCert(txtId, key_path, password);
  txt_cert = as.character(cert)
  res_cert = rjson::fromJSON(txt_cert)
  if(res_cert$code == 0){
    download.file(res_cert$data,cert_dir)
  }


}


#'  查询证书
#'
#' @param session 会话
#' @param key_path privatekey
#' @param txtId   文件ID
#' @param password 文件名
#'
#' @return 返回值
#' @export
#'
#' @examples
#' xp_downloadCert()
xp_queryCert <- function(session = xp_session(),
                            key_path = 'data-raw/cfg',
                            txtId = "5974108e7624f1f8c955ad170eeb84862c6322cb295a6ab354b4f4d6323c135d",
                            password ="123456"

){

  cert = session$getCert(txtId, key_path, password);
  txt_cert = as.character(cert)
  res_cert = rjson::fromJSON(txt_cert)
   return(res_cert)


}


