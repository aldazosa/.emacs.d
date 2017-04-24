(require 'avy)

(autoload 'avy-goto-char "avy")
(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "M-g f") 'avy-goto-line)

(require 'avy-zap)

(global-set-key (kbd "M-z") 'avy-zap-to-char-dwim)
(global-set-key (kbd "M-Z") 'avy-zap-up-to-char-dwim)

(provide 'setup-avy)
