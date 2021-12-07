;;; package -- Summary
;;; Commentary:
;;; code:
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)
(use-package helm
  :ensure t
  :demand
  :bind (
         ("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-buffers-list)
         ("C-x c o" . helm-occur)
         ("M-y" . helm-show-kill-ring)
         ("C-x r b" . helm-filtered-bookmarks))
  :preface (require 'helm-config)
  :config (helm-mode 1))
(require 'helm-config)
(require 'helm-misc)
(require 'helm-locate)
(use-package helm-projectile)
(use-package helm-lsp)
(provide 'init-fuzzyfinder)
;;; init-fuzzyfinder.el ends here
