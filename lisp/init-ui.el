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

;; encoding begin
(set-language-environment 'Chinese-GB)
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq-default pathname-coding-system 'euc-cn)
(setq file-name-coding-system 'euc-cn)
(prefer-coding-system 'cp950)
(prefer-coding-system 'gb2312)
(prefer-coding-system 'cp936)
(prefer-coding-system 'gb18030)
(prefer-coding-system 'utf-16)
(prefer-coding-system 'utf-8-dos)
(prefer-coding-system 'utf-8-unix)
;; encoding end
(provide 'init-ui)
;;; init-ui.el ends here
