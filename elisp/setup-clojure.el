(setq cider-cljs-lein-repl
      "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")

(eval-after-load 'clojure-mode
  '(progn
     (define-key clojure-mode-map (kbd "ESC M-;") 'insert-ignore-form)
     (setq clojure-indent-style :always-indent)))

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

(define-clojure-indent
  (some-> 1)
  (some->> 1)
  (->> 0)
  (-> 0)
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2)
  (b/validate 1)
  (b/valid? 1))

;; (put-clojure-indent 'context 1)

(provide 'setup-clojure)
