# 큐(Queue)

큐는 먼저들어온 자료가 먼저 처리 되는 구조 FIFO(First-In, First-Out)이라고 부름. 나중에 집어 넣은 데이터가 먼저 나오는 스택과는 반대된다.
> front(head)와 rear(tail)은 데이터의 위치를 가리킨다. front는 큐의 첫번째 요소를 가리키고 rear는 큐의 마지막 요소를 가리킨다.


기본적으로 큐의 종류엔 선형 큐, 원형 큐가 있다.
- 선형 큐 : 막대모양으로 된 큐. front, rear 값이 계속 증가하기 때문에 주기적으로 모든 요소들을 이동시켜야 한다.
- 원형 큐 : 선형큐의 문제점을 보완하고 front와 rear를 원형 회전시켜서 하나 증가시키고 증가된 위치에 데이터를 삽입하거나 삭제한다.
## 사용 예
1. 키보드 입력
2. 운영 체제의 큐

> 프린터의 버퍼 큐, 메시지 큐, 스케쥴링 큐(잡 큐, 레디 큐, 디바이스 큐) , 다단계 피드백 큐 등이 있다.

- create()
- init() : 큐를 초기화한다.
- is_empty() : 큐가 비어있는지 검사한다.
- is_fulll() : 큐기 꽉 찾는지 검사한다.
- enqueue() : 큐의 뒤에 요소를 추가한다.
- deque() : 큐의 앞에 있는 요소를 반환한다음 삭제한다.
- peek() : 큐에서 삭제하지 않고 앞에 있는 요소를 반환한다.


## 우선순위 큐
(-priority, index, item).priority 인 튜플로 구성되어 있다.
index 변수는 우선순위가 동일한 아이템(요소)의 순서를 정할 때 사용한다. 인덱스 값은 우선순위 값이 동일할 때도 중요하다.

```
>>> q = Priority_Queue()
>>> q.push(Item('foo'), 1)
>>> q.push(Item('bar'), 5)
>>> q.push(Item('spam'), 4)
>>> q.push(Item('grok'), 1)
>>> q.pop()
Item('bar')
>>> q.pop()
Item('spam')
>>> q.pop()
Item('foo')
>>> q.pop()
Item.('grok') # foo, grok 동일하게 반환!

```
다음과 같이 인스턴스를 만들었다면 
```
>>> a = Item('foo')
>>> b = Item('bar')
>>> a < b # 실패!
```
(priority, item) 으로 만들어보자
```
>>> a = (1, Item('foo'))
>>> b = (5, Item('foo'))
>>> a < b # (리스트나 튜플끼리 비교할 때는 첫번째 값을 먼저 비교하고 그다음 값을 비교한다.
True
>>> c = (1, Item('grok'))
```

인덱스 값을 추가해보자
```
>>> a = (1, 0, Item('foo'))
>>> a = (5, 1, Item('bar'))
>>> a = (1, 2, Item('grok'))
>>> a < b
True
>>> a < c
True
```

실제로 사용하기 위해선 제약(락,시그널)이 더 필요하다.
