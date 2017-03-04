# 리스트(list)
리스트는 추상적 자료 형(ADT) 중 하나다. 리스트는 자료를 선형적으로 저장하는데 이때문에 선형 구조를 띈다.
- 선형 구조는  데이터가 순차적으로 저장됨
### 변명?
배열리스트는 리스트(`[]`)를 안 쓰고 구현하면 알고리즘이 난해해지기 시작해서 결국 그냥 사용함. 다음 자료구조부터는 다른 언어 사용을 고려해야할듯
- index 구현은? 결국 리스트를 배열처럼 억지로 사용해야... 

## 배열리스트
```python
class ArrayList:
    """
    size 는 배열의 최대 크기
    length 는 저장된 자료 개수
    """
    def __repr__(self):
        for i in self.array: print(i)
        
    def __init__(self, size):
        self.size = size
        self.array = []
            
    def __len__(self):
        return len(self.array)
        
    def is_empty(self):
        return len(self.array) == 0
        
    def is_full(self):
        return len(self.array) == self.size
        
    def insert(self, data):
        if self.is_full(): return False
        self.array.append(data) # 끝에 넣기
        
    def delete(self):
        if len(self.array) == 0: return False
        self.array.pop() # 마지막 요소 제거
        
    def clear(self):
        for x in range(len(self.array)): self.array.pop()

```

## 링크드 리스트
```python
class Node:
    def __init__(self, value = None, next = None):
        self.value = value
        self.next = next

    def __repr__(self):
        return str(self.value)

class LinkedList:
    def __init__(self, iterable=[]):
        self.head = None
        self.size = 0
        for item in iterable: self.append(item)

    def __repr__(self):
        (current, nodes) = self.head, []
        while current:
            nodes.append(str(current))
            current = current.next
        return "->".join(nodes)

    def __len__(self):
        return self.size

    def __iter__(self):
        current = self.head
        while current:
            yield current
            current = current.next
        raise StopIteration

    def __contains__(self, value):
        tmp = self.head
        found = False
        while tmp and not found:
            if value == tmp.value:
                found = True
            else:
                tmp = tmp.next
        return found

    def append(self, value):
        tmp = Node(value)
        tmp.next = self.head
        self.head = tmp
        self.size += 1

    def getHead(self):
        return self.head

    def getTail(self):
        tmp = self.head
        while tmp.next:
            tmp = tmp.next
        return tmp

    def delete(self, value):
        tmp = self.head
        prev = None
        found = False
        while tmp and not found:
            if value == tmp.value:
                found = True
            else:
                prev = tmp
                tmp = tmp.next
        if found:
            self.size -= 1
            if prev == None:
                self.head = self.head.next
            else:
                prev.next = tmp.next
```
