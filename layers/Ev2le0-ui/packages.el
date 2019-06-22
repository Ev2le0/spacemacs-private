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

(defconst Ev2le0-ui-packages
  '(
    all-the-icons
  )
)
(defun Ev2le0-ui/post-init-all-the-icons()
	 (use-package 
	   :config
        (setq all-the-icons-color-icons t)
        (setq all-the-icons-fro-buffer t)
	   )
)

;;; packages.el ends here

