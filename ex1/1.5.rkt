#lang racket
(define (p) (p))
(define (test x y)
  (if (= x 0)
      x
      y))

;test
;(test 0 (p))

;Using applicative-order evaluation, the evaluation of (test 0 (p))
;never terminates,beacause (p) is infinitely expanded to itself;

;Using normal-order evaluation, the expression evaluates, step by step,
;to 0