#------------------------------------------------
#                   제어문               
#------------------------------------------------

# 조건문
# [인덱스 조건식]
# if, if ~ else
# 삼항연산자 ifelse(조건항, 참, 거짓)
x <- runif(1) #난수
print(x)


# x가 0보다 크면
if(x > 0) print(abs(x))

# x가 0.5보다 작으면 1-x 출력, 아니면 x 출력
if(x < 0.5){
  print(1-x)
}else {
  print(x)
}


# 하나의 숫자를 받아 짝수인지 홀수인지 짝수인지 판단
check = -9
if(check %% 2 == 0){
  print(check)
  print("짝수입니다")
  print(abs(check))
} else{
  print(check)
  print("홀수입니다")
  print(abs(check))
}
  

# ifelse(조건항, 참, 거짓)
ifelse(x < 0.5, 1-x, x)


# switch : 조건에 따라 실행
point = 95

if(point >= 90){
  print("A 학점")
} if(point >= 80){
  print("B 학점")
} else if(point >= 70){
  print("C 학점")
} else if(point >= 60){
  print("D 학점")
} else{
  print("F 학점")
}

point = 95
grade = point %/% 10 # 10, 9, 8, 7, 6, 5, 4, 3, 2, 1

switch(as.character(grade),
       "10" = print("A학점"),
       "9" = print("A학점"),
       "8" = print("B학점"),
       "7" = print("C학점"),
       "6" = print("D학점"),
       print("F학점"))


t(matrix)
# as.character()
# as.numerict()
# as.logical()
# as.data.frame()



#------------------------------------
#               반복문
#------------------------------------

# ----< for >----
sum = 0
for(i in seq(1, 10, by=1)) sum = sum+i
sum
 
# 구구단 3단을 출력 . 3 x 1 = 3
dan = 3
for(i in seq(1,9)){
  # print(dan, ' x ', i , ' = ', dan*i)   # ,때문에 오류
  # paste(dan, ' x ', i , ' = ', dan*i)   # paste로 하면 모든 게 String으로 취급
  cat(dan, ' x ', i , ' = ', dan*i, '\n') # 줄바꿈이 안돼서 따로 조치해야 함
}

# 구구단 전체 출력
for(i in seq(2,9)){
  cat(paste("\n======", i, "단 ======\n"))
  for(j in seq(1,9)){
    cat(i, ' x ', i , ' = ', i*i, '\n')
  }
}



# ----< while >----
sum = 0
i = 1
while(i < 11){
  sum = sum+i
  i = i + 1
}
sum


# ----< repeat >----
#     무한 반복
#while(1) == while(TRUE)

sum1 = 0
i = 1
repeat{
  if(i > 10) break
  sum1 = sum1 + i
  i = i + 1
}
sum1

# 1부터 10까지 짝수만 출력
for(i in 1:10) {
  if(i %% 2 == 0) cat(i,"\n")
}

# 1부터 10까지 소수만 출력
for(i in 5:10) {
  if((i %% 1 == 0 & i %% i == 0) & (i %% 2:i-1 != 0))
    cat(i,"는 소수")
}



for(i in 1:10) {
  check = 0
  for(j in 1:i){
    if(i %% j == 0)
      check = check + 1
  }
  if(check == 2) print(i)
}
