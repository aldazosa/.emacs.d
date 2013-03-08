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
  '(define-key clojure-mode-map (kbd "M-t") 'transpose-words-with-hyphens))

(require 'pretty-lambdada)

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

(add-hook 'clojure-mode-hook '(lambda ()
                                (turn-on-pretty-lambda-mode)
                                (rainbow-delimiters-mode)))

;; (eval-after-load 'clojure-mode
;;   `(defvar clojure-mode-syntax-table
;;      (let ((table (copy-syntax-table clojure-mode-syntax-table)))
;;        (modify-syntax-entry ?ƒ "w")
;;        (modify-syntax-entry ?∈ "w")
;;        table)))

;; (eval-after-load 'clojure-mode
;;                  '(progn
;;                    (define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)))

(provide 'setup-clojure)
