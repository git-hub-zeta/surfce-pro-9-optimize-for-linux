# surfce-pro-9-optimize-for-linux
Optimize System to make ubuntu more comfortable to use

对于GNOME shell优化触控制后，会出现每点击就弹出虚拟键盘的问题

用给出的脚本可以在连接键盘的时候禁用虚拟键盘，在键盘拔出之后启用

新建文件
nano ~/auto-touch-keyboard.sh

给执行权限
chmod +x ~/auto-touch-keyboard.sh

创建自动服务：
mkdir -p ~/.config/systemd/user
nano ~/.config/systemd/user/auto-touch-keyboard.service

创建服务：
[Unit]
Description=Auto toggle GNOME onscreen keyboard based on physical keyboard

[Service]
Type=simple
ExecStart=/bin/bash -c 'while true; do ~/auto-touch-keyboard.sh; sleep 2; done'

[Install]
WantedBy=default.target
#两秒一次检测状态

启动：
systemctl --user daemon-reexec
systemctl --user daemon-reload
systemctl --user enable auto-touch-keyboard.service
systemctl --user start auto-touch-keyboard.service

检测
systemctl --user status auto-touch-keyboard.service

