import json
import pandas as pd
import numpy as np

# Step 1: 读取 JSON 数据
with open('/vllm-workspace/00_Test_UCM/data.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# Step 2: 构建 metrics 表（这部分数据单位已经是 ms，无需改动）
metrics_data = {
    key: data.get(key) for key in [
        "time",
        "completed",
        "total_input_tokens",
        "total_output_tokens",
        "request_throughput",
        "request_goodput",
        "output_throughput",
        "total_token_throughput",
        "mean_ttft_ms",
        "p50_ttft_ms",
        "p90_ttft_ms",
        "p99_ttft_ms",
        "mean_tpot_ms",
        "p50_tpot_ms",
        "p90_tpot_ms",
        "p99_tpot_ms",
        "mean_itl_ms",
        "p50_itl_ms",
        "p90_itl_ms",
        "p99_itl_ms",
        "mean_e2el_ms",
        "p50_e2el_ms",
        "p90_e2el_ms",
        "p99_e2el_ms",
    ] if key in data
}

# 转换为 DataFrame（单行）
metrics_df = pd.DataFrame([metrics_data])

# Step 3: 构建 details 表 —— 关键修改在这里
num_requests = len(data.get("input_lens", []))

# 将 ttfts 从秒(s) 转换为毫秒(ms)
ttfts_ms = [t * 1000 for t in data.get("ttfts", [])]

# 将 itls 从秒(s) 转换为毫秒(ms)：先对每个请求的 itl 列表转换单位，再求平均
itls_ms = []
for itl_list in data.get("itls", []):
    if itl_list:
        # 先将每个值从秒转毫秒，再求平均
        itl_ms_avg = np.mean([x * 1000 for x in itl_list])
        itls_ms.append(itl_ms_avg)
    else:
        itls_ms.append(None)

# 计算各种时间差
srd_ms = [b - a for a, b in zip(data.get("send_time", []), data.get("running_time", []))]
rwd_ms = [b - a for a, b in zip(data.get("running_time", []), data.get("worker_time", []))]
wsd_ms = [b - a for a, b in zip(data.get("worker_time", []), data.get("start_loadkv_time", []))]
ssd_ms = [b - a for a, b in zip(data.get("start_loadkv_time", []), data.get("start_forward_time", []))]
fd_ms = [b - a for a, b in zip(data.get("start_forward_time", []), data.get("finish_forward_time", []))]
sd_ms = [b - a for a, b in zip(data.get("finish_forward_time", []), data.get("finish_savekv_time", []))]
rftd_ms = [b - a for a, b in zip(srd_ms, ttfts_ms)]
# 构建 details_data 字典
details_data = {
    "input_lens": data.get("input_lens", []),
    "output_lens": data.get("output_lens", []),
    "ttfts": ttfts_ms,  # 单位：ms
    "itls": itls_ms,    # 单位：ms（每个请求的平均 ITL）
    "send_to_running": srd_ms,
    "running_to_worker": rwd_ms,
    "worker_to_loadkv": wsd_ms,
    "loadkv_duration": ssd_ms,
    "forward_duration": fd_ms,
    "savekv_duration": sd_ms,
    "running_to_first_token": rftd_ms
}

details_df = pd.DataFrame(details_data)

# Step 4: 写入 Excel
with pd.ExcelWriter("output.xlsx", engine="openpyxl") as writer:
    metrics_df.to_excel(writer, sheet_name="metrics", index=False)
    details_df.to_excel(writer, sheet_name="details", index=False)

print("✅ 数据已成功写入 output.xlsx")