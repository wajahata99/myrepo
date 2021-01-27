print("File two __name__ is set to: {}" .format(__name__))

def function_3():
    print('function_3 is ran')

def function_4():
    print('function_4 is ran')

if __name__ == "__main__":
    print("file_two is ran directly")
else:
    print("file_two is ran when imported")