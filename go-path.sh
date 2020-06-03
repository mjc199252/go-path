#!/bin/bash
function go-path(){
  local PS_NAME="go-path"
  local PS_VERSION="0.1"
  local PROGRAM_DISPLAY_VERSION="$PS_NAME v$PS_VERSION"
  #local PHP_SWITCH_PATH="$PHP_IV_PATH"
  # colors
  COLOR_NORMAL=$(tput sgr0)
  COLOR_REVERSE=$(tput smso)
  GO_C_PATH=$(echo $G_C_PATH)
  PATH_FILE=$2

case "$1" in
    -h|--help|h|help)

cat <<-EOF
欢迎使用go-path地址切换工具，该工具主要用于开发环境中，多个项目开发的切换
相关指令信息:
      --help | -h | h | help     显示手册帮助信息 
切换地址(例):              
      go-path -c｜-C 地址文件名称
EOF

        return 0
        ;;
     -v|--version|v|version)
        echo $PROGRAM_DISPLAY_VERSION
        return 0 
        ;;

    -c|-C|-change|-changePath)
      if [[ GO_C_PATH == "" ]]; then
        echo '对不起，没有获取到对应的GOPATH信息' >&2
        return 1
      fi  

      if [ -f "$(echo $GO_C_PATH/$2)" ];then
          source $GO_C_PATH/$2
      else
          echo "配置路径文件不存在"
      fi
      return 0
      ;;
    "")
      if [[ GO_C_PATH == "" ]]; then
        echo '对不起，没有获取到对应的GOPATH信息' >&2
        return 1
      fi  

      for GOPATHS in `ls $(echo $GO_C_PATH)`; do
        local selected=" "
        local color=$COLOR_NORMAL
        if [[ $GOPATHS == ${$(echo $GOPATH)##*/} ]]; then
          local selected="->"
          local color=$COLOR_REVERSE
        fi
        printf "${color}%s %s${COLOR_NORMAL}\n" "$selected" "$GOPATHS"
      done
      return 0
      ;;
    *)
      echo "欢迎使用go-path，让您更加方便的使用go进行开发。"
      return 1
      ;;
  esac

  hash -r           
}



