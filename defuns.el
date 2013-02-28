(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "<C-return>") 'open-line-above)
(global-set-key (kbd "<C-S-return>") 'open-line-below)

(defun what-face (pos)
  "Return the font-lock face information at the current point
   Thanks to Miles Bader <miles@lsi.nec.co.jp> for
   this (gnus.emacs.help)"
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face
        (message "Face: %s" face)
      (message "No face at %d" pos))))

(provide 'defuns)
