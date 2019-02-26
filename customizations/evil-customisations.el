;; (use-package utils)

(defun beginning-line-or-indentation ()
  "Move to beginning of line, or to match indentation if already there"
  (interactive) ;; special form, makes this command callable via M-x or a keybind
  (if (bolp) ;; if at beginning of line
      (back-to-indentation) ;; jump to indentation
    (beginning-of-line))) ;; otherwise, jump to very start

(use-package evil
  :ensure t
  ;; :defines beginning-line-or-indentation
  ;; :functions beginning-line-or-indentation
  ;; :load-path "customizations/"
  :bind (:map evil-normal-state-map
              ("C-e" . evil-end-of-line)
              ("C-a" . beginning-line-or-indentation)
              ("C-c t" . simple-todo)) ;; bind the extremely neat todo function defined in editing.el to C-c t in normal mode
  :bind (:map evil-insert-state-map
              ("C-e" . evil-end-of-line)
              ("C-a" . beginning-line-or-indentation)
              ("C-c t" . simple-todo))
  :config (evil-mode 1))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))


;; (add-hook 'c-mode-common-hook #'(lambda ()
;;                                   (evil-local-set-key evil-insert-state-map (kbd "RET") 'electrify-return-if-match)))

;; (evil-define-key 'insert c++-mode-map
;;   (kbd "RET") 'electrify-return-if-match
;;   )


;;TODO:
