% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xp_env.R
\name{xp_getBalance}
\alias{xp_getBalance}
\title{检验余额}
\usage{
xp_getBalance(
  session = xp_session(),
  key_path = "data-raw/cfg",
  password = "123456"
)
}
\arguments{
\item{session}{}

\item{key_path}{路径}

\item{password}{支付码}
}
\value{
返回值
}
\description{
检验余额
}
\examples{
xp_getBalance()
}
