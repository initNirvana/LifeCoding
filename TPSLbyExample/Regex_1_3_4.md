###1장 Regex p.56
#### 반복
##### 기본 탐욕


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
test_patterns(
	'abbaabbba',
    [('ab*',		'a followed by zero or more b'),
     ('ab+',		'a followed by one or more b'),
     ('ab?',		'a followed by zero or one b'),
     ('ab{3}',		'a followed by three b'),
     ('ab{2,3}',	'a followed by two or three b'),
])
```
ab+ 보다 ab*와 ab?에서 더 많은 매칭이 발생한다.


Pattern 'ab*',		'a followed by zero or more b')
'abbaaabbba'
'abb'
...'a'
....'abbb'
........'a'

Pattern 'ab+',		'a followed by one or more b')
'abbaabbba'
'abb'
....'abbb'

Pattern 'ab?',		'a followed by zero or one b')
'abbaabbba'
...'a'
....'ab'
........'a'

Pattern 'ab{3}',		'a followed by three b')
'abbaabbba'
....'abbb'

Pattern 'ab{2,3}',	'a followed by two or three b')
'abbaabbba'
'abb'
....'abbb'


#####반복문뒤에 `?`를 붙여 탐욕(greedy) 비활성화
```python
test_patterns(
    'abbaabbba',
    [ ('ab*?',     'a followed by zero or more b'),
      ('ab+?',     'a followed by one or more b'),
      ('ab??',     'a followed by zero or one b'),
      ('ab{3}?',   'a followed by three b'),
      ('ab{2,3}?', 'a followed by two to three b'),
      ])
```
Pattern 'ab*?' (a followed by zero or more b)

  'abbaabbba'
  'a'
  ...'a'
  ....'a'
  ........'a'

Pattern 'ab+?' (a followed by one or more b)

  'abbaabbba'
  'ab'
  ....'ab'

Pattern 'ab??' (a followed by zero or one b)

  'abbaabbba'
  'a'
  ...'a'
  ....'a'
  ........'a'

Pattern 'ab{3}?' (a followed by three b)

  'abbaabbba'
  ....'abbb'

Pattern 'ab{2,3}?' (a followed by two to three b)

  'abbaabbba'
  'abb'
  ....'abb'


b 가 0 혹은 그 이상 반복되는 패턴에서 탐욕 방식을 비활성화 시키면 매칭된 하위 문자열은 더이상 b 문자를 포함하지 않는다.