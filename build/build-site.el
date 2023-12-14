;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(message "Package refresh complete!")

;; Install dependencies inside the ./packages directory
;; should install ONLY org-static-blog
(package-install 'org-static-blog)
(message "Package installation complete!")

;; directories and urls
(setq org-static-blog-publish-title "arvydasg.github.io")
(setq org-static-blog-publish-url "https://arvydasg.github.io/org-static-blog/html")
(setq org-static-blog-publish-directory "~/GIT/org-static-blog/html")
(setq org-static-blog-posts-directory "~/GIT/org-static-blog/org")
(setq org-static-blog-drafts-directory "~/GIT/org-static-blog/drafts")
(setq org-static-blog-index-length 5)
;; (setq org-static-blog-preview-link-p t)
(setq org-static-blog-preview-date-first-p nil) ;date goes after title when nil
(setq org-static-blog-use-preview t)	;don't show the whole post, just a preview of 10 or so words
(setq org-static-blog-enable-tags t)	;enable tags(separate html pages for tags and tags next to posts)
;; (setq org-export-with-toc nil)            ;can add in individual file with #+OPTIONS: toc:1/nil
;; (setq org-export-with-section-numbers nil) ;can add in individual file with #+OPTIONS: num:nil

(org-static-blog-publish t)

(message "Build complete!")
