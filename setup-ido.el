(require 'ido)
(ido-mode t)
(set-default 'imenu-auto-rescan t)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; Fuzzy matching rocks
(setq ido-enable-flex-matching t)

(provide 'setup-ido)
