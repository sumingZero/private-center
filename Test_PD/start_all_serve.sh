# export PYTHONHASHSEED=123456
# export CUDA_VISIBLE_DEVICES=2
# vllm serve /home/models/DeepSeek-V2-Lite \
#     --max-model-len 150000 \
#     --tensor-parallel-size 1 \
#     --gpu_memory_utilization 0.85 \
#     --trust-remote-code \
#     --disable-log-requests \
#     --enable-prefix-caching \
#     --max-num-batched-tokens 65536 \
#     --max-num-seqs 1 \
#     --port 8000 \
#     --block-size 128 \
#     --kv-transfer-config \
#     '{
#         "kv_connector": "UnifiedCacheConnectorV1",
#         "kv_connector_module_path": "ucm.integration.vllm.uc_connector",
#         "kv_role": "kv_producer",
#         "kv_connector_extra_config": {
#             "ucm_connector_name": "UcmNfsStore",
#             "ucm_connector_config": {
#                 "storage_backends": "/home/share/yuhui-test/test1"
#             }
#         }
#     }' \
#     > serve1.log 2>&1 &

# export PYTHONHASHSEED=123456
# export CUDA_VISIBLE_DEVICES=3
# vllm serve /home/models/DeepSeek-V2-Lite \
#     --max-model-len 150000 \
#     --tensor-parallel-size 1 \
#     --gpu_memory_utilization 0.85 \
#     --trust-remote-code \
#     --disable-log-requests \
#     --enable-prefix-caching \
#     --max-num-batched-tokens 65536 \
#     --max-num-seqs 1 \
#     --port 8001 \
#     --block-size 128 \
#     --kv-transfer-config \
#     '{
#         "kv_connector": "UnifiedCacheConnectorV1",
#         "kv_connector_module_path": "ucm.integration.vllm.uc_connector",
#         "kv_role": "kv_producer",
#         "kv_connector_extra_config": {
#             "ucm_connector_name": "UcmNfsStore",
#             "ucm_connector_config": {
#                 "storage_backends": "/home/share/yuhui-test/test1"
#             }
#         }
#     }' \
#     > serve2.log 2>&1 &

# export PYTHONHASHSEED=123456
# export CUDA_VISIBLE_DEVICES=4
# vllm serve /home/models/DeepSeek-V2-Lite \
#     --max-model-len 150000 \
#     --tensor-parallel-size 1 \
#     --gpu_memory_utilization 0.85 \
#     --trust-remote-code \
#     --disable-log-requests \
#     --enable-prefix-caching \
#     --max-num-batched-tokens 65536 \
#     --max-num-seqs 1 \
#     --port 8002 \
#     --block-size 128 \
#     --kv-transfer-config \
#     '{
#         "kv_connector": "UnifiedCacheConnectorV1",
#         "kv_connector_module_path": "ucm.integration.vllm.uc_connector",
#         "kv_role": "kv_producer",
#         "kv_connector_extra_config": {
#             "ucm_connector_name": "UcmNfsStore",
#             "ucm_connector_config": {
#                 "storage_backends": "/home/share/yuhui-test/test1"
#             }
#         }
#     }' \
#     > serve3.log 2>&1 &

# export PYTHONHASHSEED=123456
# export CUDA_VISIBLE_DEVICES=5
# vllm serve /home/models/DeepSeek-V2-Lite \
#     --max-model-len 150000 \
#     --tensor-parallel-size 1 \
#     --gpu_memory_utilization 0.85 \
#     --trust-remote-code \
#     --disable-log-requests \
#     --enable-prefix-caching \
#     --max-num-batched-tokens 65536 \
#     --max-num-seqs 1 \
#     --port 8003 \
#     --block-size 128 \
#     --kv-transfer-config \
#     '{
#         "kv_connector": "UnifiedCacheConnectorV1",
#         "kv_connector_module_path": "ucm.integration.vllm.uc_connector",
#         "kv_role": "kv_producer",
#         "kv_connector_extra_config": {
#             "ucm_connector_name": "UcmNfsStore",
#             "ucm_connector_config": {
#                 "storage_backends": "/home/share/yuhui-test/test1"
#             }
#         }
#     }' \
#     > serve4.log 2>&1 &

export PYTHONHASHSEED=123456
export CUDA_VISIBLE_DEVICES=0
vllm serve /home/models/DeepSeek-V2-Lite \
    --max-model-len 150000 \
    --tensor-parallel-size 1 \
    --gpu_memory_utilization 0.85 \
    --trust-remote-code \
    --disable-log-requests \
    --enable-prefix-caching \
    --max-num-batched-tokens 65536 \
    --max-num-seqs 1 \
    --port 8004 \
    --block-size 128 \
    --kv-transfer-config \
    '{
        "kv_connector": "UnifiedCacheConnectorV1",
        "kv_connector_module_path": "ucm.integration.vllm.uc_connector",
        "kv_role": "kv_producer",
        "kv_connector_extra_config": {
            "ucm_connector_name": "UcmNfsStore",
            "ucm_connector_config": {
                "storage_backends": "/home/share/yuhui-test/test1"
            }
        }
    }' \
    > serve5.log 2>&1 &

export PYTHONHASHSEED=123456
export CUDA_VISIBLE_DEVICES=1
vllm serve /home/models/DeepSeek-V2-Lite \
    --max-model-len 150000 \
    --tensor-parallel-size 1 \
    --gpu_memory_utilization 0.85 \
    --trust-remote-code \
    --disable-log-requests \
    --enable-prefix-caching \
    --max-num-batched-tokens 65536 \
    --max-num-seqs 64 \
    --port 8005 \
    --block-size 128 \
    --kv-transfer-config \
    '{
        "kv_connector": "UnifiedCacheConnectorV1",
        "kv_connector_module_path": "ucm.integration.vllm.uc_connector",
        "kv_role": "kv_both",
        "kv_connector_extra_config": {
            "ucm_connector_name": "UcmNfsStore",
            "ucm_connector_config": {
                "storage_backends": "/home/share/yuhui-test/test1"
            }
        }
    }' \
    > serve6.log 2>&1 &