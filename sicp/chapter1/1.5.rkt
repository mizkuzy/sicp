#lang sicp

(#%require rackunit)
; test applicative-order evaluation (count operands then apply operand) vs normal-order evaluation
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;(test 0 (p))

;applicative-order evaluation -> infinite recursion
;normal-order evaluation -> 0