;;; package -- Summary
;;; Commentary:
;;; code:
(use-package org
  :defines org-plantuml-jar-path org-ditaa-jar-path org-home-dir org-capture-templates
  :config
  (declare-function org-display-inline-images "org.el")

  :init
  (setq org-todo-keyword-faces '(("TODO" . "green")
							   ("DOING" . (:background "yellow" :foreground "black" :weight bold))
							   ("PENDING" . "red")
							   ("DONE" . "grey")
							   ("CANCEL" . "grey")))
  (setq org-enforce-todo-dependencies t)
  ;; trust all code as being safe
  (setq org-confirm-babel-evaluate nil)
  ;; support uml drawing
  (setq org-plantuml-jar-path
      (expand-file-name "scripts/plantuml.jar" user-emacs-directory))
  (setq org-ditaa-jar-path (expand-file-name "scripts/ditaa0_9.jar" user-emacs-directory))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
	 (plantuml . t)
	 (ditaa . t)
	 (python . t)))
  ;; automatically show the resulting image
  ; make babel results blocks lowercase
  (defun bh/display-inline-images ()
    "Display image."
    (condition-case nil
	(org-display-inline-images)
      (error nil)))
  (add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)
  ;; org-capture setting
  (setq org-home-dir (or (getenv "ORG_HOME") "~/.org"))
  (setq org-default-notes-file (concat (file-name-as-directory org-home-dir) "plan/after-hours/after-hours-2021.org"))
  (setq org-capture-templates
      `(("t" "Work Todo" entry (file ,(concat (file-name-as-directory org-home-dir) "plan/work/work-2021.org")) "* TODO %?\n Create at %U\n %a")
	("j" "Journal" entry (file+datetree ,(concat (file-name-as-directory org-home-dir) "journal/journal-2021.org")) "* %U - %^{heading}\n %?")
	("h" "After hours Todo" entry (file ,(concat (file-name-as-directory org-home-dir) "plan/after-hours/after-hours-2021.org")) "* TODO %?\n Create at %U\n %a")))
  :bind ("C-c c" . org-capture)
  )

(require 'cal-china)
;; deal with chinese anniversary
(defun my-diary-chinese-anniversary (lunar-month lunar-day &optional year mark)
  "Chinese diary for birthday record.
LUNAR-MONTH is chinese date month.
LUNAR-DAY is chinese date day.
YEAR is year in chinese date year.
MARK is reserve parameter."
	(if year
		(let* ((calendar-date-style 'american)
			   (d-date (diary-make-date lunar-month lunar-day year))
			   (a-date (calendar-absolute-from-gregorian d-date))
			   (c-date (calendar-chinese-from-absolute a-date))
			   (cycle (car c-date))
			   (yy (cadr c-date))
			   (y (+ (* 100 cycle) yy)))
		  (diary-chinese-anniversary lunar-month lunar-day y mark))
	  (diary-chinese-anniversary lunar-month lunar-day year mark)))
(provide 'init-org)
;;; init-org.el ends here
