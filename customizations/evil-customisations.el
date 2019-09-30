;; (use-package utils)

(defun beginning-line-or-indentation ()
  "Move to beginning of line, or to match indentation if already there"
  (interactive) ;; special form, makes this command callable via M-x or a keybind
  (if (bolp) ;; if at beginning of line
      (back-to-indentation) ;; jump to indentation
    (beginning-of-line))) ;; otherwise, jump to very start

(defun djoyner/evil-shift-left-visual ()
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun djoyner/evil-shift-right-visual ()
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun smart-backward-kill-word ()
  (interactive)
  (if (boundp 'paredit-mode)
      (progn
        (if (sexp-at-point) 
            (kill-sexp -1)
          (delete-horizontal-space))
        (when (bolp)
          (paredit-backward-delete)
          (indent-for-tab-command)))
    (backward-kill-word)))

(use-package evil
  :ensure t
  ;; :defines beginning-line-or-indentation
  ;; :functions beginning-line-or-indentation
  ;; :load-path "customizations/"
  :bind (:map evil-normal-state-map
              ("C-e" . evil-end-of-line)
              ("C-a" . beginning-line-or-indentation)
              ("C-c t" . simple-todo)
              ("j" . evil-next-visual-line)
              ("k" . evil-previous-visual-line)
              ("q" . nil)) ;; bind the extremely neat todo function defined in editing.el to C-c t in normal mode
  :bind (:map evil-insert-state-map
              ("C-e" . evil-end-of-line)
              ("C-a" . beginning-line-or-indentation)
              ("C-c t" . simple-todo)
              ("C-<backspace>" . smart-backward-kill-word))
  :bind (:map evil-visual-state-map
              ("j" . evil-next-visual-line)
              ("k" . evil-previous-visual-line)
              ;; Overload shifts so that they don't lose the selection
              (">" . djoyner/evil-shift-right-visual)
              ("<" . djoyner/evil-shift-left-visual))
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
