;; Set up load path
(add-to-list 'load-path user-emacs-directory)

(let ((default-directory "~/.emacs.d/elisp/"))
  (normal-top-level-add-subdirs-to-load-path))


(require 'cl)
(defvar *emacs-load-start* (current-time))

(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))

(global-set-key [f11] 'fullscreen)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(clojure-mode scpaste ace-jump-mode clojure-test-mode
                                   csv-mode diminish flycheck google-translate hackernews
                                   magit markdown-mode nrepl paredit rainbow-delimiters
                                   smex sql-indent yasnippet ido-ubiquitous smooth-scrolling
                                   undo-tree emacs-eclim starter-kit-eshell
                                   browse-kill-ring))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Things that should always be loaded

(setq inhibit-startup-message t)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Nice theme
(load-theme 'zen-and-art t)

(require 'cl)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(require 'browse-kill-ring)
(require 'yasnippet)
(require 'setup-ispell)
(require 'sane-defaults)
(require 'my-misc)
(require 'setup-ido)
(require 'key-bindings)
(require 'appearance)
(require 'defuns)
(require 'file-defuns)
;; (require 'eclim-setup)
(require 'setup-java-mode)
(require 'setup-paredit)
(require 'programming)
(require 'setup-elisp)
(require 'setup-nrepl)
(require 'setup-ibuffer)


(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                                     (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))

;;; init.el ends here
