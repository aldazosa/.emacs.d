(global-set-key (kbd "C-c o r") 'nrepl-switch-to-repl-buffer)

;; From https://github.com/stuartsierra/dotfiles/blob/master/.emacs

(defun nrepl-refresh ()
  (interactive)
  (set-buffer "*nrepl*")
  (goto-char (point-max))
  (insert "(clojure.tools.namespace.repl/refresh)")
  (nrepl-return))

(defun nrepl-reset ()
  (interactive)
  (set-buffer "*nrepl*")
  (goto-char (point-max))
  (insert "(user/reset)")
  (nrepl-return))
