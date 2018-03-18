;; Loading ESS
(require 'ess-site)
(ess-toggle-underscore nil)

(show-paren-mode 1)
(setq show-paren-delay 0)

(fset 'my-complete-file-name
        (make-hippie-expand-function '(try-complete-file-name-partially
                                       try-complete-file-name)))
(global-set-key "\M-/" 'my-complete-file-name)
