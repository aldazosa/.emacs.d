
(require 'setup-lisp)

(add-hook 'emacs-lisp-mode-hook (lambda()
                                  (lisp-defaults)
                                  (turn-on-eldoc-mode)))
(provide 'setup-elisp)
