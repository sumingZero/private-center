curl http://localhost:9000/v1/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "/home/models/Qwen2.5-7B-Instruct",
        "prompt": "What date is today?",
        "max_tokens": 20,
        "temperature": 0
    }'