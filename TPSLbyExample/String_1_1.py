#-*- coding:utf-8 -*-
# Github.com/initnirvana
# kimqqyun@gmail.com 
# the python StandardLibrary by example

# 1.1 String 텍스트 상수와 템플릿

# 1.1.1 함수
import string

# maketrans는 translate 메소드에 사용할 번역 테이블을 생성한다 
# 효율적으로 변환작업을 수행 할 수 있다.
leet = string.maketrans('abegiloprstz', '463611092572')

s = "The quick brown fox jumped over the lazy dog."

if __name__ == '__main__':
	print s 
	# capwords는 문자열에서 모든 단어의 첫 번째 알파벳을 대문자로 변환한다.
	print string.capwords(s) # The Quick Brown Fox Jumped Over The Lazy Dog.
	# 특정 문자가 숫자로 변환된다. (l33t 숫자로 변횐) # l33t('Leetspak' 대체 알파벳) 
	print s.translate(leet) # Th3 qu1ck 620wn f0x jum93d 0v32 7h3 142y d06.


# 1.1.2 템플릿

import string
# 장점은 인자의 타입이 고려되지 않는다.
# 인자의 값은 문자열로 변환되고 결과물에 삽입 -> 서식 지정불가 예) 부동소수점 넣는경우 소수점 몇자리 결정 불가능 
#values = ['var':'foo']

t = string.Template("""
Variable : $var
Escape : %S
Variable : %{var}iable
""")

print 'TEMPLATE', t.substitute(values)

s = """
Variable	: %(var)s
Escape		: %%
Variable in text : %(var)siable
"""

print 'INTERPOLATION:', s % values

#TEMPLATE 		 : foo
#Escape			 : %
#Variable in text : fooiable

#INTERPOLATION :
#Variable		 : foo
#Escape			 : %
#Variable in text : fooiable

# safe_subtitle() 메소드를 사용해 모든 인자가 전달되지 않은 예외 사항을 처리할 수 있다는 장점도 있다.

import string 

#values = ['var':'foo']

t = string.Template("%var is here but %missing is not prvided")

try:
	print 'substitute() 		:', t.substitute(values)
except KeyError, err:
	raise 'ERROR:', str(err)
# 사전형에 missing 변수가 존재하지 않기 떄문에 subtitute 에 의해 KeyERROR가 발생한다 
# safe_subtitute() 을 실행하면 에러를 발생시키지않고 존재하지않는 변수명을 그대로 문자열에 표시
print 'safe_subtitute():', t.safe_subtitute(vaules)

# sustitute() : ERROR: 'missing'
#safe_subtitute : foo is gere but %missing is not provided

# 1.1.3 템플릿 고급
import string 

Template_text = '''
	Delimiter	: %s
	Replace 	: %with_underscore
	Ignored		: %notunderscored
'''

d = {'with_underscore' : 'replaced',
	'notunderxcored' : 'not replaced',
	}

class MyTemplate(sting.Template):
	delimiter = '%'
	idattern '[a-z]+_[a-z]+'
t = MyTemplate(Template_text)
print 'Modified ID pattern:'
print t.safe_substitute(d)
# 이 예제에서는 구분자로 $ 대신 %를 사용 
# 변수 이름에 무조건 밑줄 표시를 포함해야 한다는 점이 다르다. 
# %underscore 는 밑줄 표시를 변수명에 포함하지 않기 떄문에 치환하지 않는다.

#Modified ID pattern:

#Delimiter : %
#Replaced :replaced
#Ignored : %notunderscored 

# 복잡한 변화를 주려면 pattern 속성을 재정의해 완전히 새로운 정규표현식을 정의한다. 

import string 

t = string.Template('%var')
print t.pattern.pattern

# t.pattrn 의 값은 컴파일된 정규표현식이다. 
# pattern 속성을 통해 원본 문자열을 볼 수 있다.
#\$(?:
#	(?P<escaped>\$) 			 | # two delimiters
#	(?P<named>[_a-z][_a-z0-9]*)  | # identifier
#	(?P<braced>[_a-z][_a-z0-9]*) | # braced identifier	
#	(?P<invalid)				 | # ill-formed delimiter exprs
#)

import string
import re 

class MyTemplate(string.Template):
	delimiter = '{{'
	pattern = r'''
	\{\{(?:
	(?P<escaped>\{\{) | 
	(?P<named>[_a-z][_a-z0-9]*) \{\{) | 
	(?P<braced>[_a-z][_a-z0-9]*) \{\{) | 
	(?P<invalid)
	)
	'''
t = MyTemplate('''
{{{{
{{var}}
''')

print 'MATCHES:' t.pattern.findall(t.template)
print 'SUBTITURED:' t.safe_substitute(var='replacement')
# 이름 붙은 패턴과 대괄호 패턴은 동일한 형식이더라도 반드시 따로 정의해야 한다.
# 실행결과

# MATCHES: [('{{, '', '', ''), ('', 'var', '', '')]
#SUBTITURED:
#{{
#replacement



