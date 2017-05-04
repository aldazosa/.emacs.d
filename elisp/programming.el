(defun add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(require 'which-func)
(setq which-func-modes t)
(which-function-mode 1)

(setq reb-re-syntax 'string)

(defun local-comment-auto-fill ()
  (auto-fill-mode 1)
  (set (make-local-variable 'comment-auto-fill-only-comments) t))

(require 'highlight-symbol)

(add-hook 'prog-mode-hook (lambda ()
                            ;; (flyspell-prog-mode)
                            (local-comment-auto-fill)
                            (add-watchwords)
                            (highlight-symbol-mode)))

(diminish 'highlight-symbol-mode)

;; CSS indent
(setq css-indent-offset 2)

;; Git modes
(require 'gitconfig-mode)
(require 'gitignore-mode)
(require 'gitattributes-mode)

(provide 'programming)
