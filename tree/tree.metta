; TREE MODULE

;; Tree Representation
; (Node (left child) (right child))


;; CHECK IF TWO TREES ARE THE SAME
; 0 -> False, 1 -> True
(= (check-equal () ()) 1)
(= (check-equal ($x) ()) 0)
(= (check-equal () ($x)) 0)
(= (check-equal ($x) ($y)) (if (== $x $y) 1 0))
(= (check-equal ($x $x-left $x-right) ($y $y-left $y-right)) (
    let $count (+ (+ (check-equal $x-left $y-left) (check-equal ($x) ($y))) (check-equal $x-right $y-right))
    (if (== $count 3) 1 0)
))

!(check-equal (5 (4 (1) (3)) (2)) (5 (4 (1) (3)) (2)))


; TESTS
!(== (check-equal () ()) 1)
!(== (check-equal (5) ()) 0)
!(== (check-equal () (5)) 0)
!(== (check-equal (5) (5)) 1)
!(== (check-equal (5) (6)) 0)
!(== (check-equal (5 (4 (1) (3)) (2)) (5 (4 (1) (3)) (2))) 1)
!(== (check-equal (5 (4 (1) (3)) (2)) (5 (4 (1) (9)) (2))) 0)
!(== (check-equal (5 (4 (1)) (2)) (5 (4 (1) (3)) (2))) 0)


;; PATH SUM
(= (path-sum ()) 0)
(= (path-sum ($x)) $x)
(= (path-sum ($node $left $right)) (
    + (+ $node (path-sum $left)) (path-sum $right)
))


!(path-sum (5 (4 (1) (3)) (2)))


;; MAX DEPTH OF A TREE
(= (max $x $y) (if (> $x $y) $x $y))
(= (depth ()) 0)
(= (depth ($x)) 1)
(= (depth ($node $left $right)) (
    max (+ 1 (depth $left)) (+ 1 (depth $right))
))

!(depth (5 (4) (2)))

; TESTS
!(== (depth ()) 0)
!(== (depth (5)) 1)
!(== (depth (5 (4) ())) 2)
!(== (depth (5 () (6))) 2)
!(== (depth (5 (4) (6))) 2)
!(== (depth (5 (4 (3) ()) ())) 3)
!(== (depth (5 () (6 () (7)))) 3)
!(== (depth (5 (4 (3) ()) (6 (7) ()))) 3)
!(== (depth (5 (4 (3 (2) ()) ()) ())) 4)
!(== (depth (5 (4 (2) ()) (6 (7) ()))) 3)

!(== (max 3 7) 7)
!(== (max 9 1) 9)
!(== (max 5 5) 5)
