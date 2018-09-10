#lang racket

(define (hello-world) "helloworld")

(module+ main
  (displayln (hello-world)))
