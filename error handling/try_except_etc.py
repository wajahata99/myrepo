
try:
    f = open("testfile.txt")
    if f.name == 'testfile.txt':
        raise  Exception
except FileNotFoundError as e:
    print(e)

except Exception as e:
    print("Error")

else:
    print(f.read())
    f.close()

finally:
    print('executing finally')

