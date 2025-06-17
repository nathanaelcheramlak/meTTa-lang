;; Apply-twice (a higher-order function)

(= (apply-twice $function $item) ($function ($function $item)))
(= (square $x) (* $x $x))
; !(apply-twice square 2)


; A map function that squares every element
(= (map ()) ())
(= (map (:: $x $xs)) (
    :: (square $x) (map $xs)
)) 

!(map (:: 1 (:: 3 (:: 4 (:: 5 ())))))



; (= (map ()) ())
; (= (map $list) (
;     let* (
;         ($curr (car-atom $list))
;         ($squared (square $curr))
;         ($the-rest (map (cdr-atom $list)))
;         !(println! $the-rest)
;     )
;     ; $squared
;     cons-atom $squared $the-rest
; ))

; !(println! (3))
!(map (2 3 4 6))

;; Factorial using case
(= (fact $num) (
    case $num (
        (0 1)
        ($x (* $x (fact(- $num 1))))
    )
))

!(fact 5)


; Zip two lists
(= (zip () ()) ())
(= (zip (:: $x $xs) (:: $y $ys)) (
    (:: $x $y) (:: (zip $xs $ys))
))

!(zip (:: 1 (:: 2 ())) (:: A (:: B ())))

(= (zip $list1 $list2)
   (case ($list1 $list2)
         (((() ()) ())
          (((:: $x $xs) (:: $y $ys)) (:: ($x $y) (zip $xs $ys)))
          ($_ ERROR)
         )
   )
)
! (zip (:: A (:: B ())) (:: 1 (:: 2 ()))) ; (:: (A 1) (:: (B 2) ()))
! (zip (:: A (:: B ())) (:: 1 ())) ; (:: (A 1) ERROR)