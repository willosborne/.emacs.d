(require 'package)
(require 'xref)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'load-path "/usr/local/lib/chicken/8/")

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(eval-when-compile
  (require 'use-package))

;; (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;; 			 ("marmalade" . "http://marmalade-repo.org/packages/")
;; 			 ("melpa-stable" . "https://stable.melpa.org/packages/")))

(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)
(defvar predicate nil)
(defvar inherit-input-method nil)

(require 'slime)
(slime-setup '(slime-repl slime-banner))

;; (setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq inferior-lisp-program "/home/will/common-lisp/ccl/lx86cl64")
(setq slime-contribs '(slime-fancy slime-asdf slime-quicklisp))


;; (autoload 'chicken-slime "chicken-slime" "SWANK backend for Chicken Scheme" t)

;; (add-hook 'scheme-mode-hook
;;           (lambda ()
;;             (slime-mode t)))

;; (setq solarized-scale-org-headlines nil)
;; (setq solarized-use-variable-pitch nil)

;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
;; (setq inferior-lisp-program "sbcl")

;; (add-to-list 'load-path "~/.emacs.d/evil")

;; (require 'better-defaults)
(defvar my-packages
  '(
    ;; paredit
    better-defaults
    
    ;; elpy
    flycheck

    evil
    evil-leader
    evil-commentary

    clojure-mode
    clojure-mode-extra-font-locking
    cider
    
    slime

    ;; projectile

    ;; rainbow-delimiters

    tagedit
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/vendor")

(add-to-list 'load-path "~/.emacs.d/customizations")

(load "navigation.el")

(load "editing.el")
(load "ui.el")
(load "misc.el")
(load "elisp-editing.el")
(load "haskell-editing.el")
(load "setup-clojure.el")
(load "setup-js.el")
(load "helm-customisations.el")
(load "evil-customisations.el")
(load "org-customisations.el")

;; LEAVE THIS ALONE, it does stuff for themes
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(blink-cursor-mode nil)
 '(coffee-tab-width 2)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (gruvbox-dark-medium)))
 '(custom-safe-themes
   (quote
    ("1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" default)))
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files
   (quote
    ("~/Documents/CS/project/third-year-project-report/progress.org" "~/notes.org")))
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 2.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-latex-pdf-process
   (quote
    ("cd %o; LATEX=\"%latex\" texi2dvi -p -b -V %b.tex")))
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (telephone-line ag which-key helm-descbinds evil-surround use-package racket-mode git-gutter-fringe+ gruvbox-theme vlf org-ref solarized-theme org-projectile-helm org-projectile yaml-mode function-args helm-gtags ggtags helm haskell-mode magit scheme-complete tagedit smex slime s12cpuv2-mode rainbow-delimiters projectile paredit magit-popup ido-vertical-mode ido-ubiquitous git-commit ghub geiser flycheck evil-leader evil-commentary elpy clojure-mode-extra-font-locking cider better-defaults)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(recentf-max-saved-items 50)
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c8805d801780")
     (60 . "#bec073400bc0")
     (80 . "#b58900")
     (100 . "#a5008e550000")
     (120 . "#9d0091000000")
     (140 . "#950093aa0000")
     (160 . "#8d0096550000")
     (180 . "#859900")
     (200 . "#66aa9baa32aa")
     (220 . "#57809d004c00")
     (240 . "#48559e556555")
     (260 . "#392a9faa7eaa")
     (280 . "#2aa198")
     (300 . "#28669833af33")
     (320 . "#279993ccbacc")
     (340 . "#26cc8f66c666")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DroidSansMono Nerd Font Mono" :foundry "1ASC" :slant normal :weight normal :height 113 :width normal)))))
