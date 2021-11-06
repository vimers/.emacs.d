;;; package -- Summary
;;; Commentary:
;;; code:
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  :config
  (setq-default magit-diff-refine-hunk t)
  (setq magit-save-repository-buffers 'dontask)
  )

(provide 'init-git)
;;; init-git.el ends here
