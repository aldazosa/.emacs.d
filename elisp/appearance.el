;; A nice font
(set-frame-font "Anonymous pro 14")
(setq default-frame-alist '((font . "Anonymous pro 14")))
;;(set-frame-font "Inconsolata 14")

(setq visible-bell t
      font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

(set-face-background 'region "#464740")

;; Highlight current line
(global-hl-line-mode 1)

;; Highlight matching parentheses
(show-paren-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Stop wasting real estate
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Nice theme
(load-theme 'zen-and-art t)

;; Never loose the cursor
(beacon-mode 1)
(setq beacon-color "dark slate blue")
(provide 'appearance)
