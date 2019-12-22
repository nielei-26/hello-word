# 计算 0 - 100 之间所有偶数个记录最终结果的变量
result = 0

i = 0

while i <= 100:

	# 判断变量 i 中的数值， 是否是一个偶数
	# 偶数 i % 2 == 0
	# 奇数 i % 2 != 0
	if i % 2 == 0:
		print(i)

		result += i

	i += 1

print('\n0 - 100 之间的偶数累加结果 = %d' % result)
