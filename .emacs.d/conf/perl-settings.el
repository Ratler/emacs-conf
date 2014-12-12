;; Force perl-mode to call cperl-mode
(fset 'perl-mode 'cperl-mode)
(add-to-list 'auto-mode-alist
             '("\\.p[lm]$" . cperl-mode))

(defun cperl-mode-settings ()
  (setq cperl-indent-level 2
        cperl-continued-statement-offset 0
        ;;cperl-extra-newline-before-brace t
        cperl-auto-newline-after-colon t
        cperl-electric-keywords t
        cperl-electric-linefeed t
        cperl-electric-parens t
        cperl-indent-parens-as-block t
        cperl-close-paren-offset -2))

(add-hook 'cperl-mode-hook 'cperl-mode-settings)
(add-hook 'cperl-mode-hook 'write-file-settings)

(provide 'perl-settings)
