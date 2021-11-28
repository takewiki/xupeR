#创建百度可信存证会话管理器------
#' 创建百度可信存证会话管理器
#'
#' @param py_venv py_venv地址
#' @param package 增加把的应用
#'
#' @return 返回值
#' @import reticulate
#' @import rJava
#' @export
#'
#' @examples
#' xp_session()
xp_session <- function(py_venv ="/opt/my_env",package='rJava') {
  if(package == 'rJava'){
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
    saas$setLibPath(libPath);
  }else{
    #使用jpype作为过渡
    reticulate::use_virtualenv(py_venv, required = TRUE)
    jpype = import('jpype')
    os = import('os')
    jvmPath = jpype$getDefaultJVMPath()
    system.file('java','rds-invcer.jar',package = "xupeR")

    jarpath_xuper = system.file('java','saas-java-linux-core.jar',package = "xupeR")
    jarpath_saas = system.file('java','rds-invcer.jar',package = "xupeR")
    jpype_status = jpype$isJVMStarted()
    if(!jpype_status){
      jpype$startJVM(jvmPath,"-ea", classpath=list(jarpath_xuper,jarpath_saas))
    }
    xuper = jpype$JClass("com.baidu.xchain.saas.SaasJavaManager")
    saas = jpype$JClass("rds.InvCer")

  }


  return(saas)
}
#检查private.key目录是否存在-----
#' 检查private.key是否存在
#'
#' @param key_path key所在的路径
#' @param session 会话管理器
#'
#' @return 返回值
#' @export
#'
#' @examples
#' xp_checkPrivateKey()
xp_checkPrivateKey <- function(session = xp_session(),
                               key_path = 'data-raw/cfg'


) {
  #返回结果
  isExist = session$isExist(key_path);
  #转化为文本
  txt_isExist = as.character(isExist)
  #格式化文本
  json_isExist = rjson::fromJSON(txt_isExist)
  #获取结果
  info =  json_isExist$code
  if(info == 0){
    res =TRUE
  }else{
    res = FALSE
  }
  return(res)


}


#' 检验余额
#'
#' @param key_path 路径
#' @param password 支付码
#' @param session
#'
#' @return 返回值
#' @export
#'
#' @examples
#' xp_getBalance()
xp_getBalance <- function(session = xp_session(),
                            key_path = 'data-raw/cfg',
                            password ="123456"


) {
  bal = session$getBalance(key_path,password)

  txt_bal  =as.character(bal)

  res_bal = rjson::fromJSON(txt_bal)
  res<-as.integer(res_bal$data$evidence_chain_cross)
  return(res)
}


#' 检查司法存量的余量
#'
#' @param session 会议
#' @param key_path key所在位置
#' @param password 支付安全码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' xp_checkBalance()
xp_checkBalance <- function(session = xp_session(),
                            key_path = 'data-raw/cfg',
                            password ="123456"


) {
  data = xp_getBalance(session = session,key_path = key_path,password = password)
  if(data >0){
    res = TRUE
  }else{
    res=FALSE
  }
  return(res)



}






