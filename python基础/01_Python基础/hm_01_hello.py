print("hello python")
print("你好世界")
age = 23
message = "Happy " + str(age) + "rd Birsrthday !"
print(message)
row = 1
while row <= 9:
    col = 1
    while col <= row:
        print("%d*%d=%d" % (col, row, col * row ), end="\t")
        col += 1
    print("")
    row += 1