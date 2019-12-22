# 打印 5 遍 hello Python
# 1. 定义一个整数变量， 记录循环次数
i = 0

# 2. 开始循环
while i < 3:

	# 1> 希望再循环内执行代码
	print('hello python')

	# 2> 处理计数器
	#i = i + 1
	i += 1

# 3. 观察一下， 循环结束后， 计数器 i 数值是多少
print('循环结束后，i = %d' % i)