(require 'python)

(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args (if (system-is-mac)
				   "--matplotlib=osx --colors=Linux"
                                   (if (system-is-linux)
				       "--gui=wx --matplotlib=wx --colors=Linux"))
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")


;; -----------------------------
;; emacs IPython notebook config
;; -----------------------------

; use autocompletion, but don't start to autocomplete after a dot
(setq ein:complete-on-dot -1)
(setq ein:use-auto-complete 1)

; set python console args
(setq ein:console-args
      (if (system-is-mac)
          '("--gui=osx" "--matplotlib=osx" "--colors=Linux")
        (if (system-is-linux)
            '("--gui=wx" "--matplotlib=wx" "--colors=Linux"))))

; timeout settings
(setq ein:query-timeout 1000)

; IPython notebook
(include-plugin "emacs-ipython-notebook/lisp")
(require 'ein)

; shortcut function to load notebooklist
(defun load-ein () 
  (ein:notebooklist-load)
  (interactive)
  (ein:notebooklist-open))


;; ------------------
;; misc python config
;; ------------------

; pydoc info
(include-plugin "pydoc-info-0.2")
(require 'pydoc-info)

;; ; jedi python completion
(include-elget-plugin "ctable")   ; required for epc
(include-elget-plugin "deferred") ; required for epc
(include-elget-plugin "epc")      ; required for jedi
(include-elget-plugin "jedi")
(require 'jedi)
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; pyflakes flymake integration
;; http://stackoverflow.com/a/1257306/347942
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pycheckers" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))
(add-hook 'python-mode-hook
	  (lambda ()
	    (unless (eq buffer-file-name nil) (flymake-mode 1))))

; Set PYTHONPATH, because we don't load .bashrc
(defun set-python-path-from-shell-PYTHONPATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PYTHONPATH'")))
    (setenv "PYTHONPATH" path-from-shell)))

(if window-system (set-python-path-from-shell-PYTHONPATH))

(setq auto-mode-alist
      (append 
       (list '("\\.pyx" . python-mode)
             '("SConstruct" . python-mode))
       auto-mode-alist))

;; ; keybindings
(eval-after-load 'python
  '(define-key python-mode-map (kbd "C-c !") 'python-shell-switch-to-shell))
(eval-after-load 'python
  '(define-key python-mode-map (kbd "C-c |") 'python-shell-send-region))

;; Automatically load python virtualenv
;; http://stackoverflow.com/questions/21246218/how-can-i-make-emacs-jedi-use-project-specific-virtualenvs
;; (defun project-directory (buffer-name)
;;   "Returns the root directory of the project that contains the
;; given buffer. Any directory with a .git or .jedi file/directory
;; is considered to be a project root."
;;   (interactive)
;;   (let ((root-dir (file-name-directory buffer-name)))
;;     (while (and root-dir
;;                 (not (file-exists-p (concat root-dir ".git")))
;;                 (not (file-exists-p (concat root-dir ".hg")))
;;                 (not (file-exists-p (concat root-dir ".jedi"))))
;;       (setq root-dir
;;             (if (equal root-dir "/")
;;                 nil
;;               (file-name-directory (directory-file-name root-dir)))))
;;     root-dir))

;; (defun project-name (buffer-name)
;;   "Returns the name of the project that contains the given buffer."
;;   (let ((root-dir (project-directory buffer-name)))
;;     (if root-dir
;;         (file-name-nondirectory
;;          (directory-file-name root-dir))
;;       nil)))

;; (defun jedi-setup-venv ()
;;   "Activates the virtualenv of the current buffer."
;;   (let ((project-name (project-name buffer-file-name)))
;;     (when project-name (venv-workon project-name))))

;; (setq jedi:setup-keys t)
;; (setq jedi:complete-on-dot t)
;; (add-hook 'python-mode-hook 'jedi-setup-venv)
;; (add-hook 'python-mode-hook 'jedi:setup)

(provide 'python-settings)
