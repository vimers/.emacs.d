;;; package -- Summary
;;; Commentary:
;;; code:
(use-package org
  :defines org-plantuml-jar-path org-ditaa-jar-path org-home-dir org-capture-templates
  :config
  (declare-function org-display-inline-images "org.el")

  :init
  (setq-default org-todo-keywords
                '((sequence "TODO" "PENDING" "|" "DONE" "CANCEL")))
  (setq org-todo-keyword-faces '(("TODO" . "green")
                                 ("PENDING" . "red")
                                 ("DONE" . "grey")
                                 ("CANCEL" . "grey")))
  (setq org-enforce-todo-dependencies t)
  ;; trust all code as being safe
  (setq org-confirm-babel-evaluate nil)
  ;; enable <? to expand org tempates
  (require 'org-tempo)
  ;; support uml drawing
  (setq org-plantuml-jar-path
      (expand-file-name "scripts/plantuml.jar" user-emacs-directory))
  (setq org-ditaa-jar-path (expand-file-name "scripts/ditaa0_9.jar" user-emacs-directory))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
	 (plantuml . t)
	 (ditaa . t)
	 (shell . t)
	 (C . t)
	 (python . t)))
  ;; automatically show the resulting image
  ; make babel results blocks lowercase
  (defun bh/display-inline-images ()
    "Display image."
    (condition-case nil
	(org-display-inline-images)
      (error nil)))
  (add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)
  (setq org-log-done 'time)
  ;; org-capture setting
  (setq org-home-dir (or (getenv "ORG_HOME") "~/.org"))
  (setq org-default-notes-file (concat (file-name-as-directory org-home-dir) (format-time-string "plan/after-hours/after-hours-%Y.org")))
  (setq org-capture-templates
      `(("t" "Work Todo" entry (file ,(concat (file-name-as-directory org-home-dir) (format-time-string "plan/work/work-%Y.org"))) "* TODO %^{任务标题}\nCreate at %U\n %?")
	("j" "Journal" entry (file+datetree ,(concat (file-name-as-directory org-home-dir) (format-time-string "journal/journal-%Y.org"))) "* %U - %^{标题}\n %?")
	("r" "Recruit" entry (file+headline ,(concat (file-name-as-directory org-home-dir) "plan/work/recruit.org") "意向人员") "* 待沟通 %^{姓名}%^{COMPANY}p%^{TEAM}p\n%?")
	("b" "Billing")
	("bg" "Game" table-line (file+olp ,(concat (file-name-as-directory org-home-dir) "plan/after-hours/billing.org") ,(format-time-string "%Y年") ,(format-time-string "%m月")) " | %^t | Game | %^{Description} | %^{Amount} |")
	("be" "Education" table-line (file+olp ,(concat (file-name-as-directory org-home-dir) "plan/after-hours/billing.org") ,(format-time-string "%Y年") ,(format-time-string "%m月")) " | %^t | Education | %^{Description} | %^{Amount} |")
	("bf" "Food" table-line (file+olp ,(concat (file-name-as-directory org-home-dir) "plan/after-hours/billing.org") ,(format-time-string "%Y年") ,(format-time-string "%m月")) " | %^t | Food | %^{Description} | %^{Amount} |")
	("bt" "Travel" table-line (file+olp ,(concat (file-name-as-directory org-home-dir) "plan/after-hours/billing.org") ,(format-time-string "%Y年") ,(format-time-string "%m月")) " | %^t | Travel | %^{Description} | %^{Amount} |")
	("bs" "Salary" table-line (file+olp ,(concat (file-name-as-directory org-home-dir) "plan/after-hours/billing.org") ,(format-time-string "%Y年") ,(format-time-string "%m月")) " | %^t | Salary | %^{Description} | %^{Amount} |")
	("bh" "House(Rent/Mortgage)" table-line (file+olp ,(concat (file-name-as-directory org-home-dir) "plan/after-hours/billing.org") ,(format-time-string "%Y年") ,(format-time-string "%m月")) " | %^t | House | %^{Description} | %^{Amount} |")
	("bb" "Body Health" table-line (file+olp ,(concat (file-name-as-directory org-home-dir) "plan/after-hours/billing.org") ,(format-time-string "%Y年") ,(format-time-string "%m月")) " | %^t | Health | %^{Description} | %^{Amount} |")
	("bp" "Pet" table-line (file+olp ,(concat (file-name-as-directory org-home-dir) "plan/after-hours/billing.org") ,(format-time-string "%Y年") ,(format-time-string "%m月")) " | %^t | Pet | %^{Description} | %^{Amount} |")
	("bo" "Others" table-line (file+olp ,(concat (file-name-as-directory org-home-dir) "plan/after-hours/billing.org") ,(format-time-string "%Y年") ,(format-time-string "%m月")) " | %^t | Others | %^{Description} | %^{Amount} |")
	("a" "After hours Todo" entry (file ,(concat (file-name-as-directory org-home-dir) (format-time-string "plan/after-hours/after-hours-%Y.org"))) "* TODO %^{任务标题}\nCreate at %U\n %?")
    ("h" "Health record" table-line (file ,(concat (file-name-as-directory org-home-dir) (format-time-string "journal/blood_pressure.org"))) " | %U | %^{高压} | %^{低压} | %^{心率} |")))
  :bind ("C-c c" . org-capture)
  :bind ("C-c a" . org-agenda)
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
;; export to pdf setting
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode %f"
	"xelatex -interaction nonstopmode %f"))
;; hide the emphasis markup
(setq org-hide-emphasis-markers t)
;; use centered-dot character as list marker
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
(use-package org-bullets
  :hook (org-mode . org-bullets-mode))
(provide 'init-org)
;;; init-org.el ends here
