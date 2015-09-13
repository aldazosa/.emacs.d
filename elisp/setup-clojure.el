(eval-after-load 'clojure-mode
  '(progn
     (define-key clojure-mode-map (kbd "C-c M-;") 'insert-ignore-form)
     (define-key clojure-mode-map (kbd "C-c C-f") 'nrepl-eval-expression-at-point-in-repl)))

(add-hook 'clojure-mode-hook (lambda ()
                               (dolist (el '(("\\(partial\\)[[:space:]]"     . "Ƥ")
                                             ;;
                                             ("\\(#\\){"                     . "∈")
                                             ("\\(#\\)("                     . "ƒ")
                                             ("(\\(fn\\)[\[[:space:]]"       . "λ")
                                             ;;
                                             ("\\(comp\\)[[:space:]]"        . "·")
                                             ("(\\(not\\)[[:space:]]"        . "¬")
                                             ("\\(->\\)[[:space:]]"          . "→")
                                             ("\\(<=\\)[[:space:]]"          . "≤")
                                             ("\\(>=\\)[[:space:]]"          . "≥")
                                             ("\\(not=\\)[[:space:]]"        . "≠")
                                             ("\\(identical\\?\\)[[:space:]]". "≡")
                                             ("\\(every\\?\\)[[:space:]]"    . "∀")
                                             ("\\(true\\)[[:space:]]"        . "т")
                                             ("\\(true\\))"                  . "т")
                                             ("\\(true\\))[ \t\n]"           . "т")
                                             ("\\(false\\)[[:space:]]"       . "ғ")
                                             ("\\(false\\))"                 . "ғ")
                                             ("\\(false\\))[ \t\n]"          . "ғ")
                                             ("\\(:keys\\)[[:space:]]"       . "ӄ")))
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
  (insert "#_")
  (indent-sexp))

(require 'align-cljlet)

(provide 'setup-clojure)
