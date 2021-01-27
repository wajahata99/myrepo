from file_two import function_3
print("File one __name__ is set to: {}" .format(__name__))

def function_1():
    print("function_1 is ran")

def function_2():
    print("function_2 is ran")

if __name__ == "__main__":
    print("File_one is ran directly")
    function_1()
    function_3()
else:
    print("File one executed when imported")