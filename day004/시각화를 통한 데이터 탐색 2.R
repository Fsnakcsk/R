# 웹 사이트에 공개된 데이터섹을 이용한 분석
tips = read.csv("https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv")

#데이터 구조
str(tips)
tips

# 속성의 의미 파악
head(tips, 10)
tail(tips, 10)

# 기초 통계분석
summary(tips)


# 동석자수(size) 분포
library(dplyr)
library(ggplot2)
tips %>% ggplot(aes(size)) + geom_histogram() 


# 결제 금액과 팁은 관련성이 있을까?
# 연관이 있는지 없는지 산점도로 함
tips %>% ggplot(aes(total_bill, tip)) + geom_point()

# 요일정보로 추가
tips %>% ggplot(aes(total_bill, tip)) + geom_point(aes(col=day))

# 성별에 따라 볼릿기호를 변경
tips %>% ggplot(aes(total_bill, tip)) + geom_point(aes(col=day, pch=sex))      

 


  