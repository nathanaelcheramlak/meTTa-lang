(= (filter $lst) (
    if (== $lst ())
        ()
        (   
            let* (
                ($current (car-atom $lst))
                ($rest (filter (cdr-atom $lst)))
            )
            (if (== $current ())
                $rest
                (cons-atom $current $rest))
        )
))

!(filter (1 () () 2 () 3 ()))

!(union-atom () (() ()))