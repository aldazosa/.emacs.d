(setq auto-mode-alist (append '(("\\.md$" . markdown-mode))
                              auto-mode-alist))

(add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode t)
            (flyspell-mode t)))

(provide 'setup-markdown)
