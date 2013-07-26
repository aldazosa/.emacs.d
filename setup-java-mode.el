(defun java-annotations-setup()
  "Treat Java 1.5 @-style annotations as comments."
  (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
  (modify-syntax-entry ?@ "< b" java-mode-syntax-table))

;; Highlight long lines
(setq whitespace-line-column 120
      whitespace-style '(face tabs trailing lines-tail))

(add-hook 'java-mode-hook (lambda ()
                                  (java-annotations-setup)
                                  (yas--initialize)
                                  (yas-load-directory "~/.emacs.d/java-mode")
                                  (autopair-mode)
                                  (whitespace-mode)))


(defun mvn(&optional args)
  "Runs maven in the current project. Starting at the directoy where the file being visited resides, a search is
   made for pom.xml recsurively. A maven command is made from the first directory where the pom.xml file is found is then displayed
  in the minibuffer. The command can be edited as needed and then executed. Errors are navigate to as in any other compile mode"
  (interactive)
  (let ((fn (buffer-file-name)))
    (let ((dir (file-name-directory fn)))
      (while (and (not (file-exists-p (concat dir "/pom.xml")))
                  (not (equal dir (file-truename (concat dir "/..")))))
        (setf dir (file-truename (concat dir "/.."))))
      (if (not (file-exists-p (concat dir "/pom.xml")))
          (message "No pom.xml found")
        (compile (read-from-minibuffer "Command: "
                                       (concat "mvn -o -f " dir "/pom.xml install") nil nil 'mvn-command-history))))))

(defun run-mvn()
  (interactive)
  (progn
    (mvn)))

(global-set-key (kbd "<f6>") 'run-mvn)

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

(global-set-key (kbd "C-x C-j") 'switch-to-companion-file)

(provide 'setup-java-mode)
