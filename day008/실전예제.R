# 한국인의 생활실태를 담은 데이터 셋

#------------------------------------------------
# 1. 필요 패키지 설치 및 불러오기
#------------------------------------------------
# SPSS, SAS, STATA 전통적인 통계전용 프로그램 -- 
# foreign 패키지 
install.packages("https://cran.r-project.org/src/contrib/Archive/foreign/foreign_0.8-71.tar.gz", repos = NULL, type="source")
library(foreign)
library(dplyr)
library(ggplot2)

install.packages('readxl') # 엑셀 파일 불러오기 위해서
library(readxl)

#------------------------------------------------
#2. 데이터 불러오기
#------------------------------------------------
raw <- read.spss('Koweps_hpc10_2015_beta1.sav.part', to.data.frame = T) # list반환, 프레임으로 해야함
df <- raw
View(df)

#------------------------------------------------
#3. 데이터 탐색
#------------------------------------------------
str(df)


## 내용 확인
head(df)


## 차원 확인
dim(df)


## 수치형 데이터의 기초 통계량
summary(df)

#------------------------------------------------
# 4. 데이터 변형 ~ 변수 이름 변경하기
#------------------------------------------------
# rename(data, new = old)
df <- rename(df,
             gender = h10_g3,        # 성별
             birth = h10_g4,         # 태어난 년도
             marriage = h10_g10,     # 혼인 상태
             religion = h10_g11,     # 종료
             code_job = h10_eco9,    # 직업 코드
             income = p1002_8aq1,   # 급여
             code_region = h10_reg7) # 지역
str(df)

            
#------------------------------------------------
# 5. 탐색적 데이터 분석
#------------------------------------------------
# 분수를 검토하고 분석하기 좋은 형태로 전처리
# 분석에 사용할 변수들의 전처리
# 변수의 특정을 파악하고 이상치를 정제하고 필요에 따라 파생변수 생성
# 변수 간 관계 분석
# 분석에 사용할 변수들 간에 관계가 있는지 관계를 파악
# 가설 세우고 분석한 결과를 시각화 작업

# 성별 생일 혼인여부 종교 직업 급여 지역

welfare <- df[, c('gender','birth','marriage',
                  'religion','code_job','income','code_region')]

welfare
names(welfare)
head(welfare)

#----------------------
# 성별 전처리
# 성별이 무응답(9)일 경우, 이상치보고 NA로 변경하는 작업
table(welfare$gender)
class(welfare$gender)

# 결측값 측정
table(is.na(welfare$gender))


# 결측값 NA로 바꿈
welfare$gender <- ifelse(welfare$gender == 9, NA, welfare$gender)

#----------------------
# 성별대이터가 1일 경우 male, 2일 경우 female
welfare$gender <- ifelse(welfare$gender == 1, 'male', 'female')
table(welfare$gender)
welfare$gender <- as.factor(welfare$gender)
qplot(welfare$gender)


#--------------------------------------
# 6. 가설
#--------------------------------------

# 성별과 급여ㅑ에 관련성이 있는지
# 성별에 따른 급여의 차이는 얼마나 될까?
class(welfare$incomde)
summary(welfare$incomde)
qplot(welfare$income) + xlim(0, 1000)

##월급 전처리 : 0 or 9999 결측처리함
welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)
table(is.na(welfare$income))

### 성별에 따른 급여에 평균을 요약
x <- welfare %>%
  filter(!is.na(income)) %>% 
  group_by(gender) %>%
  summarise(mean_income = mean(income))
x


#qplot(x=gender, y=men_income, data=x, geom ="col")
ggplot(x, aes(x=gender, y=mean_income)) + geom_col()

#------------

# 나이에 따른 급여의 고나계를 분석해보고 싶다.
## 몇살때 급여를 가장 많이 받을까?
## 나이, 급여, 생일 : 1900 ~ 2014, 나이 = 2015 - 출생년도 + 1
class(welfare$birth)
summary(welfare$birth)
table(is.na(welfare$birth))
welfare$age <- 2015 - welfare$birth + 1
# 나이 통계량
summary(welfare$age)
qplot(welfare$age, col='red')

#나이와 월급의 요약

data <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_age = mean(income))
head(data)

ggplot(data, aes(x=age, y=mean_age)) + geom_line() + geom_smooth()

#------------
# 연령대별 급여의 차이
# 청년층(you)<=30, 중장년층(mid) <= 65, 66 < 노년층(old) 3개의 집단으로 -> 파생변수로

## mutate()
welfare <- welfare %>%
  mutate(ageGroup = ifelse(age <= 34, 'you', ifelse(age <= 65, 'mid', 'old')))
table(welfare$ageGroup)
qplot(welfare$ageGroup)

#---------------------------------
# 연령대별 급여의 요약
data <- welfare %>% 
  filter(!is.na(income)) %>%
  group_by(ageGroup) %>%
  summarise(mean_income = mean(income))
View(data)

data %>% ggplot(aes(x=ageGroup, y=mean_income)) + 
  geom_col(aes(fill = ageGroup)) +
  scale_x_discrete(limits = c('you', 'mid', 'old')) # x축 필드 순서 바꾸기

# 연령대와 성별에 따른 굽여의 차이를 요약
data <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageGroup, gender)%>%
  summarise(mean_income = mean(income))
data

ggplot(data, aes(x=ageGroup, y=mean_income, fill = gender)) +
  geom_col(position = 'dodge') +
  scale_x_discrete(limits = c('you', 'mid', 'old'))

#
data %>% ggplot(aes(x=ageGroup, y=mean_income)) + 
  geom_col(aes(fill = ageGroup)) +
  scale_x_discrete(limits = c('you', 'mid', 'old'))

# 연령대과 나이에 따른 급여 요악
data <- welfare %>% 
  filter(!is.na(income)) %>%
  group_by(age, gender) %>%
  summarise(mean_income = mean(income))
data


?ggplot

ggplot(data, aes(x=age, y=mean_income, col = gender)) + 
  geom_line() + scale_color_manual(values = c('red', 'blue'))

#-------------------------------------------------------------
# 직업별로 급여의 차이 날까?
# 어떤 직업군이 급여를 많이 받을까?
class(welfare$code_job)
table(welfare$code_job)

# sheet 엑셀의 몇번째 워크시트
# col_names 필드명 T
list_job <- read_excel('Koweps_Codebook.xlsx', sheet = 2, col_names = T)
View(list_job)

# 조인 **
# list_job있는 코드와 일치하는 welfare의 연결하라

?left_join
welfare <- left_join(welfare, list_job, id = 'code_job')
View(welfare)


### 직업별 급여에 차이를 분석하자
job_data <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))

head(job_data)


#급여가 많은 직업군 10개를 추출
top10 <- job_data %>%
  arrange(desc(mean_income)) %>%
  head(10)
top10
                                  #-는 역순으로
ggplot(top10, aes(x=reorder(job, -mean_income), y=mean_income)) +
  geom_col() + coord_flip() + ylim(0, 1000)

# 급여가 가장 적은 직업군 10개를 추출해서 시각화까지
bottom10 <- job_data %>% 
  arrange(mean_income)%>%
  head(10)
bottom10


# 셩별에 따라 선호하는 직업
View(job_cnt)
job_cnt <- welfare %>% 
  filter(!is.na(job) & gender == 'male') %>%
  count(job) %>%
  arrange(desc(n)) %>%
  head(10)
  
#  group_by(job) %>%
#  summarise(cnt = n()) %>%
#  arrange(desc(cnt)) %>%
#  head(10)
job_cnt

job_cnt %>% ggplot(aes(x=reorder(job, cnt), y=cnt, fill=job)) + 
  geom_col() + 
  coord_flip()


#--------------------------
# 종교가 있는 사람이 이혼을 덜 할까?
# 종교, 혼인상태
# 

table(welfare$religion)

# 전처리
welfare$religion <- ifelse(welfare$religion == 1, 'yes', 'no')
welfare$religion <- as.factor(welfare$religion)
qplot((welfare$religion))

#파생변수 만들기
welfare$md <- ifelse(welfare$marriage == 1, 'marriage', 
                     ifelse(welfare$marriage == 3, 'divorce', NA))
table(welfare$md)
table(is.na(welfare$md))

qplot(welfare$md)


xx <- welfare %>% 
  filter(!is.na(md)) %>%
  group_by(religion, md) %>%
  summarise(n = n()) %>%
  mutate(tot = sum(n), 
         pct = round(n/tot*100,1))
xx

# count() : 집단별 빈도를 구하는 함수
# 함수를 구현하면 ,mutate함수에서 하나로 통합해서 처리함
yy <- welfare %>%
  filter(!is.na(md)) %>%
  count(religion, md) %>%
  group_by(religion) %>%
  mutate(pct = round(n/sum(n)*100, 1))
yy

# 이혼추출 
divorce <- yy %>% filter(md == 'divorce') %>%
  select(religion, pct)
divorce

ggplot(divorce, aes(x=religion, y=pct, fill=religion)) + geom_col()





