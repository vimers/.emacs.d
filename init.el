;;; package -- Summary
;;; Commentary:
;;; code:
(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

(require 'init-startup nil 'noerror)
(require 'init-elpa nil 'noerror)
(require 'init-ui nil 'noerror)
(require 'init-autocomplete nil 'noerror)
(require 'init-kbd nil 'noerror)
(require 'init-org nil 'noerror)
(require 'init-git nil 'noerror)
(use-package restart-emacs)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
		     (load-file custom-file))
;;; init.el ends here
