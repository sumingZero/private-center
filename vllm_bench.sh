#!/usr/bin/env bash
# 假设 server 已在 141.111.32.58:9300 运行
vllm bench serve \
  --backend vllm \
  --model /home/models/DeepSeek-R1-awq \
  --host 141.111.32.58 \
  --port 9300 \
  --seed $(date +%s) \
  --dataset-name random \
  --num-prompts 140 \
  --random-input-len 3200 \
  --random-output-len 1200 \
  --request-rate inf \
  --percentile-metrics "ttft,tpot,itl,e2el" \
  --metric-percentiles "50,90,99" \
  --goodput "ttft:2000" "tpot:50" \
  --ignore-eos \
  --save-result \
  --save-detailed \
  --result-dir /vllm-workspace/Test_UCM \
  --result-filename data.json