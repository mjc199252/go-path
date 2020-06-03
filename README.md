### 1.创建存储GOPATH文件夹
##### 例如：
```
➜  go-path-test pwd
/Users/XXX/go-path-test
➜  go-path-test ls
go_module_api       go_module_back_end  go_module_front_end
```
##### 上述代码中‘go-path-test’用于存放要切换GOPATH的文件其中包括:
```
go_module_qpi
go_module_back_end
go_module_front_end
```
##### 根据个人需求创建，文件里面的内容跟普通的GOPATH文件配置一致
### 2.创建全局环境变量G_C_PATH
##### G_C_PATH主要是储存GOPATH文件夹地址mac电脑可以通过下面的命令实现全局环境变量
```
➜  ~ echo export G_C_PATH="/Users/XXX/go-path-test" >> ~/.bash_profile
```
### 3.从github上拉取代码
```
git clone https://github.com/mjc199252/go-path.git
```
##### 进入项目文件夹输入
```
➜  go-path git:(master) pwd
/Users/XXX/go-path
```
##### 复制上述代码得出地址 输入
```
➜  go-path git:(master) echo "source /Users/XXX/go-path/go-path.sh" >> ~/.bash_profile && source /Users/XXX/go-path/go-path.sh
```
### 4.最后输入go-path就能看到你想要的东西啦
```
➜  go-path git:(master) ✗ go-path
-> go_module_api
  go_module_back_end
  go_module_front_end
➜  go-path git:(master) ✗ echo $GOPATH
/Users/XXX/go_module_api
➜  go-path git:(master) ✗ go-path -c go_module_back_end
➜  go-path git:(master) ✗ go-path
  go_module_api
-> go_module_back_end
  go_module_front_end
➜  go-path git:(master) ✗ echo $GOPATH
/Users/XXX/go_module_back_end
```

