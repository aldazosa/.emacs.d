(add-hook 'cider-mode-hook 'eldoc-mode)
(add-hook 'cider-mode-hook 'subword-mode)
(add-hook 'cider-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)

(add-hook 'cider-repl-mode-hook 'eldoc-mode)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(setq nrepl-hide-special-buffers t)
(setq cider-server-command "lein trampoline repl :headless")
(setq cider-repl-print-length 42)

(defun my-cider-insert-defun-in-repl ()
  (interactive)
  (cider-insert-defun-in-repl 1)
  (cider-switch-to-last-clojure-buffer))

(eval-after-load 'cider
                 '(progn
                   (setq lisp-indent-function 'clojure-indent-function)
                   ;; (define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)
                   (define-key cider-mode-map (kbd "C-c M-f") 'cider-pprint-eval-defun-at-point)
                   (define-key cider-mode-map (kbd "C-c C-f") 'my-cider-insert-defun-in-repl)))

;; When developing leiningen plugins things we cant use trampoline
;; (setq nrepl-server-command "lein repl :headless")

(setq cider-repl-use-clojure-font-lock t)

(provide 'setup-cider)
