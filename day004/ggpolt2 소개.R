#----------------------------------------------
#                   ggplot2
#----------------------------------------------
# 패키지 설치
install.packages("ggplot2")

# 패키지 로딩
library(ggplot2)

?ggplot

# 그래프를 그릴 공간 설정 : ggplot()
# ggplot(data.frame, aes())   ase 데이터 시각화
# data : 그래프로 사용할 데이터프레임
# aes() : 데이터 항목, 시각화할 요소(옵션)
# :: 누구누구 것
# ggplot2 :: mpg ggplot2 것 
ggplot2 :: mpg
str(mpg)
mpg = as.data.frame(mpg)
str(mpg)


View(mpg)

ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_bin_2d()

#
classDf = data.frame(gender = c('남','여','남','여','남','여','남','여'),
                     blood = c('A', 'A', 'AB', 'AB','B','B','O','O'),
                     freq = c(4, 3, 1, 1, 0, 5, 5, 1))
classDf

#----------------------------------------------------------------------
# 데이터 프렘임을 이용해 ggplot
class1 = data.frame(blood = c('A', 'A', 'AB', 'AB','B','B','O','O'),
                    freq = c(4, 3, 1, 1, 0, 5, 5, 1))
ggplot(class1, aes(x=blood, y=freq)) + 
  geom_col()
#------------------------------------------------------------

blood.Type = c('A', 'B','A','O','A','AB','B','A','O','O',
               'B','AB','AB','O','A','B','B','B','O','AB','O')
class(blood.Type)
str(blood.Type)
table(blood.Type)

#벡터를 table로 변환
blood.Type = table(blood.Type)
blood.Type

barplot(blood.Type, col=rainbow(5))

install.packages('plotrix')
library(plotrix)
pie(blood.Type, main ='선호계절', radius=1)

pie3D(blood.Type, 
      labels=names(blood.Type),
      main ='선호계절', 
      radius=1,
      labelcex=2,
      explode=0.1,
      col = c('red', 'green', 'yellow', 'pink'))

#---------------------------------------------------------------------
ggplot(classDf, aes(x=blood, y=freq)) + 
  ggtitle('호랑이반 혈액형 비율',subtitle = '혈액형/성별 기준준') + 
  labs(x='혈액형', y='인원수', fill='성별') +
  geom_col(aes(fill=gender)) -> x
  
x + theme_gray()  
#  geom_point(aes(shape=gender), size=3)


# aplot(x축, y축데이터, 옵션)
qplot(Sepal.Length, Petal.Length, data=iris)


# Q. 시즌별 티켓판매량을 분석하려고 한다
# 시즌은 ('A', 'B', 'C', 'D', 'E')
# 판매()

abc = c(110, 300, 150, 280, 310)
barplot(abc, main='시즌별 판매량', xlab='시즌', ylab='판매량',
        names.arg=c('A', 'B', 'C', 'D', 'E'))

# 스포츠 경기별 판매량 분석
baseball = c(110, 300, 150, 280, 310)
scoccer = c(180, 200, 210, 190, 170)
beach = c(210, 150, 260, 210, 70)

data = matrix(c(baseball, scoccer, beach), 5,3) #5행 3열
data

barplot(t(data), main='결기별 시즌의 판매량(누적표시형)', 
        xlab='season', ylab='판매량',
        names.arg=c('BaseBall','SoccerBall','BeachBall'),
        col = rainbow(5), horiz = T, beside = T)
legend(1, 400, c('A','B','C','D','E'), cex=0.8, fill=rainbow(5))













