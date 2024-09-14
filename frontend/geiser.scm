(define-library (geiser)
  (import (scheme base)
          (scheme write)
          (hoot eval)
          (my-library)
          (only (hoot control) call-with-prompt abort-to-prompt))
  (export write-to-string geiser:add-to-load-path geiser:eval)
  (begin
    (define (write-to-string obj)
      (let ((out (open-output-string)))
        (write obj out)
        (get-output-string out)))

    (define (geiser:add-to-load-path x) #t)

    (define (geiser:eval module form . rest)
      (call-with-prompt "prompt"
        (lambda ()
          (let* ((out (open-output-string))
                 (result (parameterize ((current-output-port out))
                           (with-exception-handler
                               (lambda (err) (abort-to-prompt "prompt" err))
                             (lambda ()
                               (eval form (current-environment)))))))
            `((result ,(write-to-string result))
              (output . ,(get-output-string out)))))
        (lambda (k err) `((result "#f") (output . ,(write-to-string err))))
        ))
    ))
