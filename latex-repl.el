(defun latex-repl () 
  (interactive)
  (latex-repl-regenerate))

(defun latex-file-name-to-dvi (file-name)
  (concat 
   (file-name-sans-extension file-name)
   ".dvi"))

(defun latex-repl-regenerate ()
  (interactive)
  (shell-command-to-string (concat
			    "cd "
			    (file-name-directory buffer-file-name)
			    ";latex " 
			    buffer-file-name))
  (doc-view t (latex-file-name-to-dvi buffer-file-name)))

(provide 'latex-repl)