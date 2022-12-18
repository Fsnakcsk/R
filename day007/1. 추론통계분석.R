purifier_df <- read.table(file="clipboard", header=T)
purifier_df <- read.table(file="C:/k_digital/source/R_source/day007/purifier.csv", header=T, sep=',')
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
# --------------- 분석 가설(가설검정) -------------
# 정수기 AS기사를 채용하려고 하는데 몇명의 기사를 채용해야할까?



# 중수기 대여수가 1대 증가할 때마다 AS쇼요시간이 얼마나 늘어날까?



# 노후 정수기가 1대 늘어날때마다 AS 쇼요시간이 얼마나 늘어날까?



# 정수기 총 대여수와 노후된 정수기 대여수 중 어떤 것이 AS쇼요시간에 더 영향을 줄까?



# 이번달 정수기의 총 대여수와 노후된 정수기 대여수를 알 수 있을까?



# 다음달 AS쇼요되는 시간을 예측할 수 있을까?



# cars
# speed : 차속도(mi/h), dist : 제동거리(feet)
str(cars)

#자동차의 속도와 제동거리 휘귀분석
## lm(fomula, data)


#----------------------------------------------------------
#-------------------      휘귀분석      -------------------

## 어떤 형상을 발생시키는 원인(돌깁변수)들이 결과(종속변수)
## 얼마나 영향을 미치는가? 알아보는 통계 분석 및 예측 방법















