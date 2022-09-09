# dev_RFreeze
R Freeze Mechanism to Replicate Pip List/Freeze to Capture Package Requirements 

##### List all installed packages
```
>install.packages("tibble")

>pkg = tibble::tibble(
  Package = names(installed.packages()[,3]),
  Version = unname(installed.packages()[,3])
 )
```

```
>write(pkg, "", sep = ", ")
## Error b/c pkg is a list
```
![https://github.com/lel99999/dev_RFreeze/blob/main/R_write_error-01.png](https://github.com/lel99999/dev_RFreeze/blob/main/R_write_error-01.png) <br/>

```
>sink("/tmp/test2.txt")
>print(pkg)
>sink()
>system("cat /tmp/test2.txt")
```
![https://github.com/lel99999/dev_RFreeze/blob/main/Rsytem_cat-02.png](https://github.com/lel99999/dev_RFreeze/blob/main/Rsytem_cat-02.png) <br/>

```
>print(pkg,n=Inf) #print all rows
```
![https://github.com/lel99999/dev_RFreeze/blob/main/R_print_all-01.png](https://github.com/lel99999/dev_RFreeze/blob/main/R_print_all-01.png) <br/>

##### Using dataframe
```
inst_pkgs <- as.data.frame(installed.packages()[ , c(1, 3:4)]) 
inst_pkgs <- inst_pkgs[is.na(inst_pkgs$Priority), 1:2, drop = FALSE] 
rownames(inst_pkgs) <- NULL 
print(inst_pkgs)
```

##### Save Rv3 Packages to install to Rv4 
inst_pkgs_v3.R
```
ip = installed.packages()
inst_pkgs = as.vector(ip[is.na(ip[,"Priority"]), 1])
save(inst_pkgs, file="~/inst_pkgs.v3")
```

restore_pkgs_v4.R
```
load("~/inst_pkgs.v3")
for(count in 1:length(inst_pkgs)){
  install.packages(inst_pkgs[count]])
}
```


##### List all attached and loaded packages (for dependencies), which is a subset of all installed packages
```
>sessionInfo()
```

##### Project and Package Isolation with Packrat
- [https://rstudio.github.io/packrat/](https://rstudio.github.io/packrat/) <br/>
- [https://rstudio.github.io/packrat/walkthrough.html](https://rstudio.github.io/packrat/walkthrough.html) <br/>

##### Tooling
- Use SQLite3 DB and Tools to capture and store info
  - Tools (command line interface) <br/>
    Src: [https://sqlite.org/2022/sqlite-autoconf-3390200.tar.gz](https://sqlite.org/2022/sqlite-autoconf-3390200.tar.gz) <br/>
    Linux: [https://www.sqlite.org/2022/sqlite-tools-linux-x86-3390200.zip](https://www.sqlite.org/2022/sqlite-tools-linux-x86-3390200.zip) <br/>
    Mac: [https://www.sqlite.org/2022/sqlite-tools-osx-x86-3390200.zip](https://www.sqlite.org/2022/sqlite-tools-osx-x86-3390200.zip) <br/>
