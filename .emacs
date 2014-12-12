;; Configuration directory
(add-to-list 'load-path "~/.emacs.d/conf")

;; El-get plugins directory
(setq plugin-path "~/.emacs.d/el-get/")

;; Utility functions
(require 'utility-functions)

;; General settings
(require 'general-settings)

;; install plugins
(require 'el-get-settings)

;; GIT
(include-plugin "magit")
(require 'magit)

;; Popup
(include-elget-plugin "popup")
(require 'popup)

;; Yasnippets
(require 'yasnippet-settings)

;; Auto completion
(require 'auto-complete-settings)

;; Helm
(require 'helm-settings)

;; Ido
(require 'ido)
(ido-mode 1)

;; Bash
(require 'bash-settings)

;; Perl
(require 'perl-settings)

;; Python
(require 'python-settings)

;; Markdown
(require 'markdown-settings)

;; Javascript
(require 'markdown-settings)

;; custom stuff
(load
 (setq custom-file (expand-file-name "conf/custom.el" user-emacs-directory))
 'noerror)