# 평균(mean)


# 중앙값(median)

#사분위수(quantile(data, 백분율값))
# 중앙과과 평균값 같으면 인사분위수 구함
# fivenum() : 다솟수치요약(최소값, 1사분위수, 중아값, 3사분위수,최대값)
# summary() : rlchxhdrPqnstjr(요약보고서)
fivenum(1:11)
summary(1:11)
# fivenum과 summary의 결과는 데이터가 홀수개일 떄 동일하지만 짝수개일 때
# 다른 결과를 보인다
fivenum(1:4)
summary(1:4)


#사분위수 식
# 1Q = 1+(4-1) x (1/4), 

#summary
# 30 = 1 + (4-1)x (3/4)

## iQR = 3사분위수 - 1사분위수
IQR(1:10)
quantile(1:10)

 
# range() : min, max
# 범위, diff(range())
diff(range(1:10))
range(1:10)


#---------------------------------------------------------------
## 범주형 데이터 : 파이차트와 막대그래프
# 최빈값 : 빈도가 가장 많은 것 mode() R에서 존재하지 않다
# table(범주형대이터)
# which.max(table()) 가장 큰값을 찾아줌

bloodType = c('A','B','A','B','AB','O','A','O','B','A','O','O','B','O','A','AB','B','O','A','A','B')
bloodType
table(bloodType)


#which, #which.max, #which.mim
which.max(table(bloodType))

# 위에서 얻은 인덱스를 이용해서 이름을 추출
names(table(bloodType))[1]

# 혈액형 데이터의 수
length(bloodType)

result <- table(bloodType)
result

#범주를 확인하면 names()사용
names(result)
sum(result)

# addmargins() : 합계를 붙여서 표시하는 기능
addmargins(result)
