(require 'ox-latex)

(setq org-startup-indented t)
(setq org-special-ctrl-a/e t)
(setq org-use-speed-commands t)
(setq org-startup-folded "nofold")

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
    "NEXT(n)"
    "STARTED(s)"
    "WAITING(w@/!)"
    "CARLOS(c)"
    "MIGUEL(m)"
    "MARTHA(M)"
    "ERICK(E)"
    "CINTHIA(C)"
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

(org-defkey org-mode-map (kbd "C-M-o") 'open-line-below)

(setq org-agenda-files (list "~/org/xfc.org"
                             "~/org/extras.org"))

(require 'window-margin)

(add-hook 'org-mode-hook (lambda ()
                           (setq window-margin-width 120)
                           (window-margin-mode 1)))

(setq org-src-fontify-natively t)

(provide 'setup-org-mode)
