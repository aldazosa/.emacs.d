(add-hook 'sql-mode-hook
          (lambda ()
            (sql-set-product 'postgres)))

(defvar sql-database-list
  '(("escuela" . xfc/sql-escuela)
    ("ciencias" . xfc/sql-ciencias)))

(defun connect-to-database (database)
  (funcall (cdr (assoc database sql-database-list))))

(defun connect-to ()
  (interactive)
  (connect-to-database (completing-read "Choose a database: " sql-database-list)))

(setq sql-connection-alist
      '((escuela (sql-product  'postgres)
                 (sql-port 5432)
                 (sql-server "localhost")
                 (sql-user "chronno")
                 (sql-database "escuela"))
        (ciencias (sql-product  'postgres)
                  (sql-port 5432)
                  (sql-server "localhost")
                  (sql-user "chronno")
                  (sql-database "ciencias"))))

(defun xfc/sql-escuela ()
  (interactive)
  (setq sql-product 'postgres)
  (sql-connect 'escuela))

(defun xfc/sql-ciencias ()
  (interactive)
  (setq sql-product 'postgres)
  (sql-connect 'ciencias))

(defun local-comment-auto-fill ()
  (auto-fill-mode 1)
  (set (make-local-variable 'comment-auto-fill-only-comments) t))

(require 'highlight-symbol)

(defun add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(add-hook 'sql-mode-hook (lambda ()
                            ;; (flyspell-prog-mode)
                            (local-comment-auto-fill)
                            (add-watchwords)
                            (highlight-symbol-mode)))

(diminish 'highlight-symbol-mode)

(defun sqli-clean-output (output)
  (replace-regexp-in-string "=#\\(.*\\)┌"
                            "=#\n┌"
                            output))

(defun sqli-add-hooks ()
  (add-hook 'comint-preoutput-filter-functions
            'sql-add-newline-first))

(add-hook 'sql-interactive-mode-hook 'sqli-add-hooks)

(defun clear-sqli-buffer ()
  (interactive)
  (erase-buffer)
  (comint-send-input))

(add-hook 'sql-interactive-mode-hook (lambda ()
                                       (local-set-key (kbd "C-c M-o") 'clear-sqli-buffer)))

(defadvice sql-send-region (after sql-store-in-history)
  "The region sent to the SQLi process is also stored in the history."
  (let ((history (buffer-substring-no-properties start end)))
    (save-excursion
      (set-buffer sql-buffer)
      ;; (message history)
      (if (and (funcall comint-input-filter history)
               (or (null comint-input-ignoredups)
                   (not (ring-p comint-input-ring))
                   (ring-empty-p comint-input-ring)
                   (not (string-equal (ring-ref comint-input-ring 0)
                                      history))))
          (ring-insert comint-input-ring history))
      (setq comint-save-input-ring-index comint-input-ring-index)
      (setq comint-input-ring-index nil))))

(ad-activate 'sql-send-region)

(provide 'setup-sql)
