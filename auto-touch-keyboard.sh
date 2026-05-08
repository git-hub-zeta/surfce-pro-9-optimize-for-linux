#!/bin/bash

# 检测是否存在物理键盘（排除虚拟/屏幕键盘）
HAS_KBD=$(ls /dev/input/by-path/*-kbd 2>/dev/null | wc -l)

if [ "$HAS_KBD" -gt 0 ]; then
    # 有物理键盘 → 关闭屏幕键盘
    gsettings set org.gnome.desktop.a11y.applications screen-keyboard-enabled false
else
    # 没有物理键盘 → 开启屏幕键盘
    gsettings set org.gnome.desktop.a11y.applications screen-keyboard-enabled true
fi
