(setq recentf-save-file (concat user-emacs-directory ".recentf"))


(use-package recentf
  :ensure t
  :config 
  (recentf-mode 1)
  (setq recentf-max-menu-items 40)
  (add-to-list 'recentf-exclude (format "%s/\\.emacs\\.d/elpa/.*" (getenv "HOME"))))


;; (ido-mode t)
;; ;; fuzzy matching
;; (setq ido-enable-flex-matching t)
;; ;; annoying
;; (setq ido-use-filename-at-point nil)

;; ;; only match in current directory
;; (setq ido-auto-merge-work-directories-length -1)

;; ;; include recently open files
;; (setq ido-use-virtual-buffers t)

;; (ido-ubiquitous-mode 1)

;; (setq smex-save-file (concat user-emacs-directory ".smex-items"))
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)

;; (projectile-global-mode)

;; (require 'ido-vertical-mode)
;; (ido-mode 1)
;; (ido-vertical-mode 1)
;; (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

;; (defun recentf-ido-find-file ()
;;   "Find a recent file using ido."
;;   (interactive)
;;   (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
;;     (when file
;;       (find-file file))))

;; (global-set-key (kbd "C-c f") 'recentf-ido-find-file)

(defun switch-to-last-buffer ()
  "Switch to last open buffer"
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(global-set-key (kbd "C-c b") 'switch-to-last-buffer)
(global-set-key (kbd "M-#") 'switch-to-last-buffer)

; rebind C-x C-0 to avoid clashes with C-x 0
(global-set-key (kbd "C-x C-0") 'delete-window)

(use-package magit
  :ensure t
  :commands magit-status
  :bind (("C-x g" . magit-status)))

(use-package projectile
  :ensure t
  :config (progn
            (setq projectile-completion-system 'helm)   
            (projectile-global-mode)))

(use-package ag
  :ensure t)


(defvar find-file-root-prefix (if (featurep 'xemacs) "/[sudo/root@localhost]" "/sudo:root@localhost:" )
  "*The filename prefix used to open a file with `find-file-root'.")

(defvar find-file-root-history nil
  "History list for files found using `find-file-root'.")

(defvar find-file-root-hook nil
  "Normal hook for functions to run after finding a \"root\" file.")

(defun find-file-root ()
  "*Open a file as the root user.
   Prepends `find-file-root-prefix' to the selected file name so that it
   maybe accessed via the corresponding tramp method."

  (interactive)
  (require 'tramp)
  (let* ( ;; We bind the variable `file-name-history' locally so we can
	 ;; use a separate history list for "root" files.
	 (file-name-history find-file-root-history)
	 (name (or buffer-file-name default-directory))
	 (tramp (and (tramp-tramp-file-p name)
		     (tramp-dissect-file-name name)))
	 path dir file)

    ;; If called from a "root" file, we need to fix up the path.
    (when tramp
      (setq path (tramp-file-name-localname tramp)
	    dir (file-name-directory path)))

    (when (setq file (read-file-name "Find file (UID = 0): " dir path))
      (find-file (concat find-file-root-prefix file))
      ;; If this all succeeded save our new history list.
      (setq find-file-root-history file-name-history)
      ;; allow some user customization
      (run-hooks 'find-file-root-hook))))

(general-define-key
 "C-x C-r" 'find-file-root)
