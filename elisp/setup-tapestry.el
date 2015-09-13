(defun switch-to-tml (java-file)
  (interactive)
  (find-file (replace-regexp-in-string "\\(.*\\)src/main/java\\(.*\\)/\\(.*\\).java" "\\1src/main/resources\\2/\\3.tml" java-file)))

(defun switch-to-java (tml-file)
  (interactive)
  (find-file (replace-regexp-in-string "\\(.*\\)src/main/resources\\(.*\\)/\\(.*\\).tml" "\\1src/main/java\\2/\\3.java" tml-file)))

(defun switch-to-companion-file ()
  "switch from a .java file to its .tml companion and viceversa"
  (interactive)
  (let ((buffer-file (buffer-file-name)))
    (cond ((string-match "\.java$" buffer-file) (switch-to-tml buffer-file))
          ((string-match "\.tml$" buffer-file) (switch-to-java buffer-file)))))

(provide 'setup-tapestry)
