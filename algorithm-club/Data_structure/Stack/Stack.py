# -*- coding:utf-8 -*-

class Stack:
    def __init__(self):
        self.items = []

    def push(self, item):
        self.items.append(item) 
    
    def peek(self):
        return self.items.pop()

    def size(self):
        return len(self.items)

    def is_empty(self):
        return self.items == []

    def is_full(self):
        pass
