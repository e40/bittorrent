
(eval-when (compile eval load)
  (require :datetime)
  (require :osi)
  (require :shell)
  (require :smtp))

(defpackage :bittorrent
  (:use #:common-lisp #:excl #:excl.osi #:excl.shell
	#:util.date-time #:net.post-office))

(in-package :bittorrent)

(deftype usb8 () '(unsigned-byte 8))
(deftype ausb8 () '(simple-array usb8 (*)))

(defmacro make-usb8 (size &rest rest)
  `(make-array ,size :element-type 'usb8 ,@rest))
