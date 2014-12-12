(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

(defun make-plugin-path (plugin)
  (expand-file-name
   (concat plugin-path plugin)))

(defun include-plugin (plugin)
  (add-to-list 'load-path (make-plugin-path plugin)))

(defun make-elget-path (plugin)
  (expand-file-name
   (concat elget-path plugin)))

(defun include-elget-plugin (plugin)
  (add-to-list 'load-path (make-elget-path plugin)))

;; File write settings
(defun write-file-settings ()
  ;; Force untabify and deletion of whitespaces
  (add-hook 'write-file-functions 'delete-trailing-whitespace)
  ;;  (save-excursion
  ;;    (untabify (point-min) (point-max)))
)

(provide 'utility-functions)
