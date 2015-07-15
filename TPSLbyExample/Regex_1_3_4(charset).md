###1장 Regex p.56
#### 문자 집합

패턴에 문자 집합을 사용하면 집합속의 문자 어느 것이라도 매칭될수 있음 

예를 들어 [ab]는 a에도 매칭되고 b에도 매칭된다.

```python
import re

def test_patterns(text, patterns=[]):
    """Given source text and a list of patterns, look for
    matches for each pattern within the text and print
    them to stdout.
    """
    # 텍스트에서 패턴을 찾고 결과 출력
    for pattern, desc in patterns:
        print 'Pattern %r (%s)\n' % (pattern, desc)
        print '  %r' % text
        for match in re.finditer(pattern, text):
            s = match.start()
            e = match.end()
            substr = text[s:e]
            n_backslashes = text[:s].count('\\')
            prefix = '.' * (s + n_backslashes)
            print '  %s%r' % (prefix, substr)
        print
    return
```

```python
from re_test_patterns import test_patterns
# 위의 함수를 임포트 한다.

test_patterns(
    'abbaabbba',
    [ ('[ab]',    'either a or b'),
      ('a[ab]+',  'a followed by 1 or more a or b'),
      ('a[ab]+?', 'a followed by 1 or more a or b, not greedy'),
      ])
```
탐욕 방식을 사용한 (a[ab]+)는 텍스트 전체를 소비한다. a를 처음문자로 사용, 하위문자열에 a 혹은 b 가 1개 이상 나올 수 있다는 의미

Pattern '[ab]' (either a or b)

  'abbaabbba'
  'a'
  .'b'
  ..'b'
  ...'a'
  ....'a'
  .....'b'
  ......'b'
  .......'b'
  ........'a'

Pattern 'a[ab]+' (a followed by 1 or more a or b)

  'abbaabbba'
  'abbaabbba'

Pattern 'a[ab]+?' (a followed by 1 or more a or b, not greedy)

  'abbaabbba'
  'ab'
  ...'aa'
  
이 외에 특정문자를 제외할때 `^` 사용, 집함 앞에 `^` 를 붙이면 문자집합에 열거된 문자를 제외하고 찾는다.
정규표현식에 `.`을 사용하면 그 자리에 어떤 문자가 와도 매칭함을 의미
허나 탐욕 알고리즘에 사용하면 탐색이 길어질 수 있으니 사용시 주의