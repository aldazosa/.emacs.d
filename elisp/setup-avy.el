(require 'avy)

(autoload 'avy-goto-char "avy")
(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "M-g f") 'avy-goto-line)

(provide 'setup-avy)
