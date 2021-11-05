;;; package -- Summary
;;; Commentary:
;;; code:
(use-package company
  :defines company-dabbrev-code-everywhere
  company-dabbrev-code-modes
  company-dabbrev-code-other-buffers
  company-dabbrev-downcase
  company-dabbrev-ignore-case
  company-dabbrev-other-buffers
  :config
  (setq company-dabbrev-code-everywhere t
	company-dabbrev-code-modes t
	company-dabbrev-code-other-buffers 'all
	company-dabbrev-downcase nil
	company-dabbrev-ignore-case t
	company-dabbrev-other-buffers 'all
	company-require-match nil
	company-minimum-prefix-length 2
	company-show-quick-access t
	company-tooltip-limit 20
	company-idle-delay 0
	company-echo-delay 0
	company-tooltip-offset-display 'scrollbar
	company-begin-commands '(self-insert-command))
  (push '(company-semantic :with company-yasnippet) company-backends)
  :hook ((after-init . global-company-mode)))

;; semantic check
(use-package flycheck
  :hook (prog-mode . flycheck-mode))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode))

(provide 'init-autocomplete)
;;; init-autocomplete.el ends here
