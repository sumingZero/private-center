# export PYTHONHASHSEED=123456
# export CUDA_VISIBLE_DEVICES=2
# vllm serve /home/models/DeepSeek-V2-Lite \
#     --max-model-len 150000 \
#     --tensor-parallel-size 1 \
#     --gpu_memory_utilization 0.85 \
#     --trust-remote-code \
#     --disable-log-requests \
#     --enable-prefix-caching \
#     --long-prefill-token-threshold 128 \
#     --max-num-batched-tokens 32768 \
#     --max-num-seqs 64 \
#     --port 7880 \
#     --block-size 128 \
#     --kv-transfer-config \
#     '{
#         "kv_connector": "UnifiedCacheConnectorV1",
#         "kv_connector_module_path": "ucm.integration.vllm.uc_connector",
#         "kv_role": "kv_both",
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
#     --long-prefill-token-threshold 128 \
#     --max-num-batched-tokens 32768 \
#     --max-num-seqs 64 \
#     --port 7881 \
#     --block-size 128 \
#     --kv-transfer-config \
#     '{
#         "kv_connector": "UnifiedCacheConnectorV1",
#         "kv_connector_module_path": "ucm.integration.vllm.uc_connector",
#         "kv_role": "kv_both",
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
#     --long-prefill-token-threshold 128 \
#     --max-num-batched-tokens 32768 \
#     --max-num-seqs 64 \
#     --port 7882 \
#     --block-size 128 \
#     --kv-transfer-config \
#     '{
#         "kv_connector": "UnifiedCacheConnectorV1",
#         "kv_connector_module_path": "ucm.integration.vllm.uc_connector",
#         "kv_role": "kv_both",
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
#     --long-prefill-token-threshold 128 \
#     --max-num-batched-tokens 32768 \
#     --max-num-seqs 64 \
#     --port 7883 \
#     --block-size 128 \
#     --kv-transfer-config \
#     '{
#         "kv_connector": "UnifiedCacheConnectorV1",
#         "kv_connector_module_path": "ucm.integration.vllm.uc_connector",
#         "kv_role": "kv_both",
#         "kv_connector_extra_config": {
#             "ucm_connector_name": "UcmNfsStore",
#             "ucm_connector_config": {
#                 "storage_backends": "/home/share/yuhui-test/test1"
#             }
#         }
#     }' \
#     > serve4.log 2>&1 &

# export PYTHONHASHSEED=123456
# export CUDA_VISIBLE_DEVICES=6
# vllm serve /home/models/DeepSeek-V2-Lite \
#     --max-model-len 150000 \
#     --tensor-parallel-size 1 \
#     --gpu_memory_utilization 0.85 \
#     --trust-remote-code \
#     --disable-log-requests \
#     --enable-prefix-caching \
#     --long-prefill-token-threshold 128 \
#     --max-num-batched-tokens 32768 \
#     --max-num-seqs 64 \
#     --port 7884 \
#     --block-size 128 \
#     --kv-transfer-config \
#     '{
#         "kv_connector": "UnifiedCacheConnectorV1",
#         "kv_connector_module_path": "ucm.integration.vllm.uc_connector",
#         "kv_role": "kv_both",
#         "kv_connector_extra_config": {
#             "ucm_connector_name": "UcmNfsStore",
#             "ucm_connector_config": {
#                 "storage_backends": "/home/share/yuhui-test/test1"
#             }
#         }
#     }' \
#     > serve5.log 2>&1 &

export PYTHONHASHSEED=123456
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7
vllm serve /home/models/DeepSeek-V3-0324 \
    --max-model-len 150000 \
    --tensor-parallel-size 8 \
    --gpu_memory_utilization 0.95 \
    --trust-remote-code \
    --disable-log-requests \
    --enable-prefix-caching \
    --long-prefill-token-threshold 128 \
    --max-num-batched-tokens 65536 \
    --max-num-seqs 1024 \
    --port 7885 \
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