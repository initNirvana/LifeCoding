# -*- coding:utf-8 -*-
# Github.com/initnirvana
# kimqqyun@gmail.com 
# the python StandardLibrary by example


"""

텍스트의 서식을 조절해 문서를 예쁘게 출혁해야 하는 경우 textwrap ㅗ듈을 사요한다
일반 텍스트 에디터나 워드 프로세서가 제공하는 단락 조절 등과 비슷한 기능을 제공한다.

예제 데이터는 textwrap_example.py 모듈을 사용하나 여기선 sample_text를 가져왔다.
"""

# 1.2.1 예제 데이터
sample_text = '''
    The textwrap module can be used to format text for output in
    situations where pretty-printing is desired.  It offers
    programmatic functionality similar to the paragraph wrapping
    or filling features found in many text editors.
    '''

# 1.2.2 단락 채우기
import textwrap

print 'No dedent:\n'
print textwrap.fill(sample_text, width= 50)
"""
출력 결과
No dent:

     The textwrap module can be used to format
text for output in     situations where pretty-
printing is desired.  It offers     programmatic
functionality similar to the paragraph wrapping
or filling features found in many text editors.
"""
# 1.2.3 들여 쓰기 없애
dedented_text = textwrap.dedent(sample_text)
print 'Dedented:'
print dedented_text
"""
출력 결과
Dedented:

The textwrap module can be used to format text for output in
situations where pretty-printing is desired.  It offers
programmatic functionality similar to the paragraph wrapping
or filling features found in many text editors.
"""
""" 
 Line one. # 1 -> 0
   Line two. # 3 -> 2
 Line three. # 1 -> 0 
다른 줄에 비해 더 들여쓰기가 된 줄이 있다면 그 공백까지 사라진다.
"""

# 1.2.4 Dedent 와 Fill을 함께 사용

# 공백을 없앤 텍스트를 다른 witdh 값과 함께 fill()에 넘길 수 있다.

dedented_text = textwrap.dedent(sample_text).strip()
for width in [45, 70]:
	print '%d Columns:\n' % width
	print textwrap.fill(dedented_text, width=width)
	print 
"""
지정한 너비 만큼의 결과물을 출력한다.
45 Columns:

The textwrap module can be used to format
text for output in situations where pretty-
printing is desired.  It offers programmatic
functionality similar to the paragraph
wrapping or filling features found in many
text editors.

70 Columns:

The textwrap module can be used to format text for output in
situations where pretty-printing is desired.  It offers programmatic
functionality similar to the paragraph wrapping or filling features
found in many text editors.

"""

# 1.2.5 이어지는 들여 쓰기
dedented_text = textwrap.dedent(sample_text).strip()
print textwrap.fill(dedented_text,
					initial_indent='',
					subsequent_indent=' ' * 4,
					width=50,
					)
# 들여쓰기 값으로 꼭 공백 문자를 사용할 필요 없음. 두번째 줄 부터 들여쓰기에는 * 이용해 값을 조절할 수 있다.
"""
The textwrap module can be used to format text for
    output in situations where pretty-printing is
    desired.  It offers programmatic functionality
    similar to the paragraph wrapping or filling
    features found in many text editors.
"""


