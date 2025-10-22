python3 -m sglang_router.launch_router \
    --worker-urls   http://127.0.0.1:7880 http://127.0.0.1:7881 http://127.0.0.1:7882 http://127.0.0.1:7883 http://127.0.0.1:7884 http://127.0.0.1:7885 \
    --host 127.0.0.1 \
    --port 9300 \
    --policy round_robin \
    > proxy.log 2>&1 