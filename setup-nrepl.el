(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)

(setq nrepl-hide-special-buffers t)

(defun toggle-repl-stacktrace-popup (unused)
  (interactive "P")
  (setq nrepl-popup-stacktraces-in-repl (not nrepl-popup-stacktraces-in-repl)))

(setq nrepl-popup-stacktraces-in-repl t)

;;(add-to-list 'same-window-buffer-names "*nrepl*")

;; Support camel case
(add-hook 'nrepl-mode-hook 'subword-mode)

;; It's a lisp after all
(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
;; (add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))

(eval-after-load 'nrepl
                 '(progn
                   (setq lisp-indent-function 'clojure-indent-function)
                   (define-key nrepl-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)))

;;(define-key nrepl-mode-map (kbd "<return>") 'nrepl-paredit-return)

(provide 'setup-nrepl)
