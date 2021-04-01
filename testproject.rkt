#lang racket
;nthDigit
(define nthDigit (lambda (number n)
                   (remainder (quotient number (expt 10 (- n 1)))
                              10)))
(nthDigit 1234 3)

;reverseDigits
(define reverseDigits (lambda (num)
                        (+ (* 1000000 (nthDigit num 1))
                           (* 100000 (nthDigit num 2))
                           (* 10000 (nthDigit num 3))
                           (* 1000 (nthDigit num 4))
                           (* 100 (nthDigit num 5))
                           (* 10 (nthDigit num 6))
                           (nthDigit num 7))))
(reverseDigits 3423955)

;greaterOnes
(define greaterOnes (lambda (num0 num1)
                      (if (> (remainder num0 10) (remainder num1 10)) 
                          num0
                          (if (< (remainder num0 10) (remainder num1 10))
                              num1
                              "the two inputs share the same ones digit"))))
(greaterOnes 10 20)

;smallerAngle
(define smallerAngle (lambda (hour minutes)
                       (if (< (- 360 (findAngle hour minutes)) 
                              (findAngle hour minutes))
                           (- 360 (findAngle hour minutes))
                           (if (> (- 360 (findAngle hour minutes)) 
                                  (findAngle hour minutes))
                               (findAngle hour minutes) 
                               180))))
;helper function: findAngle
(define findAngle (lambda (hour minutes)
                    (abs (- (* 0.5 (+ minutes (* hour 60))) 
                            (* 6 minutes)))))

(smallerAngle 9 00)

;savingsBal
(define bacPopulation (lambda (original rate time)
                     (* original (expt (+ 1(/ rate 100))time))))
(bacPopulation 100 5 4)

;factorial
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(factorial 20)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(gcd 2000 1000)
