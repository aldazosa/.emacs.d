;; From https://github.com/stuartsierra/dotfiles/blob/master/.emacs

(defun nrepl-buffer-name ()
  (lexical-let ((project-name (with-current-buffer
                                (get-buffer (nrepl-current-connection-buffer))
                                (nrepl--project-name nrepl-project-dir))))
               (format "*nrepl%s%s*" nrepl-buffer-name-separator project-name)))

;; Change these to use (nrepl-eval INPUT &optional NS SESSION)?
(defun nrepl-refresh ()
  (interactive)
  (set-buffer (nrepl-buffer-name))
  (goto-char (point-max))
  (insert "(clojure.tools.namespace.repl/refresh)")
  (nrepl-return))

(defun nrepl-reset ()
  (interactive)
  (set-buffer (nrepl-buffer-name))
  (goto-char (point-max))
  (insert "(user/reset)")
  (nrepl-return))

;; From emacs live

(eval-after-load 'clojure-mode
  '(defvar clojure-mode-with-hyphens-as-word-sep-syntax-table
     (let ((st (make-syntax-table clojure-mode-syntax-table)))
       (modify-syntax-entry ?- "w" st)
       st)))

(defun transpose-words-with-hyphens (arg)
  "Treat hyphens as a word character when transposing words"
  (interactive "*p")
  (with-syntax-table clojure-mode-with-hyphens-as-word-sep-syntax-table
    (transpose-words arg)))

(eval-after-load 'clojure-mode
                 '(progn
                   (define-key clojure-mode-map (kbd "M-t") 'transpose-words-with-hyphens)
                   (define-key clojure-mode-map (kbd "C-c u") 'nrepl-reset)
                   (define-key clojure-mode-map (kbd "C-c o r") 'nrepl-switch-to-repl-buffer)
                   (define-key clojure-mode-map (kbd "C-c M-;") 'insert-ignore-form)))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "λ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\)("
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "ƒ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\){"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∈")
                               nil))))))

(add-hook 'clojure-mode-hook (lambda ()
                                     (dolist (el '(
                                                   ;;("(\\(fn\\)[[:space:]]"         . "ƒ")
                                                    ("\\(partial\\)[[:space:]]"     . "Ƥ")
                                                    ("\\(comp\\)[[:space:]]"        . "·")
                                                    ;; ("\\(#\\)("                     . "λ")
                                                    ("(\\(not\\)[[:space:]]"        . "¬")
                                                    ("\\(->\\)[[:space:]]"          . "→")
                                                    ;; ("\\(->>\\)[[:space:]]"         . "↠")
                                                    ("\\(<=\\)[[:space:]]"          . "≤")
                                                    ("\\(>=\\)[[:space:]]"          . "≥")
                                                    ("\\(not=\\)[[:space:]]"        . "≠")
                                                    ("\\(identical\\?\\)[[:space:]]". "≡")
                                                    ;;("[^\\]\\(~\\)"                 . "˷")
                                                    ;;("\\(contains\\?\\)[[:space:]]" . "∈")
                                                    ("\\(every\\?\\)[[:space:]]"    . "∀")
                                                    ;;("[^\\]?\\(%\\)"                . "¯")
                                                    ("\\(true\\)[[:space:]]"        . "т")
                                                    ("\\(true\\))"                  . "т")
                                                    ("\\(true\\))[ \t\n]"           . "т")
                                                    ("\\(false\\)[[:space:]]"       . "ғ")
                                                    ("\\(:keys\\)[[:space:]]"       . "ӄ")
                                                    ;;("\\(nil\\)[[:space:]]"         . "∅")
                                                    ))

                                              (font-lock-add-keywords nil `((,(car el)
                                                                             (0 (progn (compose-region (match-beginning 1)
                                                                                                       (match-end 1)
                                                                                                       ,(cdr el))
                                                                                       nil))))))))

(add-hook 'clojure-mode-hook '(lambda ()
                                      (rainbow-delimiters-mode)
                                      (set (make-local-variable 'font-lock-extra-managed-props) '(composition))))

(defun insert-ignore-form ()
  (interactive)
  (insert "#_"))

(require 'align-cljlet)

(provide 'setup-clojure)
