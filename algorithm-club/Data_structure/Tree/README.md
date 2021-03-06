# 트리 (Tree)
트리는 나무와 유사하게 계층적 구조(비선형구조)다. 나무와 비슷하게 뿌리노드(루트 노드)와 가지노드(리프노드) 등을 가지고 있다.

![Imgur](http://i.imgur.com/ZQekCmL.png) 

이미지는 높이가 3, 크기가 9인 트리다. 앞의 이미지에서 가장 위에 있는 __2__ 는 루트 노드다. 7은 2와 6의 부모 노드다. 2와 6은 6의 자식 노드가 된다. 레벨은 3이다.

- 서브 트리 : 하나의 노드와 그 노드의 자손들로 이루어진 트리
- 차수(degree) : 어떤 노드가 가지고 있는 자식 노드의 수
- 높이(height) : 트리의 루트노드
- 레벨(level) : 트리의 각 층의 번호 
- 깊이(depth) : 루트 노드에서 해당하는 노드까지 가는 경로의 길이
- 단말/비단말노드 : 자식 노드가 없는 노드를 __단말노드__, 반대를 __비단말 노드__ 라고 함

> 트리는 간선으로 연결되며 노드들 간에는 부모 관계, 형제 관계, 조상 노드, 자손 노드가 있다. 형제 관계는 어떤 노드와 같은 등급인 노드를 뜻하며, 조상노드란 루트 노드에서 임의의 노드까지의 경로를 이루고 있는 노드들을 뜻한다. 


[위키피디아](https://en.wikipedia.org/wiki/Tree_(data_structure))
## 사용 예
- 의사 결정
- 파일 시스템(디렉터리 구조)
- 검색엔진
- DBMS
- 라우터 알고리즘
- 기타 등등 계층적 데이터
- 파싱 트리

## 이진트리
이진트리는 자식노드를 최대 두 개만 가지고 있다.
