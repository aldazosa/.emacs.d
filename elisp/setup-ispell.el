;; Ispell hablando español.
(setq ispell-program-name "aspell"
      ispell-extra-args '("-W" "3"))

(set-default 'ispell-local-dictionary "castellano")

(provide 'setup-ispell)
