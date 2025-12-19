# 官方文档地址：https://console.firebase.google.com/u/0/?pli=1

# 1.下载firebase-tools
npm install -g firebase-tools
# 2.登陆firebase
firebase login
# 如果登陆不成功使用试试
firebase login --no-localhost
# 3.检查项目
firebase projects:list


# ###########################
# 1.下载安装 FlutterFire CLI
dart pub global activate flutterfire_cli
# 2.配置环境变量
vim .zshrc
export PATH="$PATH":"$HOME/.pub-cache/bin"
# 修改环境变量后，执行source，让环境变量生效(注意：关一下终端再打开才会生效)
source .zshrc
# 3.检查是否配置成功
flutterfire -v


# ###########################
# 1.生成配置文件(可以按照firebase 平台提升操作)
# 进入项目根目录
flutterfire configure --project=bujunshou
flutterfire configure --project=bujunshou-3618f

# 2.插件
firebase_core: 4.2.1
firebase_messaging: 16.0.4
firebase_crashlytics: 5.0.5
firebase_analytics: 12.0.4

echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshrc