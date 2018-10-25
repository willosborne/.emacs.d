(global-set-key (kbd "M-/") 'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))



;; (require 'evil)
;; (evil-mode 1)

;; (elpy-enable)

;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

;; (global-evil-leader-mode)
;; (evil-leader/set-leader ",")
;; (evil-leader/set-key "q" 'evil-quit)

;; highlight matching paren
(show-paren-mode 1)

;; highlight current line
;; (global-hl-line-mode 1)


; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; soft tabs
(setq-default indent-tabs-mode nil)

;; remember place
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

;; backups in backups folder
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
					       "backups"))))
(setq auto-save-default nil)


(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-ending-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)


;; (evil-commentary-mode)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

(setq electric-indent-mode nil)

(setq org-startup-indented t)

;; c++ stuff
(setq c-default-style "k&r")
(global-set-key (kbd "RET") 'newline-and-indent)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(add-hook 'c-mode-common-hook 'hs-minor-mode)

(require 'cc-mode)

;; completion
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)



(setq company-backends (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(kbd "s-TAB")] 'company-complete)

(setq mouse-wheel-progressive-speed nil)
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

(defvar simple-todo-regex "\\(TODO\\|FIXME\\|NOTE\\)") 

(defun simple-todo ()
  "Display all TODO, NOTE and FIXME comments in a new buffer.
If we're in a project, display for all in that project."
  (interactive)
  (if (projectile-project-p)
      (multi-occur (projectile-project-buffers) simple-todo-regex)
    (occur simple-todo-regex)))
