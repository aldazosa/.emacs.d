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

(defun open-line-here ()
  (interactive)
  (newline)
  (indent-for-tab-command)
  (forward-line -1)
  (end-of-line))

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

;; Taken from
;; http://blog.bookworm.at/2007/03/pretty-print-xml-with-emacs.html
(defun pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))

(defun insert-comment-annotation (tag)
  "Adds a comment annotation with the name of the user and the current date."
  (interactive)
  (let ((from (point)))
    (insert (concat tag ": "))
    (push-mark)
    (insert (concat "(MAM " (format-time-string "%Y-%m-%d") ")"))
    (comment-region from (point))
    (goto-char (mark))
    (pop-mark)))

(defun insert-fixme ()
  "Adds a FIXME comment annotation."
  (interactive)
  (insert-comment-annotation "FIXME"))

(defun insert-todo ()
  "Adds a TODO comment annotation."
  (interactive)
  (insert-comment-annotation "TODO"))

(provide 'defuns)
