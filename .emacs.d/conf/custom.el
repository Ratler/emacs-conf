(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e4e97731f52a5237f37ceb2423cb327778c7d3af7dc831788473d4a76bcc9760" default)))
 '(display-time-mode t)
 '(mwheel-follow-mouse t)
 '(require-final-newline (quote ask))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

;; theme
(add-to-list 'custom-theme-load-path (make-plugin-path "color-theme-zenburn"))
(load-theme 'zenburn)

;; Default font in X only
(if window-system
    (set-face-font 'default "-artwiz-smoothansi.se-medium-r-normal--13-130-75-75-m-60-iso8859-*"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
