# 1p1d
python3 toy_proxy_server.py \
  --host localhost \
  --port 9000 \
  --prefiller-host 127.0.0.1 \
  --prefiller-port 8500 \
  --decoder-host 127.0.0.1 \
  --decoder-port 8502 \

# 2p1d
# python3 toy_proxy_server.py \
#   --host localhost \
#   --port 9000 \
#   --prefiller-hosts 127.0.0.1 127.0.0.1 \
#   --prefiller-port 8500 8501 \
#   --decoder-hosts 127.0.0.1 \
#   --decoder-ports 8502 