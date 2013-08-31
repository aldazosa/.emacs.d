;; Smart M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; Zap to char
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "M-Z") 'zap-to-char)

;; ;; Jump to a definition in the current file. (This is awesome)
;; (global-set-key (kbd "C-x C-i") 'ido-imenu)

;; ;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
;; (global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-p") 'find-or-create-file-at-point)
(global-set-key (kbd "C-x M-p") 'find-or-create-file-at-point-other-window)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Revert without any fuss
(global-set-key (kbd "M-<escape>")
                (lambda () (interactive) (revert-buffer t t)))

;; Edit file with sudo
(global-set-key (kbd "C-M-s") 'sudo-edit)

;; Copy file path to kill ring
(global-set-key (kbd "C-x M-w") 'copy-current-file-path)

;; Indentation help
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line -1)))

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c C-e") 'eval-and-replace)

;; Magit
(global-set-key (kbd "C-x m") 'magit-status)
(autoload 'magit-status "magit")

;; Clever newlines
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)
(global-set-key (kbd "C-o") 'open-line-here)

;; Sorting
(global-set-key (kbd "M-s l") 'sort-lines)

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; Buffer file functions
(global-set-key (kbd "C-x t") 'touch-buffer-file)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

;; Jump from file to containing directory
;; (global-set-key (kbd "C-x C-j") 'dired-jump) (autoload 'dired-jump "dired")
;; (global-set-key (kbd "C-x M-j") '(lambda () (interactive) (dired-jump 1))

(global-set-key (kbd "C-h") 'delete-backward-char)

;; switch to other frame
(global-set-key (kbd "C-x p") 'other-frame)

;; Move between panes with shift + arrows
(windmove-default-keybindings)

;; Regex search
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

;; Regular search
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(provide 'key-bindings)
