(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)

(setq nrepl-hide-special-buffers t)
(setq nrepl-server-command "lein trampoline repl :headless")

;; When developing leiningen plugins things we cant use trampoline
;; (setq nrepl-server-command "lein repl :headless")

(defun nrepl-send-to-repl (arg)
  "Send the appropriate forms to the repl to be evaluated."
  (interactive "P")
  (save-excursion
   (cond
    ;; Region selected - evaluate region
    ((not (equal mark-active nil))
     (copy-region-as-kill (mark) (point)))
    ;; At/before sexp - evaluate next sexp
    ((or (looking-at "\s(")
         (save-excursion
          (ignore-errors (forward-char 1))
          (looking-at "\s(")))
     (forward-list 1)
     (let ((end (point))
           (beg (save-excursion
                 (backward-list 1)
                 (point))))
       (copy-region-as-kill beg end)))
    ;; At/after sexp - evaluate last sexp
    ((or (looking-at "\s)")
         (save-excursion
          (backward-char 1)
          (looking-at "\s)")))
     (if (looking-at "\s)")
       (forward-char 1))
     (let ((end (point))
           (beg (save-excursion
                 (backward-list 1)
                 (point))))
       (copy-region-as-kill beg end)))
    ;; Default - evaluate enclosing top-level sexp
    (t (progn
        (while (ignore-errors (progn
                               (backward-up-list)
                               t)))
        (forward-list 1)
        (let ((end (point))
              (beg (save-excursion
                    (backward-list 1)
                    (point))))
          (copy-region-as-kill beg end)))))
   (set-buffer (nrepl-current-repl-buffer))
   (unless (eq (current-buffer) (window-buffer))
           (pop-to-buffer (current-buffer) t))
   (goto-char (point-max))
   (yank)
   (if arg (progn
            (nrepl-return)
            (other-window 1)))))

(defun nrepl-toggle-stacktrace-popup (unused)
  (interactive "P")
  (setq nrepl-popup-stacktraces-in-repl (not nrepl-popup-stacktraces-in-repl)))

;(setq nrepl-popup-stacktraces-in-repl nil)

;;(add-to-list 'same-window-buffer-names "*nrepl*")

(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook (lambda ()
                                   (subword-mode)
                                   (paredit-mode)
                                   (rainbow-delimiters-mode)
                                   (ac-nrepl-setup)))

(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))

(eval-after-load 'nrepl
                 '(progn
                   (setq lisp-indent-function 'clojure-indent-function)
                   (define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)
                   (define-key nrepl-mode-map (kbd "C-c C-f") 'nrepl-send-to-repl)))

;;(define-key nrepl-mode-map (kbd "<return>") 'nrepl-paredit-return)

(provide 'setup-nrepl)
