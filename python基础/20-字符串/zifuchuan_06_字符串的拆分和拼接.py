# 假设：以下内容从网络上抓取的
# 要求: 1.将字符串中的空白字符全部去掉
# 2.在使用“  ” 作为分隔符，在拼接成一个整齐的字符串
poem_str = "东方健康\t就开始\t说的说的就\t\n酒店客房的的空\t间分割上课的地点"

print(poem_str)

# 1.拆分字符串
poem_list = poem_str.split()
print(poem_list)

# 2.合并字符串
result = "".join(poem_list)
print(result)
