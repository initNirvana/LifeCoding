# -*- coding:utf-8 -*-
# Github.com/initnirvana
# kimqqyun@gmail.com 
# the python StandardLibrary by example

"""
정규표현식
"""

# 1.3.1 텍스트에서 패턴 찾기

import re

pattern = 'this'
text = 'Does this text match the pattern?'

match = re.search(pattern, text)

s = match.start()
e = match.end()

print 'Found "%s"\nin "%s"\nfrom %d to %d ("%s")' % \
    (match.re.pattern, match.string, s, e, text[s:e])
# start(), end() 메소드는 텍스트에서 패턴이 발견된 위치를 문자열의 인덱스를 보여준다.

"""
실행결과
Found"this"
in"Does this text match the pattern?"
from 5 to 9 ("this")
"""

# 1.3.2 표현식 컴파일 

import re

# compile(source, filename, mode) 은 표현식 문자열을 Regexobject로 변환한다.
regexes = [ re.compile(p)
            for p in [ 'this', 'that' ]
            ]
text = 'Does this text match the pattern?'

print 'Text: %r\n' % text

for regex in regexes:
    print 'Seeking "%s" ->' % regex.pattern,

    if regex.search(text):
        print 'match!'
    else:
        print 'no match'

"""
Text: 'Does this text match the pattern?'

Seeking "this" -> match!
Seeking "that" -> no match
"""

# 1.3.3 다중 매칭

import re

text = 'abbaaabbbbaaaaa'

pattern = 'ab'

for match in re.finditer(pattern, text):
    s = match.start()
    e = match.end()
    print 'Found "%s" at %d:%d' % (text[s:e], s, e)

"""
ab를 두번 찾아내고 match 인스턴스는 이들이 어느 위치에 있는지 보여준다.
Found "ab" at 0:2
Found "ab" at 5:7
"""

# 1.3.4 패턴 문법

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

if __name__ == '__main__':
    test_patterns('abbaaabbbbaaaaa',
                  [('ab', "'a' followed by 'b'"),
                   ])
"""

Pattern 'ab' ('a' followed by 'b')

 'abbaaabbbbaaaaa'
 'ab'
 .....'ab'

"""

다른 파일에서 계속...
