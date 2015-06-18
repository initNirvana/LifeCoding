# Chapter 1
1.1
# 순서대로 답
10, 12, 8, 3, 6, a, b, 19, #f, 4, 16, 6, 16,

1.2
#앞 가지 쓰기 꼴
(/  (+5
      4
      (-2(-3(+6(/4 5)))))
      (* 3
      (- 6 2)
      (- 2 7 )))

1.3
#세 숫자 인자로 받아 그 가운데 숫자 두개를 제곱한다음, 그 두값을 덧셈하여 내놓는 프로시저
(define (square x) (* x x) )
(define (sum-of-squares x y) (+ (square x) (square y)))
(define (sum-of-squared-largest-two x y z)
         (cond ((= (min x y z) x) (sum-of-squares y z))
               ((= (min x y z) y) (sum-of-squares x z))
               ((= (min x y z) z) (sum-of-squares x y))))
1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b)

(a-plus-abs-b 10 2) # 12
(a-plus-abs-b 10 -1) # 11


1.5
(test 0 (p))
(if (= 0 0) 0 (p))
(if #t 0 (p))
0

1.6
#good-enough? 원형
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                      x)))
못구하지않나...?

1.7
#abs가 필요함
(define (good-enough? guess x)
 (< (abs (- (improve guess x) guess))
  (* guess 0.001)))


1.8
(define (cube x)
  (* x x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (cuve guess) x)) 0.001))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
          guess
          (cube-root-iter (improve guess x)
                      x)))
(define (cube-root x)
  (cube-root-iter 1.0 x))

  
