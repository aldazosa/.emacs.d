(eval-after-load 'clojure-mode
                 '(progn
                    (define-key clojure-mode-map (kbd "ESC M-;") 'insert-ignore-form)))

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
                                                   ("\\b\\(true\\)\\b"             . "т")
                                                   ("\\b\\(false\\)\\b"             . "ғ")
                                                   ("\\(:keys\\)[[:space:]]"       . "ӄ")
                                                   ("\\(:strs\\)[[:space:]]"       . "ʂ")))
                                             (font-lock-add-keywords nil
                                                                     `((,(car el)
                                                                        (0 (progn (compose-region (match-beginning 1)
                                                                                                  (match-end 1)
                                                                                                  ,(cdr el))
                                                                                  nil))))))))

(setq clojure-indent-style :always-indent)
(define-clojure-indent
  (->> 0))
(require 'clj-refactor)

(add-hook 'clojure-mode-hook
          '(lambda ()
                   (rainbow-delimiters-mode)
                   (set (make-local-variable 'font-lock-extra-managed-props) '(composition))
                   (clj-refactor-mode 1)
                   (yas-minor-mode-on)
                   (cljr-add-keybindings-with-prefix "C-c C-m")))

(defun insert-ignore-form ()
  (interactive)
  (insert "#_")
  (indent-sexp))

(provide 'setup-clojure)
