(require 'highlight-symbol)

(add-hook 'sql-mode-hook
          (lambda ()
            (sql-set-product 'postgres)
            (local-comment-auto-fill)
            (highlight-symbol-mode)))

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
            'sqli-clean-output))

(add-hook 'sql-interactive-mode-hook 'sqli-add-hooks)

(defun clear-sqli-buffer ()
  (interactive)
  (erase-buffer)
  (comint-send-input))

(add-hook 'sql-interactive-mode-hook (lambda ()
                                       (local-set-key (kbd "C-c M-o") 'clear-sqli-buffer)))

(defun pop-to-sqli-buffer ()
  (interactive)
  (if (sql-find-sqli-buffer)
      (progn
        (pop-to-buffer sql-buffer)
        (goto-char (point-max)))
    (connect-to)))

(eval-after-load 'sql
  '(define-key sql-mode-map (kbd "C-c C-z") 'pop-to-sqli-buffer))

(defun eval-query ()
  (interactive)
  (let* ((start (save-excursion
                  (backward-paragraph)
                  (point)))
         (end (save-excursion
                (forward-paragraph)
                (point)))
         (query (buffer-substring-no-properties start end)))
    (with-current-buffer sql-buffer
      (save-excursion
        (goto-char (point-max))
        (insert (format "%s" query))
        (comint-send-input nil t)))))

(eval-after-load 'sql
  '(define-key sql-mode-map (kbd "C-c C-c") 'eval-query))

(provide 'setup-sql)
