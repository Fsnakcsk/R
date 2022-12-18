# 파일 입출력
# R에서 사용중인

no = c(1, 2, 3, 4) # 코드
name = c('Apple', 'Banana', 'Berry', 'Peach')
price = c(500, 200, 300, 50)
qty = c(5, 2, 4, 7) # 수량

fruit = data.frame(No = no, Name = name, Price = price, QTY = qty)
fruit


# 현재 선언된 변수 목록 확인
ls(fruit)


# 각각의 변수를 정장함
# test.data 파일에 저장
# .dat 확장자, 읽어올 수 없는 파일이다.
save(no, name, fruit, file = "C:/k_digital/source/data/text.dat")
rm(no, name, fruit)

# 저장된 데이터를 로딩
load("C:/k_digital/source/data/text.dat")



# 텍스트 파일 저장 및 불로오기
# 배열형태로 읽어옴
# 공백문자, 텝, 줄마꿈등을 기준으로 단어 단위로 배열 저장
# scan("경로 이름", waht=자료형, ) 
# waht="", 다양한 자료형이 썩여 있을 경우*********
data = scan("C:/k_digital/source/data/test.txt", what="")
data

data[4]
str(data)


## 배열이 아닌 데이터프레임 형식으로 읽어오기
raw = read.table("C:/k_digital/source/data/test.txt", 
                 header = T, # 속성 존재
                 sep = '\t') # 구분자
raw
str(raw)


# R내장 데이터셋 확인
data()



