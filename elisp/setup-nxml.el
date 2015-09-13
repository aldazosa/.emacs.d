(setq auto-mode-alist (append '(("\\.jwc$" . nxml-mode)
                                ("\\.page$" . nxml-mode)
                                ("\\.dtml$" . nxml-mode)
                                ("\\.library$" . nxml-mode)
                                ("\\.application$" . nxml-mode)
                                ("\\.html$" . nxml-mode)
                                ("\\.tml$" . nxml-mode)
                                ("\\.xml$" . nxml-mode))
                              auto-mode-alist))

(eval-after-load 'nxml-mode
                 '(progn
                   (define-key nxml-mode-map (kbd "C-x C-j") 'switch-to-companion-file)))

(provide 'setup-nxml)
