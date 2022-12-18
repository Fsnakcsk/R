# cars : 자동차의 속도와 제동거리
plot(cars)

#회귀분석
# 인과관계 있으면 얼마나 있느냐 분석
?lm
summary(lm(cars$speed ~ cars$dist))

#-----------------------------------------
# 건전지의 수명이 1000시간일 때 
x <- c(980, 1008, 968, 1032, 1012, 1002, 996, 1017, 1009)
## 귀무가설 : 건전지의 수명시간은 1000시간이다
## 대립가설 : 건전지의 수명시간은 1000시간이 아니다


# 모든 가설 중규분호 따라야함
# 데이트의 개수가 적을 때는 정규분포인지를 검정 : Shapiro-wilk 검정
# 귀무가설 : 정규분포를 따른다.
# 대립가설 : 정규분포를 따르지 않는다.
shapiro.test(x) 
# p-value=0.8002는 0.05보다 크프로 귀무가설을 태책한다. 
# 따르서 정규분포이다

?t.test
 t.test(x, ,mu=1000, alternative = 'two.sided')
# alternative에 적는 것은 대립가설
#mu=평균
# 결과 : 귀목가설 설립되지않다 주장하는 사람의 문제다


#------------------------------------------------------------------------
# Q. 어떤 학급의 수학 평균성적은 55점이다. 0교시 수업을 시행하고 나서 
#    학생들의 시험성적은 다음과 같다
score <- c(58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39)

# 정규분포 따르냐 확인, 0.05보다 크면 귀무가설
shapiro.test(score)


# 0교시 수업을 시행한 후 학생들의 성적을 올랐다고 할수 있을까?
t.test(score, mu = 55, alternative = 'greater')

# 귀무가설 : 성적이 오르지 않았다. #정답# 귀무
# 대립가설 : 성적이 올랐다


#-------------------------------------------------------------------------

# A학원은 성적향상에 도움이 될까?
jumsu <- read.csv('score.csv', header=F)
jumsu

# Shapiro-wilk
# 귀모가설 : 정규분포를 따른다
# 대립가설 : 정규분포를 따르지 않는다
shapiro.test(jumsu)


# 학원을 다니기 전의 성적
before <- jumsu$V1


# 학원을 수강한 후 성적
after <- jumsu$V2

## boxplot
boxplot(before, after, names=c('수강전', '수강후'))

# 두 집단을 피교하려면 두 집단의 평균을 가지고 함
# 대응 t검정

# 첫번쨰 집단 평균
mean(before)
# 두번째 집단 평균
mean(after)


# 정규분포 여부 검정
shapiro.test(before)
shapiro.test(after)
# 귀무가설 : 정규분포 따르다 **
# 대립가설 : 정규분포 따르지 않는다

#--------------------------------------------------------
#독립표본 - 서로 독립된 두집단으로부터 샘플을 추출
# t.test(x, y, paired=FALSE) 

# var.equal=T 두집단의 분산이 같다
# var.equal=F 두집단의 분산이 다르다

#대응표본 - 한 집단으로부터 두번 반복해서 샘풀을 추출
# t.test(x, y, paired=TRUE var.equal, alternative='two.sided)  
#--------------------------------------------------------

# alternative : 양측검정과 단측검정 설정
# 양측검정 - 단순히 두집단이 다르다라는 것만 확인하는 것
# 단측검정 - 큰지 작은지까지 확인하는 것(less작다, greater크다)

var.test(before, after)
# 귀무거설 :분산이 같다
# 대립가설 : 분산이 다르다

t.test(before, after, paired = T, alternative = 'less')
# 귀무가설 : 성적이 오르지 않았다
# 대립가설 : 성적이 올랐다

# A학원은 성적향상에 도움이 될까?


#--------------------------------------------------------------------------
# 일원분산분석(one-way ANOVA) == 분산분석
# 3개 이상의 집단간의 차이를 검정하는 분석기법
# 단, t-검정과 달리 ANOVA 검정은 집단간의 차이가 존재하는지에 대한 여부만 확인
# 귀무가설 : 3개의 집단의 평균이 같다.
# 대립가설 : 3개의 집단의 평균이 같이 않다.
# 귀무가설 기각이 될때 *사후검정* 함

# 설치된 패키지 정보확인
library(help='MASS')
library(MASS)
?anorexia

attach(anorexia)
# 거식증 환자의 몸무게 변화 평균값이 세가지 치료방법(Contruol/CBT/FT)에
# 상관없이 동일한지를 검정(차이가 있냐 없냐)

# aov(중속변수, ~ 독립변수(그룹변수), data셋)
# 분산분석시 독립변수를 factor형으로 변환해야 한다.
View(anorexia)

change <- Postwt - Prewt # 중속변수
aov_result <- aov(change ~ Treat)
summary(aov_result)

boxplot(change ~ Treat, col=rainbow(3))

## 사후검정
TukeyHSD(aov_result)


plot(TukeyHSD(aov_result))
