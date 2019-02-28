(use-package haskell-mode
  :ensure t
  :bind (:map evil-normal-state-map
              ("C-c C-d d" . haskell-hoogle)
              ("C-c C-d C-d" . haskell-hoogle))
  :bind (:map evil-insert-state-map
              ("C-c C-d d" . haskell-hoogle)
              ("C-c C-d C-d" . haskell-hoogle))
  :config (setq haskell-tags-on-save t))


