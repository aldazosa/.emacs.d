(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)

(setq nrepl-hide-special-buffers t)

(setq nrepl-popup-stacktraces nil)

;;(add-to-list 'same-window-buffer-names "*nrepl*")

;; Support camel case
(add-hook 'nrepl-mode-hook 'subword-mode)

;; It's a lisp after all
(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

(provide 'setup-nrepl)
