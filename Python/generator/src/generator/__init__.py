def my_loop(start,end):
    current = start
    while current<end:
        yield current
        current+=1
            

def main() -> None:
    SEP=150
    print("="*SEP)
    
    for i in my_loop(0,100):
        print(i,end=" ")

    print(" ")
    print("="*SEP)

    for i in my_loop(ord('A'),ord('z')+1):
        print(chr(i),end=" ")

    print(" ")
    print("="*SEP)