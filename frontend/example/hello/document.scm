(define-library (hello document)
  (export document-body
          make-text-node)
  (import (scheme base)
          (hoot ffi))

  (begin
    (define-foreign document-body
      "document" "body"
      -> (ref null extern))
    (define-foreign make-text-node
      "document" "createTextNode"
      (ref string) -> (ref null extern))))
