from my_range_iterator import my_range_iterator

class my_range:
    def __init__(self, start, end):
        self.start = start
        self.end = end

    def __iter__(self):
        return my_range_iterator(self)