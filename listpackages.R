str(allPackage <- installed.packages(.Library, priority = "high"))

allPackage [, c(1,3:5)]

pkg = tibble::tibble(
  Package = names(installed.packages()[,3]),
  Version = unname(installed.packages()[,3])
)
