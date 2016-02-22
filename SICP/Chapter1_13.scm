;; 1.29
(define (cube x) (* x x x)

(define (intp n) (+ n 1))

(define (sum term a next b)
 (if (> a b)
  	0
	(+ (term a)
	 	(sum term (next a) next b))))
(define (simpson-integral f a b n)
 	(define h (/ (- b a) n))
	(define (yk k) (f (+ a (* h k))))
	(define (simpson-term k)
	 (* (cond ((or (= k 0) (= k n)) 1)
		 ((odd? k) 4)
		 (else 2))
	  (yk k)))
	(* (/ h 3) (sum simpson-term 0 intp n)))
;; another

(define (another-simpson-integral f a b n)
 (define h (/ (- b a) n))
 (define (add-2h x) (+ x (* 2 h)))
 (* (/ h 3.0) (+ (f a)
			   (* 4.0 (sum f (+ a h) add-2h (- b n)))
			   (* 2.0 (sum f (add-2h a) add-2h (- b n)))
			   (f (+ a (* h n))))))

;; 1.30

(define (itersum term a next b)
 (define (iter a result)
  	(if (> a b)
	 result
	 (iter (next a) (+ result (term a)))))
	(iter a 0))
;; 1.31
;; a
(define (product term a next b)
 (if (> a b) 1
  (* (term a) (product term (next a) next b))))

;; b
(define (product term a next b)
 (define (iter a res)
  (if (> a b) res
   (iter (next a) (* (term a) res))))
 (iter a 1))

(define (pi n)
 	(define (term x) (* x x))
	(define (next x) (+ x 2))
	(define limit (* n 2))
	(* 4 (/ (/ (* 2 (product term 4 next (+ limit 2)))
			 	(+ limit 2))
		  (product term 3 next (+ limit 1)))))
;; 1.32
(define (accumulate combiner null-value term a next b) 
 	(if (> a b) null-value
	 	(combiner (terma)
		 (accumlate combiner null-value term (next a) next b))))

(define (accumulate combiner null-value term a next b) 
 (define (iter a res)
  (if (> a b) res
   	(iter (next a) (combiner res (term a)))))
 (iter a null-value))

