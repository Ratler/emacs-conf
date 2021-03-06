;; set the el-get path, and create it if it doesn't exist
(setq elget-path plugin-path)
(unless (file-exists-p elget-path)
  (make-directory elget-path))

;; add el-get to the load path, and install it if it doesn't exist
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; Override gh submodule that requires private access (only docs anyway)
(setq el-get-sources
      '((:name gh
               :submodule nil)))

(setq my-packages '(auto-complete
                    color-theme-zenburn
                    popup
                    puppet-mode
                    php-mode
                    markdown-mode
                    po-mode
                    ruby-mode
                    jedi
                    direx
                    s
                    magit
                    magit-gh-pulls
                    ein
                    pydoc-info
                    nxhtml
                    helm
                    helm-descbinds
                    js2-mode
                    virtualenvwrapper
                    yasnippet
                    dockerfile-mode
                    yaml-mode
                    coffee-mode))
                    

;; first enable shallow clone, so we don't need to clone the entire
;; history of every project
(setq el-get-git-shallow-clone t)

;; then we install
(el-get 'sync my-packages)

(provide 'el-get-settings)
