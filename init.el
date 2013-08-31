;;; Inspiration, code and functions taken from a variety of sources:
;;;
;;; * Technomancy's dot files https://github.com/technomancy
;;; * Magnars's dot emacs https://github.com/magnars
;;; * Emacs live https://github.com/overtone/emacs-live
;;; * Code scattered around the interwebs

;; Set up load path
(add-to-list 'load-path user-emacs-directory)

(let ((default-directory "~/.emacs.d/elisp/"))
  (normal-top-level-add-subdirs-to-load-path))

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

(defvar my-packages '(ac-nrepl
                      ace-jump-mode
                      ack-and-a-half
                      align-cljlet
                      auto-complete
                      browse-kill-ring
                      clojure-mode
                      clojure-test-mode
                      csv-mode
                      diminish
                      erc-hl-nicks
                      ercn
                      flycheck
                      git-gutter-fringe
                      google-this
                      google-translate
                      ido-ubiquitous
                      magit
                      markdown-mode
                      nrepl
                      org
                      paredit
                      pretty-lambdada
                      rainbow-delimiters
                      s
                      slamhound
                      smex
                      smooth-scrolling
                      sql-indent
                      starter-kit-eshell
                      undo-tree
                      yasnippet
                      zen-and-art-theme))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq inhibit-startup-message t)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Elisp first so we can always configure Emacs
(require 'setup-lisp)
(require 'setup-elisp)
(require 'setup-paredit)

;; Handy functions next
(require 'defuns)
(require 'buffer-defuns)
(require 'file-defuns)

;; Prettify Emacs
(require 'sane-defaults)
(require 'key-bindings)
(require 'appearance)
(require 'my-misc)

;; Everything else
(require 'setup-ido)
(require 'setup-ace-jump)
(require 'setup-autocomplete)
(require 'setup-google)
(require 'browse-kill-ring)
(require 'setup-dired)
(require 'setup-ispell)
(require 'setup-ibuffer)
(require 'setup-magit)
(require 'setup-erc)

(require 'setup-flyspell)
;; Programming stuff
(require 'yasnippet)
(require 'programming)
(require 'setup-nxml)
(require 'setup-java-mode)
(require 'setup-nrepl)
(require 'setup-clojure)
(require 'setup-eshell)
(require 'setup-git-gutter)
(require 'setup-markdown)
(require 'setup-maven)

;;; init.el ends here
