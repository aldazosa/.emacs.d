(add-hook 'sql-mode-hook
          (lambda ()
            (sql-set-product 'postgres)))

(defun local-comment-auto-fill ()
  (auto-fill-mode 1)
  (set (make-local-variable 'comment-auto-fill-only-comments) t))

(require 'highlight-symbol)

(defun add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(add-hook 'sql-mode-hook (lambda ()
                            ;; (flyspell-prog-mode)
                            (local-comment-auto-fill)
                            (add-watchwords)
                            (highlight-symbol-mode)))

(diminish 'highlight-symbol-mode)

(provide 'setup-sql)
