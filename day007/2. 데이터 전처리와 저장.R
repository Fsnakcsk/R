# 실습 데이터 : titanic
# titanic.csv

titanic <- read.csv('titanic.csv')
str(titanic)
View(titanic)
head(titanic)
summary(titanic)

# 필요한 컬럼만 뽑아서 새로운 데이터 프레임 생성
df <- titanic[ ,c('X','pclass','survived','sex','age','sibsp','parch','embarked')]
str(df)



# Factor 형 변환
table(is.na(df$embarked))
df$embarked <- ifelse(is.na(df$embarked), 'Southampton', df$embarked)
df$embarked <- as.factor(df$embarked)

df$pclass <- as.factor(df$pclass)
df$survived <- as.factor(df$survived) # 생준 여부
df$sex <- as.factor(df$sex)
#나이 걸측값 처리
df$age <- ifelse(is.na(df$age), mean(df$age, na.rm = T), df$age)




# 범주형 데이터의 건수
table(is.na(titanic$embarked))
titanic$embarked <- ifelse(table(is.na(titanic$embarked)), 'Southampton', titanic$embarked)




summary(df)
# 1등실 탑승 고객 추출
titanic[titanic$pclass=='1st',]



# pclass별 생존 및 사망 비율을 시각화
# 객실 등급별 생존율
qplot(survived, data=df, fill=sex)
qplot(survived, data=df, fill=embarked)
qplot(age, data=df)
              

boxplot(df$age)$stats


# system.time() : 처리속도를 보여주는 함수
df <- data.frame(x=runif(2.6e+07), y= rep(letters, each=10000))
system.time(x <- df[df$y == 'C'])

DT <- as.data.table(df)
system.time(x <- df[df$y == 'C'])

head(titanic[, 1])



titanic_df[, c('sex','pclass')]

titanic[,1,,with=F] #데이터프레임으로 읽어옴


titanic_df <- as.data.table(titanic)
class(titanic_df)
str(titanic_df)

head(titanic_df)

titanic_df[,1, with=F]


#데이터프레임[행, 열]
titanic_df[pclass == '1st',]

#테이블 , 생략해도됨
titanic_df[pclass == '1st']


setkeyv(titanic_df, c('sex', 'pclass'))
tables()

setkey(titanic_df, pclass)
tables()


key <- 'pclass'
setkeyv(titanic_df, key)
tables()

titanic_df['1st']
titanic_df[J('1st')]

titanic_df[J('1st'), mean(survived)]

# apply, lapply, sapply, tapply
# apply : 특정 행이나열을 함수를 적용
# apply(행렬, 방향, 함수) : 1행, 2열
?apply

# matrix(data, nrow, ncol)
m <- matrix(1:12, nrow = 3, byrow=F)
m

#dimnages(list(c(행이름), c(열이름)))

apply(m, 1, sum) #rowSums(), rowMeans()
apply(m, 2, mean, na.rm=T) #colSums(), colMeans()

x <- lapply(1:3, function(a){a * 2})
x
x[[2]] <- c(1,2,3,4,5)
x
x[[2]][4]

x <- list(a=1:3, b='aaa', c=100)
x
x$a
x$a[3]
