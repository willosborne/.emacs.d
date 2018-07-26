(require 'package)
(require 'xref)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)
(defvar predicate nil)
(defvar inherit-input-method nil)

(require 'slime)
(slime-setup '(slime-repl))

;; (setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq inferior-lisp-program "/home/will/common-lisp/ccl/lx86cl64")
(setq slime-contribs '(slime-fancy slime-asdf slime-quicklisp))

;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
;; (setq inferior-lisp-program "sbcl")

;; (add-to-list 'load-path "~/.emacs.d/evil")


(defvar my-packages
  '(
    paredit
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

    ido-ubiquitous

    smex

    projectile
    slime

    rainbow-delimiters

    tagedit

    magit
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
(load "setup-clojure.el")
(load "setup-js.el")



;; LEAVE THIS ALONE, it does stuff for themes
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" default)))
 '(package-selected-packages
   (quote
    (magit scheme-complete tagedit smex slime s12cpuv2-mode rainbow-delimiters projectile paredit magit-popup lispy ido-vertical-mode ido-ubiquitous git-commit ghub geiser flycheck evil-leader evil-commentary elpy clojure-mode-extra-font-locking cider better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
