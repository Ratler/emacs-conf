;; Bash settings
(add-to-list 'auto-mode-alist
             '("\\(DETAILS\\|CONFIGURE\\|DEPENDS\\|CONFLICTS\\)\\|\\(PRE_\\)?\\(BUILD\\|REMOVE\\)\\|\\(POST_\\)\\(BUILD\\|INSTALL\\|REMOVE\\|\\.sh\\)$" . sh-mode))

(defun my-sh-mode-settings ()
  (setq sh-basic-offset 2
        sh-indentation 2
        sh-indent-after-if '+
        sh-indent-after-do '+
        sh-indent-after-continuation 0
        sh-indent-for-then 0))

(add-hook 'sh-mode-hook 'my-sh-mode-settings)
(add-hook 'sh-mode-book 'write-file-settings)
(add-hook 'sh-mode-hook (lambda () (electric-indent-local-mode -1)))

(provide 'bash-settings)
