# -*- coding:utf-8 -*-
class Queue:
    def __init__(self, items=None):
        if items is None:
            self.items = []
        else:
            self.items = list(items)

    def __repr__(self):
        for i in self.items : print (i)
    
    def is_empty(self):
        return self.items == []

    def is_full(self):
        pass

    def enqueue(self, item):
        self.items.insert(0, item)

    def dequeue(self):
        return self.items.pop()

    def peek(self, pos=0):
        return self.items[pos]

    def size(self):
        return len(self.items)
