# -*- coding:utf-8 -*-

class Node(object):
    def __init__(self, item = None):
        self.item = item
        self.next = None
        self.prev = None

class Liknked_Queue(object):
    def __init__(self):
        self.length = 0
        self.head = None
        self.tail = None

    def is_empty(self):
        return self.length == 0

    def enqueue(self, item):
        node = Node(item)
        node.next = None

        if self.head == None:
            self.head = node
            self.tail = node
        else:
            self.tail.next = node
            node.prev = self.tail
            self.tail = node
            self.length += 1

    def dequeue(self):
        item = self.head.item
        self.head = self.head.next
        self.length -= 1
        if self.length == 0:
            print ("is empty!")
        return item

    def front(self):
        return self.head.item

    def rear(self):
        return self.tail.item

    def __len__(self):
        return self.length


