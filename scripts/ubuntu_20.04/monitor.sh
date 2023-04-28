#!/usr/bin/env bash

cpu_high_treshold=50 # 超过这个 cpu 就会调用 perf
process_name="" # 你要监控的进程的名字
process_id=`pgrep $process_name`
echo "cpu_high_treshold: $cpu_high_treshold"
echo "Process Name: $process_name"
echo "Process PID: $process_id"

count=0
start_time_s=$(date +%s) # 开始时间戳（秒）

while true
do
  # 将计数器加1
  count=$((count+1))

  # 每隔100个计数器打印一条日志
  if [ $((count % 100)) -eq 0 ]; then
    current_time_s=$(date +%s)
    elapsed_time_s=$(( current_time_s - start_time_s ))
    echo "[$process_name][$process_id][$count] $(date '+%Y-%m-%d %H:%M:%S'), $elapsed_time_s"
  fi

  CPU=`ps -p $process_id -o %cpu | tail -1`
  if (( $(echo "$CPU > $cpu_high_treshold" | bc -l) )); then
    echo "CPU usage for process $process_name is high ($CPU%), executing perf command..."
    perf record -F 99 -p $process_id -g -- sleep 20 # 生成 perf.data
    perf script > out.perf # 生成 out.perf
    mv "out.perf" "out.perf.$(date '+%Y-%m-%d_%H-%M-%S')"
    rm -rf perf.data
  fi
  sleep 0.1
done

