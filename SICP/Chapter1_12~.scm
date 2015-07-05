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
