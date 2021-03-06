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
  (push '(company-files) company-backends)
  :hook ((after-init . global-company-mode)))

(use-package company-box
  :hook (company-mode . company-box-mode))
(use-package projectile
  :ensure t
  :after helm
  :bind-keymap (
                ("C-c p" . projectile-command-map)
                ))
(use-package flycheck)
(use-package yasnippet :config (yas-global-mode))
(use-package lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  (setq lsp-completion-enable-additional-text-edit nil))
(use-package hydra)
(use-package lsp-ui
  :config
  (key-chord-define evil-normal-state-map "gr" 'lsp-ui-peek-find-references))
(use-package which-key :config (which-key-mode))
(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package dap-java :ensure nil)
(use-package lsp-treemacs)

;; semantic check
(use-package flycheck
  :hook (prog-mode . flycheck-mode))

;; set python auto complete
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
			 (require 'lsp-pyright)
			 (lsp))))

(use-package helm-xref)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

;; typescript language server setting
(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(provide 'init-lsc)
;;; init-lsc.el ends here
