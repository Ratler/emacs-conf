;; Disable startup screen
(setq inhibit-splash-screen t)

;; Don't create backup files
(setq make-backup-files nil)

;; Help and date stuff
(global-set-key [(f1)] (lambda () (interactive) (manual-entry (current-word))))
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(setq display-time)
(display-time-mode)

;; No menu bar or tool bar
(menu-bar-mode 0)
(require 'tool-bar)
(tool-bar-mode 0)

;; No scrollbar in X
(if window-system (scroll-bar-mode 0))

;; [tab] insert space instead of tab
(setq-default indent-tabs-mode nil)
(setq standard-indent 2)
(setq-default tab-width 2)

;; Paste at cursor, not where the mouse pointer is
(setq mouse-yank-at-point t)

;; A line number mode (prefix each line with line number)
(require 'linum)
(global-linum-mode 1)

;; Fix linum width in no-window mode
(unless window-system
  (setq linum-format "%6d "))

;; Don't wrap lines
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

;; Wrap length
(setq fill-column 76)

;; Change yes/no questions to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; ignore case when searching
(setq-default case-fold-search 1)

;; Don't insert a new line when moving down with arrow key
(setq next-line-add-newlines nil)


;; By default we start text mode.
(setq initial-major-mode
      (lambda ()
        (text-mode)
        (turn-on-auto-fill)
        (font-lock-mode)
        ))

;; Highlight current line - only in X
(if window-system
    (global-hl-line-mode t)
  )

;; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode 1)

;; key rebindings
(global-set-key [(meta g)] `goto-line)
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [f12] 'compile)

;; Define image-types if running emacs-nox to make nxhtml happy
(if (boundp 'image-types)
    nil
  (defvar image-types nil))

(provide 'general-settings)
