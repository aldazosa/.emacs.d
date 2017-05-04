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

(setq org-agenda-files (list "~/org/todo.org"))

(require 'window-margin)

(add-hook 'org-mode-hook (lambda ()
                           (setq window-margin-width 120)
                           (window-margin-mode 1)))

(setq org-src-fontify-natively t)

;; Clock tracking

(org-clock-persistence-insinuate)
(setq org-clock-history-length 30)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)

;; Change tasks to NEXT when clocking in
;; (setq org-clock-in-switch-to-state 'bh/clock-in-to-next) ;; Revisar como pasar a NEXT

;; Separate drawers for clocking and logs
;; (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))

;; Save clock data and state changes and notes in the LOGBOOK drawer
;; (setq org-clock-into-drawer t)

;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)
;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)
;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)

;;set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)

;;set colours for priorities
(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))

(define-key global-map (kbd "C-c c") 'org-capture)
;; (org-defkey org-mode-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
  '(("t" "todo" entry (file+headline "~/org/todo.org" "Tasks")
     "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n")
    ("n" "note" entry (file "~/org/refile.org")
     "* %? :NOTE:\n%U\n%a\n  %i" :clock-in t :clock-resume t)
    ("r" "review" plain (file "~/org/refile.org")
     "* %? TODO Review %c\n%U\n  %i" :immediate-finish t)))

(setq org-deadline-warning-days 7)
(setq org-agenda-span (quote fortnight)) ;; 14 days
(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
(setq org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
(setq org-agenda-todo-ignore-deadlines (quote all))
(setq org-agenda-todo-ignore-scheduled (quote all))

(setq org-agenda-sorting-strategy
  (quote
   ((agenda deadline-up priority-down)
    (todo priority-down category-keep)
    (tags priority-down category-keep)
    (search category-keep))))

;; (define-key ergoemacs-keymap (kbd "M-C-m") 'org-agenda)
;; (define-key ergoemacs-keymap (kbd "M-m") 'org-capture)
;; (define-key ergoemacs-keymap (kbd "M-,") 'org-clock-goto)
;; (define-key ergoemacs-keymap (kbd "M-C-,") 'org-clock-in)
;; (define-key ergoemacs-keymap (kbd "M-<") 'bh/clock-in-last-task)
;; (define-key ergoemacs-keymap (kbd "M-b") 'mlf/punch-in-or-out)


(provide 'setup-org-mode)
