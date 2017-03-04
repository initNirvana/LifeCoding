#-*- coding: utf-8 -*-
class ArrayList:
    """
    size 는 배열의 최대 크기
    length 는 저장된 자료 개수
    """
    def __init__(self, size):
        self.size = size
        self.array = []

    def __len__(self):
        return len(self.array)

    def __repr__(self):
        for i in self.array: print(i)

    def is_empty(self):
        return len(self.array) == 0

    def is_full(self):
        return len(self.array) == self.size

    def insert(self, data):
        if self.is_full():
            return False
        self.array.append(data) # 끝에 넣기

    def delete(self):
        if len(self.array) == 0:
            print("error")
            return False
        self.array.pop() # 마지막 요소 제거

    def clear(self):
        for x in range(len(self.array)): self.array.pop()



