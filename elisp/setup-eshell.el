(add-hook 'eshell-mode-hook (lambda ()
                              (set-face-foreground 'eshell-prompt "turquoise4")
                              (electric-pair-mode)))

(eshell-git-prompt-use-theme 'robbyrussell)

(setq eshell-aliases-file "~/.emacs.d/eshell.alias")

(require 'eshell-up)

;; From https://github.com/jimm/elisp/blob/master/eshell-customize.el

;; (defun pwd-repl-home (pwd)
;;   (interactive)
;;   (let* ((home (expand-file-name (getenv "HOME")))
;;    (home-len (length home)))
;;     (if (and
;;    (>= (length pwd) home-len)
;;    (equal home (substring pwd 0 home-len)))
;;   (concat "~" (substring pwd home-len))
;;       pwd)))

;; (defun curr-dir-git-branch-string (pwd)
;;   "Returns current git branch as a string, or the empty string if
;; PWD is not in a git repo (or the git command is not found)."
;;   (interactive)
;;   (when (and (eshell-search-path "git")
;;              (locate-dominating-file pwd ".git"))
;;     (let ((git-output (shell-command-to-string (concat "cd " pwd " && git branch | grep '\\*' | sed -e 's/^\\* //'"))))
;;       (concat " ["
;;               (if (> (length git-output) 0)
;;                   (substring git-output 0 -1)
;;                 "(no branch)")
;;               "] ")
;;       )))

;; (setq eshell-prompt-function
;;       (lambda ()
;;         (concat
;;          (propertize ((lambda (p-lst)
;;             (if (> (length p-lst) 3)
;;                 (concat
;;                  (mapconcat (lambda (elm) (if (zerop (length elm)) ""
;;                                             (substring elm 0 1)))
;;                             (butlast p-lst 3)
;;                             "/")
;;                  "/"
;;                  (mapconcat (lambda (elm) elm)
;;                             (last p-lst 3)
;;                             "/"))
;;               (mapconcat (lambda (elm) elm)
;;                          p-lst
;;                          "/")))
;;           (split-string (pwd-repl-home (eshell/pwd)) "/")) 'face `(:foreground "turquoise4"))
;;          (or (curr-dir-git-branch-string (eshell/pwd)))
;;          (propertize "# " 'face 'default))))

;; (setq eshell-highlight-prompt nil)

(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    ;; (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-!") 'eshell-here)

(defun eshell/x ()
  (insert "exit")
  (eshell-send-input)
  (delete-window))

(provide 'setup-eshell)
