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

(defconst Ev2le0-better-defaults-packages
  '(
	(dired-mode :location built-in)
	(profiler :location built-in)
	(recentf :location built-in)
    )
  )

(defun Ev2le0-better-defaults/post-init-recentf()
    (progn
    (setq recentf-exclude
          '("COMMIT_MSG"
            "COMMIT_EDITMSG"
            "github.*txt$"
            "/tmp/"
            "/ssh:"
            "/sudo:"
            "/TAGS$"
            "/GTAGS$"
            "/GRAGS$"
            "/GPATH$"
            "\\.mkv$"
            "\\.mp[34]$"
            "\\.avi$"
            "\\.pdf$"
            "\\.sub$"
            "\\.srt$"
            "\\.ass$"
            ".*png$"))
    (setq recentf-max-saved-items 2048))
    )

(defun Ev2le0-better-defaults/init-dired-mode ()
  (use-package dired-mode
	:defer t
	:init
	(progn
      (require 'dired-x)
      (require 'dired-aux)
      (setq dired-listing-switches "-alh")
      (setq dired-guess-shell-alist-user
            '(("\\.pdf\\'" "open")
              ("\\.docx\\'" "open")
              ("\\.\\(?:djvu\\|eps\\)\\'" "open")
              ("\\.\\(?:jpg\\|jpeg\\|png\\|gif\\|xpm\\)\\'" "open")
              ("\\.\\(?:xcf\\)\\'" "open")
              ("\\.csv\\'" "open")
              ("\\.tex\\'" "open")
              ("\\.\\(?:mp4\\|mkv\\|avi\\|flv\\|ogv\\)\\(?:\\.part\\)?\\'"
               "open")
              ("\\.\\(?:mp3\\|flac\\)\\'" "open")
              ("\\.html?\\'" "open")
              ("\\.md\\'" "open")))
	)
	;; always delete and copy recursively
    (setq dired-recursive-deletes 'always)
    (setq dired-recursive-copies 'always)
  ))

(defun Ev2le0-better-defaults/init-profiler ()
  (use-package profiler
    :init
    (evilified-state-evilify profiler-report-mode profiler-report-mode-map)))
;;; packages.el ends here

