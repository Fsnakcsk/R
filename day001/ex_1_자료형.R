# 산술연산 - 계산기처럼 활용
# 연산자 : +, -, *
# */  실수 목
# %/% 정수 목
# %% 나머지
# ** 혹은 ^ = 거듭제곱

# 비교 연산자
# TRUE(T) or FALSE(F)
# <, <=, >, >=, ==, !=, 

# 논리연산자
# !=NOT, (| or ||)or , (&, &&)and
# isTRUE 참이냐

# R 자료형
# 숫자형 : (int정수, num실수, cplx복소수) 
# 문자형 : chr, "" or ''
# 범주형 : factor
# 특수상수(값) : NULL = 알수없는 값, 
#                NA   = (missing value-결측값, 누락된 값)

# Inf, -Inf
# NaN : Not a number (숫자가 아라는 뜻) 예 : 0/0,Inf, -Inf 연산이 불가능한 값


# R의 자료형을 확인하는 함수
# class(x)        자료형 확인
# is.integer(x)   정수입니까?,  is.integer(1L)  1은 1.0로 인식 1L은 정수로 인식
# is-numbeic(x)   실수 입니까?  is.integer(1)   is.numeric(1L) 해도 TRUE로 인식**
# is.complex(x)   복소수
# is.character(x) 문자
# is.na(x)        결측값


# R Type변환 :
# as.factor(x)    범주형으로 바꿈
# as.integer(x)   정수으로 바꿈
# as.numeric(x)   숫자이나아니나
# as.character(x) 문자열로
# as.matrix(x)    행열으로
# as.array(x)     배열로

# fator(c()) fator로 만들면 c로 묶어야 함

# 숫자형 - 정수형, 실수형, 복소수
x <- 1
class(x)
is.integer(x)
is.numeric(x)


# x에 단손히 1을 넣을 경우 x는 숫자형
x <-1L
class(x)
is.integer(x)
is.numeric(x)

x = as.integer(1)
is.integer(x)

is.double(x) # 실수이냐

# 목록 보기
ls()

# 변수 제거
rm(x)


# factor : (가변 배열)
# 1차원배열
# 같은 타입만 담을 수 있음
# index : 1~n까지

# 한줄에 여러줄 처리할 떄 ;로 연결함.
# score.1 -< 68; score.2 -< 95
# total <- score.1 + score.2

# factor로 만든 함수 : c()
score <- c(68, 95, 83, 76, 90, 80, 85, 91, 82, 70)
mean(score) # : mean()=



























