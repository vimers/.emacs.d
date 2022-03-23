;;; package -- Summary
;;; Commentary:
;;; code:
(use-package gruvbox-theme
     :init (load-theme 'gruvbox-light-soft t))
(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))
(menu-bar-mode -1)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
(provide 'init-ui)
;;; init-ui.el ends here
