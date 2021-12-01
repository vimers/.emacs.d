;;; package -- Summary
;;; Commentary:
;;; code:
(require 'ox-publish)
(require 'ox-html)

;;; code highlight
;;; htmlize install by apt install elpa-htmlize
(setq org-html-htmlize-output-type 'css)
(setq org-html-htmlize-font-prefix "org-")
(setq org-html-head-include-default-style nil)
(setq org-publish-project-alist
      '(("blog-notes"
	 :base-directory "~/Documents/Blog/org/notes"
	 :base-extension "org"
	 :publishing-directory "~/Documents/Blog/org/public_html/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :html-link-home "index.html"
	 :html-link-org-files-as-html org-html-link-org-files-as-html
	 :headline-level 5
	 :with-author nil
	 :with-email nil
	 :with-creator nil
	 :with-timestamps nil
	 :with-postamble nil
	 :auto-preamble t
	 :section-number nil
	 :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://gongzhitaao.org/orgcss/org.css\" />"
	 :auto-sitemap t
	 :sitemap-filename "sitemap.org"
	 :sitemap-title "Sitemap"
	 :sitemap-sort-files anti-chronologically
	 :sitemap-file-entry-format "%d %t")
	("blog-static"
	 :base-directory "~/Documents/Blog/org/notes"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
	 :publishing-directory "~/Documents/Blog/org/public_html/"
	 :recursive t
	 :publishing-function org-publish-attachment)
	("blog-github" :components ("blog-notes" "blog-static"))
	))

(provide 'init-blog)
;;; init-blog.el ends here
