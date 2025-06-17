;; FIND AND REPLACE MODULE

;; Expression Version
(= (findReplace () $x $y) ())
(= (findReplace $list $newValue $oldValue) (
    let* (
        ($current (car-atom $list))
        ($rest (cdr-atom $list))
        ($modified (findReplace $rest $newValue $oldValue))
    ) (if (== $current $oldValue)
        (cons-atom $newValue $modified)
        (cons-atom $current $modified)
    )
))

!(findReplace (1 4 5 2 1 6 4) 9 4)


;; Recursive List Version
(= (findReplaceR () $x $y) ())
(= (findReplaceR (:: $x $xs) $newValue $oldValue) (
    if (== $x $oldValue)
        (:: $newValue (findReplaceR $xs $newValue $oldValue))
        (:: $x (findReplaceR $xs $newValue $oldValue))
))

!(findReplaceR (:: 3 (:: 2 (:: 1 ()))) 4 2)