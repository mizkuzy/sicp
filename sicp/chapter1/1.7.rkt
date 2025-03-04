#lang sicp

(#%require rackunit)

(define (sqrt-iter guess x)
  (sqrt-iter-inner guess (improve guess x) x))
  
(define (sqrt-iter-inner old-guess new-guess x)
  (if (good-enough? old-guess new-guess)
      new-guess
      (sqrt-iter-inner new-guess
                       (improve new-guess x)
                       x))
  )

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;new good-enough
(define (good-enough? old-guess new-guess)
  (< (abs (- old-guess new-guess)) 0.001))

(define (square z) (* z z))

; newton solution from SICP
(define (sqrt-iter-sicp guess x)
  (if (good-enough-sicp? guess x)
      guess
      (sqrt-iter-sicp (improve guess x)
                      x)))

(define (good-enough-sicp? guess x)
  (< (abs (- (square guess) x)) 0.001))


(define findSqrtFrom 2)
(define result (sqrt-iter 1 findSqrtFrom))
(define resultImproved (sqrt-iter-sicp 1 findSqrtFrom))

(check-true (> (- findSqrtFrom (square result))
               (- findSqrtFrom (square resultImproved))))

(define findSqrtFromSmall 0.0001)
(define resultSmall (sqrt-iter 0.03 findSqrtFromSmall))
(define resultSmallImproved (sqrt-iter-sicp 0.03 findSqrtFromSmall))

(check-true (> (- findSqrtFromSmall (square resultSmall))
               (- findSqrtFromSmall (square resultSmallImproved))))

(define findSqrtFromLarge 1e10)
(define resultLarge (sqrt-iter 1e5 findSqrtFromLarge))
(define resultLargeImproved (sqrt-iter-sicp 1e5 findSqrtFromLarge))
resultLarge
resultLargeImproved
(check-true (> (- findSqrtFromSmall (square resultSmall))
               (- findSqrtFromSmall (square resultSmallImproved))))