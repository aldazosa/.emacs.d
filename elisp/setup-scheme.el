(require 'scheme)

(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Switch to interactive Scheme buffer." t)
(setq auto-mode-alist (append '(("\\.ss" . scheme-mode)
                                ("\\.scm" . scheme-mode))
                              auto-mode-alist))

(setq scheme-program-name "petite")

(add-hook 'scheme-mode-hook '(lambda ()
                                (rainbow-delimiters-mode)))

(provide 'setup-scheme)
