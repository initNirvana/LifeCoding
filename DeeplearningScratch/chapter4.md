# 신경망 학습

__학습__이란 훈련데이터로부터 가중치 매개변수의 최적값을 자동으로 획득하는 것을 뜻함

- 학습의 목표 : 신경망이 학습할 수 있도록 해주는 지표가 손실함수
- 손실 함수의 결괏괎을 가장 작게 만드는 가중치 매개변수를 찾는 것이 학습의 목표 

## 데이터에서 학습한다!

신경망의 특징은 데이터를 보고 학습할 수 있다. 데이터에서 학습한다는 것은 가중치 매개변수의 값을 데이터를 보고 자동으로 결장한다는 뜻이다.

> 선형 분리 가능 문제라면 데이터로부터 자동으로 학습할 수 있다(퍼셉트론 수렴정리). 하지만 비선형 분리 문제는 (자동으로) 학습 할 수 없다.

## 데이터 주도 학습

MNIST를 예로 들어, 데이터를 활용한다면. 이미지에서 __특징(feature)__을 추출하고 그 특징의 패턴을 기계학습 기술로 학습하는 방법이 있다.

> 입력 데이터(입력 이미지)에서 본질적인 데이터를 정확하게 추출할 수 있도록 설계된 변환기. 컴퓨터 비전에서는 SIFT, SURF, HOG 등. SVM, KNN등으로 학습할 수 있음

기계학습의 두 가지 접근법

- 사람이 생각한 특징(SIFT, HOG 등) -> 기계학습(SVM, KNN등)
- 신경망 딥러닝

신경망은 이미지를 '있는 그대로' 학습한다. 

> 딥러닝을 종단간 기계학습이라고도 한다. 종단간은 '처음부터 끝까지'라는 의미로 데이터에서 목표한 결과를 얻는 다는 뜻

### 훈련데이터와 시험 데이터

훈련 데이터와 시험 데이터를 나눠야 한다. 우선 훈련 데이터만 사용하여 학습하면서 최적의 매개변수를 찾는다. 시험데이터를 사용하여 훈련한 모델의 실력을 평가하는 것이다. 훈련 데이터와 시험데이터를 나누는 이유는 범용적으로 사용하기 위해서다.

> 한 데이터셋에만 지나치게 최적화된 상태를 __오버피팅__이라고 한다.

## 손실 함수

신경망은 '하나의 지표'를 기준으로 최적의 매개변수 값을 탐색한다. 신경망 학습에서 사용하는 지표는 __손실 함수__라고 함. 일반적으로 __평균 제곱 오차__와 __교차 엔트로피 오차__를 사용한다.

> 손실 함수는 신경망 성능의 '나쁨'을 나타내는 지표로 신경망이 훈련데이터를 얼마나 잘 처리하지 못하느냐를 나타낸다.

### 평균 제곱 오차

가장 많이 쓰이는 손실 함수는 평균 제곱 오차.  ([위키피디아](https://en.wikipedia.org/wiki/Mean_squared_error)) [^1]

y_k는 신경망의 출력(신경망이 추정한 값), t_k는 정답 레이블, k는 데이터의 차원 수를 나타냄.

![Imgur](http://i.imgur.com/yrAfh5z.png)

```python
>>> y = [0.1, 0.05, 0.6, 0.0, 0.05, 0.1, 0.0, 0.1, 0.0, 0.0]
>>> t = [0, 0, 1, 0, 0, 0, 0, 0, 0, 0]
```

정답 레이블인  t는 정답을 1로 표시함. 이처럼 한 원소만 1로 하고 그 외에는 0으로 나타내는 표기법을 __원-핫 인코딩__이라고 했음.



```python
def mean_squared_error(y, t):
    return 0.5 * np.sum((y-t)**2)
```

첫 번째의 예는 정답이 2, 신경망의 출력도 '2'에서 가장 높은 경우. 두 번째 예에서도 정답은 똑같이 '2'지만, 신경망의 출력은 7에서 가장 높음. 다라서 첫번째의 예의 손실함수 쪽이 __출력이 작으면서 오차도 작은것__ 을 알고 있음. 즉 정답에 더 가깝다고 볼 수 있다.

```python
>>> t = [0,0,1,0,0,0,0,0,0,0]
>>> y = [0.1, 0.05, 0.6, 0.0, 0.05, 0.1, 0.0, 0.1, 0.0, 0.0]
>>> mean_squared_error(np.array(y), np.array(t))
0.097500000000000031
>>> y = [0.1, 0.05, 0.1, 0.0, 0.05, 0.1, 0.0, 0.6, 0.0, 0.0]
>>> mean_squared_error(np.array(y), np.array(t))
0.59750000000000003
```

### 교차 엔트로피 오차

![Imgur](http://i.imgur.com/JcunQcj.png)

교차 엔트로피 오차에서도 원-핫 인코딩이다. 교차 엔트로피 오차는 정답일 때의 출력이 전체 값을 정하게 된다. 자연로그(y = log x ) 라고 하는데 `ln x` 아닌가? [^2]

```python
>>> def cross_entropy_error(y, t):
...     delta = 1e-7 # np.log 함수에 0을 입력하면 -inf가 되어 계산 진행 불가, 아주 작은 값을 더해 0이 되지 않도록 함
...     return -np.sum(t * np.log(y + delta))
...
>>> y = [0.1, 0.05, 0.6, 0.0, 0.05, 0.1, 0.0, 0.1, 0.0, 0.0]
>>> cross_entropy_error(np.array(y), np.array(t))
0.51082545709933802
>>> y = [0.1, 0.05, 0.6, 0.0, 0.05, 0.1, 0.0, 0.1, 0.0, 0.0]
>>> cross_entropy_error(np.array(y), np.array(t))
2.3025840929945458
```

첫 번째 예는 정답일 때의 출력이 0.6인 경우로, 교차 엔트로피 오차는 0.51로 나왔음. 두 번째 결과(오차 값)보다 더 작은 첫번째 추정이 정답일 가능성이 높다고 판단했으므로 평균 제곱 오차의 판단과 일치함. 

### 미니배치 학습

기계 학습 문제는 훈련 데이터에 대한 손실 함수의 값을 구하고, 그 값을 최대한 줄여주는 매개변수를 찾아내는 것이다. 이렇게 하려면 훈련 데이터를 대상으로 손실 함수 값을 구해야 함. 

훈련 데이터 모두에 대한 손실 함수의 합을 구하는 방법은 다음과 같다. (평균 손실 함수)

![Imgur](http://i.imgur.com/l9OMGYF.png)

데이터가 N개라면 t_{nk} 는 n번째 데이터의 __k번째__ 값을 의미함. 모든 데이터를 대상으로 손실 함수의 합을 구하려면 시간이 많이 걸리기 때문에, 데이터 일부를 추려 전체의 '근사치'로 이용함. 일부를 __미니배치__라고 함. 일부를 이용하여 학습하는 것을 __미니배치 학습__이라고 한다. 

#### (배치용) 교차 엔트로피 오차 구현하기

데이터가 하나인 경우의 코드

```python
def cross_entropy_error(y, t):
    if y.dim == 1:
        t = t.reshape(1, t.size)
        y = y.reshape(1, y.size)
        
    batch_size = y_shape[0]
    return -np.sum(t * np.log(y)) / batch_siz

```

- 데이터 하나당 교차 엔트로피 오차를 구하는 경우는 `reshape`함수로 데이터의 형상을 바꿔준다. 배치 크기로 나눠 정규화 하고 이미지 1장당 평균의 교차 엔트로피 오차를 계산함

데이터가 배치로 묶여 입력될 경우의 코드

```python
def cross_entropy_error(y, t):
    if y.dim == 1:
        t = t.reshape(1, t.size)
        y = y.reshape(1, y.size)
        
    batch_size = y_shape[0]
    return -np.sum(np.log(y[np.arange(batch_size), t])) / batch_size
```

- 원-핫 인코딩일 때 t가 0인 원소는 교차 엔트로피 오차도 0이므로 무시해도 좋다는 것. 정답의 해당하는 신경망의 출력만으로 교차 엔트로피 오차를 계산할 수 있다.

`np.log(y[np.arange(batch_size), t])`  np.arange(batch_size)는 0 부터 batch_size-1까지 배열을 생성함.  y[np.arange(batch_size), t]는 각 데이터의 정답 레이블에 해당하는 신경망의 출력을 추출.

## 왜 손실 함수를 설정하는가?

신경망 학습에서는 최적의 매개변수(가중치와 편향)를 탐색할 때 손실함수의 값을 가능한 한 작게하는 매개변수의 값을 찾는다. 이때 매개변수의 미분(정확히는 기울기)를 계산하고, 미분 값을 단서로 매개변수의 값을 서서히 갱신하는 과정을 반복한다.

손실 함수를 지표로 삼았다면, 매개변수의 값이 조금 변할 때마다 그에 반응하여 손실 함수의 값도 연속적으로 변함. 정확도는 매개변수의 변화에는 반응을 보이지 않고, 반응이 있더라도 값이 불연속적으로 변화함. -> 계단 함수를 활성화 함수로 사용하지 않는 이유, 잘 학습도 되지 않음

수치 미분 부분은 넘어갑니다. 

## 기울기



```python
def numerical_gradient(f, x):
    h = 1e-4 # 0.0001
    grad = np.zeros_like(x)
    
    for idx in range(x.size):
        tmp_val = x[idx]
        # f(x+h)
        x[idx] = tmp_val + h
        fxh1 = f(x)
        
        # f(x-h) 계산
        x[idx] = tmp_val - h
        fxh2 = f(x)
        
        grad[idx] = (fxh1 - fxf2) / (2*h)
        x[idx] = tmp_val # 값 복원
        
   return grad
```

`np.zeros_like(x)`는 x와 형상이 같고 그 원소가 모두 0인 배열을 만든다. `numerical_gradient(f, x) 함수의 인수인 f는 함수이고 x는 넘파이 배열. 넘파이 배열 x의 각 원소에 대해서 수치 미분을 구함. 

```python
>>> numerical_gradient(function_2, np.array([3.0, 4.0]))
array([6. ,8.])
>>> numerical_gradient(function_2, np.array([0.0, 2.0]))
array([0. ,4.])
>>> numerical_gradient(function_2, np.array([3.0, 0.0]))
array([6. ,0.])
```

그림 4-9를 보면 기울기는 가장 낮은 장소(최솟값)를 가리킨다. 반드시 그렇다고는 할 수는 없다. 

기울기는 각 지점에서 낮아지는 방향을 가리킨다. __기울기가 가리키는 쪽은 각 장소에서 함수의 출력 값을 가장 줄이는 방향__ 

### 경사법(경사 하강법)

매개변수 공간이 넓어 어디가 최솟값이 되는 곳인지 알아내기 어렵다. 이런 상황에서 기울기을 활용하여 함수의 최솟값을 찾으려는 것이 경사법

> 극소값, 최솟값, 안장점(saddle point)이 되는 장소에서는 기울기가 0이다.

다시 말해, 경사법은 현 위치에서 기울어진 방향으로 일정 거리만큼 이동한다. 이동한 곳에서도 기울기를 구하고, 또 기울어진 방향으로 나아가는 일을 반복한다. 계속 함수의 값을 줄이는 것이 __경사법__이다. 신경망 학습에서는 경사법을 많이 사용한다고 함.

> 경사법은 최솟값, 최댓값을 찾는것에 따라 경사 하강법, 경사 상승법이라고 함. 하지만 중요하지는 않고 일반적으로 경사 하강법을 사용함

```python
# 경사하강법 구현
def gradient_descent(f, init_x, lr=0.01, step_num=100):
    x = init_x
    
    for i in range(step_num):
        grad = numerical_gradient(f, x)
        x -= lr * grad
    return x
```

`f`는 최적화하려는 함수, `init_x`는 초깃값, `lr`은 학습률, `step_num`은 경사법에 따른 반복 횟수를 의미함. 함수의 기울기는 numerical_gradient(f, x)로 구하고 기울 기에 학습률을 곱한 값으로 갱신하는 처리를 step_num으로 반복하는 것. 이를 이용하면 함수의 __극솟값__과 **최솟값**을 구할 수있다.

경사법으로 함수의 최솟값을 구하는 예제

```python
def function_2(x):
    return x[0]**2 + x[1]**2

init_x = np.array([-3.0, 4.0])
gradient_descent(function_2, init_x=init_x, lr=0.1, step_num=100)
```

아무튼 학습률이 너무 크면 큰 값으로 발산해버리고, 너무 작으면 갱신되지 않은채 끝나버린다. 

> 학습률 같은 매개변수를 **하이퍼파라미터**라고 한다. 신경망의 가중치 매개변수는 자동으로 획득되는 반면, 학습률 같은 하이퍼파라미터는 사람이 직접 설정해야하는 매개변수다.

### 신경망에서의 기울기

신경망 학습에서도 기울기를 구해야 한다. 가중치 매개변수에 관한 손실 함수의 기울기다.

```python
class simpleNet:
    def __init__(self):
        self.W = np.random.randn(2,3) # 정규분포로 초기화

    def predict(self, x):
        return np.dot(x, self.W)

    def loss(self, x, t):
        z = self.predict(x)
        y = softmax(z)
        loss = cross_entropy_error(y, t)

        return loss
    
x = np.array([0.6, 0.9])
t = np.array([0, 0, 1])

net = simpleNet()

f = lambda w: net.loss(x, t)
dW = numerical_gradient(f, net.W)

print(dW)
```

`simpleNet `은 형상이 2×3인 가중치 매개변수 하나를 인스턴스 변수로 갖는다.  결과는 2×3인 2차원 배열. 신경망의 기울기를 구한 다음에는 경사법에 다라 가중치 매개변수를 갱신하기만 하면 됨. 

## 학습 알고리즘 구현하기

1. 전제 : 신경망에는 적응가능한 가중치와 편항이 있고, 이를 훈련 데이터에 적응하도록 조정하는 과정을 '학습'이라 함.
2. 1단계 미니배치 : 훈련 데이터 중 일부를 무작위로 가져옴
3. 2단계 기울기 산출 : 미니배치의 손실 함수 값을 줄이기 위해 각 가중치 매개변수의 기울기를 구한다
4. 3단계 매개변수 갱신 : 가중치 매개변수를 기울기 방향으로 아주 조금 갱신
5. 4단계 반복 : 1~3단계 반복

미니배치를 무작위로 선정하기 때문에, 확률적 경사 하강법(SGD)이라고 부름

```python
import sys, os
sys.path.append(os.pardir)  # 부모 디렉터리의 파일을 가져올 수 있도록 설정
from common.functions import *
from common.gradient import numerical_gradient


class TwoLayerNet:

    def __init__(self, input_size, hidden_size, output_size, weight_init_std=0.01):
        # 가중치 초기화
        self.params = {}
        self.params['W1'] = weight_init_std * np.random.randn(input_size, hidden_size)
        self.params['b1'] = np.zeros(hidden_size)
        self.params['W2'] = weight_init_std * np.random.randn(hidden_size, output_size)
        self.params['b2'] = np.zeros(output_size)

    def predict(self, x):
        W1, W2 = self.params['W1'], self.params['W2']
        b1, b2 = self.params['b1'], self.params['b2']

        a1 = np.dot(x, W1) + b1
        z1 = sigmoid(a1)
        a2 = np.dot(z1, W2) + b2
        y = softmax(a2)

        return y

    # x : 입력 데이터, t : 정답 레이블
    def loss(self, x, t):
        y = self.predict(x)

        return cross_entropy_error(y, t)

    def accuracy(self, x, t):
        y = self.predict(x)
        y = np.argmax(y, axis=1)
        t = np.argmax(t, axis=1)

        accuracy = np.sum(y == t) / float(x.shape[0])
        return accuracy

    # x : 입력 데이터, t : 정답 레이블
    def numerical_gradient(self, x, t):
        loss_W = lambda W: self.loss(x, t)

        grads = {}
        grads['W1'] = numerical_gradient(loss_W, self.params['W1'])
        grads['b1'] = numerical_gradient(loss_W, self.params['b1'])
        grads['W2'] = numerical_gradient(loss_W, self.params['W2'])
        grads['b2'] = numerical_gradient(loss_W, self.params['b2'])

        return grads

    def gradient(self, x, t):
        W1, W2 = self.params['W1'], self.params['W2']
        b1, b2 = self.params['b1'], self.params['b2']
        grads = {}

        batch_num = x.shape[0]

        # forward
        a1 = np.dot(x, W1) + b1
        z1 = sigmoid(a1)
        a2 = np.dot(z1, W2) + b2
        y = softmax(a2)

        # backward
        dy = (y - t) / batch_num
        grads['W2'] = np.dot(z1.T, dy)
        grads['b2'] = np.sum(dy, axis=0)

        da1 = np.dot(dy, W2.T)
        dz1 = sigmoid_grad(a1) * da1
        grads['W1'] = np.dot(x.T, dz1)
        grads['b1'] = np.sum(dz1, axis=0)

        return grads
```

> `numerical_gradient(self,x,t)`는 수치 미분 방식으로 매개변수의 기울기를 계산함. 5장에서 이 기울기 계산을 고속으로 수행하는 기법인 오차역전파법을 다룸.

### 미니배치 학습 구현하기

```python
import sys, os
sys.path.append(os.pardir)  # 부모 디렉터리의 파일을 가져올 수 있도록 설정
import numpy as np
import matplotlib.pyplot as plt
from dataset.mnist import load_mnist
from two_layer_net import TwoLayerNet

# 데이터 읽기
(x_train, t_train), (x_test, t_test) = load_mnist(normalize=True, one_hot_label=True)

network = TwoLayerNet(input_size=784, hidden_size=50, output_size=10)

# 하이퍼파라미터
iters_num = 10000  # 반복 횟수를 적절히 설정한다.
train_size = x_train.shape[0]
batch_size = 100   # 미니배치 크기
learning_rate = 0.1

train_loss_list = []
train_acc_list = []
test_acc_list = []

# 1에폭당 반복 수
iter_per_epoch = max(train_size / batch_size, 1)

for i in range(iters_num):
    # 미니배치 획득
    batch_mask = np.random.choice(train_size, batch_size)
    x_batch = x_train[batch_mask]
    t_batch = t_train[batch_mask]

    # 기울기 계산
    #grad = network.numerical_gradient(x_batch, t_batch)
    grad = network.gradient(x_batch, t_batch)

    # 매개변수 갱신
    for key in ('W1', 'b1', 'W2', 'b2'):
        network.params[key] -= learning_rate * grad[key]

    # 학습 경과 기록
    loss = network.loss(x_batch, t_batch)
    train_loss_list.append(loss)

    # 1에폭당 정확도 계산
    if i % iter_per_epoch == 0:
        train_acc = network.accuracy(x_train, t_train)
        test_acc = network.accuracy(x_test, t_test)
        train_acc_list.append(train_acc)
        test_acc_list.append(test_acc)
        print("train acc, test acc | " + str(train_acc) + ", " + str(test_acc))
```

학습 횟수가 늘어가면서 손실함수 값이 줄어들면 학습이 잘되고 있다는 뜻이다. 즉 서서히 데이터에 적응하고 있다는 의미. 최적 가중치 매개변수로 서서히 다가가고 있는 것임.

> 에폭은 하나의 단위다. 1에폭은 학습에서 훈련데이터를 모두 소진했을 때의 횟수에 해당함. 훈련데이터 10000-> 100개 미니배치? SGD를 100회 반복하면 100회가 1에폭이 됨.

그래프에서 에폭에따른 정확도가 점차적으로 증가할 수록, 차이가 없음을 보이면 오버피팅이 안일어난 것을 알 수 있다.

> 오버피팅 예방법은 **6.4 바른 학습을 위해**에 설명되어 있다.

- 아주 작은 값을 주었을 떄의 차분으로 미분을 구하는 것을 수치 미분이라고 한다.
- 수치 미분을 이용해 가중치 매개변수의 기울기를 구할 수 있다.
- 수치 미분을 이용한 계산에는 시간이 걸리지만, 구현은 간단. 5장에서 오차역전파법을 보도록 하자.

[^1]: 1/2 가 아니고 1/n 라고 오탈자 제보에 등록되어 있다. <br>
[^2]: p.115, 2번째 줄 no.log -> np.log 