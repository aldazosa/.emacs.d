;; Make emacs help us write nice commit messages

(add-hook 'magit-log-edit-mode-hook (lambda ()
                                      (flyspell-mode)
                                      (auto-fill-mode)
                                      (setq fill-column 72)))

(provide 'setup-magit)
