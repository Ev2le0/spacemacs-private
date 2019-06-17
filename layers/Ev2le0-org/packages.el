;;; packages.el --- Ev2le0 layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Y1LE0 <y1le0@y1le0>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `Ev2le0-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `Ev2le0/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `Ev2le0/pre-init-PACKAGE' and/or
;;   `Ev2le0/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst Ev2le0-org-packages
  '(
	(org :location built-in)
  deft
	))

(defun Ev2le0-org/post-init-org()
  (with-eval-after-load 'org
	(progn 
	  (require 'org-tempo)
	  (setq org-startup-indented t)
	  ;; define the refile targets
      (setq org-agenda-file-study (expand-file-name "study.org" org-agenda-dir))
      (setq org-agenda-file-work (expand-file-name "work.org" org-agenda-dir))
      (setq org-agenda-file-life (expand-file-name "life.org" org-agenda-dir))
      (setq org-agenda-file-journal (expand-file-name "journal.org" org-agenda-dir))
      (setq org-agenda-files (list org-agenda-dir))
	     (setq org-capture-templates
            '(("l" "life" entry (file+headline org-agenda-file-life "生活")
               "* %?\n  %i\n %U"
               :empty-lines 1)
              ("s" "study" entry (file+headline org-agenda-file-study "学习")
               "* %?\n  %i\n %U"
               :empty-lines 1)
              ("w" "work" entry (file+headline org-agenda-file-work "工作")
               "* TODO [#A] %?\n  %i\n %U"
               :empty-lines 1)
              ("j" "Journal Entry" entry (file+datetree org-agenda-file-journal)
               "* %?"
               :empty-lines 1)))
      ;;An entry without a cookie is treated just like priority ' B '.
      ;;So when create new task, they are default 重要且紧急
      (setq org-agenda-custom-commands
            '(
              ("w" . "日程查看")
              ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
              ("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
              ("wc" "不重要且不紧急的任务" tags-todo "+PRIORITY=\"C\"")
                ))
	  )
  )
)

(defun Ev2le0-org/post-init-deft()
  (progn
    (setq deft-use-filter-string-for-filename t)
    (setq deft-recursive t)
    (setq deft-extension "org")
    (setq deft-directory deft-dir)))
;;; packages.el ends here

