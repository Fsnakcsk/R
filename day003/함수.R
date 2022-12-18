# 함수(Function) : 내장함수 와 사용자 정의 함수
# 함수명(매개변수 or 인수){}


check = function(scores){
  if(scores > 80){
    print("합격")
  } else {
    print("불합격")
  }
}

scores = c(90, 76, 58, 82, 66)

for(i in scores){
  check(i)
}

