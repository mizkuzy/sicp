#lang sicp

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square z) (* z z))

; why 'if' is a special form? because it can count only one branch
; why 'sqrt-iter' doesn't work with 'new-if'? because there is applicative-order evaluation. It evaluates operands first.
;  So the program try to count 'else-clause' which is sqrt-iter before running 'new-if' and we are in an infinite recursion
