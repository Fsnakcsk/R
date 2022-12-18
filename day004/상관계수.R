#--------------------------------------------------------------------
#                               상관분석
#--------------------------------------------------------------------
# 1. 변수 간의 관련성을 분석하는 방법으로 하나의 변수가 다른 변수와 관련성이 있는지를 분석
#    회귀분석전에 변수간에 관련겅을 분석하는 용도로 사용함

# 2. 가설검정전에 수행한다
#    상관계수 : 피어슨 강관계수(일반적으로 많이사용함)와 스피어맨 상관계수
#    상관계수 r의 변하는 정도를 (-1 ~ 1) 사이의 값으로 나타낸다.
#--------------------------------------------------------------------

# 1. 산점도(scatter plot)
#   - 두 양적 자료간에 관계를 살펴보기 위한 시각화
windows()
plot(cars$speed, cars$dist)


# 2. 상관계수
#   - 피어스 상관계수  
#   - 모수적 Pearson : 모집단위 정규분포를 갖는다는 가정하에 분석(양적 상관관계)
#   - 비모수적 Kendall, Spearman : 모집단 분포에 대한 가정없이 분석(질적, 범주형        #     순서자료)

# 상관관계 함수 cor(x, y, method='방법')
cor(cars$speed, cars$dist, method = 'pearson') #양적 자료 pearson


# 3.상관 분석
# 두 양적 자료 간의 관련성(직선의 관계=성형의 관계)가 있는 지를 검정하는 통계분석방법
# 검정하는 통계분석방법
# 귀무가설 : 관련성이 없다
# 귀모가설 : 관련성이 있다
cor.test(cars$speed, cars$dist, method = 'pearson')

# 끝
#----------------------------------------------------------------------------------

# pairs(데이터프레임 자료형) - 산점 행렬도 : 자료가많을 때
str(iris)

plot(iris[,-5])
pairs(iris[,1:4])


# 상관계수 행렬
## 여러 개의 양적 자료간에 상관계수를 구하는것
cor(iris[,1:4])

#--------------------------------------------------------------------

# rcorr() : 여러 개의 양적 자료에 대한 상관계수와 유의확률을 한번에 주해주는 함수,
#           단, 데이터의 형태는 행렬(matrix)이어야 한다

?rcorr
install.packages("Hmisc")
library(Hmisc)

rcorr(as.matrix(iris[,1:4], type = 'pearson'))

# 상관계수의 시각화

result = cor(iris[,1:4])

#페키지 설치
install.packages("corrplot")
library(corrplot)

?rorrplot
corrplot(result, method='circle')
corrplot(result, method='number')
corrplot(result, method='ellipse')      
?corrplot

corrplot(result, type='upper')  
corrplot(result, type='lower')  


# 단순회귀분석
result <- lm(cars$dist ~ cars$speed, data=cars)
result
summary(result)

# y = ax + b
# y = 중속변수
# x = 독립변수


# F-statistic: 89.57  = 타당성 89.57%의 타당성 잘 만들었다 해석됨
# p-value: 1.49e-12   = 의미가 있다
# Adjusted R-squared: = 0.6438 성확성 64.38% 정확도 뛰어나다 할 수 없음


# Coefficients 



# 회귀반적식
# dist(제동거리) = 3.9324 * speed -17.5791
View(cars)

