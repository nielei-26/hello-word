# 假设：以下内容从网络上抓取的
# 要求: 顺序并且居中对齐输入以下内容
poem = ["\t\n东方健康",
        "就开始",
        "说的说的就\t\n",
        "酒店客房的",
        "的空间分割",
        "上课的地点"]

for poem_str in poem:
    # 中心对齐（center） 右对齐（rjust) 左对齐（ljust） 空格半角（shift+space）
    # 先使用strip(去掉）方法去除字符串中的空白字符，再用center居中显示文本
    print("|%s|" % poem_str.strip().center(10,"　"))
