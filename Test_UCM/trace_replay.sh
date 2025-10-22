rm -rf ./metrics.xlsx
rm -rf ./req_results.xlsx

export BENCHMARK_PATH="/vllm-workspace/benchmarks"
python3 /vllm-workspace/unified-cache-management/benchmarks/trace_replay.py \
    --backend vllm \
    --model /home/models/DeepSeek-V3-0324 \
    --host 127.0.0.1 \
    --port 7885 \
    --trace-path /vllm-workspace/Test_UCM/conversation_trace_reduced.jsonl \
    --trace-mode trace \
    --save-result \
    --save-prompts \
    > trace_replay.log 2>&1

pkill vllm
sleep 4
bash ./clear_data.sh 