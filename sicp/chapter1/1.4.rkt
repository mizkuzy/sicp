#lang sicp

(#%require rackunit)

;fun returns operand
(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))

(check-equal? (a-plus-abs-b 3 2) 5)
(check-equal? (a-plus-abs-b 3 -2) 5)
