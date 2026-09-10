from my_range import my_range

def my_loop(x) -> None:
    iter_x = iter(x)
    while True:
        try:
            item = next(iter_x)
            print(item, end=" ")
        except StopIteration:
            break


def main() -> None:

    print("=" * 150)
    items = [x for x in my_range(0, 100)]
    my_loop(items)

    print(" ")
    print("=" * 150)

    alphabets = [chr(x) for x in my_range(ord("A"), ord("z") + 1)]
    my_loop(alphabets)

    print(" ")
    print("=" * 150)

    fruits = ["apple", "banana", "orange", "tomato"]
    my_loop(fruits)

    print(" ")
    print("=" * 150)
