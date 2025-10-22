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
        # item['output_length'] = 1
        timestamp = item['timestamp']
        data_by_timestamp[timestamp].append(item)

# 写入削减后的数据
with open(output_file, 'w', encoding='utf-8') as f_out:
    for timestamp, items in data_by_timestamp.items():
        # 计算保留数量：原数量的1/10，向上取整
        num_to_keep = max(1, math.ceil(len(items) / 2))  # 至少保留1个
        # 只保留前 num_to_keep 条
        for i in range(num_to_keep):
            f_out.write(json.dumps(items[i], ensure_ascii=False) + '\n')

print(f"处理完成！原始数据按时间戳分组，每个时间戳保留 {1/10:.0%} 的请求（向上取整）。")
print(f"结果已保存至: {output_file}")