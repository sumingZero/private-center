# cd /vllm-workspace/benchmarks
# python3 benchmark_serving.py \
#   --backend vllm \
#   --model /home/models/Qwen2.5-7B-Instruct \
#   --dataset-name random \
#   --ignore-eos \
#   --host localhost \
#   --port 9000 \
#   --seed $(date +%s) \
#   --random-input-len 8000 \
#   --random-output-len 200 \
#   --num-prompts 30 \
#   --burstiness 100 \
#   --request-rate 5\
#   --percentile-metrics ttft,tpot,itl,e2el

cd /vllm-workspace/benchmarks
python3 benchmark_serving.py \
  --backend vllm \
  --host localhost \
  --port 9000 \
  --model /home/models/Qwen2.5-7B-Instruct \
  --seed $(date +%s) \
  --dataset-name random \
  --dataset-path /mnt/disk1/jy/datasets/ShareGPT_V3/ShareGPT_V3_unfiltered_cleaned_split/ShareGPT_V3_unfiltered_cleaned_split.json \
  --ignore-eos \
  --random-input-len 2048 \
  --random-output-len 512 \
  --num-prompts 200 \
  --burstiness 100 \
  --request-rate 5 \
  --percentile-metrics ttft,tpot,itl,e2el
