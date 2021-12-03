;;; package -- Summary
;;; Commentary:
;;; code:
(use-package which-key
  :defer nil
  :config (which-key-mode))
; use expand region to select region fastly
(use-package expand-region
  :bind ("C-=" . er/expand-region))
; tab indent setting
(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default c-basic-offset 4 c-default-style "bsd")
(define-key global-map (kbd "RET") 'newline-and-indent)
(use-package dtrt-indent)
(dtrt-indent-mode 1)
(provide 'init-kbd)
;;; init-kbd.el ends here
