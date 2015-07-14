;; 1.12 파스칼 삼각형
(define (pascal row col)
    (cond ((or (< row col)
               (< col 1)) 0)
          ((or (= col 1)
               (= col row)) 1)
          (else (+ (pascal (- row 1) (- col 1))
                   (pascal (- row 1) col )))))
;; 1.13 나중에 블로그에 정리하겠습니다. (...)
;; 1.14
;; 1.2.2 절의 count-change
(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 50)
        ((= kinds-of-coins 2) 25)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 5)
        ((= kinds-of-coins 5) 1)))
;; 그래프 그려야하는데 나중에 이미지 링크 걸어놓겠음

;;1.15
;; p는 5번 호출
(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))

;; 1.16
(define (square x) (* x x))
(define (expt b n)
    (define (iter a b n)
        (cond ((= n 0) a)
            ((even? n) (iter a (square b) (/ n 2)))
            (else (iter (* a b) b (- n 1)))))
        (iter 1 b n))
;; 1.17
(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (* a b)
(cond ((= b 0) 0)
     ((even? b) (double (* a (halve b))))
     (else (+ a (* a (- b 1))))))

;; 1.18
(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (* a b)
   (define (iter accumulator a b)
     (cond ((= b 0) accumulator)
           ((even? b) (iter accumulator (double a) (halve b)))
           (else (iter (+ accumulator a) a (- b 1)))))
   (iter 0 a b))
;; 1.19
;; 빈칸 채우기
(define (square x) (* x x))
(define (fib n)
   (fib-iter 1 0 0 1 n))
 (define (fib-iter a b p q count)
   (cond ((= count 0) b)
         ((even? count)
          (fib-iter a
                    b
                    (+ (square p) (square q)) ;; p' 값을 계산
                    (+ (* 2 p q) (square q)) ;; q' 값을 계산
                    (/ count 2)))
         (else (fib-iter (+ (* b q) (* a q) (* a p))
                         (+ (* b p) (* a q))
                         p
                         q
                         (- count 1)))))
;; 1.20
(gcd 206 40)
(if (= 40 0) ...)
(gcd 40 (remainder 206 40))
(if (= 6 0) ...)
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(if (= (remainder 40 (remainder 206 40)) 0) ...)
(if (= 4 0) ...)
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ...)
(if (= 2 0) ...)
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) ...)
(if (= 0 0) ...)
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;; 18번
;; 인자 먼저 계산
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remainder 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)
2
;; 4번
;; 1.21
;; test-divisor은??

;; 1.22
(define (square x) (* x x))

(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
    (= (remainder b a) 0))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (timed-prime-test n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
    (newline)
    (display n)
    (display " *** ")
    (display elapsed-time))
;; search-for-primes 구하기 
