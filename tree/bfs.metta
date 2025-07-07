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


(= (bfs $queue) (
    if (== $queue ())
        ()
        (let* (
            ($removed-queue (cdr-atom $queue))
            ($node (car-atom $queue))
            ($val (car-atom $node))
            ($left (index-atom $node 1))
            ($right (index-atom $node 2))
            ($children (union-atom ($left) ($right)))
            ($filtered (filter $children))
            ($new-queue (union-atom $removed-queue $filtered))
            ($ans (bfs $new-queue))
        ) 
        (cons-atom $val $ans)
        )
))

!(bfs ((2 (3 () (5 () ())) (4 (1 () ()) ()))))