export PYTHONHASHSEED=123456
export CUDA_VISIBLE_DEVICES=5
vllm serve /home/models/Qwen2.5-7B-Instruct \
  --max-model-len 20000 \
  --tensor-parallel-size 1 \
  --gpu_memory_utilization 0.87 \
  --trust-remote-code \
  --enforce-eager \
  --no-enable-prefix-caching \
  --port 8502 \
  --block-size 128 \
  --kv-transfer-config \
  '{
    "kv_connector": "UnifiedCacheConnectorV1",
    "kv_connector_module_path": "unifiedcache.integration.vllm.uc_connector",
    "kv_role": "kv_consumer",
    "kv_connector_extra_config": {
        "ucm_connector_name": "UcmNfsStore",
        "ucm_connector_config": {
            "storage_backends": "/mnt/disk2/test-yuhui",
            "kv_block_size": 33554432
        }
    }
  }'