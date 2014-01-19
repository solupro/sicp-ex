#lang racket
(define (exponent-iter x result counter max-count)
  (if (= counter max-count)
      result
      (exponent-iter x
                     (* result x)
                     (+ counter 1)
                     max-count)))
(define (exponent x c)
  (exponent-iter x 1 0 c))

(define (square x) (exponent x 2))
(define (cube x) (exponent x 3))

(define (good-enough? guess x improve)
  (< (abs (- (improve guess x) guess))
     (abs (* guess 0.001))))

(define (root-iter guess x improve)
  (if (good-enough? guess x improve)
      guess
      (root-iter (improve guess x) x improve)))

(define (sqrt-improve guess x)
  (/ (+ guess (/ x guess)) 2))

(define (cbrt-improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (sqrt x)
  (root-iter 1.0 x sqrt-improve))

(define (cbrt x)
  ((if (< x 0) - +)(root-iter 
                    (cbrt-improve 1.0 (abs x)) (abs x) cbrt-improve)))