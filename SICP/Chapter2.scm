;; 2.1
;; 
(define (make-rat n d)
 (let ((g ((if (< d 0) - +) (gcd n d))))
    (cons (/ n g) (/ d g))))

;; 2.2
;; point
(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
;; segment
(define (make-segment start-segment end-point)
 (cons start-point end-point))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (mid-point-segment segment)
    (define (average a b) (/ (+ a b) 2.0))
    (let ((a (start-segment segment))
           b (end-segment segment)))
        (make-point (average (x-point a)
                             (x-point b))
                    (average (y-point a)
                             (y-point b))))
;; 2.3
;; Point 
(define (make-point x y) (cons x y)) 
(define (x-point p) (car p)) 
(define (y-point p) (cdr p)) 
      
(define (make-rect bottom-left top-right) 
  (cons bottom-left top-right)) 
      
(define (bottom-left rect) (car rect)) 
(define (bottom-right rect) 
  (make-point (x-point (cdr rect)) 
              (y-point (car rect)))) 
(define (top-left rect) 
  (make-point (x-point (car rect)) 
              (y-point (cdr rect)))) 
(define (top-right rect) (cdr rect)) 
      
(define (width-rect rect) 
  (abs (- (x-point (bottom-left rect)) 
          (x-point (bottom-right rect))))) 
(define (height-rect rect) 
  (abs (- (y-point (bottom-left rect)) 
          (y-point (top-left rect))))) 
      
(define (area-rect rect) 
  (* (width-rect rect) (height-rect rect))) 
(define (perimeter-rect rect) 
  (* (+ (width-rect rect) (height-rect rect)) 2)) 
      
;; 2.4
(define (cons x y)
 (lambda (m) (m x y))
(define (car z)
 (z lambda (p q) p))
;; cdr
(define (cdr z)
 (z (lambda (p q) q)))

