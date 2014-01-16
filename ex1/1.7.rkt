#lang racket
;;Alternate version, which adds an "oldguess" variable to the main function. 
(define (sqrt-iter guess oldguess x)
  (if (good-enough? guess oldguess) 
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

;; Modified version to look at difference between iterations 
(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (* guess 0.001)))

(define (square x) (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))