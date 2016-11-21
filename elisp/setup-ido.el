(ido-mode t)
(set-default 'imenu-auto-rescan t)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; Fuzzy matching rocks
(setq ido-enable-flex-matching t)

(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(provide 'setup-ido)
