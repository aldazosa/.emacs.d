(require 'setup-lisp)

(add-hook 'emacs-lisp-mode-hook (lambda()
                                  (lisp-defaults)
                                  (turn-on-eldoc-mode)))
(add-hook 'after-save-hook
          (lambda ()
            (if (eq major-mode 'emacs-lisp-mode)
                (save-excursion (byte-compile-file buffer-file-name)))))

(provide 'setup-elisp)
