(setq my-author-name "Mauricio Aldazosa Mariaca")
(setq user-full-name "Mauricio Aldazosa Mariaca")
(setq line-number-mode t)
(setq column-number-mode t)

(setq-default inhibit-startup-message t)

(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

(when window-system
  (mwheel-install))

;; Titles
(setq frame-icon-title-format (concat "Emacs  " (user-login-name) "@" (system-name)))
(setq frame-title-format (concat "Emacs  " (user-login-name) "@" (system-name)))

;; Cleanup buffer before saving
(add-hook 'before-save-hook 'cleanup-buffer)


(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

;; Don't disable commands
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(provide 'my-misc)
