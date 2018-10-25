(require 'evil)
(evil-mode 1)

(define-key evil-normal-state-map (kbd "C-e") 'evil-end-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'evil-end-of-line)

(defun beginning-line-or-indentation ()
  "Move to beginning of line, or to match indentation if already there"
  (interactive) ;; special form, makes this command callable via M-x or a keybind
  (if (bolp) ;; if at beginning of line
      (back-to-indentation) ;; jump to indentation
    (beginning-of-line))) ;; otherwise, jump to very start

(define-key evil-normal-state-map (kbd "C-a") 'beginning-line-or-indentation)
(define-key evil-insert-state-map (kbd "C-a") 'beginning-line-or-indentation)



;; (add-hook 'c-mode-common-hook #'(lambda ()
;;                                   (evil-local-set-key evil-insert-state-map (kbd "RET") 'electrify-return-if-match)))

;; (evil-define-key 'insert c++-mode-map
;;   (kbd "RET") 'electrify-return-if-match
;;   )

;; bind the extremely neat todo function defined in editing.el to C-c t in normal mode
(define-key evil-normal-state-map (kbd "C-c t") 'simple-todo)
