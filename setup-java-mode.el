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

(defvar mvn-command-history nil
  "Maven command history variable")

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
        (compile (concat "mvn -o -f " dir "/pom.xml install -Dmaven.test.skip=true"))))))

(defun mvn-tst(&optional args)
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
                                       (concat "mvn -o -f " dir "/pom.xml test -Dgroups=") nil nil 'mvn-command-history))))))

(defun run-mvn()
  (interactive)
  (progn
    (mvn)))

(defun run-mvn-tst()
  (interactive)
  (progn
   (mvn-tst)))

(eval-after-load 'cc-mode
                 '(progn
                   (define-key java-mode-map (kbd "C-x C-j") 'switch-to-companion-file)
                   (define-key java-mode-map (kbd "<f6>") 'run-mvn)
                   (define-key java-mode-map (kbd "<f7>") 'run-mvn-tst)))

(provide 'setup-java-mode)
