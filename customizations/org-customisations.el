;; (require 'org-projectile)
;; (require 'org-projectile-helm)

;; (org-projectile-per-project)
;; (setq org-projectile-per-project-filepath "todo.org")
;; (push (org-projectile-project-todo-entry) org-capture-templates)
;; (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))

;; (global-set-key (kbd "C-c o")
;;                 (lambda ()
;;                   (interactive)
;;                   (find-file "~/notes.org")))

;; (setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))
;; (global-set-key (kbd "C-c c") 'org-capture)
;; (global-set-key (kbd "C-c n p") 'org-projectile-project-todo-completing-read)
;; ;; (setq org-default-notes-file "~/notes.org")
;; ;; (global-set-key (kbd "C-c n p") 'org-projectile-helm-template-or-project)

;; (setq org-confirm-elisp-link-function nil)

(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :commands (org-mode org-capture org-agenda)
  :config 
  (setq org-latex-to-pdf-process '("texi2dvi --pdf --clean --verbose --batch %f")))

(use-package org-ref
  :ensure t
  ;; :mode "\\.org\\'"
  :after org
  ;; :commands (org-mode org-capture org-agenda)
  )

