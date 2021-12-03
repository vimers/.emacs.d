;;; package -- Summary
;;; Commentary:
;;; code:
(use-package gruvbox-theme
     :init (load-theme 'gruvbox-dark-soft t))
(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))
(menu-bar-mode -1)
(use-package rainbow-delimiters
  :init
  (custom-set-faces
   '(rainbow-delimiters-depth-1-face ((t (:foreground "red" :height 1.6))))
   '(rainbow-delimiters-depth-2-face ((t (:foreground "orange" :height 1.5))))
   '(rainbow-delimiters-depth-3-face ((t (:foreground "yellow" :height 1.4))))
   '(rainbow-delimiters-depth-4-face ((t (:foreground "green" :height 1.3))))
   '(rainbow-delimiters-depth-5-face ((t (:foreground "blue" :height 1.2))))
   '(rainbow-delimiters-depth-6-face ((t (:foreground "violet" :height 1.1))))
   '(rainbow-delimiters-depth-7-face ((t (:foreground "purple" :height 1.0))))
   '(rainbow-delimiters-depth-8-face ((t (:foreground "white" :height 0.9))))
   '(rainbow-delimiters-depth-9-face ((t (:foreground "cyah" :height 0.8)))))
  :hook (prog-mode . rainbow-delimiters-mode))
(provide 'init-ui)
;;; init-ui.el ends here
