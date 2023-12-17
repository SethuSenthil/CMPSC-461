; By Sethu Senthil (sns5787@psu.edu) on Oct 14 2023

#|
  Sources Used:
  - https://docs.racket-lang.org/reference/booleans.html
  - https://docs.racket-lang.org/guide/lambda.html
  - https://stackoverflow.com/questions/5406064/difference-between-define-let-and-set
  - https://docs.racket-lang.org/reference/pairs.html
|#

#lang racket

;;--PROBLEM 1--;;
;; This function calculates the cost of buying a certain number of comics.
;; It is a helper function for the `total-cost` function.
(define (total-cost-helper total-number-of-comics-bought current-iteration)
  (if (> current-iteration total-number-of-comics-bought)
      0
      (+ (cond ((and (>= current-iteration 1) (<= current-iteration 10)) 5)  ; If the current iteration is between 1 and 10, the cost is $5.
                ((and (>= current-iteration 11) (<= current-iteration 20)) 4) ; If the current iteration is between 11 and 20, the cost is $4.
                ((and (>= current-iteration 21) (<= current-iteration 30)) 3.5) ; If the current iteration is between 21 and 30, the cost is $3.5.
                (else 3)) ; If more than 30 comics are bought, the cost is $3.
         (total-cost-helper total-number-of-comics-bought (+ current-iteration 1))))) ; Recursively call the function with the next iteration.

;; This function calculates the total cost of buying a certain number of comics.
(define (totalCost number-of-comics-bought)
  (let ((total-cost-result (total-cost-helper number-of-comics-bought 1))) ; Call the helper function to calculate the total cost.
    (if (> number-of-comics-bought 50) ; If the number of comics bought is more than 50, subtract $10 from the total cost.
        (- total-cost-result 10)
        total-cost-result))) ; Otherwise, return the total cost.

"PROBLEM 1:"
(totalCost 12)
(totalCost 37)
(totalCost 53)
(newline)

;;--PROBLEM 2--;;
(define (dot list1 list2) ; Define a function named "dot" that takes two lists as input.
        (if (or (null? list1) (null? list2)) ; (handling case) If either of the lists is empty, return 0.
            0
            (+ (* (first list1) (first list2)) (dot (rest list1) (rest list2))))) ; Otherwise, multiply the first elements of the two lists and add it to the result of recursively calling the "dot" function with the rest of the two lists.

"PROBLEM 2:"
(dot '(1 2 3) '(4 5 6))
; => 32

(dot '(1 -1 1 -1) '(2 2 2 2))
; => 0

(dot '(1 2 3 4) '(5 6 7 8))
; => 70

(dot '() '())
; => 0
(newline)

;;--PROBLEM 3--;;
(define (adjDiff L) ; Define a function named "adjDiff" that takes a list as input.
  (if (< (length L) 2) ; If the length of the list is less than 2, return an empty list.
      '()
  (cons (-(cadr L) (car L)) ; Otherwise, subtract the second element from the first element and add the result to the beginning of the output list.
      (adjDiff (cdr L))))) ; Recursively call the "adjDiff" function with the rest of the list.


"PROBLEM 3:"
(adjDiff '(3 8 -1 4)) ;; Output: [5 -9 5]
(adjDiff '(1 2 3 4 5))  ;; Output: [1 1 1 1]
(adjDiff '())  ;; Output: []
(newline)

;;--PROBLEM 4--;;
;; This function takes a positive integer n and returns the length of its Collatz sequence.
(define (collatz-length n)
(- (collatz-length-helper n 1) 1) ; Call the helper function with the input and 1 from the output to match the expected output.
)

;; This helper function takes a positive integer n and a length and returns the length of n's Collatz sequence.
(define (collatz-length-helper n length)
  (cond ((= n 1) length) ; If n is 1, return the length
        ((even? n) (collatz-length-helper (/ n 2) (+ length 1))) ; If n is even, divide it by 2 and add 1 to the length
        (else (collatz-length-helper (+ (* n 3) 1) (+ length 1))))) ; If n is odd, multiply it by 3 and add 1, then add 1 to the length

"PROBLEM 4:"
(collatz-length 7)
;; => 16
(collatz-length 2561)
;; => 146
(collatz-length 1005)
;; => 67
(newline)

;;--PROBLEM 5--;;
(define (trunc a b x) ; Define a function named "trunc" that takes three arguments: a, b, and x.
  (define (trunc-element xi) ; Define a helper function named "trunc-element" that takes one argument: xi.
    (cond ; Use a conditional statement to check the value of xi.
      ((< xi a) a) ; If xi is less than a, return a.
      ((> xi b) b) ; If xi is greater than b, return b.
      (else xi))) ; Otherwise, return xi.

(map trunc-element x)) ; Apply the "trunc-element" function to each element of x using the "map" function and return the resulting list.

"PROBLEM 5:"
(trunc 0 1 '(-2 -1 0 1 2))        ; Output: '(0 0 0 1 1)
(trunc 0.5 1.5 '(-2 -1 0 1 2))      ; Output: '(0.5 0.5 0.5 1 1.5)
(trunc 1 1 '(-2 -1 0 1 2))          ; Output: '(1 1 1 1 1)
(newline)

;;--PROBLEM 6--;;
;; Determines if each element in list1 is less than or equal to its corresponding element in list2
;; leq: (Listof Number) (Listof Number) -> Boolean
(define (leq list1 list2)
  ;; Compares two elements and returns true if the first is less than or equal to the second
  ;; compare-pair: Number Number -> Boolean
  (define (compare-pair x y)
    (<= x y))

  ;; Compares each pair of elements in list1 and list2 using compare-pair, and returns a list of the results
  (let ((comparisons (map compare-pair list1 list2)))
  ;; Combines the results of the comparisons using logical AND, and returns the final result
    (foldl (lambda (x acc) (and acc x)) #t comparisons)))


"PROBLEM 6:"
(leq '(1 2 3) '(2 3 3))  ; #t
(leq '(1 2 3) '(3 2 1))  ; #f
(leq '(1 0) '(0 1))      ; #f
(leq '() '())             ; #t
(newline)


