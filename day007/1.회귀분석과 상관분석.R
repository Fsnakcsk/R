purifier_df <- read.table(file="clipboard", header=T)
purifier_df <- read.table(file="purifier.csv", header=T, sep=',')
purifier_df


#구조확인
str(purifier_df)

# 기술통계분석 : 수치데이터로 이루어진 컬럼의 통계값 확인
summary(purifier_df)

attach(purifier_df)

# -------------  상관분석  -------------
## 정수기 총 대여수와 AS소요시간의 관계를 분석
names(purifier_df)
plot(purifier,as_time, xlab='총정수기대여수', ylab='AS시간')
plot(old_purifier, as_time, xlab='노후정수기대여수수', ylab='AS시간')

#----------------------------------------

# 상관 계수 산출 함
# 관계가 있지만 어느정도 있는지 더 확인
# 총 정수기 대여수와 AS소요시간 과의 상관계수 추출
cor(purifier, as_time)

#노후된 정수기 대여수와 AS쇼요시간과의 상관계수
cor(old_purifier, as_time)


#                   스토리 만들기
# ---------------  분석 가설(가설검정)  -------------
# 정수기 AS기사를 채용하려고 하는데 몇명의 기사를 채용해야할까?
# 중수기 대여수가 1대 증가할 때마다 AS쇼요시간이 얼마나 늘어날까?
# 노후 정수기가 1대 늘어날때마다 AS 쇼요시간이 얼마나 늘어날까?
# 정수기 총 대여수와 노후된 정수기 대여수 중 어떤 것이 AS쇼요시간에 더 영향을 줄까?
# 이번달 정수기의 총 대여수와 노후된 정수기 대여수를 알 수 있을까?
# 다음달 AS쇼요되는 시간을 예측할 수 있을까?

#----------------------------------------------------------
#-----------------      휘귀분석       -------------------

## 어떤 형상을 발생시키는 원인(돌깁변수)들이 결과(종속변수)
## 얼마나 영향을 미치는가? 알아보는 통계 분석 및 예측 방법
#----------------------------------------------------

# 휘귀분석 연숩
# cars
# speed : 차속도(mi/h), dist : 제동거리(feet)
str(cars)

#자동차의 속도와 제동거리 휘귀분석
## lm(fomula, data)
## formula : 종속변수 ~ 독립변수
## 속도 = 제동거리 +타이어면적 + 자동차무게

result <- lm(dist ~ speed, cars)
result

# dist = 017.579기울기 + 3.932(절편) * x(속도)

summary(result)
#Residuals: 잔차
#Coefficients: 상관계수

#결정계수 설명계수	
#Multiple R-squared:  0.6511, 휘귀모드의 최적의 베스트 65%의 결정력 최고 이만큼만 나옴
#Adjusted R-squared:  0.6438, 
#F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12 전체 모델의 데한 결정

#회귀모젤 방정식의 기울기와 절편 조회
coef(result)


#신뢰구간별 기울기와 절편 조회
confint(result)


#잔차의 제곱합 : 모젤 평가시 - 작을 수록 좋은 모델이다
deviance(result)


#회귀분석을 통해 사용된 독립변수를 가지고 예측값
fitted(result)


# 실제 종속변수 값과의 차이(잔차)
residuals(result)


# 결과값을 이용한 시각화 

plot(cars$speed, cars$dist, main = '제동거리와 속도', xlab='speed', ylab='dist')

#회귀선
abline(result, col='red')

## 도출된 회귀모델의 평가를 위한 시각화
par(mfrow=c(2,2))
plot(result)


#------
# 예측 : 새로운 독립변수를 회귀모델 방정식에 대입해 종속변수를 예측
## 속도가 70일때 , 제동거리는? 257.6609

# predict(결과object, 에측할 독립변수를 담은 데이터프레임, interval(구간), level(구간추정))
#: 회귀모델로통해 얻어온 결과 들어옴
# predict(object, data예측값, interval(생락하면 점으로), level(불확실성을 위한 구간추정))
# predict 오차까지 가만함
## 50, 60, 70, 80, 90, 100 속도일떄 제동거리를 예측해보자

lm_result <- lm(dist~speed, cars)
lm_result

speed <- c(50, 60, 70, 80, 90, 100)
input <- data.frame(speed) #필드면 spped 같아야함
input


# 예측 : 점추정
output <- predict(lm_result, input)
output

#결합 : rbind, cbind
cbind(input, output)


#구간추정 예측
#모델계수에 불확실성을 감안한 구간추정, 신뢰구간 95%
predict_dist <- predict(lm_result, input, interval = 'confidence', level=0.95)
predict_dist

cbind(input, predict_dist)


# 모델계수에 불확실성과 대한 오차를 감안한 구간추정 예측/신뢰구간95%
predict_dist <- predict(lm_result, input, interval = 'prediction', level=0.95)
predict_dist

cbind(input, predict_dist)


# AS 기사는 명명이 적당할까?
# purified : 전월 정수기 총 대여수
# old_purifier : 전월 10년 이상 노후 정수기 총 대여수
# as.time : 당월 AS에 소요된 시간

summary(purifier_df)
purifier_df

View(purifier_df)
# 관련성 깊은지 확인 
# 전월 정수기 총 대여수와 10년 이상 노후도니 정수의 대여수
cor(purifier_df$purifier, purifier_df$old_purifier)

# 10년 미만 정수기 대여수 = 총 대여수 - 10년 이상 대여수
cor((purifier_df$purifier-purifier_df$old_purifier), purifier_df$old_purifier)


# 파생변수 생성 : 10년 미만 정수기 대여수
purifier_df$new_purifier <- purifier_df$purifier-purifier_df$old_purifier
str(purifier_df$new_purifier)


#회귀분석
#독립변수 : 전월 기준 10년 미만 정수기 대여수, 전월 기준 10이상 노후 정수기
#종속변수 : 당월 기준 AS에 쇼요된 시간
lm_result <- lm(as_time ~ new_purifier + old_purifier, purifier_df)
lm_result

#회귀분석 요약 보고서
summary(lm_result)

# 회귀모델방적식 : AS시간 = 
+ 0.2398*(10년 이상)
# AS시간은 10년 미만 정수기는 1대당0.088 1시간이 소요, 10년 이상 정수기 1대당 0.2398시간소요


## 예측 : 월말 최종 대여수가 300,000대이고, 그중에 10녀ㅑㄴ 이상 노후 정수기가70,000
## 로 집계되엇다면 

input_predict <- data.frame(new_purifier=230000, old_purifier=70000)
input_predict

# 예측값 저장
predict_astime <- predict(lm_result, input_predict)
predict_astime


# AS 기사 1명이 한 달간 처리하는 AS시간 = 8시간 * 20일
predict_astime/160


## 233.7693명 AS기사가 필요


## 구간추정/신뢰구간 95%
predict_astime <- predict(lm_result, input_predict, interval='confidence',level=0.95)
predict_astime


# 실습데이터셋 : women
## 미국 30대 여성들의 신장과 체중을 가지고 있는 데이터 셋
# 상관분석과 휘귀분석
str(women)

#정규분포 따르냐
shapiro.test(women$weight) # 정규분포를 따르다
shapiro.test(women$height) # 정규분포를 따르다


# t.text 큰지 작은지 다른지 확인


plot(women$height, women$weight)
lm_result <- lm(women$weight ~ women$height)
summary(lm_result)
# weight = -87.52 + 3.45 X height
## 귀무가설 : 미국 성인 여성의 몸무게는 정규분포를 따른다.
## 대립가설 : 정규분포를 따르지 않는다

a = c(70, 80, 90)
b = data.frame(a)
b
predict(lm_result, b)


#-----------------------------------------------------------------------












