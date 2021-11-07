;;; package -- Summary
;;; Commentary:
;;; code:
(use-package which-key
  :defer nil
  :config (which-key-mode))
; use expand region to select region fastly
(use-package expand-region
  :bind ("C-=" . er/expand-region))
(provide 'init-kbd)
;;; init-kbd.el ends here
