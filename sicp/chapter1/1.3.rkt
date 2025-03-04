#lang sicp

(#%require rackunit)

;Определите процедуру, которая принимает в качестве аргументов три числа и возвращает сумму квадратов двух б ́ольших из них.

(define (square x) (* x x))

(define (solution x y z)
  (cond ((and (< x y) (< x z))(+ (square y) (square z)))
        ((and (< y x) (< y z))(+ (square x) (square z)))
        ((and (< z x) (< z y))(+ (square x) (square y)))
        )
  )

(check-equal? (solution 1 2 3) 13)
(check-equal? (solution 4 2 3) 25)
(check-equal? (solution 2 2 1) 8)
