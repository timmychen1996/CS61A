(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.
(define (map proc items)
  ( cond  ( (null? items) nil )
          ( else      ( cons  ( proc ( car  items ) )  ( map proc   (cdr items)        )        )         )
    )
  )

(define (cons-all first rests)
    (define ( add_to_first list)
       ( cons first list )
    )
    (  map   add_to_first   rests   )
)

(define (zip pairs)
  ( cond (  (null? pairs) (list pairs pairs ) )


  )
  )

;; Problem 17
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 17
  ( define ( create i s )
    ( cond ( (null? s) nil )
          (  else ( cons ( cons   i  ( cons ( car s ) nil ) )   ( create (+ i 1)  (cdr s )          )  ) ) 
      )
  )
  ( create 0 s )
)
  ; END PROBLEM 17

;; Problem 18
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 18
  ( cond ( ( null? denoms) nil )
         ( ( = (car denoms) total )   (cons ( cons (car denoms) nil ) (list-change total  (cdr denoms)) ) )
         ( ( > (car denoms) total ) ( list-change total  (cdr denoms) ) )
         ( else   (append ( cons-all (car denoms ) (list-change (- total (car denoms ) ) denoms) ) 
                            ( list-change total  (cdr denoms ) )
                  )
           )
  )
)
  ; END PROBLEM 18

;; Problem 19
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 19
          (cdr expr) 
         ; END PROBLEM 19
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           
           ; END PROBLEM 19
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           'replace-this-line
           ; END PROBLEM 19
           ))
        (else
         ; BEGIN PROBLEM 19
         'replace-this-line
         ; END PROBLEM 19
         )))
