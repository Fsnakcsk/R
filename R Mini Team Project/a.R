#-----------------------------------------------------------------
# 부산 관광객수
#-----------------------------------------------------------------

BS = read.table(file="product_chuy.csv", header=T, sep=',')
BS

BS$기준연월
BS$방문자.수
ggplot(BS, aes(x=BS$기준연월, y=BS$방문자.수)) + geom_col(fill=BS$기준연월)


#-----------------------------------------------------------------
#                          홍콩 : Setting
#-----------------------------------------------------------------

install.packages('readxl') # 엑셀 파일 불러오기 위해서

library(readxl)
library(dplyr)
library(ggplot2)
listHK <- read_excel('HongKong.xlsx', col_names = T)
listHK$year <- as.integer(listHK$year)
listHK$y_year <- as.integer(listHK$y_year)
listHK
HKgrowth <- listHK[ ,5:6]
HKgrowth <- head(HKgrowth,9)
listHK <- listHK[ ,1:4]


names(listHK) <- c('year', 'month','arrivals','growth')
names(HKgrowth) <- c('year','growth')
HK <- as.data.frame(listHK)


HKpersons <- 7413100  # 인구
HKdensity <- 7413100 / 1104  # 인구 밀집도


str(HK)
View(HK)
head(HK)
HK <- HK[-1,]
HK
#---------------------------------------------------------------
#                 홍콩 : 시간에따른 관광객 시각화
#---------------------------------------------------------------
HKmonth <- HK %>% group_by(month) %>% summarise(sum=sum(arrivals))
HKyear <- HK %>% group_by(year) %>% summarise(sum=sum(arrivals))

# 년도에 따른 관광객수
M <- max(HKyear$sum)
ggplot(HKyear, aes(year, sum, col='홍콩')) + geom_line(size=3) +
  scale_x_continuous(breaks = seq(2013,2021,by=1))

# 년월에 따른 관광객수
ggplot(HKmonth, aes(month, sum)) + geom_line(col='blue') +

# 전년대비 성장율율
ggplot(HKgrowth, aes(year, growth)) + geom_line(col='blue') + geom_point()

?scale_x_continuous
var(HK$date, HK$arrivals)
sd(HK$date,HK$arrivals)

#---------------------------------------------------------------
#                            상하이
#---------------------------------------------------------------
listSH <- read_excel('ShangHai.xlsx', col_names = T)
listSH$year <- as.integer(listSH$year)
listSH
SHgrowth <- listSH[ ,c(1,3)]
SH <- listSH[ ,1:2]
SH
SHgrowth

# 년도에 따른 관광객수
ggplot(SH, aes(year , arrivals,col='상하이')) + geom_line(, size=3) +
  scale_x_continuous(breaks = seq(2013,2021,by=1))

# 전년대비 승장율
ggplot(SHgrowth, aes(year,growth)) + geom_line(col='blue')

#-------------------------------------------------------------------------------

# 홍콩와 상하이의 전년대비 비교 (2013~2021)
ggplot(HKgrowth, aes(year, growth, col='홍콩')) + 
  geom_line(size=3) +
  scale_x_continuous(breaks = seq(2013,2021,by=1)) + geom_line(aes(x=SHgrowth$year, y=SHgrowth$growth, col='상하이'),size=3)

HK1 + geom_line(aes(x=SHgrowth$year, y=SHgrowth$growth, col='상하이'),size=3)



#--------------------------------------------------
#             부산 관광지 검색 순위
#--------------------------------------------------
# 2018 5706061
# 2019 7420956
# 2020 7505454
# 2021 8351677

BS <- data.frame(year = c(2018,2019,2020,2021),
                 rank = c(5706061, 7420956, 7505454, 8351677))

plot(BS$year, BS$rank)

cor.test(BS$year,BS$rank, method = 'pearson')


t.test()

t.test(score, mu = 55, alternative = 'greater')


#--------------------------------------------------

install.packages("ggwordcloud")
library(ggwordcloud)

a <- data.frame(name=c('謝謝','Thank you','Gracias','aaa','bbb'),
                nums=c(1009,500,30,50,1000))

ggplot(a, aes(label=name, size=nums, color=name)) + geom_text_wordcloud() +
  theme_minimal()                       

#----------------------------------------------------------------------------
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
install.packages("tidyverse")
install.packages("patchwork")
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(ggwordcloud)

library(tidyverse)
library(ggwordcloud) #词云包
library(patchwork)

library(dplyr)
library(ggplot2)

select_Rank
select_Rank <- read_excel("Exportb.xlsx", col_names = T)
head(select_Rank)
str(select_Rank)

rank <- data.frame(name=select_Rank$관광지명,
                  nums=select_Rank$검색건수)

rank <- rank %>%
  mutate(angle = 90 * sample(c(0, 1), n(), replace = TRUE, prob = c(60, 40)))

set.seed(1)
ggplot(rank, aes(label=name, size=nums, color=name, angle = angle)) + 
  geom_text_wordcloud() +
  scale_size_area(max_size = 20) +
  theme_minimal()

#-------------------------------------------------------------------------
my <- read_excel('abc.xlsx', col_names = T)
head(my)
View(my)

my <- my[,c(1,2)]
my

ggplot(my, aes(x = 4, y=per, fill=year)) +
  geom_col() +
  geom_text(aes(label = year),
            position = position_stack(vjust = 0.5)) +
  coord_polar(theta = 'y')

#--------------------------------------------------------------------
#--------------------------------------------------------------------

install.packages("remotes")
install.packages("Ecdat")
install.packages("tidyverse")
install.packages("gganimate")

library(Ecdat)
library(tidyverse)
library(gganimate)

remotes::install_github("R-CoderDotCom/ggcats@main")
library(ggcats)
library(ggplot2)
grid <- expand.grid(1:5, 3:1)

df <- data.frame(x = grid[, 1],
                 y = grid[, 2],
                 image = c("nyancat", "bongo",
                           "colonel", "grumpy",
                           "hipster", "lil_bub",
                           "maru", "mouth",
                           "pop", "pop_close", 
                           "pusheen", "pusheen_pc",
                           "toast", "venus",
                           "shironeko"))

ggplot(df) +
  geom_cat(aes(x, y, cat = image), size = 5) +
  geom_text(aes(x, y - 0.5, label = image), size = 2.5) +
  xlim(c(0.25, 5.5)) + 
  ylim(c(0.25, 3.5)) 

#--------------------------------------------------------------------
# Data frame

dat <-
  incomeInequality %>%
  select(Year, P99, median) %>%
  rename(income_median = median,
         income_99percent = P99) %>%
  pivot_longer(cols = starts_with("income"),
               names_to = "income",
               names_prefix = "income_")

# Cats for each line
dat$cat <- rep(NA, 132)
dat$cat[which(dat$income == "median")] <- "nyancat"
dat$cat[which(dat$income == "99percent")] <- rep(c("pop_close", "pop"), 33)

# Animation
dat
ggplot(dat, aes(x = Year, y = value, group = income, color = income)) +
  geom_line(size = 2) +
  ggtitle("ggcats, a core package of the memeverse") +
  geom_cat(aes(cat = cat), size = 5) +
  xlab("Cats") +
  ylab("Cats") +
  theme(legend.position = "none",
        plot.title = element_text(size = 20),
        axis.text = element_blank(),
        axis.ticks = element_blank()) +
  transition_reveal(Year)

#=============================================================================

dat <-
  incomeInequality %>%
  select(Year, P99, median) %>%
  rename(income_median = median,
         income_99percent = P99) %>%
  pivot_longer(cols = starts_with("income"),
               names_to = "income",
               names_prefix = "income_")

HPV <- read_excel("HPV.xlsx", col_names = T)

# Cats for each line
HPV$cat <- rep(NA, 96)
HPV$cat[which(HPV$type == "park")] <- "nyancat"
HPV$cat[which(HPV$type == "visit")] <- rep(c("pop_close", "pop"), 48)

# Animation
dat
ggplot(HPV, aes(x = year, y = pop, group = type, color = type)) +
  geom_line(size = 2) +
  geom_cat(aes(cat = cat), size = 5) +
  theme(legend.position = "none",
        axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank()) +
  transition_reveal(year)



#--------------------------------------------------------------------------------
BS = read.table(file="bbb.csv", header=T, sep=',')
head(BS)
str(BS)
BS <- BS[c(1,4)]
BS <- BS %>% group_by(기준년월) %>% summarise(mean = mean(광역지자체.검색건수))

BS %>% ggplot(aes(x=기준년월, y=mean), fill=기준년월) + geom_col()

ggplot(BS, aes(x=기준년월, y=mean)) +
  geom_line() +
  geom_point(shape=21, size=3, colour="black",fill='#FC4E07')



