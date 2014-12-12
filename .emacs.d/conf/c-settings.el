;; C-mode settings
(add-to-list 'auto-mode-alist
             '("\\.[ch]$" . c-mode))

(defun my-c-mode-settings ()
  (setq c-default-style "ellemtel"
        c-basic-offset 2)
  (c-set-offset 'substatement-open 0)
  (define-key c-mode-base-map (kbd "RET") 'newline-and-indent))

(add-hook 'c-mode-hook 'my-c-mode-settings)
;; (add-hook 'c-mode-hook 'write-file-settings)

(provide 'c-settings)
