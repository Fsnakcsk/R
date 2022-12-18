# 데이터 탐색
# 기술통계량 : 데이터를 요약해서 대표값

# 식당의 배달시간을 측정한 값을 이용해서 기통통계를 파악

storeA = c(20, 21, 23, 22, 26, 28, 35, 35, 41, 42, 43, 45, 44, 45, 
           46, 47, 47, 46, 47, 58, 58, 59, 60, 56, 57, 57, 80)

storeB = c(5, 6, 11, 13, 15, 16, 20, 20, 21, 23, 22, 27, 27, 30, 30, 
           32, 36, 37, 37, 40, 40, 43, 44, 45, 51, 54, 70, 600)

storeC = c(5, 5, 5, 12, 10, 11, 20, 20, 20, 20, 20, 21, 20, 30, 32,
           31, 31, 31, 36, 40, 40, 51, 61, 51, 61, 61, 70)

# 평균 : 산술평균

## A 식당의 평균 배달시간 산출
mean(storeA) #해석 : A식당은 주문 후 평균 44분 정도 후에 도착한다



# B식당의 평균 배달시간 순출
mean(storeB) #해석 : B식당은 주문 후 평균 50분 정도 후에 도착한다

# 600분을 뺴고 평균을 산출
storeB[storeB < 600]
mean(storeB[storeB < 600])

#--------------------------------------------------

# 그렇다 해서 B가 더 빠르다고 할 수 없고, 더 개관적으로 비교해야 함
# 중간값(median)
median(storeA)
median(storeB)
# 해석 : A식당 배달시간이 45분 이하인 경우 50%
# 해석 : B식당 배달시간이 30분 이하인 경우 50%

#--------------------------------------------------

# 사분인수 : 전체데이터 상태로 - quantile
# A 식당의 사분인수
quantile(storeA) # 20.0 35.0 45.0 56.5 80.0 

# B 식당의 사분인수
quantile(storeB)


#결과를 통해 B식당이 조금 더 빠르다는 걸 알 수 있다

#--------------------------------------------------
# 하지만 수치를 가지고 알기 힘들고 시각화를 통해서 보여주는 게 더 좋다

##fivenum() : 다섯개의 수치 요약을 추출
fivenum(storeA) # 20.0 35.0 45.0 56.5 80.0

## summary() : 수치데이터의 기초통계량을 한번에 파악
summary(storeA) # 20.0    35.0    45.0    44.0(mean)    56.5    80.0 

#--------------------------------------------------
# boxplot() : 상자수염그래프
boxplot(storeB)

storeB = storeB[storeB < 600]
boxplot(storeB)

## A, B 식당의 배달시간
boxplot(storeA, storeB, names= c('A식당', 'B식당'))

#--------------------------------------------------
boxplot(storeA, storeB, names= c('A식당', 'B식당'))
points(c(mean(storeA), mean(storeB)), col='red', pch=15, cex=1)

#끝-----------------끝-----------------끝
boxplot(storeA, storeB, storeC, names= c('A식당', 'B식당', 'C식당'))
points(c(mean(storeA), mean(storeB), mean(storeC)), col='red', pch=15, cex=1)

mean(storeB)
mean(storeC)
summary(storeB)
summary(storeC)

# B, C 식당의 배달시간을 분석
storeB
mean(storeB)
quantile(storeB)

storeC
mean(storeC)
quantile(storeC)


boxplot(storeB, storeC, name = c('B식당', 'C식당당'))

# 같으니까 히스토램으로 구분하기
#------------------------------------------------
#                   히스토그램
#------------------------------------------------
# 연속된 수를 그래프로 표현할 때 구간을 나누고 , 구간의 빈도수를 이용 비교

# 막대그래프 : 이산형 데이터, barplot()
# 히스토그램 : 연속형 데이터, 박대그래프과 유사, (그래도 다름)
# hist(데이터, 차트제목, x축제목 , y축제목)
m = matrix(c(1, 2), ncol=2, byrow = T)
layout(mat = m)
hist(storeB, main='B식당 배달시간 분포', xlab='배달시간 구간', ylab='건수')
hist(storeC, main='C식당 배달시간 분포', xlab='배달시간 구간', ylab='건수')
# B 식당이 조금 더 안정적인 것을 확인할 수 있다.

# scatter plot : 산점도(산포도)
plot(cars$speed, cars$dist, type='l')

























        