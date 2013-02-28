;; Stop wasting real estate
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

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

;; Recursive delete, but ask nicely
(setq dired-recursive-deletes 'top)

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a before-save-hook, and that
might be bad."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))

;; Cleanup buffer before saving
(add-hook 'before-save-hook 'cleanup-buffer)


(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

(require 'google-this)
(google-this-mode 1)

(require 'google-translate)

(provide 'my-misc)
