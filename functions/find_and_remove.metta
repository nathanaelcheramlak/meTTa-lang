;; FIND AND REMOVE MODULE

; Expression Version
(= (findRemove () $x) ())
(= (findRemove $list $val) (
    let* (
        ($current (car-atom $list))
        ($rest (cdr-atom $list)) 
        ($modified (findRemove $rest $val))
    ) (if (== $current $val)
        $modified
        (cons-atom $current $modified)
    )
))

!(findRemove (1 2 3 6 5 6) 6)


;; Non-deterministically 
(= (remove $list $val) (
    collapse (let $x (superpose $list) (if (== $x $val) (empty) $x))
))

!(remove (1 2 3 6 5 6) 6)

; Recursive List Version
(= (findRemoveR () $val) ())
(= (findRemoveR (:: $x $xs) $val) (
    if (== $x $val)
        (findRemoveR $xs $val)
        (:: $x (findRemoveR $xs $val))
))

!(findRemoveR (:: 2 (:: 1 (:: 3 (:: 4 ())))) 3)
