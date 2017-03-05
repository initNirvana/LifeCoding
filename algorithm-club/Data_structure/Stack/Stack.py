# -*- coding:utf-8 -*-

class Stack:
    def __init__(self):
        self.items = []

    def __repr__(self):
        """
        스택에 있는 모든 아이템을 출력
        """
        print (self.items)
    
    def push(self, item):
        """
        스택의 맨 위에 삽입
        """
        self.items.append(item) 
    
    def peek(self):
        """
        스택의 마지막 확인
        """
        return self.items.pop()
        
    def size(self):
        """
        스택의 길이 확인
        """
        return len(self.items)

    def is_empty(self):
        """
        스택이 비어있는지 확인
        """
        return self.items == []

    def is_full(self):
        pass
