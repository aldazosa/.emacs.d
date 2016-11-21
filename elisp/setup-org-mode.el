(require 'ox-latex)

(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))

(add-to-list 'org-latex-classes
             '("xfc-article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")))

(setq org-todo-keywords
 '((sequence
    "TODO(t)"  ; next action
    "STARTED(s)"
    "WAITING(w@/!)"
    "CARLOS(c)"
    "MIGUEL(m)"
    "SOMEDAY(.)" "|" "DONE(x!)" "CANCELLED(c@)")
   (sequence "LEARN" "TRY" "TEACH" "|" "COMPLETE(x)")
   (sequence "TOSKETCH" "SKETCHED" "|" "POSTED")
   (sequence "TODELEGATE(-)" "DELEGATED(d)" "|" "COMPLETE(x)")))

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "green" :weight bold))
        ("DONE" . (:foreground "cyan" :weight bold))
        ("WAITING" . (:foreground "red" :weight bold))
        ("SOMEDAY" . (:foreground "gray" :weight bold))
        ("CARLOS" . (:foreground "tomato" :weight bold))
        ("MIGUEL" . (:foreground "chocolate" :weight bold))))

(setq org-log-done 'time)

(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-agenda-files (list "~/org/xfc.org"
                             "~/org/extras.org"))

(provide 'setup-org-mode)
