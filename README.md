# dev_RFreeze
R Freeze Mechanism to Replicate Pip List/Freeze to Capture Package Requirements 

##### List all installed packages
```
>install.packages("tiblle")

>pkg = tibble::tibble(
  Package = names(installed.packages()[,3]),
  Version = unname(installed.packages()[,3])
 )

>write(pkg, "", sep = ", ")
```

##### List all attached and loaded packages (for dependencies), which is a subset of all installed packages
```
>sessionInfo()
```

##### Tooling
- Use SQLite3 DB and Tools to capture and store info
  - Tools (command line interface) <br/>
    Src: [https://sqlite.org/2022/sqlite-autoconf-3390200.tar.gz](https://sqlite.org/2022/sqlite-autoconf-3390200.tar.gz) <br/>
    Linux: [https://www.sqlite.org/2022/sqlite-tools-linux-x86-3390200.zip](https://www.sqlite.org/2022/sqlite-tools-linux-x86-3390200.zip) <br/>
    Mac: [https://www.sqlite.org/2022/sqlite-tools-osx-x86-3390200.zip](https://www.sqlite.org/2022/sqlite-tools-osx-x86-3390200.zip) <br/>
