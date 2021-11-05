;;; package -- Summary
;;; Commentary:
;;; code:
(use-package which-key
  :defer nil
  :config (which-key-mode))

(global-set-key (kbd "C-c c") 'org-capture)

(provide 'init-kbd)
;;; init-kbd.el ends here
