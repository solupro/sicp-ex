#lang racket

;1.3
(define (square x) (* x x))

(define (sum-square x y)
  (+ (square x) (square y)))

;sort
(define (do-sum-square x y z)
  (let* ([l `(,x ,y ,z)]
        [l (sort l >)])
    (sum-square (first l) 
                (first (cdr l)))))

(define (largest-two-square-sum x y z)
  (if (= x (max x y))
      (sum-square x (max y z))
      (sum-square y (max x z))))

;> (do-sum-square 2 6 3)
;45
;> (largest-two-square-sum 2 6 3)
;45
