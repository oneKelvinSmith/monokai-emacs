;;; monokai-theme.el --- A fruity color theme for Emacs.

;; Copyright (C) 2011-2013

;; Author: Kelvin Smith <oneKelvinSmith@gmail.com>
;; URL: http://github.com/oneKelvinSmith/monokai-emacs
;; Version: 0.1.3

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A port of the popular Textmate theme Monokai for Emacs 24, built on top
;; of the new built-in theme support in Emacs 24.
;;
;;; Credits:
;;
;; Wimer Hazenberg created the original theme.
;; - http://www.monokai.nl/blog/2006/07/15/textmate-color-theme/
;;
;; Bozhidar Batsov created zenburn-theme.el on which this file is based.
;; - https://github.com/bbatsov/zenburn-emacs
;;
;; Color Scheme Designer 3 for complementary colours.
;; - http://colorschemedesigner.com/
;;
;; K. Adam Christensen for his person monokai theme that addresses 256 colors.
;; - https://github.com/pope/personal/blob/master/etc/emacs.d/monokai-theme.el

;;; Code:

(unless (>= 24 emacs-major-version)
  (error "The monokai theme requires Emacs 24 or later!"))

(deftheme monokai "The Monokai color theme")

;;; Color Palette

(defvar monokai-colors
  '((((class color) (min-colors 65535))
     (monokai-bg-1      . "#171A0B")
     (monokai-bg        . "#272822")
     (monokai-bg+1      . "#3E3D31")
     (monokai-bg+2      . "#49483E")
     (monokai-red-1     . "#A20C41")
     (monokai-red       . "#F92672")
     (monokai-red+1     . "#FC5C94")
     (monokai-red+2     . "#FC87B0")
     (monokai-green-1   . "#67930F")
     (monokai-green     . "#A6E22E")
     (monokai-green+1   . "#C1F161")
     (monokai-green+2   . "#CDF187")
     (monokai-orange-1  . "#A45E0A")
     (monokai-orange    . "#FD971F")
     (monokai-orange+1  . "#FEB257")
     (monokai-orange+2  . "#FEC683")
     (monokai-yellow-1  . "#968B26")
     (monokai-yellow    . "#E6DB74")
     (monokai-yellow+1  . "#F3EA98")
     (monokai-yellow+2  . "#F3ECB0")
     (monokai-blue-1    . "#21889B")
     (monokai-blue      . "#66D9EF")
     (monokai-blue+1    . "#8DE6F7")
     (monokai-blue+2    . "#A9EBF7")
     (monokai-purple-1  . "#562AA6")
     (monokai-purple    . "#AE81FF")
     (monokai-purple+1  . "#C2A1FF")
     (monokai-purple+2  . "#D2BAFF")
     (monokai-magenta-1 . "#A41F99")
     (monokai-magenta   . "#FD5FF0")
     (monokai-magenta+1 . "#FE87F4")
     (monokai-magenta+2 . "#FEA7F7")
     (monokai-cyan-1    . "#349B8D")
     (monokai-cyan      . "#A1EFE4")
     (monokai-cyan+1    . "#BBF7EF")
     (monokai-cyan+2    . "#CBF7F1")
     (monokai-fg-1      . "#75715E")
     (monokai-fg        . "#F8F8F2")
     (monokai-fg+1      . "#F8F8F0"))
    (t
     (monokai-bg-1      . "#141414")
     (monokai-bg        . "#1B1E1C")
     (monokai-bg+1      . "#212121")
     (monokai-bg+2      . "#303030")
     (monokai-red-1     . "#5F0000")
     (monokai-red       . "#FF1493")
     (monokai-red+1     . "#EE6AA7")
     (monokai-red+2     . "#FF82AB")
     (monokai-green-1   . "#6B8E23")
     (monokai-green     . "#87D700")
     (monokai-green+1   . "#B3EE3A")
     (monokai-green+2   . "#CCFF99")
     (monokai-orange-1  . "#A0522D")
     (monokai-orange    . "#FF8C00")
     (monokai-orange+1  . "#FFA54F")
     (monokai-orange+2  . "#FFD39B")
     (monokai-yellow-1  . "#968B26")
     (monokai-yellow    . "#CDC673")
     (monokai-yellow+1  . "#FFF68F")
     (monokai-yellow+2  . "#F3ECB0")
     (monokai-blue-1    . "#21889B")
     (monokai-blue      . "#5FD7FF")
     (monokai-blue+1    . "#8DE6F7")
     (monokai-blue+2    . "#A9EBF7")
     (monokai-purple-1  . "#562AA6")
     (monokai-purple    . "#AF87FF")
     (monokai-purple+1  . "#C2A1FF")
     (monokai-purple+2  . "#D2BAFF")
     (monokai-magenta-1 . "#A41F99")
     (monokai-magenta   . "#D700D7")
     (monokai-magenta+1 . "#FE87F4")
     (monokai-magenta+2 . "#FEA7F7")
     (monokai-cyan-1    . "#349B8D")
     (monokai-cyan      . "#5FFFFF")
     (monokai-cyan+1    . "#AFEEEE")
     (monokai-cyan+2    . "#CBF7F1")
     (monokai-fg-1      . "#8B8878")
     (monokai-fg        . "#F5F5F5")
     (monokai-fg+1      . "#FFFAFA")))
  "List of Monokai colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")


(defun monokai-expand-face (face)
  "Expands the simple `FACE' declaration with the color conditions."
  (let ((spec (car face))
        (props (cadr face)))
    (list spec (mapcar
                #'(lambda (entry)
                    (let ((color-condition (car entry)))
                      (list color-condition
                            (monokai-expand-colors (cdr entry) props))))
                monokai-colors))))

(defun monokai-expand-colors (color-alist props)
  "Expand colors in `COLOR-ALIST' onto `PROPS'."
  (let ((result '()))
    (while (car props)
      (let ((key (car props))
            (val (cadr props)))
        (if (memq key '(:foreground :background :color))
            (setq val (or (cdr (assq val color-alist)) val)))
        (if (listp val)
            (setq val (monokai-expand-colors entry val)))
        (setq result (append result `(,key ,val))))
      (setq props (cddr props)))
    result))

(defun monokai-theme-set-faces (theme &rest faces)
  "Set the `THEME' `FACES' to monokai colors."
  (apply 'custom-theme-set-faces
         (append (list theme)
                 (mapcar 'monokai-expand-face faces))))

;;; Theme Faces
(monokai-theme-set-faces
 'monokai
;;;; Built-in
;;;;; basic coloring
 '(button
   (:underline t))

 '(link
   (:foreground monokai-blue
                :underline t :weight bold))

 '(link-visited
   (:foreground monokai-purple
                :underline t
                :weight normal))

 '(default
    (:foreground monokai-fg
                 :background monokai-bg))

 '(cursor
   (:foreground monokai-bg-1
                :background monokai-fg))

 '(escape-glyph
   (:foreground monokai-fg-1
                :bold t))

 '(fringe
   (:foreground monokai-fg
                :background monokai-bg))

 '(header-line
   (:foreground monokai-fg-1
                :background monokai-bg-1
                :box (:line-width -1 :style released-button)))

 '(highlight
   (:foreground monokai-fg+1
                :background monokai-bg+2))

 '(success
   (:foreground monokai-green
                :weight bold))

 '(warning
   (:foreground monokai-yellow-1
                :weight bold))

 '(menu
   (:foreground monokai-fg
                :background monokai-bg))

 '(minibuffer-prompt
   (:foreground monokai-blue))

 '(mode-line
   (:foreground monokai-fg
                :background monokai-bg+2
                :box (:line-width -1 :style released-button)))


 '(mode-line-buffer-id
   (:foreground monokai-green
                :weight bold))

 '(mode-line-inactive
   (:foreground monokai-bg+2
                :background monokai-bg
                :box (:line-width -1 :style released-button)))

 '(region
   (:background monokai-bg+2))

 '(secondary-selection
   (:background monokai-bg+2))

 '(trailing-whitespace
   (:background monokai-red))

 '(vertical-border
   (:foreground monokai-bg+2))

;;;;; compilation
 '(compilation-column-face
   (:foreground monokai-yellow))

 '(compilation-enter-directory-face
   (:foreground monokai-green))

 '(compilation-error-face
   (:foreground monokai-red
                :weight bold
                :underline t))

 '(compilation-face
   (:foreground monokai-fg))

 '(compilation-info-face
   (:foreground monokai-blue))

 '(compilation-info
   (:foreground monokai-purple
                :underline t))

 '(compilation-leave-directory-face
   (:foreground monokai-green))

 '(compilation-line-face
   (:foreground monokai-bg+2))

 '(compilation-line-number
   (:foreground monokai-bg+2))

 '(compilation-message-face
   (:foreground monokai-blue))

 '(compilation-warning-face
   (:foreground monokai-yellow-1
                :weight bold
                :underline t))

;;;;; grep
 '(grep-context-face
   (:foreground monokai-fg))

 '(grep-error-face
   (:foreground monokai-red
                :weight bold
                :underline t))

 '(grep-hit-face
   (:foreground monokai-magenta))

 '(grep-match-face
   (:foreground monokai-orange
                :weight bold))

 '(match
   (:foreground monokai-green
                :background monokai-bg-1
                :weight bold))

;;;;; isearch
 '(isearch
   (:foreground monokai-orange
                :background monokai-bg-1))

 '(isearch-fail
   (:foreground monokai-fg+1
                :background monokai-red))

 '(lazy-highlight
   (:foreground monokai-magenta
                :background monokai-bg-1))

;;;;; font lock
 '(font-lock-builtin-face
   (:foreground monokai-green))

 '(font-lock-comment-delimiter-face
   (:foreground monokai-fg-1))

 '(font-lock-comment-face
   (:foreground monokai-fg-1))

 '(font-lock-constant-face
   (:foreground monokai-purple))

 '(font-lock-doc-face
   (:foreground monokai-fg-1))

 '(font-lock-doc-string-face
   (:foreground monokai-fg-1))

 '(font-lock-function-name-face
   (:foreground monokai-green))

 '(font-lock-keyword-face
   (:foreground monokai-red
                :weight bold))

 '(font-lock-negation-char-face
   (:foreground monokai-fg-1))

 '(font-lock-preprocessor-face
   (:foreground monokai-red))

 '(font-lock-regexp-grouping-construct
   (:foreground monokai-orange
                :weight bold))

 '(font-lock-regexp-grouping-backslash
   (:foreground monokai-green
                :weight bold))

 '(font-lock-string-face
   (:foreground monokai-yellow))

 '(font-lock-type-face
   (:foreground monokai-blue))

 '(font-lock-variable-name-face
   (:foreground monokai-orange))

 '(font-lock-warning-face
   (:foreground monokai-yellow-1
                :weight bold))

 '(c-annotation-face
   (:inherit 'font-lock-constant-face))

;;;;; newsticker
 '(newsticker-date-face
   (:foreground monokai-fg))

 '(newsticker-default-face
   (:foreground monokai-fg))

 '(newsticker-enclosure-face
   (:foreground monokai-green+1))

 '(newsticker-extra-face
   (:foreground monokai-fg-1
                :height 0.8))

 '(newsticker-feed-face
   (:foreground monokai-fg))

 '(newsticker-immortal-item-face
   (:foreground monokai-green))

 '(newsticker-new-item-face
   (:foreground monokai-blue))

 '(newsticker-obsolete-item-face
   (:foreground monokai-red))

 '(newsticker-old-item-face
   (:foreground monokai-fg-1))

 '(newsticker-statistics-face
   (:foreground monokai-fg))

 '(newsticker-treeview-face
   (:foreground monokai-fg))

 '(newsticker-treeview-immortal-face
   (:foreground monokai-green))

 '(newsticker-treeview-listwindow-face
   (:foreground monokai-fg))

 '(newsticker-treeview-new-face
   (:foreground monokai-blue
                :weight bold))

 '(newsticker-treeview-obsolete-face
   (:foreground monokai-red))

 '(newsticker-treeview-old-face
   (:foreground monokai-fg-1))

 '(newsticker-treeview-selection-face
   (:foreground monokai-orange))
;;;; Third-party
;;;;; ace-jump
 '(ace-jump-face-background
   (:foreground monokai-fg-1
                :background monokai-bg
                :inverse-video nil))

 '(ace-jump-face-foreground
   (:foreground monokai-green
                :background monokai-bg
                :inverse-video nil))

;;;;; full-ack
 '(ack-separator
   (:foreground monokai-fg))

 '(ack-file
   (:foreground monokai-blue))

 '(ack-line
   (:foreground monokai-yellow))

 '(ack-match
   (:foreground monokai-orange
                :background monokai-bg-1
                :weight bold))
;;;;; acutes
 '(font-latex-bold
   (:inherit 'bold))

 '(font-latex-warning
   (:inherit 'font-lock-warning))

 '(font-latex-sedate
   (:foreground monokai-fg-1
                :weight bold ))

 '(font-latex-title-4
   (:inherit 'variable-pitch
             :weight bold))

;;;;; auto-complete
 '(ac-candidate-face
   (:background monokai-bg+1
                :foreground monokai-fg-1))

 '(ac-selection-face
   (:background monokai-bg+2
                :foreground monokai-orange))

 '(popup-tip-face
   (:background monokai-bg+2
                :foreground monokai-orange))

 '(popup-scroll-bar-foreground-face
   (:background monokai-fg-1))

 '(popup-scroll-bar-background-face
   (:background monokai-bg-1))

 '(popup-isearch-match
   (:background monokai-bg
                :foreground monokai-fg))

;;;;; android mode
 '(android-mode-debug-face
   (:foreground monokai-green))

 '(android-mode-error-face
   (:foreground monokai-orange
                :weight bold))

 '(android-mode-info-face
   (:foreground monokai-blue))

 '(android-mode-verbose-face
   (:foreground monokai-purple))

 '(android-mode-warning-face
   (:foreground monokai-yellow-1))

;;;;; bm
 '(bm-face
   (:background monokai-yellow-1
                :foreground monokai-bg))

 '(bm-fringe-face
   (:background monokai-yellow-1
                :foreground monokai-bg))

 '(bm-fringe-persistent-face
   (:background monokai-orange-1
                :foreground monokai-bg))

 '(bm-persistent-face
   (:background monokai-orange-1
                :foreground monokai-bg))

;;;;; clojure-test-mode
 '(clojure-test-failure-face
   (:foreground monokai-red
                :weight bold
                :underline t))

 '(clojure-test-error-face
   (:foreground monokai-orange
                :weight bold
                :underline t))

 '(clojure-test-success-face
   (:foreground monokai-green
                :weight bold
                :underline t))

;;;;; ctable
 '(ctbl:face-cell-select
   (:background monokai-blue
                :foreground monokai-bg))

 '(ctbl:face-continue-bar
   (:background monokai-bg-1
                :foreground monokai-bg))

 '(ctbl:face-row-select
   (:background monokai-cyan
                :foreground monokai-bg))

;;;;; diff
 '(diff-added
   (:foreground monokai-green
                :background monokai-bg-1))

 '(diff-changed
   (:foreground monokai-yellow))

 '(diff-removed
   (:foreground monokai-red
                :background monokai-bg-1))

 '(diff-refine-added
   (:inherit 'diff-added
             :weight bold))

 '(diff-refine-change
   (:inherit 'diff-changed
             :weight bold))

 '(diff-refine-removed
   (:inherit 'diff-removed
             :weight bold))

 '(diff-header
   (:background monokai-bg+1))

 '(diff-file-header
   (:background monokai-bg+1
                :foreground monokai-fg
                :bold t))

;;;;; dired+
 '(diredp-display-msg
   (:foreground monokai-blue))

 '(diredp-compressed-file-suffix
   (:foreground monokai-orange))

 '(diredp-date-time
   (:foreground monokai-magenta))

 '(diredp-deletion
   (:foreground monokai-yellow))

 '(diredp-deletion-file-name
   (:foreground monokai-red))

 '(diredp-dir-heading
   (:foreground monokai-blue
                :background monokai-bg-1))

 '(diredp-dir-priv
   (:foreground monokai-cyan))

 '(diredp-exec-priv
   (:foreground monokai-red))

 '(diredp-executable-tag
   (:foreground monokai-green+1))

 '(diredp-file-name
   (:foreground monokai-blue))

 '(diredp-file-suffix
   (:foreground monokai-green))

 '(diredp-flag-mark
   (:foreground monokai-yellow))

 '(diredp-flag-mark-line
   (:foreground monokai-orange))

 '(diredp-ignored-file-name
   (:foreground monokai-red))

 '(diredp-link-priv
   (:foreground monokai-yellow))

 '(diredp-mode-line-flagged
   (:foreground monokai-yellow))

 '(diredp-mode-line-marked
   (:foreground monokai-orange))

 '(diredp-no-priv
   (:foreground monokai-fg))

 '(diredp-number
   (:foreground monokai-green+1))

 '(diredp-other-priv
   (:foreground monokai-yellow-1))

 '(diredp-rare-priv
   (:foreground monokai-red-1))

 '(diredp-read-priv
   (:foreground monokai-green-1))

 '(diredp-symlink
   (:foreground monokai-yellow))

 '(diredp-write-priv
   (:foreground monokai-magenta))

;;;;; ert
 '(ert-test-result-expected
   (:foreground monokai-green
                :background monokai-bg))

 '(ert-test-result-unexpected
   (:foreground monokai-red
                :background monokai-bg))

;;;;; eshell
 '(eshell-prompt
   (:foreground monokai-fg
                :weight bold))

 '(eshell-ls-archive
   (:foreground monokai-purple
                :weight bold))

 '(eshell-ls-backup
   (:inherit 'font-lock-comment))

 '(eshell-ls-clutter
   (:inherit 'font-lock-comment))

 '(eshell-ls-directory
   (:foreground monokai-blue
                :weight bold))

 '(eshell-ls-executable
   (:foreground monokai-green
                :weight bold))

 '(eshell-ls-unreadable
   (:foreground monokai-red))

 '(eshell-ls-missing
   (:inherit 'font-lock-warning))

 '(eshell-ls-product
   (:inherit 'font-lock-doc))

 '(eshell-ls-special
   (:foreground monokai-yellow
                :weight bold))

 '(eshell-ls-symlink
   (:foreground monokai-cyan
                :weight bold))

;;;;; flx
'(flx-highlight-face
  (:foreground monokai-green
               :weight bold))
;;;;; flycheck
 '(flycheck-error
   (supports :underline
             (:style wave)
             (:underline (:style wave :color monokai-red))))

 '(flycheck-warning
   (supports :underline
             (:style wave)
             (:underline (:style wave :color monokai-yellow-1))))

 '(flycheck-fringe-error
   (:foreground monokai-red
                :weight bold))

 '(flycheck-fringe-warning
   (:foreground monokai-yellow-1
                :weight bold))
;;;;; flymake
 '(flymake-errline
   (supports :underline
             (:style wave)
             (:underline (:style wave :color ,monokai-red))))

 '(flymake-warnline
   (supports :underline
             (:style wave)
             (:underline (:style wave :color ,monokai-yellow-1))))
 '(flymake-infoline
   (supports :underline
             (:style wave)
             (:underline
              (:style wave :color ,monokai-blue))))

;;;;; flyspell
 '(flyspell-duplicate
   (supports :underline
             (:style wave)
             (:underline
              (:style wave :color ,monokai-orange) :inherit unspecified)))
 '(flyspell-incorrect
   (supports :underline
             (:style wave)
             (:underline
              (:style wave :color ,monokai-red) :inherit unspecified)))

 ;;;;; erc
  '(erc-action-face
    (:inherit 'erc-default-face))

  '(erc-bold-face
    (:weight bold))

  '(erc-current-nick-face
    (:foreground monokai-blue
                 :weight bold))

  '(erc-dangerous-host-face
    (:inherit 'font-lock-warning))

  '(erc-default-face
    (:foreground monokai-fg))

  '(erc-direct-msg-face
    (:inherit 'erc-default))

  '(erc-error-face
    (:inherit 'font-lock-warning))

  '(erc-fool-face
    (:inherit 'erc-default))

  '(erc-highlight-face
    (:inherit 'hover-highlight))

  '(erc-input-face
    (:foreground monokai-fg-1))

  '(erc-keyword-face
    (:foreground monokai-blue
                 :weight bold))

  '(erc-nick-default-face
    (:foreground monokai-fg-1
                 :weight bold))

  '(erc-my-nick-face
    (:foreground monokai-red
                 :weight bold))

  '(erc-nick-msg-face
    (:inherit 'erc-default))

  '(erc-notice-face
    (:foreground monokai-green))

  '(erc-pal-face
    (:foreground monokai-orange
                 :weight bold))

  '(erc-prompt-face
    (:foreground monokai-orange
                 :background monokai-bg
                 :weight bold))

  '(erc-timestamp-face
    (:foreground monokai-green+1))

  '(erc-underline-face
    (:underline t))

 ;;;;; git-gutter
  '(git-gutter:added
    (:foreground monokai-green
                 :weight bold
                 :inverse-video t))

  '(git-gutter:deleted
    (:foreground monokai-red
                 :weight bold
                 :inverse-video t))

  '(git-gutter:modified
    (:foreground monokai-yellow
                 :weight bold
                 :inverse-video t))

 ;;;;; git-gutter-fr
  '(git-gutter-fr:added
    (:foreground monokai-green
                 :weight bold))

  '(git-gutter-fr:deleted
    (:foreground monokai-red
                 :weight bold))

  '(git-gutter-fr:modified
    (:foreground monokai-yellow
                 :weight bold))

  ;; gnus
  '(gnus-group-mail-1
    (:inherit 'gnus-group-mail-1-empty))

  '(gnus-group-mail-1-empty
    (:inherit 'gnus-group-news-1-empty))

  '(gnus-group-mail-2
    (:bold t
           :inherit 'gnus-group-mail-2-empty))

  '(gnus-group-mail-2-empty
    (:inherit 'gnus-group-news-2-empty))

  '(gnus-group-mail-3
    (:bold t
           :inherit 'gnus-group-mail-3-empty))

  '(gnus-group-mail-3-empty
    (:inherit 'gnus-group-news-3-empty))

  '(gnus-group-mail-4
    (:bold t
           :inherit 'gnus-group-mail-4-empty))

  '(gnus-group-mail-4-empty
    (:inherit 'gnus-group-news-4-empty))

  '(gnus-group-mail-5
    (:bold t
           :inherit 'gnus-group-mail-5-empty))

  '(gnus-group-mail-5-empty
    (:inherit 'gnus-group-news-5-empty))

  '(gnus-group-mail-6
    (:bold t
           :inherit 'gnus-group-mail-6-empty))

  '(gnus-group-mail-6-empty
    (:inherit 'gnus-group-news-6-empty))

  '(gnus-group-mail-low
    (:bold t
           :inherit 'gnus-group-mail-low-empty))

  '(gnus-group-mail-low-empty
    (:inherit 'gnus-group-news-low-empty))

  '(gnus-group-news-1
    (:bold t
           :inherit 'gnus-group-news-1-empty))

  '(gnus-group-news-2
    (:bold t
           :inherit 'gnus-group-news-2-empty))

  '(gnus-group-news-3
    (:bold t
           :inherit 'gnus-group-news-3-empty))

  '(gnus-group-news-4
    (:bold t
           :inherit 'gnus-group-news-4-empty))

  '(gnus-group-news-5
    (:bold t
           :inherit 'gnus-group-news-5-empty))

  '(gnus-group-news-6
    (:bold t
           :inherit 'gnus-group-news-6-empty))

  '(gnus-group-news-low
    (:bold t
           :inherit 'gnus-group-news-low-empty))

  '(gnus-header-content
    (:inherit 'message-header-other))

  '(gnus-header-from
    (:inherit 'message-header-from))

  '(gnus-header-name
    (:inherit 'message-header-name))

  '(gnus-header-newsgroups
    (:inherit 'message-header-other))

  '(gnus-header-subject
    (:inherit 'message-header-subject))

  '(gnus-summary-cancelled
    (:foreground monokai-orange))

  '(gnus-summary-high-ancient
    (:foreground monokai-blue))

  '(gnus-summary-high-read
    (:foreground monokai-green
                 :weight bold))

  '(gnus-summary-high-ticked
    (:foreground monokai-orange
                 :weight bold))

  '(gnus-summary-high-unread
    (:foreground monokai-fg
                 :weight bold))

  '(gnus-summary-low-ancient
    (:foreground monokai-blue))

  '(gnus-summary-low-read
    (:foreground monokai-green))

  '(gnus-summary-low-ticked
    (:foreground monokai-orange
                 :weight bold))

  '(gnus-summary-low-unread
    (:foreground monokai-fg))

  '(gnus-summary-normal-ancient
    (:foreground monokai-blue))

  '(gnus-summary-normal-read
    (:foreground monokai-green))

  '(gnus-summary-normal-ticked
    (:foreground monokai-orange
                 :weight bold))

  '(gnus-summary-normal-unread
    (:foreground monokai-fg))

  '(gnus-summary-selected
    (:foreground monokai-fg-1
                 :weight bold))

  '(gnus-cite-1
    (:foreground monokai-blue))

  '(gnus-cite-10
    (:foreground monokai-yellow-1))

  '(gnus-cite-11
    (:foreground monokai-yellow))

  '(gnus-cite-2
    (:foreground monokai-blue-1))

  '(gnus-cite-3
    (:foreground monokai-cyan))

  '(gnus-cite-4
    (:foreground monokai-purple))

  '(gnus-cite-5
    (:foreground monokai-green+1))

  '(gnus-cite-6
    (:foreground monokai-green))

  '(gnus-cite-7
    (:foreground monokai-red))

  '(gnus-cite-8
    (:foreground monokai-red))

  '(gnus-cite-9
    (:foreground monokai-purple))

  '(gnus-group-news-1-empty
    (:foreground monokai-fg-1))

  '(gnus-group-news-2-empty
    (:foreground monokai-green+1))

  '(gnus-group-news-3-empty
    (:foreground monokai-green+1))

  '(gnus-group-news-4-empty
    (:foreground monokai-cyan))

  '(gnus-group-news-5-empty
    (:foreground monokai-cyan+1))

  '(gnus-group-news-6-empty
    (:foreground monokai-bg+2))

  '(gnus-group-news-low-empty
    (:foreground monokai-bg+2))

  '(gnus-signature
    (:foreground monokai-fg-1))

  '(gnus-x
    (:background monokai-fg
                 :foreground monokai-bg))
 ;;;;; guide-key
  '(guide-key/highlight-command-face
    (:foreground monokai-blue))

  '(guide-key/key-face
    (:foreground monokai-green))

  '(guide-key/prefix-command-face
    (:foreground monokai-green+1))

 ;;;;; helm
  '(helm-header
    (:foreground monokai-green
                 :background monokai-bg
                 :underline nil :box nil))

  '(helm-source-header
    (:foreground monokai-yellow
                 :background monokai-bg-1
                 :underline nil :weight bold
                 :box (:line-width -1 :style released-button)))

  '(helm-selection
    (:background monokai-bg+2
                 :underline nil))

  '(helm-selection-line
    (:background monokai-bg+1))

  '(helm-visible-mark
    (:foreground monokai-fg-1
                 :background monokai-bg+2))

  '(helm-candidate-number
    (:foreground monokai-green+2
                 :background monokai-bg-1))

  '(helm-ff-directory
    (:foreground monokai-magenta))

 ;;;;; hl-line-mode
  '(hl-line
    (:background monokai-bg+1 :inherit 't))

 ;;;;; hl-sexp
  '(hl-sexp-face
    (:background monokai-bg+1 :inherit 't))

 ;;;;; ido-mode
  '(ido-first-match
    (:foreground monokai-orange
                 :background monokai-bg
                 :weight bold))

  '(ido-only-match
    (:foreground monokai-green
                 :background monokai-bg
                 :weight bold))

  '(ido-subdir
    (:foreground monokai-blue
                 :background monokai-bg))

 ;;;;; Js2-mode
  '(js2-warning-face
    (:foreground monokai-yellow-1
                 :underline t))

  '(js2-error-face
    (:foreground monokai-red
                 :weight bold))

  '(js2-jsdoc-tag-face
    (:foreground monokai-green))

  '(js2-jsdoc-type-face
    (:foreground monokai-blue))

  '(js2-jsdoc-value-face
    (:foreground monokai-purple))

  '(js2-function-param-face
    (:foreground monokai-green))

  '(js2-external-variable-face
    (:foreground monokai-yellow))

 ;;;;; jabber-mode

  '(jabber-roster-user-away
    (:foreground monokai-purple))

  '(jabber-roster-user-online
    (:foreground monokai-green))

  '(jabber-roster-user-dnd
    (:foreground monokai-red))

  '(jabber-rare-time-face
    (:foreground monokai-purple))

  '(jabber-chat-prompt-local
    (:foreground monokai-blue))

  '(jabber-chat-prompt-foreign
    (:foreground monokai-orange))

  '(jabber-activity-face
    (:foreground monokai-red))

  '(jabber-activity-personal-face
    (:foreground monokai-cyan))

  '(jabber-title-small
    (:height 1.1 :weight bold))

  '(jabber-title-medium
    (:height 1.2 :weight bold))

  '(jabber-title-large
    (:height 1.3 :weight bold))

 ;;;;; linum-mode
  '(linum
    (:foreground monokai-purple
                 :background monokai-bg))

 ;;;;; macrostep
  '(macrostep-gensym-1
    (:foreground monokai-green+2
                 :background monokai-bg-1))

  '(macrostep-gensym-2
    (:foreground monokai-red+1
                 :background monokai-bg-1))

  '(macrostep-gensym-3
    (:foreground monokai-blue+1
                 :background monokai-bg-1))

  '(macrostep-gensym-4
    (:foreground monokai-magenta
                 :background monokai-bg-1))

  '(macrostep-gensym-5
    (:foreground monokai-yellow
                 :background monokai-bg-1))

  '(macrostep-expansion-highlight-face
    (:inherit 'highlight))

  '(macrostep-macro-face
    (:underline t))

 ;;;;; magit
  '(magit-section-title
    (:foreground monokai-yellow
                 :weight bold))

  '(magit-branch
    (:foreground monokai-blue
                 :weight bold))

  '(magit-item-highlight
    (:background monokai-bg+2))

 ;;;;; message-mode
  '(message-cited-text
    (:inherit 'font-lock-comment))

  '(message-header-name
    (:foreground monokai-green+1))

  '(message-header-other
    (:foreground monokai-green))

  '(message-header-to
    (:foreground monokai-fg-1
                 :weight bold))

  '(message-header-from
    (:foreground monokai-fg-1
                 :weight bold))

  '(message-header-cc
    (:foreground monokai-fg-1
                 :weight bold))

  '(message-header-newsgroups
    (:foreground monokai-fg-1
                 :weight bold))

  '(message-header-subject
    (:foreground monokai-orange
                 :weight bold))

  '(message-header-xheader
    (:foreground monokai-green))

  '(message-mml
    (:foreground monokai-fg-1
                 :weight bold))

  '(message-separator
    (:inherit 'font-lock-comment))

 ;;;;; egg
  '(egg-text-base
    (:foreground monokai-fg))

  '(egg-help-header-1
    (:foreground monokai-blue))

  '(egg-help-header-2
    (:foreground monokai-green))

  '(egg-branch
    (:foreground monokai-blue))

  '(egg-branch-mono
    (:foreground monokai-blue))

  '(egg-term
    (:foreground monokai-blue))

  '(egg-diff-add
    (:foreground monokai-green+1))

  '(egg-diff-del
    (:foreground monokai-red+1))

  '(egg-diff-file-header
    (:foreground monokai-fg-1))

  '(egg-section-title
    (:foreground monokai-blue))

  '(egg-stash-mono
    (:foreground monokai-purple))

 ;;;;; message-mode
  '(message-cited-text
    (:inherit 'font-lock-comment))

  '(message-header-name
    (:foreground monokai-green+1))

  '(message-header-other
    (:foreground monokai-green))

  '(message-header-to
    (:foreground monokai-yellow
                 :weight bold))

  '(message-header-from
    (:foreground monokai-yellow
                 :weight bold))

  '(message-header-cc
    (:foreground monokai-yellow
                 :weight bold))

  '(message-header-newsgroups
    (:foreground monokai-yellow
                 :weight bold))

  '(message-header-subject
    (:foreground monokai-orange
                 :weight bold))

  '(message-header-xheader
    (:foreground monokai-green))

  '(message-mml
    (:foreground monokai-yellow
                 :weight bold))

  '(message-separator
    (:inherit 'font-lock-comment))

 ;;;;; mew
  '(mew-face-header-subject
    (:foreground monokai-orange))

  '(mew-face-header-from
    (:foreground monokai-yellow))

  '(mew-face-header-date
    (:foreground monokai-green))

  '(mew-face-header-to
    (:foreground monokai-red))

  '(mew-face-header-key
    (:foreground monokai-blue))

  '(mew-face-header-private
    (:foreground monokai-purple))

  '(mew-face-header-important
    (:foreground monokai-blue))

  '(mew-face-header-marginal
    (:foreground monokai-fg
                 :weight bold))

  '(mew-face-header-warning
    (:foreground monokai-yellow-1))

  '(mew-face-header-xmew
    (:foreground monokai-green))

  '(mew-face-header-xmew-bad
    (:foreground monokai-red))

  '(mew-face-body-url
    (:foreground monokai-blue))

  '(mew-face-body-comment
    (:foreground monokai-fg-1
                 :slant italic))

  '(mew-face-body-cite1
    (:foreground monokai-cyan))

  '(mew-face-body-cite2
    (:foreground monokai-purple))

  '(mew-face-body-cite3
    (:foreground monokai-orange))

  '(mew-face-body-cite4
    (:foreground monokai-yellow))

  '(mew-face-body-cite5
    (:foreground monokai-red))

  '(mew-face-mark-review
    (:foreground monokai-blue))

  '(mew-face-mark-escape
    (:foreground monokai-green))

  '(mew-face-mark-delete
    (:foreground monokai-red))

  '(mew-face-mark-unlink
    (:foreground monokai-yellow))

  '(mew-face-mark-refile
    (:foreground monokai-orange))

  '(mew-face-mark-unread
    (:foreground monokai-purple))

  '(mew-face-eof-message
    (:foreground monokai-red))

  '(mew-face-eof-part
    (:foreground monokai-yellow))

 ;;;;; mic-paren
  '(paren-face-match
    (:foreground monokai-bg-1
                 :background monokai-orange
                 :weight bold))

  '(paren-face-mismatch
    (:foreground monokai-bg-1
                 :background monokai-magenta
                 :weight bold))

  '(paren-face-no-match
    (:foreground monokai-bg-1
                 :background monokai-purple
                 :weight bold))

 ;;;;; mingus
  '(mingus-directory-face
    (:foreground monokai-blue))

  '(mingus-pausing-face
    (:foreground monokai-magenta))

  '(mingus-playing-face
    (:foreground monokai-cyan))

  '(mingus-playlist-face
    (:foreground monokai-cyan ))

  '(mingus-song-file-face
    (:foreground monokai-yellow))

  '(mingus-stopped-face
    (:foreground monokai-red))

 ;;;;; nav
  '(nav-face-heading
    (:foreground monokai-fg-1))

  '(nav-face-button-num
    (:foreground monokai-blue))

  '(nav-face-dir
    (:foreground monokai-green))

  '(nav-face-hdir
    (:foreground monokai-red))

  '(nav-face-file
    (:foreground monokai-fg))

  '(nav-face-hfile
    (:foreground monokai-purple))

 ;;;;; mu4e
  '(mu4e-cited-1-face
    (:foreground monokai-blue
                 :slant italic))

  '(mu4e-cited-2-face
    (:foreground monokai-purple
                 :slant italic))

  '(mu4e-cited-3-face
    (:foreground monokai-cyan
                 :slant italic))

  '(mu4e-cited-4-face
    (:foreground monokai-green
                 :slant italic))

  '(mu4e-cited-5-face
    (:foreground monokai-orange
                 :slant italic))

  '(mu4e-cited-6-face
    (:foreground monokai-purple
                 :slant italic))

  '(mu4e-cited-7-face
    (:foreground monokai-yellow
                 :slant italic))

  '(mu4e-replied-face
    (:foreground monokai-fg-1))

  '(mu4e-trashed-face
    (:foreground monokai-fg-1
                 :strike-through t))

 ;;;;; mumamo
  '(mumamo-background-chunk-major
    (:background nil))

  '(mumamo-background-chunk-submode1
    (:background monokai-bg-1))

  '(mumamo-background-chunk-submode2
    (:background monokai-bg+2))

  '(mumamo-background-chunk-submode3
    (:background monokai-fg-1))

  '(mumamo-background-chunk-submode4
    (:background monokai-bg+2))

 ;;;;; org-mode
  '(org-agenda-date-today
    (:foreground monokai-fg+1
                 :slant italic
                 :weight bold))

  '(org-agenda-structure
    (:inherit 'font-lock-comment-face))

  '(org-archived
    (:foreground monokai-fg
                 :weight bold))

  '(org-checkbox
    (:background monokai-bg+2
                 :foreground monokai-fg+1
                 :box (:line-width 1 :style released-button)))
  '(org-date
    (:foreground monokai-blue
                 :underline t))

  '(org-deadline-announce
    (:foreground monokai-red))

  '(org-done
    (:foreground monokai-green+1
                 :weight bold))
  '(org-formula
    (:foreground monokai-yellow))

  '(org-headline-done
    (:foreground monokai-green+1))

  '(org-hide
    (:foreground monokai-bg-1))

  '(org-level-1
    (:foreground monokai-orange))

  '(org-level-2
    (:foreground monokai-orange+1))

  '(org-level-3
    (:foreground monokai-cyan))

  '(org-level-4
    (:foreground monokai-cyan+1))

  '(org-level-5
    (:foreground monokai-purple))

  '(org-level-6
    (:foreground monokai-purple+1))

  '(org-level-7
    (:foreground monokai-red+1))

  '(org-level-8
    (:foreground monokai-red+2))

  '(org-link
    (:foreground monokai-blue
                 :underline t))

  '(org-scheduled
    (:foreground monokai-purple+1))

  '(org-scheduled-previously
    (:foreground monokai-red))

  '(org-scheduled-today
    (:foreground monokai-blue+1))

  '(org-special-keyword
    (:foreground monokai-fg-1))

  '(org-table
    (:foreground monokai-purple))

  '(org-tag
    (:weight bold))

  '(org-time-grid
    (:foreground monokai-orange))

  '(org-todo
    (:foreground monokai-red
                 :weight bold))

  '(org-upcoming-deadline
    (:inherit 'font-lock-keyword-face))

  '(org-warning
    (:foreground monokai-yellow-1
                 :weight bold
                 :underline t))

  '(org-column
    (:background monokai-bg-1))

  '(org-column-title
    (:background monokai-bg-1
                 :underline t
                 :weight bold))

 ;;;;; outline
  '(outline-1
    (:foreground monokai-orange))

  '(outline-2
    (:foreground monokai-magenta))

  '(outline-3
    (:foreground monokai-blue))

  '(outline-4
    (:foreground monokai-yellow))

  '(outline-5
    (:foreground monokai-cyan))

  '(outline-6
    (:foreground monokai-purple))

  '(outline-7
    (:foreground monokai-red))

  '(outline-8
    (:foreground monokai-green))

 ;;;;; rainbow-delimiters
  '(rainbow-delimiters-depth-1-face
    (:foreground monokai-orange))

  '(rainbow-delimiters-depth-2-face
    (:foreground monokai-blue))

  '(rainbow-delimiters-depth-3-face
    (:foreground monokai-purple))

  '(rainbow-delimiters-depth-4-face
    (:foreground monokai-green))

  '(rainbow-delimiters-depth-5-face
    (:foreground monokai-cyan))

  '(rainbow-delimiters-depth-6-face
    (:foreground monokai-red))

  '(rainbow-delimiters-depth-7-face
    (:foreground monokai-orange))

  '(rainbow-delimiters-depth-8-face
    (:foreground monokai-blue+1))

  '(rainbow-delimiters-depth-9-face
    (:foreground monokai-red+1))

  '(rainbow-delimiters-depth-10-face
    (:foreground monokai-green+1))

  '(rainbow-delimiters-depth-11-face
    (:foreground monokai-purple+1))

  '(rainbow-delimiters-depth-12-face
    (:foreground monokai-orange+1))

 ;;;;;rcirc
  '(rcirc-my-nick
    (:foreground monokai-blue))

  '(rcirc-other-nick
    (:foreground monokai-orange))

  '(rcirc-bright-nick
    (:foreground monokai-blue+1))

  '(rcirc-dim-nick
    (:foreground monokai-blue-1))

  '(rcirc-server
    (:foreground monokai-green))

  '(rcirc-server-prefix
    (:foreground monokai-green+1))

  '(rcirc-timestamp
    (:foreground monokai-purple))

  '(rcirc-nick-in-message
    (:foreground monokai-yellow))

  '(rcirc-nick-in-message-full-line
    (:bold t))

  '(rcirc-prompt
    (:foreground monokai-fg-1
                 :bold t))

  '(rcirc-track-nick
    (:inverse-video t))

  '(rcirc-track-keyword
    (:bold t))

  '(rcirc-url
    (:bold t))

  '(rcirc-keyword
    (:foreground monokai-red
                 :bold t))

 ;;;;; rhtml-mode
  '(erb-face
    (:foreground monokai-fg+1
                 :background monokai-bg-1))

  '(erb-delim-face
    (:foreground monokai-cyan-1
                 :background monokai-bg-1))

  '(erb-exec-face
    (:foreground monokai-fg+1
                 :background monokai-bg-1))

  '(erb-exec-delim-face
    (:foreground monokai-cyan-1
                 :background monokai-bg-1))

  '(erb-out-face
    (:foreground monokai-fg+1
                 :background monokai-bg-1))

  '(erb-out-delim-face
    (:foreground monokai-cyan-1
                 :background monokai-bg-1))

  '(erb-comment-face
    (:foreground monokai-fg-1
                 :background monokai-bg-1))

  '(erb-comment-delim-face
    (:foreground monokai-cyan-1
                 :background monokai-bg-1))

 ;;;;; rpm-mode
  '(rpm-spec-dir-face
    (:foreground monokai-green))

  '(rpm-spec-doc-face
    (:foreground monokai-blue))

  '(rpm-spec-ghost-face
    (:foreground monokai-magenta))

  '(rpm-spec-macro-face
    (:foreground monokai-yellow))

  '(rpm-spec-obsolete-tag-face
    (:foreground monokai-red))

  '(rpm-spec-package-face
    (:foreground monokai-purple))

  '(rpm-spec-section-face
    (:foreground monokai-yellow))

  '(rpm-spec-tag-face
    (:foreground monokai-purple))

  '(rpm-spec-var-face
    (:foreground monokai-orange))
 ;;;;; rst-mode
  '(rst-level-1-face
    (:foreground monokai-orange))

  '(rst-level-2-face
    (:foreground monokai-green))

  '(rst-level-3-face
    (:foreground monokai-blue))

  '(rst-level-4-face
    (:foreground monokai-yellow))

  '(rst-level-5-face
    (:foreground monokai-purple))

  '(rst-level-6-face
    (:foreground monokai-red))

 ;;;;; show-paren
  '(show-paren-mismatch
    (:foreground monokai-bg-1
                 :background monokai-red
                 :weight bold))

  '(show-paren-match
    (:foreground monokai-bg-1
                 :background monokai-orange
                 ::weight bold))

 ;;;;; sml-mode-line
  '(sml-modeline-end-face
    (:inherit 'default
              :width condensed))

 ;;;;; SLIME
  '(slime-repl-inputed-output-face
    (:foreground monokai-red))

 ;;;;; tabbar
  '(tabbar-button
    (:foreground monokai-fg
                 :background monokai-bg))

  '(tabbar-selected
    (:foreground monokai-fg
                 :background monokai-bg
                 :box (:line-width -1 :style pressed-button)))

  '(tabbar-unselected
    (:foreground monokai-fg
                 :background monokai-bg+2
                 :box (:line-width -1 :style released-button)))
 ;;;;; term
  '(term-color-black
    (:foreground monokai-bg
                 :background monokai-bg+1))

  '(term-color-red
    (:foreground monokai-red
                 :background monokai-red+1))

  '(term-color-green
    (:foreground monokai-green
                 :background monokai-green+1))

  '(term-color-yellow
    (:foreground monokai-orange
                 :background monokai-orange+1))

  '(term-color-blue
    (:foreground monokai-blue
                 :background monokai-blue+1))

  '(term-color-magenta
    (:foreground monokai-purple
                 :background monokai-purple+1))

  '(term-color-cyan
    (:foreground monokai-cyan
                 :background monokai-cyan+1))

  '(term-color-white
    (:foreground monokai-fg
                 :background monokai-fg+1))

  '(term-default-fg-color
    (:foreground monokai-fg))

  '(term-default-bg-color
    (:foreground monokai-bg))

 ;;;;; volatile-highlights
  '(vhl/default-face
    (:background monokai-bg+2))

 ;;;;; emacs-w3m
  '(w3m-anchor
    (:foreground monokai-fg-1
                 :underline t
                 :weight bold))

  '(w3m-arrived-anchor
    (:foreground monokai-yellow-1
                 :underline t
                 :weight normal))

  '(w3m-form
    (:foreground monokai-red
                 :underline t))

  '(w3m-header-line-location-title
    (:foreground monokai-fg-1
                 :underline t
                 :weight bold))

  '(w3m-history-current-url
    (:inherit 'match))

  '(w3m-lnum
    (:foreground monokai-purple
                 :background monokai-bg))

  '(w3m-lnum-match
    (:background monokai-bg-1
                 :foreground monokai-orange
                 :weight bold))

  '(w3m-lnum-minibuffer-prompt
    (:foreground monokai-fg-1))

 ;;;;; whitespace-mode
  '(whitespace-space
    (:background monokai-bg
                 :foreground monokai-bg-1))
  '(whitespace-hspace
    (:background monokai-bg
                 :foreground monokai-bg-1))

  '(whitespace-tab
    (:background monokai-red))

  '(whitespace-newline
    (:foreground monokai-bg-1))

  '(whitespace-trailing
    (:background monokai-red))

  '(whitespace-line
    (:background monokai-bg
                 :foreground monokai-red))

  '(whitespace-space-before-tab
    (:background monokai-bg
                 :foreground monokai-orange))

  '(whitespace-indentation
    (:background monokai-fg-1
                 :foreground monokai-red))

  '(whitespace-empty
    (:background monokai-fg-1))

  '(whitespace-space-after-tab
    (:background monokai-fg-1
                 :foreground monokai-red))

 ;;;;; wanderlust
  '(wl-highlight-folder-few-face
    (:foreground monokai-purple))

  '(wl-highlight-folder-many-face
    (:foreground monokai-red))

  '(wl-highlight-folder-path-face
    (:foreground monokai-orange))

  '(wl-highlight-folder-unread-face
    (:foreground monokai-blue))

  '(wl-highlight-folder-zero-face
    (:foreground monokai-fg))

  '(wl-highlight-folder-unknown-face
    (:foreground monokai-cyan))

  '(wl-highlight-message-citation-header
    (:foreground monokai-yellow))

  '(wl-highlight-message-cited-text-1
    (:foreground monokai-purple))

  '(wl-highlight-message-cited-text-2
    (:foreground monokai-purple+1))

  '(wl-highlight-message-cited-text-3
    (:foreground monokai-blue))

  '(wl-highlight-message-cited-text-4
    (:foreground monokai-blue+1))

  '(wl-highlight-message-header-contents-face
    (:foreground monokai-green))

  '(wl-highlight-message-headers-face
    (:foreground monokai-red+1))

  '(wl-highlight-message-important-header-contents
    (:foreground monokai-purple))

  '(wl-highlight-message-header-contents
    (:foreground monokai-green+1))

  '(wl-highlight-message-important-header-contents2
    (:foreground monokai-purple+1))

  '(wl-highlight-message-signature
    (:foreground monokai-green))

  '(wl-highlight-message-unimportant-header-contents
    (:foreground monokai-fg))

  '(wl-highlight-summary-answered-face
    (:foreground monokai-blue))

  '(wl-highlight-summary-disposed-face
    (:foreground monokai-fg
                 :slant italic))

  '(wl-highlight-summary-new-face
    (:foreground monokai-blue))

  '(wl-highlight-summary-normal-face
    (:foreground monokai-fg))

  '(wl-highlight-summary-thread-top-face
    (:foreground monokai-fg-1))

  '(wl-highlight-thread-indent-face
    (:foreground monokai-magenta))

  '(wl-highlight-summary-refiled-face
    (:foreground monokai-fg))

  '(wl-highlight-summary-displaying-face
    (:underline t
                :weight bold))

 ;;;;; which-func-mode
  '(which-func
    (:foreground monokai-purple+1))

 ;;;;; yascroll
  '(yascroll:thumb-text-area
    (:background monokai-bg-1))

  '(yascroll:thumb-fringe
    (:background monokai-bg-1
                 :foreground monokai-bg-1))
 )

;;; Theme Variables
(custom-theme-set-variables
 'monokai
;;;;; ansi-color
 '(ansi-color-names-vector
   [monokai-bg
    monokai-red
    monokai-green
    monokai-orange
    monokai-blue
    monokai-purple
    monokai-cyan
    monokai-fg])

;;;;; fill-column-indicator
 '(fci-rule-color monokai-bg-1)
;;;;; vc-annotate
 '(vc-annotate-color-map
   '(( 20. . monokai-fg-1)
     ( 40. . monokai-bg+2)
     ( 60. . monokai-red)
     ( 80. . monokai-red+1)
     (100. . monokai-orange)
     (120. . monokai-orange+1)
     (140. . monokai-green)
     (160. . monokai-green+1)
     (180. . monokai-yellow)
     (200. . monokai-yellow+1)
     (220. . monokai-blue)
     (240. . monokai-blue+1)
     (260. . monokai-purple)
     (280. . monokai-purple+1)
     (300. . monokai-cyan)
     (320. . monokai-cyan+1)
     (340. . monokai-magenta)
     (360. . monokai-magenta+1)))
 '(vc-annotate-very-old-color monokai-magenta)
 '(vc-annotate-background monokai-bg)
 )

;;; Rainbow Support
(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

(defvar monokai-add-font-lock-keywords nil
  "Whether to add font-lock keywords for monokai color names.
In buffers visiting library `monokai-theme.el' the monokai
specific keywords are always added.  In all other Emacs-Lisp
buffers this variable controls whether this should be done.
This requires library `rainbow-mode'.")

(defvar monokai-colors-font-lock-keywords nil)

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'monokai)
;;; monokai-theme.el ends here
