;; Taken from http://whattheemacsd.com//setup-dired.el-02.html

(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(eval-after-load 'dired
  '(progn
     (define-key dired-mode-map
       (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)
     (define-key dired-mode-map
       (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)))

;; Recursive delete, but ask nicely
(setq dired-recursive-deletes 'top)

;; Auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(provide 'setup-dired)
