;; ########### HELM #############

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-c f" . helm-recentf)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-mini)
         ("C-x C-b" . helm-mini)
         ;; ("C-c h" . helm-command-prefix)
         ("C-c h o" . helm-occur))
  :bind (:map helm-map
              ("<tab>" . helm-execute-persistent-action)
              ("C-i" . helm-execute-persistent-action)
              ("C-z" . helm-select-action))
  :config (progn
            (when (executable-find "curl")
              (setq helm-google-suggest-use-curl-p t))
            (setq helm-M-x-fuzzy-match t)

            (setq helm-autoresize-max-height 80)
            (setq helm-autoresize-min-height 20)
            (helm-autoresize-mode 1)
            (add-to-list 'recentf-exclude "ido.last")

            (when (executable-find "ag")
              (setq helm-grep-ag-command "ag --line-numbers -S --hidden --color --color-match '31;43' --nogroup %s %s %s")
              (setq helm-grep-ag-pipe-cmd-switches '("--color-match '31;43'")))

            (helm-mode 1)))

(use-package helm-descbinds
  :ensure t
  :bind ("C-h b" . helm-descbinds))

;; (require 'helm)
;; (require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
;; (global-set-key (kbd "C-c h") 'helm-command-prefix)
;; (global-unset-key (kbd "C-x c"))


(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line        t
      helm-buffers-fuzzy-matching           t
      helm-recentf-fuzzy-match              t)

(use-package helm-gtags
  :ensure t
  :config (setq
           helm-gtags-ignore-case t
           helm-gtags-auto-update t
           helm-gtags-use-input-at-cursor t
           helm-gtags-pulse-at-cursor t
           helm-gtags-prefix-key "\C-cg"
           helm-gtags-suggested-key-mapping t)
  :bind (:map helm-gtags-mode-map
              ("M-." . helm-gtags-dwim)
              ("M-," . helm-gtags-pop-stack)
              ("C-c g a" . helm-gtags-tags-in-this-function)
              ("C-c <" . helm-gtags-previous-history)
              ("C-c >" . helm-gtags-next-history))
  :hook ((dired-mode . helm-gtags-mode)
         (eshell-mode . helm-gtags-mode)
         (c-mode . helm-gtags-mode)
         (c++-mode . helm-gtags-mode)
         (asm-mode . helm-gtags-mode)
         )
  
  )

;; (require 'helm-gtags)
;; ;; Enable helm-gtags-mode
;; (add-hook 'dired-mode-hook 'helm-gtags-mode)
;; (add-hook 'eshell-mode-hook 'helm-gtags-mode)
;; (add-hook 'c-mode-hook 'helm-gtags-mode)
;; (add-hook 'c++-mode-hook 'helm-gtags-mode)
;; (add-hook 'asm-mode-hook 'helm-gtags-mode)

;; (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;; (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
;; (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
;; (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;; (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;; (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

;; (setq helm-autoresize-max-height 80)
;; (setq helm-autoresize-min-height 20)
;; (helm-autoresize-mode 1)

;; (helm-mode 1)


;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (setq helm-M-x-fuzzy-match t)

;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; (global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "C-x C-b") 'helm-mini)
;; (setq helm-buffers-fuzzy-matching t
;;       helm-recentf-fuzzy-match    t)

;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-c f") 'helm-recentf)

;; use ag instead of grep (when it's present)
;; (when (executable-find "ag")
;;   (setq helm-grep-ag-command "ag --line-numbers -S --hidden --color --color-match '31;43' --nogroup %s %s %s")
;;   (setq helm-grep-ag-pipe-cmd-switches '("--color-match '31;43'")))

