% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xp_file.R
\name{xp_uploadFile}
\alias{xp_uploadFile}
\title{上传可信存证}
\usage{
xp_uploadFile(
  session = xp_session(),
  key_path = "data-raw/cfg",
  password = "123456",
  filePath = "/home/ubuntu/xuper/porsche.jpg",
  fileName = "netStore2.jp",
  companyPrefix = "棱星数据"
)
}
\arguments{
\item{key_path}{private.key所在目录}

\item{password}{安全码}

\item{filePath}{文件路径}

\item{fileName}{文件名}

\item{companyPrefix}{公司前缀}

\item{sesseion}{会话}
}
\value{
返回值
}
\description{
上传可信存证
}
\examples{
xp_upload()
}
