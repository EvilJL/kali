#!/bin/bash
cat >> /etc/ssh/ssh_config <<EOF
    ServerAliveInterval 20      # 心跳包间隔
    ServerAliveCountMax 999     # 最大失联次数
EOF
