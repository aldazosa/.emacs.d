;; A nice font
(set-default-font "Anonymous pro 14")
;;(set-default-font "Inconsolata 14")

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

(provide 'appearance)
