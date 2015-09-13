(require 'git-gutter-fringe)
(global-git-gutter-mode t)

(set-face-foreground 'git-gutter-fr:modified "maroon")
(set-face-foreground 'git-gutter-fr:added "DarkGreen")
(set-face-foreground 'git-gutter-fr:deleted "red4")

(diminish 'git-gutter-mode)

(provide 'setup-git-gutter)
