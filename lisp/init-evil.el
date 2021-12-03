;;; package -- Summary
;;; Commentary:
;;; code:
(use-package evil)
(evil-mode 1)
; set jk to espace from insert mode to normal mode in evil
(use-package key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)
(use-package evil-leader)
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
 "e" 'find-file
 "b" 'switch-to-buffer
 "k" 'kill-buffer)
(provide 'init-evil)
;;; init-evil.el ends here
