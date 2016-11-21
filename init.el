;;; Inspiration, code and functions taken from a variety of sources:
;;;
;;; * Technomancy's dot files https://github.com/technomancy
;;; * Magnars's dot emacs https://github.com/magnars
;;; * Emacs live https://github.com/overtone/emacs-live
;;; * Code scattered around the interwebs

;; Set up load path
(add-to-list 'load-path "~/.emacs.d/elisp/")

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
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(cider
                      ag
                      align-cljlet
                      auto-complete
                      autopair
                      avy
                      browse-kill-ring
                      clojure-mode
                      company
                      csv-mode
                      diminish
                      erc-hl-nicks
                      ercn
                      flycheck
                      git-gutter-fringe
                      google-this
                      google-translate
                      highlight-symbol
                      ido-ubiquitous
                      magit
                      markdown-mode
                      org
                      paredit
                      pretty-lambdada
                      rainbow-delimiters
                      s
                      slamhound
                      smex
                      smooth-scrolling
                      swiper
                      sql-indent
                      starter-kit-eshell
                      undo-tree
                      yasnippet
                      zen-and-art-theme
                      yaml-mode))

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
(require 'misc)
(require 'sane-defaults)
(require 'key-bindings)
(require 'appearance)
(require 'my-misc)

;; Everything else
(require 'setup-avy)
(require 'setup-swiper) ;; trying swiper for search
(require 'setup-ido)
(require 'setup-company)
(require 'setup-google)
(require 'browse-kill-ring)
(require 'setup-dired)
(require 'setup-ispell)
(require 'setup-ibuffer)
(require 'setup-magit)
(require 'setup-erc)
(require 'setup-flyspell)

;; Programming stuff

(require 'setup-yasnippet)
(require 'programming)
(require 'setup-tapestry)
(require 'setup-nxml)
(require 'setup-java-mode)
(require 'setup-cider)
(require 'setup-clojure)
(require 'setup-eshell)
(require 'setup-git-gutter)
(require 'setup-markdown)
(require 'setup-sql)
(require 'setup-scheme)

(require 'setup-org-mode)
;;; init.el ends here
