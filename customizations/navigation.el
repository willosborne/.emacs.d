(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)

(ido-mode t)
;; fuzzy matching
(setq ido-enable-flex-matching t)
;; annoying
(setq ido-use-filename-at-point nil)

;; only match in current directory
(setq ido-auto-merge-work-directories-length -1)

;; include recently open files
(setq ido-use-virtual-buffers t)

(ido-ubiquitous-mode 1)

;; (global-set-key (kbd "C-x C-b") 'ibuffer)

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(projectile-global-mode)

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(global-set-key (kbd "C-c f") 'recentf-ido-find-file)

(defun switch-to-last-buffer ()
  "Switch to last open buffer"
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(global-set-key (kbd "C-c b") 'switch-to-last-buffer)
(global-set-key (kbd "M-#") 'switch-to-last-buffer)


(global-set-key (kbd "C-x g") 'magit-status)

; rebind C-x C-0 to avoid clashes with C-x 0
(global-set-key (kbd "C-x C-0") 'delete-window)
