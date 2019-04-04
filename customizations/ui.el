;; (menu-bar-mode -1)
(tool-bar-mode -1)
;; (global-linum-mode 1)

(use-package nlinum
  :ensure t
  :config (global-nlinum-mode))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(setq inhibit-startup-message t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")

(use-package gruvbox-theme
  :ensure t
  :config (load-theme 'gruvbox-dark-medium t))

;; show git diff in fringe
(use-package git-gutter-fringe+
  :ensure t
  :delight git-gutter+-mode
  :config (global-git-gutter+-mode))

;; display key suggestions as you type
(use-package which-key
  :ensure t
  :delight
  :config (which-key-mode))

(use-package eldoc
  :delight)

(use-package autorevert
  :delight auto-revert-mode)

(use-package telephone-line
  :ensure t
  :config (progn
            (setq telephone-line-lhs
                  '((evil   . (telephone-line-evil-tag-segment))
                    (nil    . (telephone-line-buffer-segment))
                    (accent . (telephone-line-vc-segment
                               telephone-line-erc-modified-channels-segment
                               telephone-line-process-segment))
                    (nil    . (telephone-line-minor-mode-segment))))
            (setq telephone-line-rhs
                  '((nil    . (telephone-line-misc-info-segment))
                    (accent . (telephone-line-major-mode-segment))
                    (evil   . (telephone-line-airline-position-segment))))
            (telephone-line-mode t)))

;; (set-face-attribute 'default nil :height 140)

(setq x-select-enable-clipboard t
      
      ;; save other program clipboard before doing regular emacs kill
      save-interprogram-paste-before-kill t

      apropos-do-all t

      mouse-yank-at-point t)


;; disable cursor blink
(blink-cursor-mode 0)

(setq-default frame-title-format "%b (%f)")

;; (global-set-key (kbd "s-t") '(lambda () (interactive)))

;;no bell
(setq ring-bell-function 'ignore)

(windmove-default-keybindings)
