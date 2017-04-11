
(in-package :user)

(defvar *files* '("bittorrent/bittorrent-common.cl"
		  "bittorrent/bencoding.cl"
		  "bittorrent/bittorrent.cl"))
    
(dolist (file *files*)
  (let ((f (compile-file file)))
    (push f *fasls*)
    (load f)))

#+ignore
(let ((full-fasl "bittorrent_full.fasl"))
  (format t ";; Creating ~a...~%" full-fasl)
  (with-open-file (s full-fasl :direction :output
		   :if-exists :supersede)
    (dolist (file *files*)
      (let ((fasl (merge-pathnames #p(:type "fasl") file)))
	(sys:copy-file fasl s)))))
