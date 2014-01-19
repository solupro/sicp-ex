#lang racket
;; Base on the solution of ex1.7

(define (square x) (* x x))

(define (cube-root-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (cube-root-iter (improve guess x) guess x)))

(define (improve guess x)
  (average3 (/ x (square guess)) guess guess))

(define (average3 x y z)
  (/ (+ x y z) 3))

;; Stop when the difference is less than 1/1000th of the guess
(define (good-enough? guess prev-guess)
  (< (abs (- guess prev-guess)) (abs (* guess 0.001))))

; fials when input -2
;(define (cube-root x)
;  (cube-root-iter 1.0 0.0 x))

;fix: take absolute cuberoot and return with sign
(define (cube-root x)
  ((if (< x 0) - +)(cube-root-iter 
                    (improve 1.0 (abs x)) 1 (abs x))))