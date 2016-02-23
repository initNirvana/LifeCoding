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

;; 1.33
;; a 
(define (smallest-div n)
 (define (divides? a b)
  (= 0 (remainder b a)))
 (define (find-div n test)
  (cond ((> (sq test) n) n) ((divides? test n) test)
   		(else (find-div n (+ test 1)))))
 (find-div n 2))

(define (prime? n)
 (if (= n 1) false (= n (smallest-div n))))

(define (filtered-accumulate combiner null-value term a next b filter) 
   (if (> a b) null-value 
	(if (filter a) 
	 (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter))
	 (combiner null-value (filtered-accumulate combiner null-value term (next a) next b filter))))) 

(define (sum-of-prime-squares a b) (filtered-accumulate + 0 sq a inc b prime?)) 

;; b
(define (gcd m n)
 (cond ((< m n) (gcd n m))
  		((= n 0) m)
		(else (gcd n (remainder m n)))))

(define (rel-prime? m n)
 (= (gcd m n) 1))

(define (product-of-rel-prime n)
 (define (filter x)
  	(rel-prime? x n))
 (filtered-accumulate filter * 1 identity 1 inc n))
;; 1.34 
; Error
;; 1.35
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
;; 1.36
(define tolerance 0.000001) 
(define (fixed-point f first-guess) 
 (define (close-enough? v1 v2) 
  (< (abs (- v1 v2)) tolerance))
 (define (try guess)
  (display guess)
  (newline)
  (let ((next (f guess)))
  (if (close-enough? guess next)
	next
	(try next))))
 (try first-guess)) 
;; 34번
(define (x-to-x y)
 (fixed-point (lambda (x) (/ (log y) (log x)))
  10.0))

;; 1.37
(define (cont-frac n d k)
 (cond ((= k 0) 0)
  	(else (/ (n k) (+ (d k) (cont-frac n d (- k 1)))))))
;; 1.38
(define (euler k)
	(+ 2.0 (cont-frac (lambda (i) 1)
					  (lambda (i)
					   (if (= (remainder i 3) 2)
					   		(/ (+ i 1) 1.5)
							1))
	 					k)))

;; 1.39
(define (tan-cf x k)
 (cont-frac (lambda (i)
			 (if (= i 1) x (- (* x x))))
  			(lambda (i)
			 (- (* i 2) 1))
			k))
;; 1.40
(define (cubic a b c)
 (lambda (x)
  (+ (cube x)
   (* a (square x))
   (* b x)
   c))) 
;; 1.41
(define (double f)
 		(lambda (x) (f (f x))))
(((double (double double)) inc 5)
; answer is 21 
;; 1.42
(define (compose f g)
 (lambda (x) (f (g x)))) 
;; 1.43

(define (repeat f n)
 (if (< n 1)
  	(lambda (x) x)
	(compose f (repeat f (- n 1))))) 
; ((repeat square 2) 5) 625

;; 1.41
(define dx 0.00001)
(define (smooth f)
 (lambda (x)
  (/ (+ (f (- x dx))
	  (f x)
	  (f (+ x dx)))
   3)))

(define (n-fold-smooth f n)
 ((repeated smooth n) f)) 
; repeated used
(define (repeated f n)
 (lambda (x) (cond ((= n 0) x)
			  		(else
					 ((compose (repeated f (- n 1)) f) x)))))
(define (n-smooth f n x)
 ((repeated (smooth f) n) x))

;; 1.45

