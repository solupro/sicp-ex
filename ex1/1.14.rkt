#lang racket
(define (count-change amount) 
   (cc amount 5)) 
(define (cc amount kinds-of-coins) 
   (cond ((= amount 0) 1) 
         ((or (< amount 0) (= kinds-of-coins 0)) 0) 
         (else (+ (cc amount 
                      (- kinds-of-coins 1)) 
                  (cc (- amount 
                         (first-denomination kinds-of-coins)) 
                      kinds-of-coins))))) 
 (define (first-denomination kinds-of-coins) 
   (cond ((= kinds-of-coins 1) 50) 
         ((= kinds-of-coins 2) 25) 
         ((= kinds-of-coins 3) 10) 
         ((= kinds-of-coins 4) 5) 
         ((= kinds-of-coins 5) 1)))

;                                 11 => 50 25 10 5 1
;                                       4|0
;                             +----------+---------+
;                             |                    |
;                        11 => 25 10 5 1      -39 => 50 25 10 5 1
;                            4|0
;                    +--------+-------+
;                    |                |
;               11 => 10 5 1    -14 => 25 10 5 1
;                   3|1
;            +-------+--------------------------------------+
;            |                                              |
;      11 => 5 1                                       1=> 10 5 1
;           1|2                                            1|0
;    +-------+-------+                                 +----+---------+
;    |               |                                 |              |
; 11=> 1          6 => 5 1                           1=> 5 1      -9 => 10 5 1
;                   1|1                               1|0
;           +--------+----+                      +-----+---+
;           |             |                      |         |
;        6 => 1        1 => 5 1               1 => 1     -4=> 5 1
;                        1|0
;                    +----+----+
;                    |         |
;                1 => 1     -4=> 5 1