rm -rf /home/share/yuhui-test/test1/data/*
rm -rf /vllm-workspace/00_Test_UCM/*.db
rm -rf /home/share/yuhui-test/test2*

# export CUDA_VISIBLE_DEVICES=7,6,5,4
# vllm serve /home/models/QwQ-32B  \
#     --max-model-len 5000 \
#     --tensor-parallel-size 4 \
#     --gpu_memory_utilization 0.87 \
#     --trust-remote-code \
#     --disable-log-requests \
#     --no-enable-prefix-caching \
#     --enforce-eager \
#     --max-num-batched-tokens 40000 \
#     --max-num-seqs 10 \
#     --host 0.0.0.0 \
#     --port 7850 \
#     > serve2.log 2>&1 &

export CUDA_VISIBLE_DEVICES=7,6,5,4

# vllm serve /home/models/QwQ-32B  \
#     --max-model-len 20000 \
#     --tensor-parallel-size 4 \
#     --gpu_memory_utilization 0.87 \
#     --trust-remote-code \
#     --disable-log-requests \
#     --no-enable-prefix-caching \
#     --max-num-batched-tokens 40000 \
#     --max-num-seqs 1 \
#     --block-size 128 \
#     --host 0.0.0.0 \
#     --port 7850 \
#     --kv-transfer-config \
#     '{
#         "kv_connector": "UCMConnector",
#         "kv_connector_module_path": "ucm.integration.vllm.ucm_connector",
#         "kv_role": "kv_both",
#         "kv_connector_extra_config": {
#             "UCM_CONFIG_FILE": "/vllm-workspace/00_Test_UCM/ucm_config.yaml"
#         }
#     }' \
#     > serve_ucm.log 2>&1 &

export LMCACHE_USE_EXPERIMENTAL=True
export LMCACHE_CONFIG_FILE="/vllm-workspace/00_Test_UCM/lmcache-config.yaml"
vllm serve /home/models/QwQ-32B \
    --max-model-len 20000 \
    --tensor-parallel-size 4 \
    --gpu_memory_utilization 0.87 \
    --trust-remote-code \
    --disable-log-requests \
    --no-enable-prefix-caching \
    --max-num-batched-tokens 40000 \
    --max-num-seqs 1 \
    --block-size 128 \
    --host 0.0.0.0 \
    --port 7850 \
    --kv-transfer-config \
    '{
        "kv_connector": "LMCacheConnectorV1",
        "kv_role": "kv_both"
    }' \
    > serve_lmc.log 2>&1 &

# 等待 vLLM 服务真正就绪
echo "⏳ Waiting for vLLM server to be ready on http://localhost:7850"
MAX_WAIT=600  # 最多等待 600 秒
COUNT=0
while [ "$COUNT" -lt "$MAX_WAIT" ]; do
    if curl -s http://localhost:7850/v1/models >/dev/null; then
        echo "✅ vLLM server is ready!"
        break
    fi
    sleep 5
    COUNT=$((COUNT + 5))
    echo -n "."
done

if [ "$COUNT" -ge "$MAX_WAIT" ]; then
    echo ""
    echo "❌ vLLM server failed to start within $MAX_WAIT seconds."
    exit 1
fi

# 启动测试

echo "🚀 预热..."
vllm bench serve \
    --backend vllm \
    --model /home/models/QwQ-32B\
    --host 127.0.0.1 \
    --port 7850 \
    --seed 123456  \
    --dataset-name random \
    --num-prompts 2 \
    --random-input-len 16000 \
    --random-output-len 1 \
    --request-rate inf \
    --percentile-metrics  "ttft,tpot,itl,e2el" \
    --metric-percentiles  "90,99" \
    --goodput "ttft:2000" "tpot:40" \
    --ignore-eos

sleep 1

vllm bench serve \
    --backend vllm \
    --model /home/models/QwQ-32B\
    --host 127.0.0.1 \
    --port 7850 \
    --seed 3654925  \
    --dataset-name random \
    --num-prompts 8 \
    --random-input-len 16000 \
    --random-output-len 1 \
    --request-rate inf \
    --percentile-metrics  "ttft,tpot,itl,e2el" \
    --metric-percentiles  "90,99" \
    --goodput "ttft:3000" "tpot:20" \
    --ignore-eos \
    --save-result \
    --save-detailed \
    --result-dir /vllm-workspace/00_Test_UCM \
    --result-filename data.json

python3 result_to_excel.py 

# pkill vllm