#-------------------------
#     데이터 탐색
#-------------------------


# View() : 데이터프레임형태로 데이터를 조회하고 정렬 및 검색
View(iris)


# subset(x, 조건식, select) : 특정 조건에 만족하는 데이터 출력


# 별도의$ 표시없이 커럼명(열이름)으로만 접근 가능 
# attach(데이터프레임형식) 만듬
# detach(데이터프레임형식) 헤제

#longley 데이터프레임 구조 확인
str(longley)
longley

# [행, 열]
colnames(longley)
longley[longley$GNP>200 & longley$Population >= 109 & longley$Year > 1960,]

attach(longley)
sum(GNP + GNP.deflator + Unemployed + Population)
sum
str(longley)

detach(longley)

# 정렬 : ordered

# 그룹함수 : 집계함수 aggregate()

# lapply 
# sapply() :  vector
# apply() : 행렬의 행또는 열방향으로 특정 함수를 적용
# apply(행렬, 방향, 함수)
# 방향(축 : 1(행), 2(열)
sum(1:10)

a = matrix(1:9, ncol=3)
a

b = matrix(1:9, ncol=3, by=T) #혹은 by row
b

# a행렬의 핸단위 합계
apply(a,1, sum)

# a행렬의 열단위 평균
apply(a,2, mean)


# iris 데이터 각 컬럼의 합을 계산
str(iris)
apply(iris[,1:4], 2, sum)


colSums(iris[1:4])
rowSums(iris[1:4])


colMeans(iris[1:4])
rowMeans(iris[1:4])



# lapply(data, 함수) : data - 벡터 또는 리스트 반환
# 결과값도 list로 반환된다


#숫자 벡터(1, 2, 3)의 각 요소를 2배한 결과를 추출 


result = lapply(1:3, function(x){x*2})
result

result[[1]]

#list를 vector로 casting
unlist(result)

x = list(a=1:3, b=4:6)
x

h = matrix(1:9, nrow=3)
h
lapply(h, mean)
lapply(x, mean)


# dataFrame에도 lapply 사용가능
str(iris)
lapply(iris[,1:4], mean) # list로 출력

colMeans(iris[,1:4])     # vector로 출력

# 데이터프레임을 처리한 결과를 리스트로 덛게되면, 그 리스트를 다시 
# 데이터프레임으로 변환하는 과정을 겨쳐야 한다
# step1. unlist()를 통해 list를 vector로 변환
# step2. matrix()를 탱해 벡터를 행렬로변환
# step3. as.data.frame() 행렬을 데이터프레임으로 변환
# 변환할 떄 컬럼명 사라짐
# names()으로 변수명을 얻어와서 생성된 데이터프레임에 이름으로 부여해줘야 함


# 1 벡터로 
unlist(lapply(iris[,1:4], mean))
str(unlist(lapply(iris[,1:4], mean)))

# 2 행렬로
matrix(unlist(lapply(iris[,1:4], mean)), ncol=4, byrow=T)

# 3 dataframe ( not name )
df = as.data.frame(matrix(unlist(lapply(iris[,1:4], mean)), ncol=4, byrow=T))
df


# 3 dataframe ( name )
names(df) = names(iris[,1:4])
df

#---------------------------------------------------------------
# do.call(호출할 함수, 파라미터)
# list로 나온 결과 dataframe으로 반환
# unlist()로 나온 데이터 손실됨
# 해결

# 공부하지 않아도 됨. 쓰지않음
xx = data.frame(do.call(cbind, lapply(iris[,1:4], mean)))
xx

# sapply() : lapply()와 유사하지만 리스트대신 (행렬,벡터) 등으로 결과 반환
lapply(iris[,1:4], mean)

sapply(iris[,1:4], sum)


## 데이터프레임으로 변환 : 행렬 => 데이터프레임
#t()전치행렬

as.data.frame(t(sapply(iris[,1:4], mean)))

str(iris)

sapply(iris, class)

# Q iris 데이터셋중 각 값이 3보다 큰지를 판단
y = sapply(iris[,1:4], function(x){x>3})
head(y)
class(y)

data()


#--------------------------------------------------------

install.packages("gapminder")
library(gapminder)

# 전체 데이터프레임을 화면에 표시
View(gapminder)

# 데이터 구조 확인
str(gapminder)

# 분석을 효율적으로 수행하기 위해 데이터프레임으로 변환
gapminder = as.data.frame(gapminder)
str(gapminder)

# 샘풀과 속성 추출
# 각 나라의 기대 수명 확인
# 데이터 프레임에서 샘풀은 행으로 속성은 열로 표현
gapminder[, c('country','lifeExp')]


# 각 나라의 기대수명을 추출하되, 분석년도도 함계추출
gapminder[, c('country', 'year','lifeExp')]


# 데이터 많음으로 샘플 추출
gapminder[1:15,]


# Croatia(크로아티아)에 대한 정보만 추출
gapminder[gapminder$country=='Croatia', ]


# Croatia의 인구만 추출
gapminder[gapminder$country=='Croatia', 'pop']

gapminder %>% filter(country =='Croatia') %>% select('pop')

# Croatia의 인구와 기대수명
x = gapminder[gapminder$country=='Croatia', c('pop', 'lifeExp')]
str(x)
gapminder %>% filter(country =='Croatia') %>% select(pop,lifeExp)


# Croatia의 1990년 이후의 기대수명과 인구 추출
x = gapminder[gapminder$country=='Croatia' & gapminder$year > 1990, c('pop', 'lifeExp', 'year')]
x

gapminder %>% filter(country=='Croatia' & year > 1990) %>% select(pop)

# Croatia의 인구와 기대수명의 평균을 추출
x = gapminder[gapminder$country=='Croatia', c('pop', 'lifeExp')]
x = apply(x, 2,mean)
str(x)
sapply(x, mean)
str(x)

z = gapminder %>% filter(country=='Croatia') %>% select(pop,lifeExp) 
# %>% apply(pop,lifeExp, 2, sum)
z = apply(z,2,mean)
z

# Q 대한민국 인구의 최대값과 해당 연도를 추출하시오
#   Korea, Rep

x = max(gapminder[gapminder$country=='Korea, Rep.', 'pop'])
gapminder[gapminder$pop==x, c('pop','year')]



z = gapminder %>% filter(country=='Korea, Rep.') %>% select(pop) %>% max()
z 
gapminder %>% filter(country=='Korea, Rep.') %>% filter(pop==z) %>% select(pop, year)



# %>%
y = gapminder %>% filter(country == 'Korea, Rep.') %>% select(pop) %>% max()
gapminder %>% filter(country == 'Korea, Rep.') %>% filter(pop == y)


# Q 2007년 아시아 대륙의 인구 총합을 추출
#   Asia
sum(gapminder[gapminder$continent=='Asia' & gapminder$year == 2007, 'pop'])

#*****
gapminder %>% filter(year == 2007 & continent == 'Asia') %>% group_by(year) %>%
  summarize(year, country, pop_sum = sum(pop))

?summarize
#*****
#*

z = gapminder %>% filter(year == 2007 & continent == 'Asia') %>% select(year, pop)
z


#------------------------------------
#         **  dplyr  **
#------------------------------------
install.packages("dplyr")
library(dplyr)

#열단위 출력
select(gapminder, country, year, lifeExp)


#행단위 출력
filter(gapminder, country == 'Croatia')


#행/열 단위 연산, summarize()
# 인구의 평균
summarize(gapminder, avg_pop = mean(pop))


#대류별 인구의 평균 추출 group_by(에이터셋, 묶으려는 속성)
summarize(group_by(gapminder, continent), pop_avg = mean(pop))
gapminder %>% group_by(continent, country) %>% summarize(gapminder, pop_avg=mean(pop))


# 대륙과 나라별 인구의 평균을 추출
summarize(group_by(gapminder, continent, country), pop_avg = mean(pop))


gapminder %>% group_by(continent, country) %>% summarize(pop_avg=mean(pop))

#summarize(k, pop_avg=mean(pop))



## 크로아티아의 기대수명의 평균
x = filter(gapminder, country == 'Croatia')
x

y = select(x, country, year, lifeExp)
y

result = sapply(y[,c('lifeExp', 'year')], mean)
result

#*##################################################

gapminder %>% filter(country == 'Croatia') %>% summarize(country, year ,life_mean = mean(lifeExp))


temp1 = filter(gapminder, country == 'Croatia')
temp1
temp2 = select(temp1, lifeExp)
temp2
temp3 = apply(temp2, 2, mean)
temp2

# 대한민국 , 중국, 일본 세 나라의 1인당 국내 총생산과 기대 수명을 출력
gapminder %>% filter(country == 'Korea, Rep.' | country == 'China' | country == 'Japan') %>% select(country, gdpPercap, year, lifeExp)


# 아프리카 대륙의 총 인구가 유럽의 총인구보다 많았던 해를 추출
s1 = gapminder %>% filter(continent == 'Africa') %>% group_by(year) %>% summarize(s = sum(pop))
s1
s2 = gapminder %>% filter(continent == 'Europe') %>% group_by(year) %>% summarize(s = sum(pop))
s2

s1$s > s2$s
s1[s1$s > s2$s, 'year']




# 페키지 설이 : install.packages("페키지명")
# 패키지 로딩 : library(패키지명)
# 페키지 제거 : remove.packages("패키지명")



#------------------------------------------------------------------------------
#                                데이터 증제
#------------------------------------------------------------------------------
# 데이터 정제 : 결측값과 이상치값 처리
# 결측값 : 통계에서 누락된 값
# 보간법 : 결측값을 다른 값으로 대체하거나 삭제하는 방법
# is.na() : NA 결측 값 찾는다 TRUE or FALSE 반환
# na.omit() : NA결측값 제거
# 함수의 속성값 : na.rm = T, 계산시 NA 제외함

str(airquality)
head(is.na(airquality))

# 범주형 데이터의 건수를 확인하는 함수 table()
table(is.na(airquality))


table(is.na(airquality$Ozone))

#Temp의 평균
mean(airquality$Temp)

#Ozone 평균
mean(airquality$Ozone)

#Ozone에서 결측값이 없는 값만 추출
air_narm = airquality[!is.na(airquality$Ozone),]
air_narm


# 결측값을 뺀 데이터셋을 이용해 Ozone의 평균
mean(air_narm$Ozone)

# na.omit()
air_narm2 = na.omit(airquality)
mean(air_narm2$Ozone) # 데이터 손실 

# 함수 속성 na.rm
mean(airquality$Ozone, na.rm = T)
 

# 이상치값 : 다른 관측과 달리 범위에서 벗어난 값

p = data.frame(name = c('aaa','bbb','ccc','ddd','eee'),
               age = c(22, 20, 31, 38, 29),
               gender = factor(c('M','F','M','K','F')),
               blood = factor(c('A','O','B','AB','C')))

p

# 성별의 이상값을 제거한 후 새로운 데이터 프레임 생성
p1 = p[p$gender=='M' | p$gender=='F',]
p1

#성별과 혈액형에 이상값을 제거한 후새로운 데이터프레임을 생성
#[행조건, 열조건]
#[(조건식1)&(조건식2), ]
p2 = p[(p$gender=='M' | p$gender=='F') & 
       (p$blood=='A' | p$blood=='B' | p$blood=='O' | p$blood=='AB') ,]
p2


p3 = data.frame(name = c('aaa','bbb','ccc','ddd','eee'),
                age = c(22, 20, 31, 38, 29),
                gender = c(1, 2, 1, 3, 2),
                blood = c(1, 2, 3, 4, 5))

p3


#p3 데이터셋에 이상치를 찾아 NA로 대체함
p3$gender = ifelse(p3$gender< 1 | p3$gender > 2, NA, p3$gender)
p3$blood = ifelse(p3$blood < 1 | p3$blood > 4, NA, p3$gender)

p3



boxplot(airquality[,c(1:4)])
boxplot(airquality[, 1])$stats









