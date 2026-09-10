class my_range_iterator:
    def __init__(self, iter_obj):
        self.iter_obj = iter_obj

    def __iter__(self):
        return self

    def __next__(self):
        if self.iter_obj.start >= self.iter_obj.end:
            raise StopIteration

        current = self.iter_obj.start
        self.iter_obj.start += 1
        return current