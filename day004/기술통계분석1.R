#------------------------------------------------------------
# 히스토그램 : hist()
#------------------------------------------------------------

?hist

# breaks = "Sturges" 데이터의 간격
# freq = NULL 빈도 상대도수+

## 임데이터 생성(난수) 고정 시킴
set.seed(1)
data = rnorm(100, 170, 4) # 정규분포 # rnorm(n, mean = 0, sd = 1)
hist(data) 
?rnorm
hist(data) 

# 시각화 결과를 별도의 창으로 표시
windows()


# 수치 데이터 요약보고서(기술통계분석)
summary(data)

x <- hist(data, breaks=seq(150,190,by=2),
          col = 'red',
          main = 'my histogram',
          xlab = 'hetigh(cm)',
          axes = F) #범례

# 최대값
max(x$counts) #최대값 구함


# x축 눈금 설정
x_axis_tick <- seq(150,190, by=2)
?axis
axis(side=1, at=x_axis_tick)

# y축 눈금 설정
y_axis_tick <- seq(0, max(x$counts), by=2)
axis(side=2, at = y_axis_tick)

# 범례설정
?legend
legend('topright', 'height', fill = 'red')

beer <- c(3,4, 1, 1, 3, 4, 3, 3, 1, 3, 2, 1, 2, 1, 2, 3, 2, 
          3, 1, 1, 1, 4, 3, 1)
windows()


# 범주형 데이터의 건수()
table(beer)
barplot(table(beer))


?barplot
# 상대도수 (상대적으로 각각의 도수가 전체의 도수의 얼마인지)
barplot(table(beer) / length(beer),
        col = c("lightblue", "mistyrose", "lightcyan","lavender", "cornsilk"),
        names = c('Domestic\n can','Domestic\n bootle',
                      'Microbrew\n','Import\n'),
        ylab = 'Relative frequency',
        main = 'Beer Preference Survey',
        horiz = T, # 수평 바꿈
        las = 2,
        args.legend =  list(x='topright', bty='n', inset=c(-0.25,0))

#----------------------------------------------------------------
# pie()
#------------------------------------------------------------

beer.counts <- table(beer)
pie(beer.counts)

names(beer.counts) <- c('Domestic\n can','Domestic\n bootle',
                        'Microbrew\n','Import\n')
pie(beer.counts)


#------------------------------------------------------------
# pie3D() 범주형
#------------------------------------------------------------

install.packages('plotrix')
library(plotrix)

pie3D(beer.counts, 
      labels = names(beer.counts),
      labelcex = 1, # 간격
      explode = 0.2,
      radius = 1.5,
      col = c('brown', 'green', 'red', 'yellow'))


#------------------------------------------------------------
# 양적 자료를 요약할 때 사용하는 시각화
# stem() : 통계학자들 많이 씀 , 양적 대이터 사용함
#------------------------------------------------------------
data <- c(2, 3, 16, 23, 14, 12, 4, 13, 2, 0, 0, 0, 6, 28, 31, 14, 4, 8)
stem(data)


# 히스토그램도 양적 대이터를 사용함
hist(rnorm(1000), xlab='data')


# 히스토그램의 밀도함수 표현
x <- rnorm(1000)
hist(x, probability = T, col = 'gray', border = 'white')


# 밀도 함수를 표현하는 곡선
z <- seq(from=-3, to=3, by=0.01)
lines(z, dnorm(z), col=2)


#------------------------------------------------------------
# 산점도 (산포도) 양적 데이터 scatter plot : plot()
#------------------------------------------------------------
plot(cars$speed, cars$dist, col='blue', pch='+', 
     ylab='제동거리리',
     xlab='속도', las=1,
     ylim=c(-20, 140))

# with(): 데이터프레임의 ???
with(cars, plot(speed, dist,  
                col='blue', pch=20, 
                ylab='dist ', xlab='spped'),
                ylim=c(-20, 140))







