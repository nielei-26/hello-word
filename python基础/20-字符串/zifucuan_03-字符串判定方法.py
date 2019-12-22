# 1、判断空白字符
space_str = "     \t\n\r"

print(space_str.isspace())

# 2.判断字符串中是否只包含数字
# 1> 都不能判断小数
# num_str = "1.1"
# 2> unicode 字符串
# 3>中文数字
num_str = "一千零一"

print(num_str)
print(num_str.isdecimal())  # 返回数字为true,大多开发用这个
print(num_str.isdigit())
print(num_str.isnumeric())
