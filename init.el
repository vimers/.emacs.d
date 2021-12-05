;;; package -- Summary
;;; Commentary:
;;; code:
(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))
; Custom setting. Proxy setting,Font setting...
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
		     (load-file custom-file))
(require 'init-startup nil 'noerror)
(require 'init-elpa nil 'noerror)
(require 'init-ui nil 'noerror)
(require 'init-lsc nil 'noerror)
(require 'init-kbd nil 'noerror)
(require 'init-org nil 'noerror)
(require 'init-evil nil 'noerror)
(require 'init-fuzzyfinder nil 'noerror)
(require 'init-git nil 'noerror)
(require 'init-custom-link nil 'noerror)
(require 'init-blog nil 'noerror)
(require 'init-abbrev nil 'noerror)
(require 'init-gdb nil 'noerror)
(use-package restart-emacs)


;;; init.el ends here
