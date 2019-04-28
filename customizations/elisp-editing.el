(use-package paredit
  :ensure t)


;; load paredit for lisp files
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of lisp" t)
;; (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;; (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook #'general-lisp-customisations)
(add-hook 'lisp-mode-hook #'general-lisp-customisations)
(add-hook 'scheme-mode-hook #'general-lisp-customisations)
;; (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
;; (add-hook 'lisp-mode-hook (lambda () (lispy-mode 1)))
;; (add-hook 'lisp-interaction-mode-hook (lambda () (lispy-mode 1)))

(autoload 'scheme-smart-complete "scheme complete" nil t)
(eval-after-load 'scheme
  '(define-key scheme-mode-map "\e\t" 'scheme-smart-complete))

;; eldoc for documentation
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(autoload 'scheme-get-current-symbol-info "scheme complete" nil t)
(add-hook 'scheme-mode-hook
          (lambda ()
            (make-local-variable 'eldoc-documentation-function)
            (setq eldoc-documentation-function 'scheme-get-current-symbol-info)
            (eldoc-mode)))


(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
;; stop SLIME grabbing DEL to stop it breaking paredit
(defun override-slime-repl-bindings-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-paredit)

(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regex matches text after cursor, do an \"electric\" return.")

(defun electrify-return-if-match (arg)
  "If text after cursor matches `electrify-return-match', then open and indent a new line between cursor and text. 
Move cursor to new line."
  (interactive "P")
  (let ((case-fold-search nil)) ;; case-sensitive match
    (if (looking-at electrify-return-match) ;; if text after point matches regex
        (save-excursion (newline-and-indent))) ;; save point, newline-and-indent, then jump back 
    (newline arg) ;; insert the number of newlines defined by the prefix argument
    (indent-according-to-mode))) ;; then indent as needed (this is to make it more general

(defun general-lisp-customisations ()
  (paredit-mode t)
  (local-set-key (kbd "RET") 'electrify-return-if-match)
  (show-paren-mode t)
  (prettify-symbols-mode))

(use-package geiser
  :ensure t
  ;; :mode "\\.scm\\'"
  :config (progn
            (setq geiser-default-implementation 'chicken)))
