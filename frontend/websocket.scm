(define-library (websocket)
  (import (scheme base)
          (hoot ffi))
  (export make-websocket! ws-on-message! ws-on-open! ws-send! event-data)
  (begin
    (define-foreign make-websocket!
      "websocket" "make"
      (ref string) -> (ref extern))
    (define-foreign ws-on-message!
      "websocket" "onMessage"
      (ref extern) (ref extern) -> none)
    (define-foreign ws-on-open!
      "websocket" "onOpen"
      (ref extern) (ref extern) -> none)
    (define-foreign event-data
      "websocket" "eventData"
      (ref extern) -> (ref string))
    (define-foreign ws-send!
      "websocket" "send"
      (ref extern) (ref string) -> none)
    ))
