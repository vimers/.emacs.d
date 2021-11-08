;;; package -- Summary
;;; Commentary:
;;; code:
(use-package org
  :config
  (declare-function org-link-set-parameters "org.el")
  :init
  (defun org-im-open (im-id)
    "Open im client to chat with IM-ID."
    (browse-url (concat "im:" im-id)))
  (org-link-set-parameters "im"
			   :follow #'org-im-open))

(provide 'init-custom-link)
;;; init-custom-link.el ends here
