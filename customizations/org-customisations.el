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
  ;; (progn 
  ;;   (setq org-latex-to-pdf-process '("texi2dvi --pdf --clean --verbose --batch %f"))
  ;;   (setq org-latex-listings t))
  )

;; (require 'ox-latex)
;; (use-package ox-latex
;;   ;; :ensure t
;;   :after org)

;; (defface org-haskell-inline-face
;;   '((t (:inhert org-code)))
;;   "Code face for haskell export")

(defun haskell-in (str)
  "Insert haskell string wrappers"
  (interactive "sString for wrapping: ")
  (insert "\\haskellIn{" str "}"))

(use-package ox
  :after org
  :config 
  (progn
    (setq org-export-with-smart-quotes t)
    (use-package ox-latex
      :config
      (progn
        (setq org-latex-listings 'minted
              org-latex-packages-alist '(("" "minted"))
              ;; org-latex-to-pdf-process '("texi2dvi --pdf --clean --shell-escape --verbose --batch %f")
              org-latex-pdf-process
              '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                "bibtex %b"
                "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                ))
        (add-to-list 'org-latex-classes
                     '("dissertation"
                       "\\documentclass[11pt,a4paper]{report}"
                       ("\\chapter{%s}" . "\\chapter*{%s}")
                       ("\\section{%s}" . "\\section*{%s}")
                       ("\\subsection{%s}" . "\\subsection*{%s}")
                       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
        ;; (add-to-list 'org-structure-template-alist
        ;;              '("S" "\\haskellIn{?}"))
        ;; (add-to-list 'org-emphasis-alist
        ;;              '("@" org-haskell-inline-face verbatim))
        ))))

(setq org-ref-prefer-bracket-links t
      org-latex-prefer-user-labels t)

(use-package org-ref
  :ensure t
  ;; :mode "\\.org\\'"
  :after org
  ;; :commands (org-mode org-capture org-agenda)
  )

