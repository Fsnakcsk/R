# 리스트(List) : 각 요소의 타입이 일치하지 않은 벡터
# List()
# R이 제공하는 모든 자료구조를 담을 수 있다
## 파이썬의 자료형인 딕셔너리와 같이 변수와 값을 쌍으로 담는다

Hong = list(kor.name = "홍길동",
            eng.name = 'Gil-dong',
            age = 43,
            married = T,
            num.child = 2,
            child.ages = c(13,10))

Hong
Hong$age
Hong$child.ages[2]

str(Hong)

# list도 벡터의 인덱스를 사용할 수 있지만 대과로[[]] 2개를 사용해야 함
Hong$eng.name
Hong[[2]]

# 벡터가 사용하면 [c(1, 2)] 형식으로
Hong[c(1, 2)]

is.list(Hong)

x = list(a = 1:10,
         b = exp(-3:3), # 자연 로그
         logic = c(T, F, F, T))

x

# 반복한다 lapply()
lapply(x, mean) # 함수과로 들어가면 안됨

Hong$age + Hong$child.ages[2]

#-------------------------------------------------------------------------

# SQL 익숙한 사람들은 SQL 이용할 수 있따
# 패키지를 설치
install.packages("sqldf")

#페키지 로딩
library(sqldf)

data()
?longley 

# SQL 사용
sqldf("SELECT GNP, Year, Employed
       FROM longley
       WHERE GNP > 400")

# sort() 정렬
# order(x, TRUE-내림차순, na위치
# FALSE-오름차순) 정렬
# TRUE - 맨 끝에, 
# FALSE - 맨 앞에
df2
df2$ages

order(df2$ages)

# 나이를 기준으로 오름차순 정렬
df2[order(df2$ages),] # 오름차순
df2[order(df2$ages, decreasing=T),] # 오름차순

sort(df2$ages)


#                        그룹함수
#---------------------------------------------------
# 그룹함수 : 특정 열을 기준으로 그룹을 묵어 계산, 집계함수
# aggregate(formula, data, function)
# formula : 집계할 열 ~ 집계기준열
# cbind(집계할 열1, 집계할 열2, .....) ~ 기준열1 + 기준열2


emp = data.frame(dept = c('개발부', '개발부', '개발부', '개발부', '영업부', '영업부', '영업부', '영업부'), 
                 position = c('과장', '과장', '차장', '차장', '과장', '과장', '차장', '차장'), 
                 name = c('aaa', 'bbb', 'ccc', 'ddd', 'eee', 'fff', 'ggg', 'hhh'),
                 sal = c(5600, 5100, 7500, 7300, 4900, 5000, 6000, 6700),
                 time = c(15, 18, 18, 12, 17, 20, 8, 19))

# aggregate(formula, data, function)
# 부서별 급여평균
aggregate(sal ~ dept, emp, mean)

# 부서별 급여 및 근무시간의 평균
aggregate(cbind(sal, time) ~ dept, emp, mean)

# 부서와 직급별로 급여의 평균
aggregate(sal ~ dept + position, emp, mean)

# na.rm  통계함수에 들어있는 함수
# na.omit() : 데이터 프레임에서 결측값을 제거

Titanic
str(Titanic)

airquality
str(airquality)

# airquality 
# Ozone의 평균을 계산

head(airquality, 10)
mean(airquality$Ozone, na.rm=T)


?na.omit()
air = na.omit(airquality)
mean(air$Ozone)

# merge() : : 여러 개의 데이터프레임을 병합할 때 사용하는 함수
?merge

name = c('홍길동', '장보고', '이순신')
age = c(22, 30, 19)
gender = factor(c('M', 'F', 'M'))

p1 = data.frame(name, age, gender)
p1

blood.taype = factor(c('A', 'O', 'B'))
p2 = data.frame(name, blood.taype)
p2

p3 = merge(p1, p2, by='name')
p3

#-------------------------------------

name1 = c('철수', '춘향', '길동')
name2 = c('민수', '춘향', '길동')

df1 = data.frame(name1, age, gender)
df2 = data.frame(name2, blood.taype)

df = merge(df1, df2, by.x = 'name1', by.y = 'name2')
df

df = merge(df1, df2, by.x = 'name1', by.y = 'name2', all = T)
df

# 리스트 : 데이터프레임보다 넓은 자료구조
## list(oop1, oop2....)
x = list(name = 'foo', height = 70)
x

# 리스트는 객체마다 크기와 타입이 달라도 가능하다.
x = list(name = 'foo', height = c(1, 3, 5))
x

# list안에 list중첩 허용
list(a=list(val=c(1, 2, 3)), b = list(val=c(1, 2, 3, 4)))


# 이름만 겨져오기
x$name
x$height

x[[1]]
x[1]  # sublist : key와 value 같이 나옴

x[[2]]
x[2]  # sublist : key와 value 같이 나옴


a = c(1, 2, 3, 4, 5)
b = c(T, F, T, T, F, T)
c = data.frame(name = c('aaa', 'bbb', 'ccc'),
               age = c(23, 41, 39))

var_list = list(v1=a, v2=b, v3=c)
var_list

# 변수명 출력
names(var_list)

# 변수명 바꾸기
names(var_list)[3] = 'df_1'
names(var_list)

names(var_list) = c('item1', 'item2', 'item3')
names(var_list)

# 구조 요소 확인인
length(var_list)
str(var_list)

