(defun add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(require 'which-func)
(setq which-func-modes t)
(which-function-mode 1)

(defun local-comment-auto-fill ()
  (auto-fill-mode 1)
  (set (make-local-variable 'comment-auto-fill-only-comments) t))

(add-hook 'prog-mode-hook (lambda ()
                            (flyspell-prog-mode)
                            (local-comment-auto-fill)
                            (add-watchwords)))

(provide 'programming)
