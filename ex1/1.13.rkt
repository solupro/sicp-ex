#lang racket
(define phi 
  (/ (+ 1 (sqrt 5)) 2))

(define (^ base exponent)
  (define (*^ exponent acc)
    (if (= exponent 0)
        acc
        (*^ (- exponent 1) (* acc base))))
  (*^ exponent 1))

(define (f n) (/ (^ phi n) (sqrt 5)))

;doc
;http://www.billthelizard.com/2009/12/sicp-exercise-113-fibonacci-and-golden.html