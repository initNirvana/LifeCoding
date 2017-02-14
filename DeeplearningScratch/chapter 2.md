# 퍼셉트론

- 퍼셉트론은 __다수의 신호를 입력으로 받아 하나의 신호를 출력__
- 신호를 전류와 같이 생각할 수 있지만 0,1 같은 1비트로 생각하자
## 입력이 2개 퍼셉트론
- 입력신호가 뉴런에 보내질때는 각각 고유한 __가중치__가 곱해짐 (wx1, wx2)
- 뉴련에서 보내온 신호의 총합이 정해진한계를 넘어서면 1을 출력
- 임계값을 세타 기호로 나타낸다.

0 = (w1x1 + w2x2 <= θ) <br>
1 = (w1x1 + w2x2 > θ)
 
# 퍼셉트론 구현하기
먼저 할일은 `w1, w2, θ` 값 정하기. 그러나 AND 게이트를 만족하는 매개변수 조합은 많다.

- `(0.5, 0.5, 0.7)` , `(0.5, 0.5 , 0.8)` `(1.0, 1.0, 1.0)`
- 이렇게 매개변수를 설정할경우 x1, x2 모두가 1일때만 가중신호의 총합이 임계값을 웃돌게 됨

NAND 게이트의 경우 `(-0.5, -0.5, -0.7)` 조합이 있음(물론 다른것도 많음) <br>
__AND 게이트를 구현하는 매개변수의 부호를 반전하면 됨__ 

중요한것은 매개변수의 값은 인간이 정함. 기계학습 문제는 이 매개변수의 값을 정하는 작업을 컴퓨터가 자동으로 하도록 하는 것.
즉, __학습__이란 매개변수를 정하는 작업, 모델을 고민하고 데이터를 주는 일을 한다.

```python
# AND 퍼셉트론으로 표현
def AND(x1, x2):
    w1, w2, theta = 0.5, 0.5, 0.7
    tmp = x1*w1 + x2*w2
    if tmp <= theta:
        return 0
    elif tmp > theta:
        return 1
# AND(0, 0) # 0
# AND(1, 0) # 0
# AND(0, 1) # 0
# AND(1, 1) # 1
```

# 가중치와 편향 도입

위의 식의 세타를 `-b`로 치환하면 퍼셉트론의 동작이 다음과 같게 된다.

0 = (b + w1x1 + w2x2 <= 0) <br>
1 = (b + w1x1 + w2x2 > 0)

`b` 편향이라 함. 
 
 ```python
>>> import numpy as np
>>> x = np.array([0, 1]) # 입력
>>> w = np.array([0.5, 0.5]) # 가중치
>>> b = -0.7
>>> w*x
array([0. , 0.5]) # 
>>> np.sum(w*x)
0.5
>>> np.sum(w*x) + b
-0.19999... #생략
```

## 가중치와 편향 구현하기

```python
def AND(x1, x2):
    x = np.array([x1, x2])
    w = np.array([0.5, 0.5])
    b = -0.7
    tmp = np.sum(w*x) + b
    if tmp <= 0:
        return 0
    else:
        return 1
```
- `w1, w2`는 각 입력신호가 결과에주는 영향력을 조절하는 매개변수 
- 편향(`b`)은 뉴런이 얼마나 쉽게 활성화(결과로 1출력)하는 매개변수

```python
def NAND(x1, x2):
    x = np.array([x1, x2])
    w = np.array([-0.5, -0,5])
    b = 0.7
    tmp = np.sum(w*x) + b
    if tmp <= 0:
        return 0
    else:
        return 1
        
def OR(x1, x2):
    x = np.array([x1, x2])
    w = np.array([0.5, 0,5]) #가중치 w,b만 다르다.
    b = 0.7
    tmp = np.sum(w*x) + b
    if tmp <= 0:
        return 0
    else:
        return 1

```

# 퍼셉트론의 한계

```python
def XOR(x1, x2):
    s1 = NAND(x1, x2)
    s2 = OR(x1, x2)
    y = AND(s1, s2)
    return y
# XOR(0, 0) # 0
# XOR(1, 0) # 1
# XOR(0, 1) # 1
# XOR(1, 1) # 0
```
XOR은 다층 구조의 네트워크, 이러한 여러 개인 퍼셉트론을 다층 퍼셉트론이라고 함.

__단층 퍼셉트론으로는 표현하지못한 것을 층을 하나 늘려 구현함__ 
또한 NAND 만으로 컴퓨터를 표현할 수 있음.

====
논리회로의 경우 찰스 펫졸드의 CODE 를 추천하는 바이다. 