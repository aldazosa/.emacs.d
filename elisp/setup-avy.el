(require 'avy)

(autoload 'avy-goto-word-or-subword-1 "avy")
(global-set-key (kbd "C-;") 'avy-goto-word-or-subword-1)

(provide 'setup-avy)
