(add-to-list 'auto-mode-alist
             '("Dockerfile$" . dockerfile-mode))
(include-plugin "dockerfile-mode")
(require 'dockerfile-mode)
(provide 'docker-settings)
