;;; package -- Summary
;;; Commentary:
;;; code:
(use-package evil
  :ensure t
  :defer 1
  :init
  (evil-mode t)
  (setq evil-want-integration t)
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-want-keybinding nil)
  :config
  (use-package evil-leader
    :ensure t
    :after evil
    :init
    (global-evil-leader-mode)
    :config
    (evil-leader/set-leader ",")
    (evil-leader/set-key
      "e" 'helm-find-files
      "b" 'helm-buffers-list
      "k" 'kill-buffer
      "g" 'magit)
    )
  (use-package evil-collection
    :after evil
    :ensure t
    :config
    (evil-collection-init))
  (use-package evil-surround
    :ensure t
    :commands
    (evil-surround-edit
     evil-Surround-edit
     evil-surround-region
     evil-Surround-region)
    :init
    (evil-define-key 'operator global-map "s" 'evil-surround-edit)
    (evil-define-key 'operator global-map "S" 'evil-Surround-edit)
    (evil-define-key 'visual global-map "S" 'evil-surround-region)
    (evil-define-key 'visual global-map "gS" 'evil-Surround-region))
  )
; evil-org not work at termianl emacs
(use-package evil-org
  :ensure t
  :defer 1
  :after (org evil)
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
; set jk to espace from insert mode to normal mode in evil
(use-package key-chord
  :ensure t
  :after evil
  :init
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode 1))

(provide 'init-evil)
;;; init-evil.el ends here
