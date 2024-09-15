(import (scheme base)
        (scheme write)
        (scheme read)
        [only [hoot ffi] procedure->external]
        (hoot eval)
        (repl geiser)
        (repl websocket))

(define ws (make-websocket! "ws://localhost:1338"))

(define (ws-on-message event)
  (let* ((data (event-data event))
         (in (open-input-string data))
         (expr (read in)))
        (ws-send! ws (write-to-string (eval expr (current-environment))))
    ))

(ws-on-message! ws (procedure->external ws-on-message))

#;(append-child! (document-body) (make-text-node "Hello"))
