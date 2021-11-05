;;; package -- Summary
;;; Commentary:
;;; code:
(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

(require 'init-startup)
(require 'init-elpa)
(require 'init-ui)
(require 'init-autocomplete)
(require 'init-kbd)
(require 'init-org)
(use-package restart-emacs)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
		     (load-file custom-file))
;;; init.el ends here
