(
 (plt:framework-pref:drracket:language-settings ((-32768) (#6(#t print mixed-fraction-e #f #t debug) (default) #0() #f #t #t ((test) (main)) #t)))
 (|plt:framework-pref:MacroStepper:Frame:Width| 700)
 (|plt:framework-pref:MacroStepper:Frame:Height| 600)
 (readline-input-history
  (
   #"(- (sub1 (expt 2 32)) 15)"
   #"(check-equal? (sub1 (expt 2 32)) (4294967295))"
   #"(expt 2 32)"
   #"(sub1 (expt 2 32))"
   #"exirt"
   #"(asm-interp\n    (prog (Mov 'rax 'r8)\n          (Mov 'rax 'rcx)\n          (Mov 'rcx 'r8)\n          (Ret)))"
   #"(require a86/ast)"
   #"(asm-interp\n    (prog (Mov 'rax 'r8)\n          (Mov 'rax 'rcx)\n          (Mov 'rcx 'r8)\n          (Ret)))"
   #"(first '(+ 1 2))"
   #"(first (+ 1 2))"
   #"'(+ 1 2)"
   #"(cadr (list 3 4 5))"
   #"(cdr (list 3 4 5))"
   #"(cadr (cons 3 (cons 4 5)))"
   #"(cdr (cons 3 (cons 4 5)))"
   #"(cdr (cons 3 4 5))"
   #"(rest (list 3 4 5))"
   #"(second (list 3 4))"
   #"(cons 1 2)"
   #"(cons 1 2 3 4)"
   #"(sexpr->expr 123)"
   #"(expr-integers 1)"
   #"(sexpr->expr 123)"
   #"(+ 1 0)"
   #"(5 + 1)"
   #"5 + 1"
   #"x"
   #"(+ (+ 1) (+ ) \n  )"
   #"(+ (+) 1)"
   #"(+ (+) (+ 1))"
   #"(+ (+) (+ 1) (+) (+ 2 3) 1)"
   #"(match (thing 7) \n    [_ 9]\n    [(thing x) x])"
   #"(struct thing (content))"
   #"(match (thing 7)\n    [(thing x) x]\n    [_ 9])"
   #"(define x 3 + 4)"
   #"(if (= 2 3) (3 + 4) (+ 3 4))"
   #"(+ (3) (4))"
   #"(3 + 4)"
   #"(define things 9 10)"
   #"(+ 3 \"4\")"
   #"i(define x 3 + 4)"
   #"(string-length \"(+ x 4)\")"
   #"(define x 3)"
   #"(+ x 4)"
   #"(+ 3 3 1)"
   #"(+ 10 (+ 2 4))"
   #"(read)"
   #"read"
   #"(test 5 10)"
   #"(test 5)"
   #"(define test (compose list void))"
   #"(define test (compose void list))"
   #"(compose void list)"
   #"(insert-desc 2 (list 1 3 4 5))"
   #"(define (insert-desc n xs)\n    (match xs\n      ['() (list n)]\n      [(list x) \n       (if (> n x) (list n x) (list x n))]\n      [(cons x xs) \n       (if (> n x) (cons (list n x) xs) (insert-desc n xs))]\n      )\n    )"
   #"insert-desc 5 "
   #"(load \"03-simple-lists.rkt\")"
   #"(number->string sqr 5)"
   #"(number->string sqr)"
   #"test"
   #"(define test (-> number->string sqr))"
   #"(-> number->string sqr)"
   #"(-> number->string)"
   #"(pipe (list number->string sqr add1))"
   #"(pipe (list number->string sqr add1)))"
   #"(pipe (list number->string sqr add1)) 5)"
   #"(define (pipe fs)\n    (-> fs)\n    )"
   #"(list ())"
   #"list ()"
   #"(sort-desc (list 20 30 40 50 60))"
   #"(define (sort-desc xs)\n    (match xs\n      ['() '()]\n      [(list x) (list x)]\n      [(list x1 x2)\n       (if (> x1 x2) (list x1 x2) (list x2 x1))]\n      [(cons x1 xs) \n       (if (> x1 (car xs)) (sort-desc xs) (cons (list (car xs) x1) (sort-desc (cdr xs))))]\n      )\n    )"
   #"(sort-desc (list 20 30 40 50 60 70 80))"
   #"(sort-desc (list 20 30 40 50))"
   #"(define (sort-desc xs)\n    (match xs\n      ['() '()]\n      [(list x) (list x)]\n      [(list x1 x2)\n       (if (> x1 x2) (list x1 x2) (list x2 x1))]\n      [(cons x1 (cons x2 xs)) \n       (if (> x1 x2) (cons (list x1 x2) (sort-desc xs)) (cons (list x2 x1) (sort-desc xs)))]\n      )\n    )"
   #"(cons 10 (cons 20 (list 30 40 50)))"
   #"(cons 10 (cons 20 (list 30)))"
   #"(list 1 2)"
   #"(minimizeHelper \"ajsdhfskajdhfsdf\" string-length '(\"abc\", \"bc\"))"
   #"(minimizeHelper \"ajsdhfskajdhfsdf\" string-length '(\"a\", \"bc\"))"
   #"(define (minimizeHelper ans f xs)\n    (match xs\n      ['() ans]\n      [(cons x xs) (if (>= (f ans) (f x)) x ans)]\n      )\n    )"
   #"(car my-list)"
   #"(define my-list '(1 2 3 4 5))"
   #"(longer \"he\" \"hello\")"
   #"longer \"he\" \"hello\""
   #"(define (longer s1 s2)\n    (if ((string-length s1) >= (string-length s2))\n      s1 \n      s2)\n    )"
   #"(string-length \"hello\")"
   #"string-length \"hello\""
   #"string-length"
   #"(fib 2)"
   #"(define (fib n)\n    (match n\n      [0 0]\n      [1 1]\n      [n (+ (fact (- n 1)) (fact (- n 2)))])\n    )"
   #"(fib 20)"
   #"fib 20"
   #"(fib 5)"
   #"(fib 10)"
   #"(define (fact n)\n    (match n \n      [0 1]\n      [n (* n (fact (- n 1)))]\n     )\n    1)"
   #"(fact 10)"
   #"(fact 1)"
   #"fact 1 10"
   #"fact 1"
   #"fact 10"
   #"(define (fact n)\n    (match n \n      [0 1]\n      [n (* n (fact (- n 1)))]\n     )\n    )"
   #"(define (fact n)\n    (match n \n      [0 1]\n      [x (* x (fact (- x 1)))]\n     )\n    1)"
   #":q"
   #"fact 5"
   #"fact 20"
   #"(define (fact n)\n    (match n \n      [0 1]\n      [1 1]\n      [x (* x (fact (- x 1)))]\n     )\n    1)"
   #"(define (fact n)\n  )"
   #"let (x 10)"
   #"let x 10"
   #"(- 10 1)"
   #"- 10 1"
   #"10 - 1"
   #"(define (fact n)\n    (match n \n      [0 1]\n      [1 1]\n      [x (x * fact (x-1))]\n     )\n    1)"
   #"https://www.cs.umd.edu/class/fall2024/cmsc430/Schedule.htm"
   #"https://www.cs.umd.edu/class/fall2024/cmsc430/Schedule.html"
  ))
 (|plt:DrRacket 8.6-splash-max-width| 1016)
 (plt:framework-pref:drracket:window-position #hash((#f . (0 627 99)) (((0 0 1920 1080)) . (0 627 99))))
 (plt:framework-pref:framework:exit-when-no-frames #t)
 (plt:framework-pref:framework:standard-style-list:font-size #2(#hash((((1920 1080)) . 12) (((1280 720)) . 12)) 12))
 (plt:framework-pref:framework:color-scheme classic)
 (plt:framework-pref:framework:recently-opened-files/pos ((#"/home/jjavillo/classes/cmsc430/a86-basics/03-stacks.rkt" 0 0) (#"/home/jjavillo/classes/cmsc430/a86-basics/01-registers.rkt" 0 0) (#"/home/jjavillo/classes/cmsc430/racket-basics/07-exprs.rkt" 0 0) (#"/home/jjavillo/classes/cmsc430/racket-basics/06-btnumbers.rkt" 0 0)))
 (plt:framework-pref:drracket:recent-language-names (("Determine language from source" #6(#t print mixed-fraction-e #f #t debug) (default) #0() #f #t #t ((test) (main)) #t)))
 (plt:framework-pref:plt:debug-tool:stack/variable-area 9/10)
 (plt:framework-pref:drracket:most-recent-lang-line "#lang racket\n")
 (plt:framework-pref:drracket:window-size #hash((((0 0 1280 720)) . (#t 600 650)) (#f . (#t 600 650)) (((0 0 1920 1080)) . (#t 600 650))))
 (plt:framework-pref:drracket:unit-window-size-percentage 1/2)
 (plt:framework-pref:framework:verify-exit #t)
 (plt:framework-pref:drracket:recently-closed-tabs ((#"/home/jjavillo/classes/cmsc430/a86-basics/03-stacks.rkt" 3808 3808) (#"/home/jjavillo/classes/cmsc430/a86-basics/01-registers.rkt" 575 575) (#"/home/jjavillo/classes/cmsc430/racket-basics/07-exprs.rkt" 4276 4328) (#"/home/jjavillo/classes/cmsc430/racket-basics/06-btnumbers.rkt" 1197 1197)))
 (plt:framework-pref:drracket:console-previous-exprs
  (
   ("(sexpr->expr 'x)")
   ("(expr-free-vars (sexpr->expr 'x))")
   ("expr-free-vars (sexpr->expr 'x))")
   ("(expr-free-vars (sexpr->expr 'x))")
   ("(expr-free-vars (sexpr->expr '((lambda (x) x) 123)))")
   ("(t3 '(1))")
   ("t3")
   ("pop-sum-rax")
   ("t3")
   ("(display pop-sum-rax)")
   ("exit")
  ))
)
