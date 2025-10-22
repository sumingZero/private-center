import math
import json
from collections import defaultdict

# 输入和输出文件路径
input_file = 'conversation_trace.jsonl'
output_file = 'conversation_trace_reduced.jsonl'

# 用于按 timestamp 存储数据
data_by_timestamp = defaultdict(list)

# 读取原始文件并按时间戳分组
with open(input_file, 'r', encoding='utf-8') as f:
    for line in f:
        line = line.strip()
        if not line:
            continue
        item = json.loads(line)
        timestamp = item['timestamp']
        data_by_timestamp[timestamp].append(item)

# 统计变量：保留下来的总条数 和 prompt_tokens <= 64K 的数量
total_kept = 0
short_prompt_count = 0
threshold = 65536  # 64K = 65536

# 写入削减后的数据
with open(output_file, 'w', encoding='utf-8') as f_out:
    for timestamp, items in data_by_timestamp.items():
        # 计算保留数量：原数量的1/2，向上取整（原代码是 /2，不是 /10）
        num_to_keep = max(1, math.ceil(len(items) / 2))  # 至少保留1个
        # 只保留前 num_to_keep 条
        for i in range(num_to_keep):
            item = items[i]
            f_out.write(json.dumps(item, ensure_ascii=False) + '\n')
            total_kept += 1
            # 检查是否有 prompt_tokens 字段且 <= 64K
            if 'input_length' in item and item['input_length'] <= threshold:
                short_prompt_count += 1

# 计算百分比
if total_kept > 0:
    percentage = (short_prompt_count / total_kept) * 100
else:
    percentage = 0.0

# 输出结果
print(f"处理完成！原始数据按时间戳分组，每个时间戳保留 {1 / 2:.0%} 的请求（向上取整）。")
print(f"结果已保存至: {output_file}")
print(f"共保留 {total_kept} 条数据，其中 prompt_tokens ≤ 64K 的有 {short_prompt_count} 条")
print(f"占比: {percentage:.2f}%")