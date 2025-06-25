;; FIND AND REPLACE MODULE

;; Expression Version
(= (findReplace () $x $y) ())
(= (findReplace $list $oldValue $newValue) (
    let* (
        ($current (car-atom $list))
        ($rest (cdr-atom $list))
        ($modified (findReplace $rest $oldValue $newValue))
    ) (if (== $current $oldValue)
        (cons-atom $newValue $modified)
        (cons-atom $current $modified)
    )
))

!(findReplace (1 2 3 4 5) 5 7)

;; Non-deterministically 
(= (replace $list $old $new) (
    collapse(let $x (superpose $list) (if (== $x $old) $new $x))
))

!(replace (1 2 3 4 5) 5 7)

;; Recursive List Version
(= (findReplaceR () $x $y) ())
(= (findReplaceR (:: $x $xs) $newValue $oldValue) (
    if (== $x $oldValue)
        (:: $newValue (findReplaceR $xs $newValue $oldValue))
        (:: $x (findReplaceR $xs $newValue $oldValue))
))

!(findReplaceR (:: 3 (:: 2 (:: 1 ()))) 4 2)