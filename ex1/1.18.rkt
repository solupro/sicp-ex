#lang racket
(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (* a b)
  (define (iter acc a b)
    (cond ((= b 0) acc)
          ((even? b) (iter acc (double a) (halve b)))
          (else (iter (+ acc a) a (- b 1)))))
  (iter 0 a b))