# 신경망

__가중치를 설정 작업은 사람이 수동으로 해야한다__ 하지만 신경망은 이것을 해결해줌.

신경망의 중요한 성질은 __가중치 매개변수의 적절한 값을 데이터로부터 자동으로 학습하는 능력__

## 퍼셉트론에서 신경망으로

신경망을 예로 들때 입력층, 은닉층, 출력층이 있으며, 은닉층은 숨겨져 있기때문에 은닉층임. 참고로 은닉층이 2개 이상인 신경망 구조를 딥러닝이라 __부를 수도__ 있음.

퍼셉트론에 편향을 명시하면 기존 퍼셉트론 모형에 가중치가 b 이고 입력이 1인 뉴런이 추가됨.

기존 퍼셉트론 식을 다음과 같은 간결한 형태로 다시 작성할 수 있음. <br>
![Imgur](http://i.imgur.com/t7M8d7Q.png)

## 활성화 함수의 등장

__h(x)__ 를 활성화 함수(activation function), 입력신호의 총합이 활성화를 일으키지를 정하는 역할을 함.

위의 식을 다 시 써보면 다음과 같이 된다. <br>
a = b + w1x1 + w2x2 [^1] <br>
y = h(a)

가중치가 달린 입력 신호와 편향의 총합을 계산하고, 이를 a 라 함. a를 함수 h()에 넣어 y를 출력하는 흐름. 그림 3-4 참고

이 책에선 __뉴런__과 __노드__를 같은 의미로 사용함.


> 단순 퍼셉트론은 단층 계단 함수(임계값을 경계로 출력이 바뀌는 함수)를 활성화 함수로 사용한 모델
>
> 다층 퍼셉트론은 신경망(여러 층으로 구성되고 시그모이드 함수 등의 매끈함 활성화 함수를 사용하는 모델)을 가리킴

##  활성화 함수
활성화함수는 임계값을 경계로 출력이 바뀌는데, 이런 함수를 계단 함수(step function)이라 함.

퍼셉트론은 __이미 계단함수를 채용__! 활성화 함수를 계단 함수에서 __다른 함수로 변경__ 하는 것이 신경망의 세계로 나아가는 열쇠!
### 시그모이드 함수

h(x) = 1 / 1 + exp(-x)

신경망에서는 활성화 함수로 시그모이드 함수를 이용하여 신호를 변환하여 뉴런에 전달. 

퍼셉트론과 신경망의 주된 차이는 __활성화 함수__

## 계단 함수 구현하기

```python
def step_function(x):
   	if x > 0:
        return 1
   	else:
        return 0
# 이렇게 하면 쉽지만 넘파이 배열을 받도록 다시 구현
def step_function(x):
    y = x > 0
    return y.astype(np.int)
# https://docs.scipy.org/doc/numpy/reference/generated/numpy.ndarray.astype.html
# 원하는 자료형으로 변환할떄는 astype() 메서드를 사용하면 됨.
```

계단함수의 그래프와 시그모이드 함수 그래프는 ipython 으로 작성하였음

## 시그모이드 함수와 계단 함수 비교

- 시그모이드 함수는 부드러운 곡선형이라 __입력에 따라 출력이 연속적으로 변화__ 
- 계단 함수는 __0을 경계로 출력이 값이 변화__ 
- 공통점은 입력이 작을때는 출력이 0에 가깝고(혹은 0), 입력이 커지면 출력이 1에 가까워지는(혹은 1) 구조

또한 시그모이드 함수와 계단함수의 공통점은 __비선형 함수__.

신경망에서는 활성화 함수로 __비선형 함수를 사용해야함__. 선형함수를 이용하면 신경망의 (은닉)층을 깊게 하는 의미가 없어지기 때문이다. 달리 말하면 은닉층이 없는 네트워크로도 똑같은 기능을 할 수 있다는 점이다. 

### 다차원 배열의 계산



```python
# 1차원
>>> import numpy as np
>>> A = np.array([1, 2, 3, 4])
>>> print(A)
[1 2 3 4]
>>> np.ndim(A)
1
>>> A.shape
(4,)
>>> A.shape[0]
4
# 2차원
>>> B = np.array([[1,2], [3,4], [5,6]])
>>> print(B)
[[1 2]
[3 4]
[5 6]]
>>> np.ndim(B)
2
>>> B.shape
(3,2)
# 2×2 행렬 계산
>>> A = np.array([[1,2], [3,4]])
>>> A.shape
(2, 2)
>>> B = np.array([[5,6], [7,8]])
>>> B.shape
(2, 2)
>>> np.dot(A, B) # 내적 계산은 np.dot()으로 계산함
array([[19, 22]
        43, 50])
```

행렬의 곱에서는 대응하는 차원의 원소 수를 일치시켜야 함

3 × 2 →→ 2 × 4	= 3 × 4

↳→→→→→⤴︎

## 신경망의 내적



```python
>>> X = np.array([1,2])
>>> X.shape
(2,)
>>> W = np.array([[1, 3, 5], [2, 4, 6]])
>>> print(W)
[[1 3 5]
  2 4 6]]
>>> W.shape
(2, 3)
>>> Y = np.dot(X, W)
>>> print(Y)
[5 11 17]
# np.dot은 중요함 (for로 노가다 할것이 아니므로) 아무튼 중요함!
```

## 3층 신경망 구현하기

3층 신경망: 입력층이 2개, 은닉층이 3개, 두번째 은닉층이 2개, 출력층이 2개의 뉴런으로 구성

[그림 3-16]

![Imgur](http://i.imgur.com/QJl63NI.png)

[그림 3-17]

![Imgur](http://i.imgur.com/FNPXVlC.png)

편향은 __하나__뿐이다.

식으로 나타내면 다음과 같다.

![Imgur](http://i.imgur.com/AQM7khl.png)



간소화 화면 `A = XW + B` 식이 되는데, A는 1×3, X는 2×1, B는 1×3, W는 2x3이 된다. (식 쓰기 귀찮음)



```python
X = np.array([1.0, 0.5])
W1 = np.array([0.1, 0.3, 0.5], [0.2, 0.4, 0.6])
B1 = np.array([0.1, 0.2, 0.3])

print(W1.shape) # (2,3)
print(X.shape) # (2,)
print(B1.shape) # (3,) #대응하는 차원의 원소수가 일치

A1 = np.dot(X, W1) + B1 
```

[그림 3-18]

![Imgur](http://i.imgur.com/UqfLinZ.png)



그림 [3-18]을 구현하면 

```python
Z1 = sigmoid(A1)

print(A1) # [0.3, 0.7, 1.1]
print(Z1) # [0.57444252, 0.66818777, 0.75026011]
```

1층에서 2층으로 가는 경우를 구현하면

```python
W2 = np.array([0.1, 0.4], [0.2, 0.5], [0.3, 0.6])
B2 = np.array([0.1, 0.2])

print(Z1.shape) # (3,)
print(W2.shape) # (3,2)
print(B2.shape) # (2,) #대응하는 차원의 원소수가 일치

A2 = np.dot(Z1, W2) + B2
Z2 = sigmoid(A2)
```

2층에서 출력층으로 가는 경우를 구현

```python
# 항등함수로 identity_function, 출력층의 활성화 함수로 사용했음
def identity_function(x):
    return x

W3 = np.array([0.1, 0.3], [0.2, 0.4])
B3 = np.array([0.1, 0.2])

A3 = np.dot(Z2, W2) + B3
Y = identity_function(A3) # 혹은 Y = A3
```

출력층의 활성화 함수를 σ()(시그마)로 표시! 은닉층 h()와 다름을 명시함.

- 출력층의 활성화 함수는 문제의 성질에 맞게 정함
- 회귀에는 항등함수, 2클래스 분류에는 시그모이드 함수를, 다중 클래스 분류에는 소프트 맥스 함수를 사용

구현정리의 코드는 생략함. 코드에선 순전파를 구현했음.



## 출력층 설계하기



신경망은 분류와 회귀 모두에 이용할 수 있는데. 위에서 언급했듯이 어떤 문제냐에 따라 출력층에서 사용하는 활성화 함수가 달라진다.

분류에서 사용하는 소프트 맥스 함수의 식은 다음과 같다.

![Imgur](http://i.imgur.com/XqOqWZ3.png)

```python
a = np.array([0.3, 2.9, 4.0])
exp_a = np.exp(a)
print(exp_a) #[  1.34985881  18.17414537  54.59815003]
sum_exp_a = np.sum(exp_a)
print(sum_exp_a) #74.1221542102
y = exp_a / sum_exp_a
print(y) #[ 0.01821127  0.24519181  0.73659691]
# 함수로 정의하면
def softmax(a):
    exp_a = np.exp(a)
    sum_exp_a = np.sum(exp_a)
    y = exp_a / sum_exp_a
    
    return y
```

소프트 맥스 구현시 문제점

- 지수함수라 오버플로되기 쉽다.

이를 개선한 함수는 다음과 같다.

![Imgur](http://i.imgur.com/sDsfLZj.png)

오버플로를 막을때는 입력신호 중 최댓값을 이용하는 것이 일반적임

```python
def softmax(a):
    c = np.max(a)
    exp_a = np.exp(a - c) # 오버플로 대책
    sum_exp_a = np.sum(exp_a)
    y = exp_a / sum_exp_a
    
    return y
```

소프트맥스 함수의 특징은 출력이 0에서 1.0사이의 실수. 출력의 총합은 1.

출력의 총합이 1이라는 성질덕분에 출력을 '확률'로 해석할 수 있음.

- y[0] 의 확률은 0.018(1.8%), y[1]의 확률은 0.245(24.5%) 같이 해석할 수 있음.

현업에서는 자원 낭비를 줄이고나 출력층의 소프트 맥스 함수를 생략하는 것이 일반적

- 기계학습의 문제 풀이는 학습과 추론의 두 단계를 거침, 신경망을 학습 시킬때는 출력층에서 소프트 맥스 함수를 사용한다.

## 손글씨 숫자 인식

p.96부터 구현하는 추론 과정은 순전파(forward propagation)이라고 한다.

- 원-핫 인코딩 : 정답을 뜻하는 원소만 1(hot하고), 나머지는 0인 배열.
- 정확도(accuracy) : 분류가 얼마나 올바른가의 수치
- 정규화 : 데이터를 특정 범위로 변환하는 처리

## 신경망의 추론처리

```python
def get_data():
    (x_train, t_train), (x_test, t_test) = load_mnist(normalize=True, flatten=True, one_hot_label=False)
    return x_test, t_test


def init_network():
    with open("sample_weight.pkl", 'rb') as f:
        network = pickle.load(f)
    return network


def predict(network, x):
    W1, W2, W3 = network['W1'], network['W2'], network['W3']
    b1, b2, b3 = network['b1'], network['b2'], network['b3']

    a1 = np.dot(x, W1) + b1
    z1 = sigmoid(a1)
    a2 = np.dot(z1, W2) + b2
    z2 = sigmoid(a2)
    a3 = np.dot(z2, W3) + b3
    y = softmax(a3)

    return y

x, t = get_data()
network = init_network()
accuracy_cnt = 0
for i in range(len(x)):
    y = predict(network, x[i])
    p= np.argmax(y) # 확률이 가장 높은 원소의 인덱스를 얻는다.
    if p == t[i]:
        accuracy_cnt += 1

print("Accuracy:" + str(float(accuracy_cnt) / len(x)))
```

`predict()`함수는 각 레이블의 확률을 넘파이 배열로 반환하는데, 0일 확률이 0.1, 1일 확률이 0.3 … 식으로 해석함. 

`np.argmax()` 함수로 배열에서 값이 가장 큰(확률이 가장 높은) 원소의 인덱스를 구함. 이것이 예측 결과.

> 전처리 과정을 예로 들면, 데이터 전체 평균과 표준편자를 이용하여 데이터들이 0을 중심으로 분포하도록 이동시키거나 데이터의 확산 범위를 제한하는 정규화를 수행하기도 함. <br>
>
> 전체 데이터를 균일하게 분포시키는 데이터 백색화(whitening)도 있다.

1. 입력 데이터를 묶은것을 배치라고 함. 추론 처리를 배치 단위로 진행하면 결과를 빠르게 얻을 수 있음







[^1]: 책을 자세히 보면 + 가 아니라 =+ 다.

