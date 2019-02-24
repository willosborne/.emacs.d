;; (menu-bar-mode -1)
(tool-bar-mode -1)
(global-linum-mode 1)

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(setq inhibit-startup-message t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")

(require 'git-gutter-fringe+)
(global-git-gutter+-mode)

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
