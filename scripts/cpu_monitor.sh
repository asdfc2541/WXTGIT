#!/bin/bash
# 设置CPU阈值（%）
THRESHOLD=80

current_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
if (( $(echo "$current_usage > $THRESHOLD" | bc -l) )); then
    echo "[$(date)] 警告：CPU使用率 ${current_usage}%"
fi
