# python3 /vllm-workspace/unified-cache-management/ucm/pd/toy_proxy_server.py \
#     --host 0.0.0.0 \
#     --port 9100 \
#     --prefiller-host 127.0.0.1 127.0.0.1 127.0.0.1\
#     --prefiller-port 7880 7881 7882\
#     --decoder-host 127.0.0.1 \
#     --decoder-port 7883 \

python3 /vllm-workspace/unified-cache-management/ucm/pd/toy_proxy_server.py \
    --host 0.0.0.0 \
    --port 9200 \
    --prefiller-host   127.0.0.1\
    --prefiller-port    8004 \
    --decoder-host    127.0.0.1  \
    --decoder-port     8005\

# curl http://localhost:9100/v1/completions \
#     -H "Content-Type: application/json" \
#     -d '{
#         "model": "/home/models/DeepSeek-V2-Lite",
#         "prompt": "What date is today?",
#         "max_tokens": 20,
#         "temperature": 0
#     }'