(provide 'setup-flyspell)

(defun toggle-dictionary ()
  (interactive)
  (let ((current ispell-current-dictionary))
    (ispell-change-dictionary (if (string= current "spanish") "english" "spanish"))))

(ispell-change-dictionary "english")

(add-hook 'java-mode-hook (lambda ()
                                  (ispell-change-dictionary "spanish")))
