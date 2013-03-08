(add-hook 'sql-mode-hook
          (lambda ()
            (sql-set-product 'postgres)))
