;;; monokai-theme.el --- A fruity color theme for Emacs.

;; Copyright (C) 2011-2016

;; Author: Kelvin Smith <oneKelvinSmith@gmail.com>
;; URL: http://github.com/oneKelvinSmith/monokai-emacs
;; Version: 2.0.2

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
;; Bozhidar Batsov created zenburn-theme.el and solarized-theme.el
;;  on which this file is based.
;; - https://github.com/bbatsov/zenburn-emacs
;;
;; Color Scheme Designer 3 for complementary colours.
;; - http://colorschemedesigner.com/
;;
;; Xterm 256 Color Chart
;; - https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
;;
;; K. Adam Christensen for his personal monokai theme that addresses 256 colours.
;; - https://github.com/pope/personal/blob/master/etc/emacs.d/monokai-theme.el
;;
;; Thomas Frössman for his work on solarized-emacs.
;; - http://github.com/bbatsov/solarized-emacs
;;
;;; Code:

(unless (>= emacs-major-version 24)
  (error "The monokai theme requires Emacs 24 or later!"))

(deftheme monokai "The Monokai colour theme")

(defgroup monokai nil
  "Monokai theme options.
The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom monokai-distinct-fringe-background nil
  "Make the fringe background different from the normal background color.
Also affects 'linum-mode' background."
  :type 'boolean
  :group 'monokai)

(defcustom monokai-use-variable-pitch t
  "Use variable pitch face for some headings and titles."
  :type 'boolean
  :group 'monokai)

(defcustom monokai-height-minus-1 0.8
  "Font size -1."
  :type 'number
  :group 'monokai)

(defcustom monokai-height-plus-1 1.1
  "Font size +1."
  :type 'number
  :group 'monokai)

(defcustom monokai-height-plus-2 1.15
  "Font size +2."
  :type 'number
  :group 'monokai)

(defcustom monokai-height-plus-3 1.2
  "Font size +3."
  :type 'number
  :group 'monokai)

(defcustom monokai-height-plus-4 1.3
  "Font size +4."
  :type 'number
  :group 'monokai)

(let* (;; Variable pitch
       (monokai-pitch (if monokai-use-variable-pitch
                          'variable-pitch
                        'default))

       ;; Definitions for guis that support 256 colors
       (class                    '((class color) (min-colors 257)))
       ;; Primary colors
       (monokai-yellow           "#E6DB74")
       (monokai-orange           "#FD971F")
       (monokai-red              "#F92672")
       (monokai-magenta          "#FD5FF0")
       (monokai-violet           "#AE81FF")
       (monokai-blue             "#66D9EF")
       (monokai-cyan             "#A1EFE4")
       (monokai-green            "#A6E22E")
       (monokai-gray             "#3E3D31")
       ;; Darker and lighter accented colors
       (monokai-yellow-d         "#BEB244")
       (monokai-yellow-l         "#FFF7A8")
       (monokai-orange-d         "#D47402")
       (monokai-orange-l         "#FFAC4A")
       (monokai-red-d            "#F70057")
       (monokai-red-l            "#FA518D")
       (monokai-magenta-d        "#FB35EA")
       (monokai-magenta-l        "#FE8CF4")
       (monokai-violet-d         "#945AFF")
       (monokai-violet-l         "#C9ACFF")
       (monokai-blue-d           "#40CAE4")
       (monokai-blue-l           "#92E7F7")
       (monokai-cyan-d           "#74DBCD")
       (monokai-cyan-l           "#D3FBF6")
       (monokai-green-d          "#86C30D")
       (monokai-green-l          "#BBEF53")
       (monokai-gray-d           "#35331D")
       (monokai-gray-l           "#7B7962")
       ;; Adaptive colors
       (monokai-fg               "#F8F8F2")
       (monokai-bg               "#272822")
       (monokai-highlight-line   "#49483E")
       (monokai-highlight        "#FFB269")
       (monokai-emph             "#F8F8F0")
       (monokai-comments         "#75715E")
       ;; Adaptive higher/lower contrast accented colors
       (monokai-fg-hc            "#141414")
       (monokai-fg-lc            "#171A0B")
       ;; High contrast colors
       (monokai-yellow-hc        "#FFFACE")
       (monokai-yellow-lc        "#9A8F21")
       (monokai-orange-hc        "#FFBE74")
       (monokai-orange-lc        "#A75B00")
       (monokai-red-hc           "#FEB0CC")
       (monokai-red-lc           "#F20055")
       (monokai-magenta-hc       "#FEC6F9")
       (monokai-magenta-lc       "#F309DF")
       (monokai-violet-hc        "#F0E7FF")
       (monokai-violet-lc        "#7830FC")
       (monokai-blue-hc          "#CAF5FD")
       (monokai-blue-lc          "#1DB4D0")
       (monokai-cyan-hc          "#D3FBF6")
       (monokai-cyan-lc          "#4BBEAE")
       (monokai-green-hc         "#CCF47C")
       (monokai-green-lc         "#679A01")
       ;; Distinct fringe
       (monokai-fringe-bg (if monokai-distinct-fringe-background
                              monokai-gray
                            monokai-bg))

       ;; Definitions for terminals that do not support 256 colors
       (terminal-class                    '((class color) (min-colors 89)))
       ;; Primary colors
       (terminal-monokai-yellow           "#CDC673")
       (terminal-monokai-orange           "#FF8C00")
       (terminal-monokai-red              "#FF1493")
       (terminal-monokai-magenta          "#D700D7")
       (terminal-monokai-violet           "#AF87FF")
       (terminal-monokai-blue             "#5FD7FF")
       (terminal-monokai-cyan             "#5FFFFF")
       (terminal-monokai-green            "#87D700")
       (terminal-monokai-gray             "#3D3D3D")
       ;; Darker and lighter accented colors
       (terminal-monokai-yellow-d         "#878700")
       (terminal-monokai-yellow-l         "#FFFF87")
       (terminal-monokai-orange-d         "#AF5F00")
       (terminal-monokai-orange-l         "#FFAF5F")
       (terminal-monokai-red-d            "#870000")
       (terminal-monokai-red-l            "#FF5F87")
       (terminal-monokai-magenta-d        "#AF0087")
       (terminal-monokai-magenta-l        "#FF87DF")
       (terminal-monokai-violet-d         "#5F00AF")
       (terminal-monokai-violet-l         "#AF87D7")
       (terminal-monokai-blue-d           "#008787")
       (terminal-monokai-blue-l           "#87D7FF")
       (terminal-monokai-cyan-d           "#5FAFAF")
       (terminal-monokai-cyan-l           "#AFFFFF")
       (terminal-monokai-green-d          "#5F8700")
       (terminal-monokai-green-l          "#AFD700")
       (terminal-monokai-gray-d           "#333333")
       (terminal-monokai-gray-l           "#707070")
       ;; Adaptive colors
       (terminal-monokai-fg               "#F5F5F5")
       (terminal-monokai-bg               "#1B1E1C")
       (terminal-monokai-highlight-line   "#474747")
       (terminal-monokai-highlight        "#F4A460")
       (terminal-monokai-emph             "#FFFAFA")
       (terminal-monokai-comments         "#8B8878")
       ;; Adaptive higher/lower contrast accented colors
       (terminal-monokai-fg-hc            "#171A0B")
       (terminal-monokai-fg-lc            "#141414")
       ;; High contrast colors
       (terminal-monokai-yellow-hc        terminal-monokai-yellow-d)
       (terminal-monokai-yellow-lc        terminal-monokai-yellow-l)
       (terminal-monokai-orange-hc        terminal-monokai-orange-d)
       (terminal-monokai-orange-lc        terminal-monokai-orange-l)
       (terminal-monokai-red-hc           terminal-monokai-red-d)
       (terminal-monokai-red-lc           terminal-monokai-red-l)
       (terminal-monokai-magenta-hc       terminal-monokai-magenta-d)
       (terminal-monokai-magenta-lc       terminal-monokai-magenta-l)
       (terminal-monokai-violet-hc        terminal-monokai-violet-d)
       (terminal-monokai-violet-lc        terminal-monokai-violet-l)
       (terminal-monokai-blue-hc          terminal-monokai-blue-d)
       (terminal-monokai-blue-lc          terminal-monokai-blue-l)
       (terminal-monokai-cyan-hc          terminal-monokai-cyan-d)
       (terminal-monokai-cyan-lc          terminal-monokai-cyan-l)
       (terminal-monokai-green-hc         terminal-monokai-green-d)
       (terminal-monokai-green-lc         terminal-monokai-green-l)
       ;; Distinct fringe
       (terminal-monokai-fringe-bg (if monokai-distinct-fringe-background
                                       terminal-monokai-gray
                                     terminal-monokai-bg)))

  ;; Define faces
  (custom-theme-set-faces
   'monokai

   ;; font lock for syntax highlighting
   `(font-lock-builtin-face
     ((,class (:foreground ,monokai-red
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :weight normal))))

   `(font-lock-comment-delimiter-face
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(font-lock-comment-face
     ((,class (:foreground ,monokai-comments
                           :background nil))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(font-lock-constant-face
     ((,class (:foreground ,monokai-violet))
      (,terminal-class (:foreground ,terminal-monokai-violet))))

   `(font-lock-doc-face
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(font-lock-function-name-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(font-lock-keyword-face
     ((,class (:foreground ,monokai-red
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :weight normal))))

   `(font-lock-negation-char-face
     ((,class (:foreground ,monokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight bold))))

   `(font-lock-preprocessor-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(font-lock-regexp-grouping-construct
     ((,class (:foreground ,monokai-yellow
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight normal))))

   `(font-lock-regexp-grouping-backslash
     ((,class (:foreground ,monokai-violet
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-violet
                                    :weight normal))))

   `(font-lock-string-face
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(font-lock-type-face
     ((,class (:foreground ,monokai-blue
                           :italic nil))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :italic nil))))

   `(font-lock-variable-name-face
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(font-lock-warning-face
     ((,class (:foreground ,monokai-orange
                           :weight bold
                           :italic t
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-orange
                                    :weight bold
                                    :italic t
                                    :underline t))))

   `(c-annotation-face
     ((,class (:inherit font-lock-constant-face))
      (,terminal-class (:inherit font-lock-constant-face))))

   ;; general colouring
   '(button ((t (:underline t))))

   `(default
      ((,class (:foreground ,monokai-fg
                            :background ,monokai-bg))
       (,terminal-class (:foreground ,terminal-monokai-fg
                                     :background ,terminal-monokai-bg))))

   `(highlight
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-highlight))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-highlight))))

   `(lazy-highlight
     ((,class (:inherit highlight
                        :background ,monokai-comments))
      (,terminal-class (:inherit highlight
                                 :background ,terminal-monokai-comments))))

   `(region
     ((,class (:inherit highlight
                        :background ,monokai-highlight))
      (,terminal-class (:inherit highlight
                                 :background ,terminal-monokai-highlight))))

   `(secondary-selection
     ((,class (:inherit region
                        :background ,monokai-blue))
      (,terminal-class (:inherit region
                                 :background ,terminal-monokai-blue))))

   `(shadow
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(match
     ((,class (:background ,monokai-green
                           :foreground ,monokai-bg
                           :weight bold))
      (,terminal-class (:background ,terminal-monokai-green
                                    :foreground ,terminal-monokai-bg
                                    :weight bold))))

   `(cursor
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-fg
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-fg
                                    :inverse-video t))))

   `(mouse
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-fg
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-fg
                                    :inverse-video t))))

   `(escape-glyph
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(escape-glyph-face
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(fringe
     ((,class (:foreground ,monokai-fg
                           :background ,monokai-fringe-bg))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :background ,terminal-monokai-fringe-bg))))

   `(link
     ((,class (:foreground ,monokai-blue
                           :underline t
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :underline t
                                    :weight bold))))

   `(link-visited
     ((,class (:foreground ,monokai-violet
                           :underline t
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-violet
                                    :underline t
                                    :weight normal))))

   `(success
     ((,class (:foreground ,monokai-green ))
      (,terminal-class (:foreground ,terminal-monokai-green ))))

   `(warning
     ((,class (:foreground ,monokai-yellow ))
      (,terminal-class (:foreground ,terminal-monokai-yellow ))))

   `(error
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(eval-sexp-fu-flash
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-green))))

   `(eval-sexp-fu-flash-error
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-red))))

   `(trailing-whitespace
     ((,class (:background ,monokai-red))
      (,terminal-class (:background ,terminal-monokai-red))))

   `(vertical-border
     ((,class (:foreground ,monokai-gray))
      (,terminal-class (:foreground ,terminal-monokai-gray))))

   `(menu
     ((,class (:foreground ,monokai-fg
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :background ,terminal-monokai-bg))))

   `(minibuffer-prompt
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   ;; mode-line and powerline
   `(mode-line-buffer-id
     ((,class (:foreground ,monokai-green
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :weight bold))))

   `(mode-line
     ((,class (:inverse-video unspecified
                              :underline unspecified
                              :foreground ,monokai-emph
                              :background ,monokai-highlight-line
                              :box (:line-width 1
                                                :color ,monokai-gray
                                                :style unspecified)))
      (,terminal-class (:inverse-video unspecified
                                       :underline unspecified
                                       :foreground ,terminal-monokai-fg
                                       :background ,terminal-monokai-bg
                                       :box (:line-width 1
                                                         :color ,terminal-monokai-highlight-line
                                                         :style unspecified)))))

   `(powerline-active1
     ((,class (:background ,monokai-gray-d))
      (,terminal-class (:background ,terminal-monokai-gray-d))))

   `(powerline-active2
     ((,class (:background ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-bg))))


   `(mode-line-inactive
     ((,class (:inverse-video unspecified
                              :underline unspecified
                              :foreground ,monokai-comments
                              :background ,monokai-gray
                              :box (:line-width 1
                                                :color ,monokai-gray
                                                :style unspecified)))
      (,terminal-class (:inverse-video unspecified
                                       :underline unspecified
                                       :foreground ,terminal-monokai-comments
                                       :background ,terminal-monokai-gray
                                       :box (:line-width 1
                                                         :color ,terminal-monokai-gray
                                                         :style unspecified)))))

   `(powerline-inactive1
     ((,class (:background ,monokai-gray-d))
      (,terminal-class (:background ,terminal-monokai-gray-d))))

   `(powerline-inactive2
     ((,class (:background ,monokai-gray))
      (,terminal-class (:background ,terminal-monokai-gray))))

   ;; header-line
   `(header-line
     ((,class (:foreground ,monokai-emph
                           :background ,monokai-highlight-line
                           :box (:color ,monokai-gray
                                        :line-width 1
                                        :style unspecified)))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :background ,terminal-monokai-highlight-line
                                    :box (:color ,terminal-monokai-gray
                                                 :line-width 1
                                                 :style unspecified)))))

   ;; cua
   `(cua-global-mark
     ((,class (:background ,monokai-yellow
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-yellow
                                    :foreground ,terminal-monokai-bg))))

   `(cua-rectangle
     ((,class (:inherit region))
      (,terminal-class (:inherit region))))

   `(cua-rectangle-noselect
     ((,class (:inherit secondary-selection))
      (,terminal-class (:inherit secondary-selection))))

   ;; diary
   `(diary
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   ;; dired
   `(dired-directory
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(dired-flagged
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(dired-header
     ((,class (:foreground ,monokai-blue
                           :background ,monokai-bg
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :background ,terminal-monokai-bg
                                    :inherit bold))))

   `(dired-ignored
     ((,class (:inherit shadow))
      (,terminal-class (:inherit shadow))))

   `(dired-mark
     ((,class (:foreground ,monokai-green
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :weight bold))))

   `(dired-marked
     ((,class (:foreground ,monokai-violet
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-monokai-violet
                                    :inherit bold))))

   `(dired-perm-write
     ((,class (:foreground ,monokai-fg
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :underline t))))

   `(dired-symlink
     ((,class (:foreground ,monokai-cyan
                           :slant italic))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :slant italic))))

   `(dired-warning
     ((,class (:foreground ,monokai-orange
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-orange
                                    :underline t))))

   ;; dropdown
   `(dropdown-list-face
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-blue))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-blue))))

   `(dropdown-list-selection-face
     ((,class (:background ,monokai-green
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-green
                                    :foreground ,terminal-monokai-bg))))

   ;; ecb
   `(ecb-default-highlight-face
     ((,class (:background ,monokai-blue
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-blue
                                    :foreground ,terminal-monokai-bg))))

   `(ecb-history-bucket-node-dir-soure-path-face
     ((,class (:inherit ecb-history-bucket-node-face
                        :foreground ,monokai-yellow))
      (,terminal-class (:inherit ecb-history-bucket-node-face
                                 :foreground ,terminal-monokai-yellow))))

   `(ecb-source-in-directories-buffer-face
     ((,class (:inherit ecb-directories-general-face
                        :foreground ,monokai-fg))
      (,terminal-class (:inherit ecb-directories-general-face
                                 :foreground ,terminal-monokai-fg))))

   `(ecb-history-dead-buffer-face
     ((,class (:inherit ecb-history-general-face
                        :foreground ,monokai-comments))
      (,terminal-class (:inherit ecb-history-general-face
                                 :foreground ,terminal-monokai-comments))))

   `(ecb-directory-not-accessible-face
     ((,class (:inherit ecb-directories-general-face
                        :foreground ,monokai-comments))
      (,terminal-class (:inherit ecb-directories-general-face
                                 :foreground ,terminal-monokai-comments))))

   `(ecb-bucket-node-face
     ((,class (:inherit ecb-default-general-face
                        :weight normal
                        :foreground ,monokai-blue))
      (,terminal-class (:inherit ecb-default-general-face
                                 :weight normal
                                 :foreground ,terminal-monokai-blue))))

   `(ecb-tag-header-face
     ((,class (:background ,monokai-highlight-line))
      (,terminal-class (:background ,terminal-monokai-highlight-line))))

   `(ecb-analyse-bucket-element-face
     ((,class (:inherit ecb-analyse-general-face
                        :foreground ,monokai-green))
      (,terminal-class (:inherit ecb-analyse-general-face
                                 :foreground ,terminal-monokai-green))))

   `(ecb-directories-general-face
     ((,class (:inherit ecb-default-general-face
                        :height 1.0))
      (,terminal-class (:inherit ecb-default-general-face
                                 :height 1.0))))

   `(ecb-method-non-semantic-face
     ((,class (:inherit ecb-methods-general-face
                        :foreground ,monokai-cyan))
      (,terminal-class (:inherit ecb-methods-general-face
                                 :foreground ,terminal-monokai-cyan))))

   `(ecb-mode-line-prefix-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(ecb-tree-guide-line-face
     ((,class (:inherit ecb-default-general-face
                        :foreground ,monokai-gray
                        :height 1.0))
      (,terminal-class (:inherit ecb-default-general-face
                                 :foreground ,terminal-monokai-gray
                                 :height 1.0))))

   ;; ee
   `(ee-bookmarked
     ((,class (:foreground ,monokai-emph))
      (,terminal-class (:foreground ,terminal-monokai-emph))))

   `(ee-category
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(ee-link
     ((,class (:inherit link))
      (,terminal-class (:inherit link))))

   `(ee-link-visited
     ((,class (:inherit link-visited))
      (,terminal-class (:inherit link-visited))))

   `(ee-marked
     ((,class (:foreground ,monokai-magenta
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-magenta
                                    :weight bold))))

   `(ee-omitted
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(ee-shadow
     ((,class (:inherit shadow))
      (,terminal-class (:inherit shadow))))

   ;; grep
   `(grep-context-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(grep-error-face
     ((,class (:foreground ,monokai-red
                           :weight bold
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :weight bold
                                    :underline t))))

   `(grep-hit-face
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(grep-match-face
     ((,class (:foreground ,monokai-green
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :weight bold))))

   ;; isearch
   `(isearch
     ((,class (:inherit region
                        :background ,monokai-green))
      (,terminal-class (:inherit region
                                 :background ,terminal-monokai-green))))

   `(isearch-fail
     ((,class (:inherit isearch
                        :foreground ,monokai-red
                        :background ,monokai-bg
                        :bold t))
      (,terminal-class (:inherit isearch
                                 :foreground ,terminal-monokai-red
                                 :background ,terminal-monokai-bg
                                 :bold t))))


   ;; ace-jump-mode
   `(ace-jump-face-background
     ((,class (:foreground ,monokai-comments
                           :background ,monokai-bg
                           :inverse-video nil))
      (,terminal-class (:foreground ,terminal-monokai-comments
                                    :background ,terminal-monokai-bg
                                    :inverse-video nil))))

   `(ace-jump-face-foreground
     ((,class (:foreground ,monokai-yellow
                           :background ,monokai-bg
                           :inverse-video nil
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :background ,terminal-monokai-bg
                                    :inverse-video nil
                                    :weight bold))))

   ;; auctex
   `(font-latex-bold-face
     ((,class (:inherit bold
                        :foreground ,monokai-emph))
      (,terminal-class (:inherit bold
                                 :foreground ,terminal-monokai-emph))))

   `(font-latex-doctex-documentation-face
     ((,class (:background unspecified))
      (,terminal-class (:background unspecified))))

   `(font-latex-doctex-preprocessor-face
     ((,class
       (:inherit (font-latex-doctex-documentation-face
                  font-lock-builtin-face
                  font-lock-preprocessor-face)))
      (,class
       (:inherit (font-latex-doctex-documentation-face
                  font-lock-builtin-face
                  font-lock-preprocessor-face)))))

   `(font-latex-italic-face
     ((,class (:inherit italic :foreground ,monokai-emph))
      (,terminal-class (:inherit italic :foreground ,terminal-monokai-emph))))

   `(font-latex-math-face
     ((,class (:foreground ,monokai-violet))
      (,terminal-class (:foreground ,terminal-monokai-violet))))

   `(font-latex-sectioning-0-face
     ((,class (:inherit font-latex-sectioning-1-face
                        :height ,monokai-height-plus-1))
      (,terminal-class (:inherit font-latex-sectioning-1-face
                                 :height ,monokai-height-plus-1))))

   `(font-latex-sectioning-1-face
     ((,class (:inherit font-latex-sectioning-2-face
                        :height ,monokai-height-plus-1))
      (,terminal-class (:inherit font-latex-sectioning-2-face
                                 :height ,monokai-height-plus-1))))

   `(font-latex-sectioning-2-face
     ((,class (:inherit font-latex-sectioning-3-face
                        :height ,monokai-height-plus-1))
      (,terminal-class (:inherit font-latex-sectioning-3-face
                                 :height ,monokai-height-plus-1))))

   `(font-latex-sectioning-3-face
     ((,class (:inherit font-latex-sectioning-4-face
                        :height ,monokai-height-plus-1))
      (,terminal-class (:inherit font-latex-sectioning-4-face
                                 :height ,monokai-height-plus-1))))

   `(font-latex-sectioning-4-face
     ((,class (:inherit font-latex-sectioning-5-face
                        :height ,monokai-height-plus-1))
      (,terminal-class (:inherit font-latex-sectioning-5-face
                                 :height ,monokai-height-plus-1))))

   `(font-latex-sectioning-5-face
     ((,class (:inherit ,monokai-pitch
                        :foreground ,monokai-yellow
                        :weight bold))
      (,terminal-class (:inherit ,monokai-pitch :
                                 foreground ,terminal-monokai-yellow
                                 :weight bold))))

   `(font-latex-sedate-face
     ((,class (:foreground ,monokai-emph))
      (,terminal-class (:foreground ,terminal-monokai-emph))))

   `(font-latex-slide-title-face
     ((,class (:inherit (,monokai-pitch font-lock-type-face)
                        :weight bold
                        :height ,monokai-height-plus-3))
      (,terminal-class (:inherit (,monokai-pitch font-lock-type-face)
                                 :weight bold
                                 :height ,monokai-height-plus-3))))

   `(font-latex-string-face
     ((,class (:foreground ,monokai-cyan))
      (,terminal-class (:foreground ,terminal-monokai-cyan))))

   `(font-latex-subscript-face
     ((,class (:height ,monokai-height-minus-1))
      (,terminal-class (:height ,monokai-height-minus-1))))

   `(font-latex-superscript-face
     ((,class (:height ,monokai-height-minus-1))
      (,terminal-class (:height ,monokai-height-minus-1))))

   `(font-latex-verbatim-face
     ((,class (:inherit fixed-pitch
                        :foreground ,monokai-fg
                        :slant italic))
      (,terminal-class (:inherit fixed-pitch
                                 :foreground ,terminal-monokai-fg
                                 :slant italic))))

   `(font-latex-warning-face
     ((,class (:inherit bold
                        :foreground ,monokai-orange))
      (,terminal-class (:inherit bold
                                 :foreground ,terminal-monokai-orange))))

   ;; auto-complete
   `(ac-candidate-face
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-blue))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-blue))))

   `(ac-selection-face
     ((,class (:background ,monokai-blue
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-blue
                                    :foreground ,terminal-monokai-bg))))

   `(ac-candidate-mouse-face
     ((,class (:background ,monokai-blue
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-blue
                                    :foreground ,terminal-monokai-bg))))

   `(ac-completion-face
     ((,class (:foreground ,monokai-emph
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :underline t))))

   `(ac-gtags-candidate-face
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-blue))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-blue))))

   `(ac-gtags-selection-face
     ((,class (:background ,monokai-blue
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-blue
                                    :foreground ,terminal-monokai-bg))))

   `(ac-yasnippet-candidate-face
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-yellow))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-yellow))))

   `(ac-yasnippet-selection-face
     ((,class (:background ,monokai-yellow
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-yellow
                                    :foreground ,terminal-monokai-bg))))

   ;; auto highlight symbol
   `(ahs-definition-face
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-blue))))

   `(ahs-edit-mode-face
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-highlight))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-highlight))))

   `(ahs-face
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-magenta
                                    :background unspecified))))

   `(ahs-plugin-bod-face
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-violet ))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-cyan ))))

   `(ahs-plugin-defalt-face
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-orange))))

   `(ahs-plugin-whole-buffer-face
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-green))))

   `(ahs-warning-face
     ((,class (:foreground ,monokai-red
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :weight bold))))

   ;; android mode
   `(android-mode-debug-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(android-mode-error-face
     ((,class (:foreground ,monokai-orange
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-orange
                                    :weight bold))))

   `(android-mode-info-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(android-mode-verbose-face
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(android-mode-warning-face
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   ;; anzu-mode
   `(anzu-mode-line
     ((,class (:foreground ,monokai-violet
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-violet
                                    :weight bold))))

   ;; bm
   `(bm-face
     ((,class (:background ,monokai-yellow-lc
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-yellow-lc
                                    :foreground ,terminal-monokai-bg))))

   `(bm-fringe-face
     ((,class (:background ,monokai-yellow-lc
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-yellow-lc
                                    :foreground ,terminal-monokai-bg))))

   `(bm-fringe-persistent-face
     ((,class (:background ,monokai-green-lc
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-green-lc
                                    :foreground ,terminal-monokai-bg))))

   `(bm-persistent-face
     ((,class (:background ,monokai-green-lc
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-green-lc
                                    :foreground ,terminal-monokai-bg))))

   ;; calfw
   `(cfw:face-day-title
     ((,class (:background ,monokai-highlight-line))
      (,terminal-class (:background ,terminal-monokai-highlight-line))))

   `(cfw:face-annotation
     ((,class (:inherit cfw:face-day-title
                        :foreground ,monokai-yellow))
      (,terminal-class (:inherit cfw:face-day-title
                                 :foreground ,terminal-monokai-yellow))))

   `(cfw:face-default-content
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(cfw:face-default-day
     ((,class (:inherit cfw:face-day-title
                        :weight bold))
      (,terminal-class (:inherit cfw:face-day-title
                                 :weight bold))))

   `(cfw:face-disable
     ((,class (:inherit cfw:face-day-title
                        :foreground ,monokai-comments))
      (,terminal-class (:inherit cfw:face-day-title
                                 :foreground ,terminal-monokai-comments))))

   `(cfw:face-grid
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(cfw:face-header
     ((,class (:foreground ,monokai-blue-hc
                           :background ,monokai-blue-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-blue-hc
                                    :background ,terminal-monokai-blue-lc
                                    :weight bold))))

   `(cfw:face-holiday
     ((,class (:background nil
                           :foreground ,monokai-red
                           :weight bold))
      (,terminal-class (:background nil
                                    :foreground ,terminal-monokai-red
                                    :weight bold))))

   `(cfw:face-periods
     ((,class (:foreground ,monokai-magenta))
      (,terminal-class (:foreground ,terminal-monokai-magenta))))

   `(cfw:face-select
     ((,class (:background ,monokai-magenta-lc
                           :foreground ,monokai-magenta-hc))
      (,terminal-class (:background ,terminal-monokai-magenta-lc
                                    :foreground ,terminal-monokai-magenta-hc))))

   `(cfw:face-saturday
     ((,class (:foreground ,monokai-cyan-hc
                           :background ,monokai-cyan-lc))
      (,terminal-class (:foreground ,terminal-monokai-cyan-hc
                                    :background ,terminal-monokai-cyan-lc))))

   `(cfw:face-sunday
     ((,class (:foreground ,monokai-red-hc
                           :background ,monokai-red-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-red-hc
                                    :background ,terminal-monokai-red-lc
                                    :weight bold))))

   `(cfw:face-title
     ((,class (:inherit ,monokai-pitch
                        :foreground ,monokai-yellow
                        :weight bold
                        :height ,monokai-height-plus-4))
      (,terminal-class (:inherit ,monokai-pitch
                                 :foreground ,terminal-monokai-yellow
                                 :weight bold
                                 :height ,monokai-height-plus-4))))

   `(cfw:face-today
     ((,class (:weight bold
                       :background ,monokai-highlight-line
                       :foreground nil))
      (,terminal-class (:weight bold
                                :background ,terminal-monokai-highlight-line
                                :foreground nil))))

   `(cfw:face-today-title
     ((,class (:background ,monokai-yellow-lc
                           :foreground ,monokai-yellow-hc
                           :weight bold))
      (,terminal-class (:background ,terminal-monokai-yellow-lc
                                    :foreground ,terminal-monokai-yellow-hc
                                    :weight bold))))

   `(cfw:face-toolbar
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-fg))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-fg))))

   `(cfw:face-toolbar-button-off
     ((,class (:background ,monokai-yellow-lc
                           :foreground ,monokai-yellow-hc
                           :weight bold))
      (,terminal-class (:background ,terminal-monokai-yellow-lc
                                    :foreground ,terminal-monokai-yellow-hc
                                    :weight bold))))

   `(cfw:face-toolbar-button-on
     ((,class (:background ,monokai-yellow-hc
                           :foreground ,monokai-yellow-lc
                           :weight bold))
      (,terminal-class (:background ,terminal-monokai-yellow-hc
                                    :foreground ,terminal-monokai-yellow-lc
                                    :weight bold))))

   ;; cider
   `(cider-enlightened
     ((,class (:foreground ,monokai-yellow
                           :background nil
                           :box (:color ,monokai-yellow :line-width -1 :style nil)))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :background nil
                                    :box (:color ,terminal-monokai-yellow :line-width -1 :style nil))) ))

   `(cider-enlightened-local
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(cider-instrumented-face
     ((,class (:foreground ,monokai-violet
                           :background nil
                           :box (:color ,monokai-violet :line-width -1 :style nil)))
      (,terminal-class (:foreground ,terminal-monokai-violet
                                    :background nil
                                    :box (:color ,terminal-monokai-violet :line-width -1 :style nil)))))

   `(cider-result-overlay-face
     ((,class (:foreground ,monokai-blue
                           :background nil
                           :box (:color ,monokai-blue :line-width -1 :style nil)))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :background nil
                                    :box (:color ,terminal-monokai-blue :line-width -1 :style nil)))))

   `(cider-test-error-face
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-orange))))

   `(cider-test-failure-face
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-red))))

   `(cider-test-success-face
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-green))))

   `(cider-traced-face
     ((,class :box (:color ,monokai-blue :line-width -1 :style nil))
      (,terminal-class :box (:color ,terminal-monokai-blue :line-width -1 :style nil))))

   ;; clojure-test
   `(clojure-test-failure-face
     ((,class (:foreground ,monokai-red
                           :weight bold
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :weight bold
                                    :underline t))))

   `(clojure-test-error-face
     ((,class (:foreground ,monokai-orange
                           :weight bold
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :weight bold
                                    :underline t))))

   `(clojure-test-success-face
     ((,class (:foreground ,monokai-green
                           :weight bold
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :weight bold
                                    :underline t))))

   ;; company-mode
   `(company-tooltip
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-emph))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-emph))))

   `(company-tooltip-selection
     ((,class (:background ,monokai-blue
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-blue
                                    :foreground ,terminal-monokai-bg))))

   `(company-tooltip-mouse
     ((,class (:background ,monokai-blue
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-blue
                                    :foreground ,terminal-monokai-bg))))

   `(company-tooltip-common
     ((,class (:foreground ,monokai-blue
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :underline t))))

   `(company-tooltip-common-selection
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-blue
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-blue
                                    :underline t))))

   `(company-preview
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-emph))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-emph))))

   `(company-preview-common
     ((,class (:foreground ,monokai-blue
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :underline t))))

   `(company-scrollbar-bg
     ((,class (:background ,monokai-gray))
      (,terminal-class (:background ,terminal-monokai-gray))))

   `(company-scrollbar-fg
     ((,class (:background ,monokai-comments))
      (,terminal-class (:background ,terminal-monokai-comments))))

   `(company-tooltip-annotation
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-green))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-green))))

   `(company-template-field
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-blue))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-blue))))

   ;; compilation
   `(compilation-column-face
     ((,class (:foreground ,monokai-cyan
                           :underline nil))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :underline nil))))

   `(compilation-column-number
     ((,class (:inherit font-lock-doc-face
                        :foreground ,monokai-cyan
                        :underline nil))
      (,terminal-class (:inherit font-lock-doc-face
                                 :foreground ,terminal-monokai-cyan
                                 :underline nil))))

   `(compilation-enter-directory-face
     ((,class (:foreground ,monokai-green
                           :underline nil))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :underline nil))))

   `(compilation-error
     ((,class (:inherit error
                        :underline nil))
      (,terminal-class (:inherit error
                                 :underline nil))))

   `(compilation-error-face
     ((,class (:foreground ,monokai-red
                           :underline nil))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :underline nil))))

   `(compilation-face
     ((,class (:foreground ,monokai-fg
                           :underline nil))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :underline nil))))

   `(compilation-info
     ((,class (:foreground ,monokai-comments
                           :underline nil
                           :bold nil))
      (,terminal-class (:foreground ,terminal-monokai-comments
                                    :underline nil
                                    :bold nil))))

   `(compilation-info-face
     ((,class (:foreground ,monokai-blue
                           :underline nil))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :underline nil))))

   `(compilation-leave-directory-face
     ((,class (:foreground ,monokai-green
                           :underline nil))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :underline nil))))

   `(compilation-line-face
     ((,class (:foreground ,monokai-green
                           :underline nil))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :underline nil))))

   `(compilation-line-number
     ((,class (:foreground ,monokai-green
                           :underline nil))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :underline nil))))

   `(compilation-warning
     ((,class (:inherit warning
                        :underline nil))
      (,terminal-class (:inherit warning
                                 :underline nil))))

   `(compilation-warning-face
     ((,class (:foreground ,monokai-yellow
                           :weight normal
                           :underline nil))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight normal
                                    :underline nil))))

   `(compilation-mode-line-exit
     ((,class (:inherit compilation-info
                        :foreground ,monokai-green
                        :weight bold))
      (,terminal-class (:inherit compilation-info
                                 :foreground ,terminal-monokai-green
                                 :weight bold))))

   `(compilation-mode-line-fail
     ((,class (:inherit compilation-error
                        :foreground ,monokai-red
                        :weight bold))
      (,terminal-class (:inherit compilation-error
                                 :foreground ,terminal-monokai-red
                                 :weight bold))))

   `(compilation-mode-line-run
     ((,class (:foreground ,monokai-orange
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-orange
                                    :weight bold))))

   ;; CSCOPE
   `(cscope-file-face
     ((,class (:foreground ,monokai-green
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :weight bold))))

   `(cscope-function-face
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(cscope-line-number-face
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(cscope-line-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(cscope-mouse-face
     ((,class (:background ,monokai-blue
                           :foreground ,monokai-fg))
      (,terminal-class (:background ,terminal-monokai-blue
                                    :foreground ,terminal-monokai-fg))))

   ;; ctable
   `(ctbl:face-cell-select
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-emph
                           :underline ,monokai-emph
                           :weight bold))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-emph
                                    :underline ,terminal-monokai-emph
                                    :weight bold))))

   `(ctbl:face-continue-bar
     ((,class (:background ,monokai-gray
                           :foreground ,monokai-yellow))
      (,terminal-class (:background ,terminal-monokai-gray
                                    :foreground ,terminal-monokai-yellow))))

   `(ctbl:face-row-select
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-fg
                           :underline t))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-fg
                                    :underline t))))

   ;; coffee
   `(coffee-mode-class-name
     ((,class (:foreground ,monokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight bold))))

   `(coffee-mode-function-param
     ((,class (:foreground ,monokai-violet
                           :slant italic))
      (,terminal-class (:foreground ,terminal-monokai-violet
                                    :slant italic))))

   ;; custom
   `(custom-face-tag
     ((,class (:inherit ,monokai-pitch
                        :height ,monokai-height-plus-3
                        :foreground ,monokai-violet
                        :weight bold))
      (,terminal-class (:inherit ,monokai-pitch
                                 :height ,monokai-height-plus-3
                                 :foreground ,terminal-monokai-violet
                                 :weight bold))))

   `(custom-variable-tag
     ((,class (:inherit ,monokai-pitch
                        :foreground ,monokai-cyan
                        :height ,monokai-height-plus-3))
      (,terminal-class (:inherit ,monokai-pitch
                                 :foreground ,terminal-monokai-cyan
                                 :height ,monokai-height-plus-3))))

   `(custom-comment-tag
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(custom-group-tag
     ((,class (:inherit ,monokai-pitch
                        :foreground ,monokai-blue
                        :height ,monokai-height-plus-3))
      (,terminal-class (:inherit ,monokai-pitch
                                 :foreground ,terminal-monokai-blue
                                 :height ,monokai-height-plus-3))))

   `(custom-group-tag-1
     ((,class (:inherit ,monokai-pitch
                        :foreground ,monokai-red
                        :height ,monokai-height-plus-3))
      (,terminal-class (:inherit ,monokai-pitch
                                 :foreground ,terminal-monokai-red
                                 :height ,monokai-height-plus-3))))

   `(custom-state
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   ;; diff
   `(diff-added
     ((,class (:foreground ,monokai-green
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :background ,terminal-monokai-bg))))

   `(diff-changed
     ((,class (:foreground ,monokai-blue
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :background ,terminal-monokai-bg))))

   `(diff-removed
     ((,class (:foreground ,monokai-red
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :background ,terminal-monokai-bg))))

   `(diff-header
     ((,class (:background ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-bg))))

   `(diff-file-header
     ((,class (:background ,monokai-bg
                           :foreground ,monokai-fg
                           :weight bold))
      (,terminal-class (:background ,terminal-monokai-bg
                                    :foreground ,terminal-monokai-fg
                                    :weight bold))))

   `(diff-refine-added
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-green))))

   `(diff-refine-change
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-blue))))

   `(diff-refine-removed
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-red))))

   ;; diff-hl
   `(diff-hl-change
     ((,class (:background ,monokai-blue-lc
                           :foreground ,monokai-blue-hc))
      (,terminal-class (:background ,terminal-monokai-blue-lc
                                    :foreground ,terminal-monokai-blue-hc))))

   `(diff-hl-delete
     ((,class (:background ,monokai-red-lc
                           :foreground ,monokai-red-hc))
      (,terminal-class (:background ,terminal-monokai-red-lc
                                    :foreground ,terminal-monokai-red-hc))))

   `(diff-hl-insert
     ((,class (:background ,monokai-green-lc
                           :foreground ,monokai-green-hc))
      (,terminal-class (:background ,terminal-monokai-green-lc
                                    :foreground ,terminal-monokai-green-hc))))

   `(diff-hl-unknown
     ((,class (:background ,monokai-violet-lc
                           :foreground ,monokai-violet-hc))
      (,terminal-class (:background ,terminal-monokai-violet-lc
                                    :foreground ,terminal-monokai-violet-hc))))

   ;; ediff
   `(ediff-fine-diff-A
     ((,class (:background ,monokai-orange-lc))
      (,terminal-class (:background ,terminal-monokai-orange-lc))))

   `(ediff-fine-diff-B
     ((,class (:background ,monokai-green-lc))
      (,terminal-class (:background ,terminal-monokai-green-lc))))

   `(ediff-fine-diff-C
     ((,class (:background ,monokai-yellow-lc))
      (,terminal-class (:background ,terminal-monokai-yellow-lc))))

   `(ediff-current-diff-C
     ((,class (:background ,monokai-blue-lc))
      (,terminal-class (:background ,terminal-monokai-blue-lc))))

   `(ediff-even-diff-A
     ((,class (:background ,monokai-comments
                           :foreground ,monokai-fg-lc ))
      (,terminal-class (:background ,terminal-monokai-comments
                                    :foreground ,terminal-monokai-fg-lc ))))

   `(ediff-odd-diff-A
     ((,class (:background ,monokai-comments
                           :foreground ,monokai-fg-hc ))
      (,terminal-class (:background ,terminal-monokai-comments
                                    :foreground ,terminal-monokai-fg-hc ))))

   `(ediff-even-diff-B
     ((,class (:background ,monokai-comments
                           :foreground ,monokai-fg-hc ))
      (,terminal-class (:background ,terminal-monokai-comments
                                    :foreground ,terminal-monokai-fg-hc ))))

   `(ediff-odd-diff-B
     ((,class (:background ,monokai-comments
                           :foreground ,monokai-fg-lc ))
      (,terminal-class (:background ,terminal-monokai-comments
                                    :foreground ,terminal-monokai-fg-lc ))))

   `(ediff-even-diff-C
     ((,class (:background ,monokai-comments
                           :foreground ,monokai-fg ))
      (,terminal-class (:background ,terminal-monokai-comments
                                    :foreground ,terminal-monokai-fg ))))

   `(ediff-odd-diff-C
     ((,class (:background ,monokai-comments
                           :foreground ,monokai-bg ))
      (,terminal-class (:background ,terminal-monokai-comments
                                    :foreground ,terminal-monokai-bg ))))

   ;; edts
   `(edts-face-error-line
     ((,(append '((supports :underline (:style line))) class)
       (:underline (:style line :color ,monokai-red)
                   :inherit unspecified))
      (,class (:foreground ,monokai-red-hc
                           :background ,monokai-red-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style line))) terminal-class)
       (:underline (:style line :color ,terminal-monokai-red)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-monokai-red-hc
                                    :background ,terminal-monokai-red-lc
                                    :weight bold
                                    :underline t))))

   `(edts-face-warning-line
     ((,(append '((supports :underline (:style line))) class)
       (:underline (:style line :color ,monokai-yellow)
                   :inherit unspecified))
      (,class (:foreground ,monokai-yellow-hc
                           :background ,monokai-yellow-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style line))) terminal-class)
       (:underline (:style line :color ,terminal-monokai-yellow)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-monokai-yellow-hc
                                    :background ,terminal-monokai-yellow-lc
                                    :weight bold
                                    :underline t))))

   `(edts-face-error-fringe-bitmap
     ((,class (:foreground ,monokai-red
                           :background unspecified
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :background unspecified
                                    :weight bold))))

   `(edts-face-warning-fringe-bitmap
     ((,class (:foreground ,monokai-yellow
                           :background unspecified
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :background unspecified
                                    :weight bold))))

   `(edts-face-error-mode-line
     ((,class (:background ,monokai-red
                           :foreground unspecified))
      (,terminal-class (:background ,terminal-monokai-red
                                    :foreground unspecified))))

   `(edts-face-warning-mode-line
     ((,class (:background ,monokai-yellow
                           :foreground unspecified))
      (,terminal-class (:background ,terminal-monokai-yellow
                                    :foreground unspecified))))


   ;; elfeed
   `(elfeed-search-date-face
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(elfeed-search-feed-face
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(elfeed-search-tag-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(elfeed-search-title-face
     ((,class (:foreground ,monokai-cyan))
      (,terminal-class (:foreground ,terminal-monokai-cyan))))

   ;; ein
   `(ein:cell-input-area
     ((,class (:background ,monokai-highlight-line))
      (,terminal-class (:background ,terminal-monokai-highlight-line))))
   `(ein:cell-input-prompt
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))
   `(ein:cell-output-prompt
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))
   `(ein:notification-tab-normal
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))
   `(ein:notification-tab-selected
     ((,class (:foreground ,monokai-orange :inherit bold))
      (,terminal-class (:foreground ,terminal-monokai-orange :inherit bold))))

   ;; enhanced ruby mode
   `(enh-ruby-string-delimiter-face
     ((,class (:inherit font-lock-string-face))
      (,terminal-class (:inherit font-lock-string-face))))

   `(enh-ruby-heredoc-delimiter-face
     ((,class (:inherit font-lock-string-face))
      (,terminal-class (:inherit font-lock-string-face))))

   `(enh-ruby-regexp-delimiter-face
     ((,class (:inherit font-lock-string-face))
      (,terminal-class (:inherit font-lock-string-face))))

   `(enh-ruby-op-face
     ((,class (:inherit font-lock-keyword-face))
      (,terminal-class (:inherit font-lock-keyword-face))))

   ;; erm-syn
   `(erm-syn-errline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,monokai-red)
                   :inherit unspecified))
      (,class (:foreground ,monokai-red-hc
                           :background ,monokai-red-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-monokai-red)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-monokai-red-hc
                                    :background ,terminal-monokai-red-lc
                                    :weight bold
                                    :underline t))))

   `(erm-syn-warnline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,monokai-orange)
                   :inherit unspecified))
      (,class (:foreground ,monokai-orange-hc
                           :background ,monokai-orange-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-monokai-orange)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-monokai-orange-hc
                                    :background ,terminal-monokai-orange-lc
                                    :weight bold
                                    :underline t))))

   ;; epc
   `(epc:face-title
     ((,class (:foreground ,monokai-blue
                           :background ,monokai-bg
                           :weight normal
                           :underline nil))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :background ,terminal-monokai-bg
                                    :weight normal
                                    :underline nil))))

   ;; erc
   `(erc-action-face
     ((,class (:inherit erc-default-face))
      (,terminal-class (:inherit erc-default-face))))

   `(erc-bold-face
     ((,class (:weight bold))
      (,terminal-class (:weight bold))))

   `(erc-current-nick-face
     ((,class (:foreground ,monokai-blue :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :weight bold))))

   `(erc-dangerous-host-face
     ((,class (:inherit font-lock-warning-face))
      (,terminal-class (:inherit font-lock-warning-face))))

   `(erc-default-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(erc-highlight-face
     ((,class (:inherit erc-default-face
                        :background ,monokai-highlight))
      (,terminal-class (:inherit erc-default-face
                                 :background ,terminal-monokai-highlight))))

   `(erc-direct-msg-face
     ((,class (:inherit erc-default-face))
      (,terminal-class (:inherit erc-default-face))))

   `(erc-error-face
     ((,class (:inherit font-lock-warning-face))
      (,terminal-class (:inherit font-lock-warning-face))))

   `(erc-fool-face
     ((,class (:inherit erc-default-face))
      (,terminal-class (:inherit erc-default-face))))

   `(erc-input-face
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(erc-keyword-face
     ((,class (:foreground ,monokai-blue
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :weight bold))))

   `(erc-nick-default-face
     ((,class (:foreground ,monokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight bold))))

   `(erc-my-nick-face
     ((,class (:foreground ,monokai-red
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :weight bold))))

   `(erc-nick-msg-face
     ((,class (:inherit erc-default-face))
      (,terminal-class (:inherit erc-default-face))))

   `(erc-notice-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(erc-pal-face
     ((,class (:foreground ,monokai-orange
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-orange
                                    :weight bold))))

   `(erc-prompt-face
     ((,class (:foreground ,monokai-orange
                           :background ,monokai-bg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-orange
                                    :background ,terminal-monokai-bg
                                    :weight bold))))

   `(erc-timestamp-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(erc-underline-face
     ((t (:underline t))))

   ;; eshell
   `(eshell-prompt
     ((,class (:foreground ,monokai-blue
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :inherit bold))))

   `(eshell-ls-archive
     ((,class (:foreground ,monokai-red
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :inherit bold))))

   `(eshell-ls-backup
     ((,class (:inherit font-lock-comment-face))
      (,terminal-class (:inherit font-lock-comment-face))))

   `(eshell-ls-clutter
     ((,class (:inherit font-lock-comment-face))
      (,terminal-class (:inherit font-lock-comment-face))))

   `(eshell-ls-directory
     ((,class (:foreground ,monokai-blue
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :inherit bold))))

   `(eshell-ls-executable
     ((,class (:foreground ,monokai-green
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :inherit bold))))

   `(eshell-ls-unreadable
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(eshell-ls-missing
     ((,class (:inherit font-lock-warning-face))
      (,terminal-class (:inherit font-lock-warning-face))))

   `(eshell-ls-product
     ((,class (:inherit font-lock-doc-face))
      (,terminal-class (:inherit font-lock-doc-face))))

   `(eshell-ls-special
     ((,class (:foreground ,monokai-yellow
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :inherit bold))))

   `(eshell-ls-symlink
     ((,class (:foreground ,monokai-cyan
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :inherit bold))))

   ;; evil-ex-substitute
   `(evil-ex-substitute-matches
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-red-l
                           :inherit italic))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-red-l
                                    :inherit italic))))
   `(evil-ex-substitute-replacement
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-green-l
                           :inherit italic))
      (,terminal-class (:background ,terminal-monokai-highlight-line :foreground ,terminal-monokai-green-l :inherit italic))))

   ;; evil-search-highlight-persist
   `(evil-search-highlight-persist-highlight-face
     ((,class (:inherit region))
      (,terminal-class (:inherit region))))

   ;; fic
   `(fic-author-face
     ((,class (:background ,monokai-bg
                           :foreground ,monokai-orange
                           :underline t
                           :slant italic))
      (,terminal-class (:background ,terminal-monokai-bg
                                    :foreground ,terminal-monokai-orange
                                    :underline t
                                    :slant italic))))

   `(fic-face
     ((,class (:background ,monokai-bg
                           :foreground ,monokai-orange
                           :weight normal
                           :slant italic))
      (,terminal-class (:background ,terminal-monokai-bg
                                    :foreground ,terminal-monokai-orange
                                    :weight normal
                                    :slant italic))))

   `(font-lock-fic-face
     ((,class (:background ,monokai-bg
                           :foreground ,monokai-orange
                           :weight normal
                           :slant italic))
      (,terminal-class (:background ,terminal-monokai-bg
                                    :foreground ,terminal-monokai-orange
                                    :weight normal
                                    :slant italic))))

   ;; flx
   `(flx-highlight-face
     ((,class (:foreground ,monokai-blue
                           :weight normal
                           :underline nil))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :weight normal
                                    :underline nil))))

   ;; flymake
   `(flymake-errline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,monokai-red)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,class (:foreground ,monokai-red-hc
                           :background ,monokai-red-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-monokai-red)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,terminal-class (:foreground ,terminal-monokai-red-hc
                                    :background ,terminal-monokai-red-lc
                                    :weight bold
                                    :underline t))))

   `(flymake-infoline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,monokai-green)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,class (:foreground ,monokai-green-hc
                           :background ,monokai-green-lc))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-monokai-green)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,terminal-class (:foreground ,terminal-monokai-green-hc
                                    :background ,terminal-monokai-green-lc))))

   `(flymake-warnline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,monokai-yellow)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,class (:foreground ,monokai-yellow-hc
                           :background ,monokai-yellow-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-monokai-yellow)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,terminal-class (:foreground ,terminal-monokai-yellow-hc
                                    :background ,terminal-monokai-yellow-lc
                                    :weight bold
                                    :underline t))))

   ;; flycheck
   `(flycheck-error
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,monokai-red)
                   :inherit unspecified))
      (,class (:foreground ,monokai-red-hc
                           :background ,monokai-red-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-monokai-red)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-monokai-red-hc
                                    :background ,terminal-monokai-red-lc
                                    :weight bold
                                    :underline t))))

   `(flycheck-warning
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,monokai-yellow)
                   :inherit unspecified))
      (,class (:foreground ,monokai-yellow-hc
                           :background ,monokai-yellow-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-monokai-yellow)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-monokai-yellow-hc
                                    :background ,terminal-monokai-yellow-lc
                                    :weight bold
                                    :underline t))))

   `(flycheck-info
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,monokai-blue)
                   :inherit unspecified))
      (,class (:foreground ,monokai-blue-hc
                           :background ,monokai-blue-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-monokai-blue)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-monokai-blue-hc
                                    :background ,terminal-monokai-blue-lc
                                    :weight bold
                                    :underline t))))

   `(flycheck-fringe-error
     ((,class (:foreground ,monokai-red-hc
                           :background ,monokai-red-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-red-hc
                                    :background ,terminal-monokai-red-lc
                                    :weight bold))))

   `(flycheck-fringe-warning
     ((,class (:foreground ,monokai-yellow-hc
                           :background ,monokai-yellow-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow-hc
                                    :background ,terminal-monokai-yellow-lc
                                    :weight bold))))

   `(flycheck-fringe-info
     ((,class (:foreground ,monokai-blue-hc
                           :background ,monokai-blue-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-blue-hc
                                    :background ,terminal-monokai-blue-lc
                                    :weight bold))))

   ;; flyspell
   `(flyspell-duplicate
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,monokai-yellow)
                   :inherit unspecified))
      (,class (:foreground ,monokai-yellow
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-monokai-yellow)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight bold
                                    :underline t))))

   `(flyspell-incorrect
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,monokai-red)
                   :inherit unspecified))
      (,class (:foreground ,monokai-red
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-monokai-red)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :weight bold
                                    :underline t))))


   ;; git-gutter
   `(git-gutter:added
     ((,class (:background ,monokai-green
                           :foreground ,monokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-monokai-green
                                    :foreground ,terminal-monokai-bg
                                    :inherit bold))))

   `(git-gutter:deleted
     ((,class (:background ,monokai-red
                           :foreground ,monokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-monokai-red
                                    :foreground ,terminal-monokai-bg
                                    :inherit bold))))

   `(git-gutter:modified
     ((,class (:background ,monokai-blue
                           :foreground ,monokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-monokai-blue
                                    :foreground ,terminal-monokai-bg
                                    :inherit bold))))

   `(git-gutter:unchanged
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-bg
                                    :inherit bold))))

   ;; git-gutter-fr
   `(git-gutter-fr:added
     ((,class (:foreground ,monokai-green
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :inherit bold))))

   `(git-gutter-fr:deleted
     ((,class (:foreground ,monokai-red
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :inherit bold))))

   `(git-gutter-fr:modified
     ((,class (:foreground ,monokai-blue
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :inherit bold))))

   ;; git-gutter+ and git-gutter+-fr
   `(git-gutter+-added
     ((,class (:background ,monokai-green
                           :foreground ,monokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-monokai-green
                                    :foreground ,terminal-monokai-bg
                                    :inherit bold))))

   `(git-gutter+-deleted
     ((,class (:background ,monokai-red
                           :foreground ,monokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-monokai-red
                                    :foreground ,terminal-monokai-bg
                                    :inherit bold))))

   `(git-gutter+-modified
     ((,class (:background ,monokai-blue
                           :foreground ,monokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-monokai-blue
                                    :foreground ,terminal-monokai-bg
                                    :inherit bold))))

   `(git-gutter+-unchanged
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-bg
                                    :inherit bold))))

   `(git-gutter-fr+-added
     ((,class (:foreground ,monokai-green
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :weight bold))))

   `(git-gutter-fr+-deleted
     ((,class (:foreground ,monokai-red
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :weight bold))))

   `(git-gutter-fr+-modified
     ((,class (:foreground ,monokai-blue
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :weight bold))))

   ;; git-timemachine
   `(git-timemachine-minibuffer-detail-face
     ((,class (:foreground ,monokai-blue
                           :background ,monokai-highlight-line
                           :inherit bold))
      (,terminal-class (:foreground ,monokai-blue
                                    :background ,terminal-monokai-highlight-line
                                    :inherit bold))))

   ;; guide-key
   `(guide-key/highlight-command-face
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(guide-key/key-face
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(guide-key/prefix-command-face
     ((,class (:foreground ,monokai-violet))
      (,terminal-class (:foreground ,terminal-monokai-violet))))

   ;; gnus
   `(gnus-group-mail-1
     ((,class (:weight bold
                       :inherit gnus-group-mail-1-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-mail-1-empty))))

   `(gnus-group-mail-1-empty
     ((,class (:inherit gnus-group-news-1-empty))
      (,terminal-class (:inherit gnus-group-news-1-empty))))

   `(gnus-group-mail-2
     ((,class (:weight bold
                       :inherit gnus-group-mail-2-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-mail-2-empty))))

   `(gnus-group-mail-2-empty
     ((,class (:inherit gnus-group-news-2-empty))
      (,terminal-class (:inherit gnus-group-news-2-empty))))

   `(gnus-group-mail-3
     ((,class (:weight bold
                       :inherit gnus-group-mail-3-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-mail-3-empty))))

   `(gnus-group-mail-3-empty
     ((,class (:inherit gnus-group-news-3-empty))
      (,terminal-class (:inherit gnus-group-news-3-empty))))

   `(gnus-group-mail-low
     ((,class (:weight bold
                       :inherit gnus-group-mail-low-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-mail-low-empty))))

   `(gnus-group-mail-low-empty
     ((,class (:inherit gnus-group-news-low-empty))
      (,terminal-class (:inherit gnus-group-news-low-empty))))

   `(gnus-group-news-1
     ((,class (:weight bold
                       :inherit gnus-group-news-1-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-news-1-empty))))

   `(gnus-group-news-2
     ((,class (:weight bold
                       :inherit gnus-group-news-2-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-news-2-empty))))

   `(gnus-group-news-3
     ((,class (:weight bold
                       :inherit gnus-group-news-3-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-news-3-empty))))

   `(gnus-group-news-4
     ((,class (:weight bold
                       :inherit gnus-group-news-4-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-news-4-empty))))

   `(gnus-group-news-5
     ((,class (:weight bold
                       :inherit gnus-group-news-5-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-news-5-empty))))

   `(gnus-group-news-6
     ((,class (:weight bold
                       :inherit gnus-group-news-6-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-news-6-empty))))

   `(gnus-group-news-low
     ((,class (:weight bold
                       :inherit gnus-group-news-low-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-news-low-empty))))

   `(gnus-header-content
     ((,class (:inherit message-header-other))
      (,terminal-class (:inherit message-header-other))))

   `(gnus-header-from
     ((,class (:inherit message-header-other))
      (,terminal-class (:inherit message-header-other))))

   `(gnus-header-name
     ((,class (:inherit message-header-name))
      (,terminal-class (:inherit message-header-name))))

   `(gnus-header-newsgroups
     ((,class (:inherit message-header-other))
      (,terminal-class (:inherit message-header-other))))

   `(gnus-header-subject
     ((,class (:inherit message-header-subject))
      (,terminal-class (:inherit message-header-subject))))

   `(gnus-summary-cancelled
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(gnus-summary-high-ancient
     ((,class (:foreground ,monokai-blue
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :weight bold))))

   `(gnus-summary-high-read
     ((,class (:foreground ,monokai-green
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :weight bold))))

   `(gnus-summary-high-ticked
     ((,class (:foreground ,monokai-orange
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-orange
                                    :weight bold))))

   `(gnus-summary-high-unread
     ((,class (:foreground ,monokai-fg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :weight bold))))

   `(gnus-summary-low-ancient
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(gnus-summary-low-read
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(gnus-summary-low-ticked
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(gnus-summary-low-unread
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(gnus-summary-normal-ancient
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(gnus-summary-normal-read
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(gnus-summary-normal-ticked
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(gnus-summary-normal-unread
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(gnus-summary-selected
     ((,class (:foreground ,monokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight bold))))

   `(gnus-cite-1
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(gnus-cite-2
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(gnus-cite-3
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(gnus-cite-4
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(gnus-cite-5
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(gnus-cite-6
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(gnus-cite-7
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(gnus-cite-8
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(gnus-cite-9
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(gnus-cite-10
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(gnus-cite-11
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(gnus-group-news-1-empty
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(gnus-group-news-2-empty
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(gnus-group-news-3-empty
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(gnus-group-news-4-empty
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(gnus-group-news-5-empty
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(gnus-group-news-6-empty
     ((,class (:foreground ,monokai-blue-lc))
      (,terminal-class (:foreground ,terminal-monokai-blue-lc))))

   `(gnus-group-news-low-empty
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(gnus-signature
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(gnus-x-face
     ((,class (:background ,monokai-fg
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-fg
                                    :foreground ,terminal-monokai-bg))))


   ;; helm
   `(helm-apt-deinstalled
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(helm-apt-installed
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(helm-bookmark-directory
     ((,class (:inherit helm-ff-directory))
      (,terminal-class (:inherit helm-ff-directory))))

   `(helm-bookmark-file
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(helm-bookmark-gnus
     ((,class (:foreground ,monokai-cyan))
      (,terminal-class (:foreground ,terminal-monokai-cyan))))

   `(helm-bookmark-info
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(helm-bookmark-man
     ((,class (:foreground ,monokai-violet))
      (,terminal-class (:foreground ,terminal-monokai-violet))))

   `(helm-bookmark-w3m
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(helm-bookmarks-su
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(helm-buffer-file
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(helm-buffer-directory
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(helm-buffer-process
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(helm-buffer-saved-out
     ((,class (:foreground ,monokai-red
                           :background ,monokai-bg
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :background ,terminal-monokai-bg
                                    :inverse-video t))))

   `(helm-buffer-size
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(helm-candidate-number
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-emph
                           :bold t))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-emph
                                    :bold t))))

   `(helm-ff-directory
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(helm-ff-executable
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(helm-ff-file
     ((,class (:background ,monokai-bg
                           :foreground ,monokai-fg))
      (,terminal-class (:background ,terminal-monokai-bg
                                    :foreground ,terminal-monokai-fg))))

   `(helm-ff-invalid-symlink
     ((,class (:background ,monokai-bg
                           :foreground ,monokai-orange
                           :slant italic))
      (,terminal-class (:background ,terminal-monokai-bg
                                    :foreground ,terminal-monokai-orange
                                    :slant italic))))

   `(helm-ff-prefix
     ((,class (:background ,monokai-green
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-green
                                    :foreground ,terminal-monokai-bg))))

   `(helm-ff-symlink
     ((,class (:foreground ,monokai-cyan))
      (,terminal-class (:foreground ,terminal-monokai-cyan))))

   `(helm-grep-file
     ((,class (:foreground ,monokai-cyan
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :underline t))))

   `(helm-grep-finish
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(helm-grep-lineno
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(helm-grep-match
     ((,class (:inherit helm-match)))
     ((,terminal-class (:inherit helm-match))))

   `(helm-grep-running
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(helm-header
     ((,class (:inherit header-line))
      (,terminal-class (:inherit terminal-header-line))))

   `(helm-lisp-completion-info
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(helm-lisp-show-completion
     ((,class (:foreground ,monokai-yellow
                           :background ,monokai-highlight-line
                           :bold t))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :background ,terminal-monokai-highlight-line
                                    :bold t))))

   `(helm-M-x-key
     ((,class (:foreground ,monokai-orange
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-orange
                                    :underline t))))

   `(helm-moccur-buffer
     ((,class (:foreground ,monokai-cyan
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :underline t))))

   `(helm-match
     ((,class (:foreground ,monokai-green :inherit bold))
      (,terminal-class (:foreground ,terminal-monokai-green :inherit bold))))

   `(helm-match-item
     ((,class (:inherit helm-match))
      (,terminal-class (:inherit helm-match))))

   `(helm-selection
     ((,class (:background ,monokai-highlight-line
                           :inherit bold
                           :underline nil))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :inherit bold
                                    :underline nil))))

   `(helm-selection-line
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-emph
                           :underline nil))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-emph
                                    :underline nil))))

   `(helm-separator
     ((,class (:foreground ,monokai-gray))
      (,terminal-class (:foreground ,terminal-monokai-gray))))

   `(helm-source-header
     ((,class (:background ,monokai-violet-l
                           :foreground ,monokai-bg
                           :underline nil))
      (,terminal-class (:background ,terminal-monokai-violet-l
                                    :foreground ,terminal-monokai-bg
                                    :underline nil))))

   `(helm-swoop-target-line-face
     ((,class (:background ,monokai-highlight-line))
      (,terminal-class (:background ,terminal-monokai-highlight-line))))

   `(helm-swoop-target-line-block-face
     ((,class (:background ,monokai-highlight-line))
      (,terminal-class (:background ,terminal-monokai-highlight-line))))

   `(helm-swoop-target-word-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(helm-time-zone-current
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(helm-time-zone-home
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(helm-visible-mark
     ((,class (:background ,monokai-bg
                           :foreground ,monokai-magenta :bold t))
      (,terminal-class (:background ,terminal-monokai-bg
                                    :foreground ,terminal-monokai-magenta :bold t))))

   ;; helm-ls-git
   `(helm-ls-git-modified-not-staged-face
     ((,class :foreground ,monokai-blue)
      (,terminal-class :foreground ,terminal-monokai-blue)))

   `(helm-ls-git-modified-and-staged-face
     ((,class :foreground ,monokai-blue-l)
      (,terminal-class :foreground ,terminal-monokai-blue-l)))

   `(helm-ls-git-renamed-modified-face
     ((,class :foreground ,monokai-blue-l)
      (,terminal-class :foreground ,terminal-monokai-blue-l)))

   `(helm-ls-git-untracked-face
     ((,class :foreground ,monokai-orange)
      (,terminal-class :foreground ,terminal-monokai-orange)))

   `(helm-ls-git-added-copied-face
     ((,class :foreground ,monokai-green)
      (,terminal-class :foreground ,terminal-monokai-green)))

   `(helm-ls-git-added-modified-face
     ((,class :foreground ,monokai-green-l)
      (,terminal-class :foreground ,terminal-monokai-green-l)))

   `(helm-ls-git-deleted-not-staged-face
     ((,class :foreground ,monokai-red)
      (,terminal-class :foreground ,terminal-monokai-red)))

   `(helm-ls-git-deleted-and-staged-face
     ((,class :foreground ,monokai-red-l)
      (,terminal-class :foreground ,terminal-monokai-red-l)))

   `(helm-ls-git-conflict-face
     ((,class :foreground ,monokai-yellow)
      (,terminal-class :foreground ,terminal-monokai-yellow)))

   ;; hi-lock-mode
   `(hi-yellow
     ((,class (:foreground ,monokai-yellow-lc
                           :background ,monokai-yellow-hc))
      (,terminal-class (:foreground ,terminal-monokai-yellow-lc
                                    :background ,terminal-monokai-yellow-hc))))

   `(hi-pink
     ((,class (:foreground ,monokai-magenta-lc
                           :background ,monokai-magenta-hc))
      (,terminal-class (:foreground ,terminal-monokai-magenta-lc
                                    :background ,terminal-monokai-magenta-hc))))

   `(hi-green
     ((,class (:foreground ,monokai-green-lc
                           :background ,monokai-green-hc))
      (,terminal-class (:foreground ,terminal-monokai-green-lc
                                    :background ,terminal-monokai-green-hc))))

   `(hi-blue
     ((,class (:foreground ,monokai-blue-lc
                           :background ,monokai-blue-hc))
      (,terminal-class (:foreground ,terminal-monokai-blue-lc
                                    :background ,terminal-monokai-blue-hc))))

   `(hi-black-b
     ((,class (:foreground ,monokai-emph
                           :background ,monokai-bg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :background ,terminal-monokai-bg
                                    :weight bold))))

   `(hi-blue-b
     ((,class (:foreground ,monokai-blue-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-blue-lc
                                    :weight bold))))

   `(hi-green-b
     ((,class (:foreground ,monokai-green-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-green-lc
                                    :weight bold))))

   `(hi-red-b
     ((,class (:foreground ,monokai-red
                           :weight bold))))

   `(hi-black-hb
     ((,class (:foreground ,monokai-emph
                           :background ,monokai-bg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :background ,terminal-monokai-bg
                                    :weight bold))))

   ;; highlight-changes
   `(highlight-changes
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(highlight-changes-delete
     ((,class (:foreground ,monokai-red
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :underline t))))

   ;; highlight-indentation
   `(highlight-indentation-face
     ((,class (:background ,monokai-gray))
      (,terminal-class (:background ,terminal-monokai-gray))))

   `(highlight-indentation-current-column-face
     ((,class (:background ,monokai-gray))
      (,terminal-class (:background ,terminal-monokai-gray))))

   ;; hl-line-mode
   `(hl-line
     ((,class (:background ,monokai-highlight-line))
      (,terminal-class (:background ,terminal-monokai-highlight-line))))

   `(hl-line-face
     ((,class (:background ,monokai-highlight-line))
      (,terminal-class (:background ,terminal-monokai-highlight-line))))

   ;; ido-mode
   `(ido-first-match
     ((,class (:foreground ,monokai-yellow
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight normal))))

   `(ido-only-match
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-yellow
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-yellow
                                    :weight normal))))

   `(ido-subdir
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(ido-incomplete-regexp
     ((,class (:foreground ,monokai-red
                           :weight bold ))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :weight bold ))))

   `(ido-indicator
     ((,class (:background ,monokai-red
                           :foreground ,monokai-bg
                           :width condensed))
      (,terminal-class (:background ,terminal-monokai-red
                                    :foreground ,terminal-monokai-bg
                                    :width condensed))))

   `(ido-virtual
     ((,class (:foreground ,monokai-cyan))
      (,terminal-class (:foreground ,terminal-monokai-cyan))))

   ;; info
   `(info-header-xref
     ((,class (:foreground ,monokai-green
                           :inherit bold
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :inherit bold
                                    :underline t))))

   `(info-menu
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(info-node
     ((,class (:foreground ,monokai-violet
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-monokai-violet
                                    :inherit bold))))

   `(info-quoted-name
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(info-reference-item
     ((,class (:background nil
                           :underline t
                           :inherit bold))
      (,terminal-class (:background nil
                                    :underline t
                                    :inherit bold))))

   `(info-string
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(info-title-1
     ((,class (:height ,monokai-height-plus-4))
      (,terminal-class (:height ,monokai-height-plus-4))))

   `(info-title-2
     ((,class (:height ,monokai-height-plus-3))
      (,terminal-class (:height ,monokai-height-plus-3))))

   `(info-title-3
     ((,class (:height ,monokai-height-plus-2))
      (,terminal-class (:height ,monokai-height-plus-2))))

   `(info-title-4
     ((,class (:height ,monokai-height-plus-1))
      (,terminal-class (:height ,monokai-height-plus-1))))

   ;; ivy
   `(ivy-current-match
     ((,class (:background ,monokai-gray :inherit bold))
      (,terminal-class (:background ,monokai-gray-l :inherit bold))))

   `(ivy-minibuffer-match-face-1
     ((,class (:inherit bold))
      (,terminal-class (:inherit bold))))

   `(ivy-minibuffer-match-face-2
     ((,class (:foreground ,monokai-violet
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-violet
                                    :underline t))))

   `(ivy-minibuffer-match-face-3
     ((,class (:foreground ,monokai-green
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :underline t))))

   `(ivy-minibuffer-match-face-4
     ((,class (:foreground ,monokai-yellow
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :underline t))))

   `(ivy-remote
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(swiper-line-face
     ((,class (:background ,monokai-highlight-line))))

   `(swiper-match-face-1
     ((,class (:background ,monokai-gray-d))))

   `(swiper-match-face-2
     ((,class (:background ,monokai-green))))

   `(swiper-match-face-3
     ((,class (:background ,monokai-orange))))

   `(swiper-match-face-4
     ((,class (:background ,monokai-magenta))))

   ;; jabber
   `(jabber-activity-face
     ((,class (:weight bold
                       :foreground ,monokai-red))
      (,terminal-class (:weight bold
                                :foreground ,terminal-monokai-red))))

   `(jabber-activity-personal-face
     ((,class (:weight bold
                       :foreground ,monokai-blue))
      (,terminal-class (:weight bold
                                :foreground ,terminal-monokai-blue))))

   `(jabber-chat-error
     ((,class (:weight bold
                       :foreground ,monokai-red))
      (,terminal-class (:weight bold
                                :foreground ,terminal-monokai-red))))

   `(jabber-chat-prompt-foreign
     ((,class (:weight bold
                       :foreground ,monokai-red))
      (,terminal-class (:weight bold
                                :foreground ,terminal-monokai-red))))

   `(jabber-chat-prompt-local
     ((,class (:weight bold
                       :foreground ,monokai-blue))
      (,terminal-class (:weight bold
                                :foreground ,terminal-monokai-blue))))

   `(jabber-chat-prompt-system
     ((,class (:weight bold
                       :foreground ,monokai-green))
      (,terminal-class (:weight bold
                                :foreground ,terminal-monokai-green))))

   `(jabber-chat-text-foreign
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(jabber-chat-text-local
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(jabber-chat-rare-time-face
     ((,class (:underline t
                          :foreground ,monokai-green))
      (,terminal-class (:underline t
                                   :foreground ,terminal-monokai-green))))

   `(jabber-roster-user-away
     ((,class (:slant italic
                      :foreground ,monokai-green))
      (,terminal-class (:slant italic
                               :foreground ,terminal-monokai-green))))

   `(jabber-roster-user-chatty
     ((,class (:weight bold
                       :foreground ,monokai-orange))
      (,terminal-class (:weight bold
                                :foreground ,terminal-monokai-orange))))

   `(jabber-roster-user-dnd
     ((,class (:slant italic
                      :foreground ,monokai-red))
      (,terminal-class (:slant italic
                               :foreground ,terminal-monokai-red))))

   `(jabber-roster-user-error
     ((,class (:weight light
                       :slant italic
                       :foreground ,monokai-red))
      (,terminal-class (:weight light
                                :slant italic
                                :foreground ,terminal-monokai-red))))

   `(jabber-roster-user-offline
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(jabber-roster-user-online
     ((,class (:weight bold
                       :foreground ,monokai-blue))
      (,terminal-class (:weight bold
                                :foreground ,terminal-monokai-blue))))

   `(jabber-roster-user-xa
     ((,class (:slant italic
                      :foreground ,monokai-magenta))
      (,terminal-class (:slant italic
                               :foreground ,terminal-monokai-magenta))))

   ;; js2-mode colors
   `(js2-error
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(js2-external-variable
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(js2-function-call
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(js2-function-param
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(js2-instance-member
     ((,class (:foreground ,monokai-violet))
      (,terminal-class (:foreground ,terminal-monokai-violet))))

   `(js2-jsdoc-html-tag-delimiter
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(js2-jsdoc-html-tag-name
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(js2-jsdoc-tag
     ((,class (:foreground ,monokai-violet))
      (,terminal-class (:foreground ,terminal-monokai-violet))))

   `(js2-jsdoc-type
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(js2-jsdoc-value
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(js2-magic-paren
     ((,class (:underline t))
      (,terminal-class (:underline t))))

   `(js2-object-property
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(js2-private-function-call
     ((,class (:foreground ,monokai-violet))
      (,terminal-class (:foreground ,terminal-monokai-violet))))

   `(js2-private-member
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(js2-warning
     ((,class (:underline ,monokai-orange))
      (,terminal-class (:underline ,terminal-monokai-orange))))

   ;; jedi
   `(jedi:highlight-function-argument
     ((,class (:inherit bold))
      (,terminal-class (:inherit bold))))

   ;; linum-mode
   `(linum
     ((,class (:foreground ,monokai-comments
                           :background ,monokai-fringe-bg))
      (,terminal-class (:foreground ,terminal-monokai-comments
                                    :background ,terminal-monokai-fringe-bg))))

   ;; lusty-explorer
   `(lusty-directory-face
     ((,class (:inherit dimonokai-red-directory))
      (,terminal-class (:inherit dimonokai-red-directory))))

   `(lusty-file-face
     ((,class nil)
      (,terminal-class nil)))

   `(lusty-match-face
     ((,class (:inherit ido-first-match))
      (,terminal-class (:inherit ido-first-match))))

   `(lusty-slash-face
     ((,class (:foreground ,monokai-cyan
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :weight bold))))

   ;; magit
   ;;
   ;; TODO: Add supports for all magit faces
   ;; https://github.com/magit/magit/search?utf8=%E2%9C%93&q=face
   ;;
   `(magit-diff-added
     ((,class (:foreground ,monokai-green
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :background ,terminal-monokai-bg))))

   `(magit-diff-added-highlight
     ((,class (:foreground ,monokai-green
                           :background ,monokai-highlight-line))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :background ,terminal-monokai-highlight-line))))

   `(magit-diff-removed
     ((,class (:foreground ,monokai-red
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :background ,terminal-monokai-bg))))

   `(magit-diff-removed-highlight
     ((,class (:foreground ,monokai-red
                           :background ,monokai-highlight-line))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :background ,terminal-monokai-highlight-line))))

   `(magit-section-title
     ((,class (:foreground ,monokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight bold))))

   `(magit-branch
     ((,class (:foreground ,monokai-orange
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-orange
                                    :weight bold))))

   `(magit-item-highlight
     ((,class (:background ,monokai-highlight-line
                           :weight unspecified))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :weight unspecified))))

   `(magit-log-author
     ((,class (:foreground ,monokai-cyan))
      (,terminal-class (:foreground ,terminal-monokai-cyan))))

   `(magit-log-graph
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(magit-log-head-label-bisect-bad
     ((,class (:background ,monokai-red-hc
                           :foreground ,monokai-red-lc
                           :box 1))
      (,terminal-class (:background ,terminal-monokai-red-hc
                                    :foreground ,terminal-monokai-red-lc
                                    :box 1))))

   `(magit-log-head-label-bisect-good
     ((,class (:background ,monokai-green-hc
                           :foreground ,monokai-green-lc
                           :box 1))
      (,terminal-class (:background ,terminal-monokai-green-hc
                                    :foreground ,terminal-monokai-green-lc
                                    :box 1))))

   `(magit-log-head-label-default
     ((,class (:background ,monokai-highlight-line
                           :box 1))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :box 1))))

   `(magit-log-head-label-local
     ((,class (:background ,monokai-blue-lc
                           :foreground ,monokai-blue-hc
                           :box 1))
      (,terminal-class (:background ,terminal-monokai-blue-lc
                                    :foreground ,terminal-monokai-blue-hc
                                    :box 1))))

   `(magit-log-head-label-patches
     ((,class (:background ,monokai-red-lc
                           :foreground ,monokai-red-hc
                           :box 1))
      (,terminal-class (:background ,terminal-monokai-red-lc
                                    :foreground ,terminal-monokai-red-hc
                                    :box 1))))

   `(magit-log-head-label-remote
     ((,class (:background ,monokai-green-lc
                           :foreground ,monokai-green-hc
                           :box 1))
      (,terminal-class (:background ,terminal-monokai-green-lc
                                    :foreground ,terminal-monokai-green-hc
                                    :box 1))))

   `(magit-log-head-label-tags
     ((,class (:background ,monokai-yellow-lc
                           :foreground ,monokai-yellow-hc
                           :box 1))
      (,terminal-class (:background ,terminal-monokai-yellow-lc
                                    :foreground ,terminal-monokai-yellow-hc
                                    :box 1))))

   `(magit-log-sha1
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   ;; man
   `(Man-overstrike
     ((,class (:foreground ,monokai-blue
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :weight bold))))

   `(Man-reverse
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(Man-underline
     ((,class (:foreground ,monokai-green :underline t))
      (,terminal-class (:foreground ,terminal-monokai-green :underline t))))

   ;; monky
   `(monky-section-title
     ((,class (:foreground ,monokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight bold))))

   `(monky-diff-add
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(monky-diff-del
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   ;; markdown-mode
   `(markdown-header-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(markdown-header-face-1
     ((,class (:inherit markdown-header-face
                        :height ,monokai-height-plus-4))
      (,terminal-class (:inherit markdown-header-face
                                 :height ,monokai-height-plus-4))))

   `(markdown-header-face-2
     ((,class (:inherit markdown-header-face
                        :height ,monokai-height-plus-3))
      (,terminal-class (:inherit markdown-header-face
                                 :height ,monokai-height-plus-3))))

   `(markdown-header-face-3
     ((,class (:inherit markdown-header-face
                        :height ,monokai-height-plus-2))
      (,terminal-class (:inherit markdown-header-face
                                 :height ,monokai-height-plus-2))))

   `(markdown-header-face-4
     ((,class (:inherit markdown-header-face
                        :height ,monokai-height-plus-1))
      (,terminal-class (:inherit markdown-header-face
                                 :height ,monokai-height-plus-1))))

   `(markdown-header-face-5
     ((,class (:inherit markdown-header-face))
      (,terminal-class (:inherit markdown-header-face))))

   `(markdown-header-face-6
     ((,class (:inherit markdown-header-face))
      (,terminal-class (:inherit markdown-header-face))))

   ;; message-mode
   `(message-cited-text
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(message-header-name
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(message-header-other
     ((,class (:foreground ,monokai-fg
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :weight normal))))

   `(message-header-to
     ((,class (:foreground ,monokai-fg
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :weight normal))))

   `(message-header-cc
     ((,class (:foreground ,monokai-fg
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :weight normal))))

   `(message-header-newsgroups
     ((,class (:foreground ,monokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight bold))))

   `(message-header-subject
     ((,class (:foreground ,monokai-cyan
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :weight normal))))

   `(message-header-xheader
     ((,class (:foreground ,monokai-cyan))
      (,terminal-class (:foreground ,terminal-monokai-cyan))))

   `(message-mml
     ((,class (:foreground ,monokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight bold))))

   `(message-separator
     ((,class (:foreground ,monokai-comments
                           :slant italic))
      (,terminal-class (:foreground ,terminal-monokai-comments
                                    :slant italic))))

   ;; mew
   `(mew-face-header-subject
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(mew-face-header-from
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(mew-face-header-date
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(mew-face-header-to
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(mew-face-header-key
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(mew-face-header-private
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(mew-face-header-important
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(mew-face-header-marginal
     ((,class (:foreground ,monokai-fg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :weight bold))))

   `(mew-face-header-warning
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(mew-face-header-xmew
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(mew-face-header-xmew-bad
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(mew-face-body-url
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(mew-face-body-comment
     ((,class (:foreground ,monokai-fg
                           :slant italic))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :slant italic))))

   `(mew-face-body-cite1
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(mew-face-body-cite2
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(mew-face-body-cite3
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(mew-face-body-cite4
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(mew-face-body-cite5
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(mew-face-mark-review
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(mew-face-mark-escape
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(mew-face-mark-delete
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(mew-face-mark-unlink
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(mew-face-mark-refile
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(mew-face-mark-unread
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(mew-face-eof-message
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(mew-face-eof-part
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   ;; mingus
   `(mingus-directory-face
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(mingus-pausing-face
     ((,class (:foreground ,monokai-magenta))
      (,terminal-class (:foreground ,terminal-monokai-magenta))))

   `(mingus-playing-face
     ((,class (:foreground ,monokai-cyan))
      (,terminal-class (:foreground ,terminal-monokai-cyan))))

   `(mingus-playlist-face
     ((,class (:foreground ,monokai-cyan ))
      (,terminal-class (:foreground ,terminal-monokai-cyan ))))

   `(mingus-song-file-face
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(mingus-stopped-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   ;; mmm
   `(mmm-init-submode-face
     ((,class (:background ,monokai-violet-d))
      (,terminal-class (:background ,terminal-monokai-violet-d))))

   `(mmm-cleanup-submode-face
     ((,class (:background ,monokai-orange-d))
      (,terminal-class (:background ,terminal-monokai-orange-d))))

   `(mmm-declaration-submode-face
     ((,class (:background ,monokai-cyan-d))
      (,terminal-class (:background ,terminal-monokai-cyan-d))))

   `(mmm-comment-submode-face
     ((,class (:background ,monokai-blue-d))
      (,terminal-class (:background ,terminal-monokai-blue-d))))

   `(mmm-output-submode-face
     ((,class (:background ,monokai-red-d))
      (,terminal-class (:background ,terminal-monokai-red-d))))

   `(mmm-special-submode-face
     ((,class (:background ,monokai-green-d))
      (,terminal-class (:background ,terminal-monokai-green-d))))

   `(mmm-code-submode-face
     ((,class (:background ,monokai-gray))
      (,terminal-class (:background ,terminal-monokai-gray))))

   `(mmm-default-submode-face
     ((,class (:background ,monokai-gray-d))
      (,terminal-class (:background ,terminal-monokai-gray-d))))

   ;; moccur
   `(moccur-current-line-face
     ((,class (:underline t))
      (,terminal-class (:underline t))))

   `(moccur-edit-done-face
     ((,class (:foreground ,monokai-comments
                           :background ,monokai-bg
                           :slant italic))
      (,terminal-class (:foreground ,terminal-monokai-comments
                                    :background ,terminal-monokai-bg
                                    :slant italic))))

   `(moccur-edit-face
     ((,class (:background ,monokai-yellow
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-yellow
                                    :foreground ,terminal-monokai-bg))))

   `(moccur-edit-file-face
     ((,class (:background ,monokai-highlight-line))
      (,terminal-class (:background ,terminal-monokai-highlight-line))))

   `(moccur-edit-reject-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(moccur-face
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-emph
                           :weight bold))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-emph
                                    :weight bold))))

   `(search-buffers-face
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-emph
                           :weight bold))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-emph
                                    :weight bold))))

   `(search-buffers-header-face
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-yellow
                           :weight bold))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-yellow
                                    :weight bold))))

   ;; mu4e
   `(mu4e-cited-1-face
     ((,class (:foreground ,monokai-green
                           :slant italic
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :slant italic
                                    :weight normal))))

   `(mu4e-cited-2-face
     ((,class (:foreground ,monokai-blue
                           :slant italic
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :slant italic
                                    :weight normal))))

   `(mu4e-cited-3-face
     ((,class (:foreground ,monokai-orange
                           :slant italic
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-orange
                                    :slant italic
                                    :weight normal))))

   `(mu4e-cited-4-face
     ((,class (:foreground ,monokai-yellow
                           :slant italic
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :slant italic
                                    :weight normal))))

   `(mu4e-cited-5-face
     ((,class (:foreground ,monokai-cyan
                           :slant italic
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :slant italic
                                    :weight normal))))

   `(mu4e-cited-6-face
     ((,class (:foreground ,monokai-green
                           :slant italic
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :slant italic
                                    :weight normal))))

   `(mu4e-cited-7-face
     ((,class (:foreground ,monokai-blue
                           :slant italic
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :slant italic
                                    :weight normal))))

   `(mu4e-flagged-face
     ((,class (:foreground ,monokai-magenta
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-magenta
                                    :weight bold))))

   `(mu4e-view-url-number-face
     ((,class (:foreground ,monokai-yellow
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight normal))))

   `(mu4e-warning-face
     ((,class (:foreground ,monokai-red
                           :slant normal
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :slant normal
                                    :weight bold))))

   `(mu4e-header-highlight-face
     ((,class (:inherit unspecified
                        :foreground unspecified
                        :background ,monokai-highlight-line
                        :underline ,monokai-emph
                        :weight normal))
      (,terminal-class (:inherit unspecified
                                 :foreground unspecified
                                 :background ,terminal-monokai-highlight-line
                                 :underline ,terminal-monokai-emph
                                 :weight normal))))


   `(mu4e-draft-face
     ((,class (:inherit font-lock-string-face))
      (,terminal-class (:inherit font-lock-string-face))))

   `(mu4e-footer-face
     ((,class (:inherit font-lock-comment-face))
      (,terminal-class (:inherit font-lock-comment-face))))

   `(mu4e-forwarded-face
     ((,class (:inherit font-lock-builtin-face
                        :weight normal))
      (,terminal-class (:inherit font-lock-builtin-face
                                 :weight normal))))

   `(mu4e-header-face
     ((,class (:inherit default))
      (,terminal-class (:inherit default))))

   `(mu4e-header-marks-face
     ((,class (:inherit font-lock-preprocessor-face))
      (,terminal-class (:inherit font-lock-preprocessor-face))))

   `(mu4e-header-title-face
     ((,class (:inherit font-lock-type-face))
      (,terminal-class (:inherit font-lock-type-face))))

   `(mu4e-highlight-face
     ((,class (:inherit font-lock-pseudo-keyword-face
                        :weight bold))
      (,terminal-class (:inherit font-lock-pseudo-keyword-face
                                 :weight bold))))

   `(mu4e-moved-face
     ((,class (:inherit font-lock-comment-face
                        :slant italic))
      (,terminal-class (:inherit font-lock-comment-face
                                 :slant italic))))

   `(mu4e-ok-face
     ((,class (:inherit font-lock-comment-face
                        :slant normal
                        :weight bold))
      (,terminal-class (:inherit font-lock-comment-face
                                 :slant normal
                                 :weight bold))))

   `(mu4e-replied-face
     ((,class (:inherit font-lock-builtin-face
                        :weight normal))
      (,terminal-class (:inherit font-lock-builtin-face
                                 :weight normal))))

   `(mu4e-system-face
     ((,class (:inherit font-lock-comment-face
                        :slant italic))
      (,terminal-class (:inherit font-lock-comment-face
                                 :slant italic))))

   `(mu4e-title-face
     ((,class (:inherit font-lock-type-face
                        :weight bold))
      (,terminal-class (:inherit font-lock-type-face
                                 :weight bold))))

   `(mu4e-trashed-face
     ((,class (:inherit font-lock-comment-face
                        :strike-through t))
      (,terminal-class (:inherit font-lock-comment-face
                                 :strike-through t))))

   `(mu4e-unread-face
     ((,class (:inherit font-lock-keyword-face
                        :weight bold))
      (,terminal-class (:inherit font-lock-keyword-face
                                 :weight bold))))

   `(mu4e-view-attach-number-face
     ((,class (:inherit font-lock-variable-name-face
                        :weight bold))
      (,terminal-class (:inherit font-lock-variable-name-face
                                 :weight bold))))

   `(mu4e-view-contact-face
     ((,class (:foreground ,monokai-fg
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :weight normal))))

   `(mu4e-view-header-key-face
     ((,class (:inherit message-header-name
                        :weight normal))
      (,terminal-class (:inherit message-header-name
                                 :weight normal))))

   `(mu4e-view-header-value-face
     ((,class (:foreground ,monokai-cyan
                           :weight normal
                           :slant normal))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :weight normal
                                    :slant normal))))

   `(mu4e-view-link-face
     ((,class (:inherit link))
      (,terminal-class (:inherit link))))

   `(mu4e-view-special-header-value-face
     ((,class (:foreground ,monokai-blue
                           :weight normal
                           :underline nil))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :weight normal
                                    :underline nil))))

   ;; mumamo
   `(mumamo-background-chunk-submode1
     ((,class (:background ,monokai-highlight-line))
      (,terminal-class (:background ,terminal-monokai-highlight-line))))

   ;; nav
   `(nav-face-heading
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(nav-face-button-num
     ((,class (:foreground ,monokai-cyan))
      (,terminal-class (:foreground ,terminal-monokai-cyan))))

   `(nav-face-dir
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(nav-face-hdir
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(nav-face-file
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(nav-face-hfile
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   ;; nav-flash
   `(nav-flash-face
     ((,class (:background ,monokai-highlight-line))
      (,terminal-class (:background ,terminal-monokai-highlight-line))))

   ;; neo-tree
   `(neo-banner-face
     ((,class (:foreground ,monokai-blue
                           :background ,monokai-bg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :background ,terminal-monokai-bg
                                    :weight bold))))


   `(neo-header-face
     ((,class (:foreground ,monokai-emph
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :background ,terminal-monokai-bg))))

   `(neo-root-dir-face
     ((,class (:foreground ,monokai-green
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :background ,terminal-monokai-bg))))

   `(neo-dir-link-face
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :background ,terminal-monokai-bg))))

   `(neo-file-link-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(neo-button-face
     ((,class (:underline nil))
      (,terminal-class (:underline nil))))

   `(neo-expand-btn-face
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(neo-vc-default-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(neo-vc-user-face
     ((,class (:foreground ,monokai-red
                           :slant italic))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :slant italic))))

   `(neo-vc-up-to-date-face
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(neo-vc-edited-face
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(neo-vc-needs-update-face
     ((,class (:underline t))
      (,terminal-class (:underline t))))

   `(neo-vc-needs-merge-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(neo-vc-unlocked-changes-face
     ((,class (:foreground ,monokai-red
                           :background ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :background ,terminal-monokai-comments))))

   `(neo-vc-added-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(neo-vc-removed-face
     ((,class (:strike-through t))
      (,terminal-class (:strike-through t))))

   `(neo-vc-conflict-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(neo-vc-missing-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(neo-vc-ignored-face
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))


   ;; org-mode
   `(org-agenda-structure
     ((,class (:foreground ,monokai-emph
                           :background ,monokai-highlight-line
                           :weight bold
                           :slant normal
                           :inverse-video nil
                           :height ,monokai-height-plus-1
                           :underline nil
                           :box (:line-width 2 :color ,monokai-bg)))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :background ,terminal-monokai-highlight-line
                                    :weight bold
                                    :slant normal
                                    :inverse-video nil
                                    :height ,monokai-height-plus-1
                                    :underline nil
                                    :box (:line-width 2 :color ,terminal-monokai-bg)))))

   `(org-agenda-calendar-event
     ((,class (:foreground ,monokai-emph))
      (,terminal-class (:foreground ,terminal-monokai-emph))))

   `(org-agenda-calendar-sexp
     ((,class (:foreground ,monokai-fg
                           :slant italic))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :slant italic))))

   `(org-agenda-date
     ((,class (:foreground ,monokai-comments
                           :background ,monokai-bg
                           :weight normal
                           :inverse-video nil
                           :overline nil
                           :slant normal
                           :height 1.0
                           :box (:line-width 2 :color ,monokai-bg)))
      (,terminal-class (:foreground ,terminal-monokai-comments
                                    :background ,terminal-monokai-bg
                                    :weight normal
                                    :inverse-video nil
                                    :overline nil
                                    :slant normal
                                    :height 1.0
                                    :box (:line-width 2 :color ,terminal-monokai-bg)))) t)

   `(org-agenda-date-weekend
     ((,class (:inherit org-agenda-date
                        :inverse-video nil
                        :background unspecified
                        :foreground ,monokai-comments
                        :weight unspecified
                        :underline t
                        :overline nil
                        :box unspecified))
      (,terminal-class (:inherit org-agenda-date
                                 :inverse-video nil
                                 :background unspecified
                                 :foreground ,terminal-monokai-comments
                                 :weight unspecified
                                 :underline t
                                 :overline nil
                                 :box unspecified))) t)

   `(org-agenda-date-today
     ((,class (:inherit org-agenda-date
                        :inverse-video t
                        :weight bold
                        :underline unspecified
                        :overline nil
                        :box unspecified
                        :foreground ,monokai-blue
                        :background ,monokai-bg))
      (,terminal-class (:inherit org-agenda-date
                                 :inverse-video t
                                 :weight bold
                                 :underline unspecified
                                 :overline nil
                                 :box unspecified
                                 :foreground ,terminal-monokai-blue
                                 :background ,terminal-monokai-bg))) t)

   `(org-agenda-done
     ((,class (:foreground ,monokai-comments
                           :slant italic))
      (,terminal-class (:foreground ,terminal-monokai-comments
                                    :slant italic))) t)

   `(org-archived
     ((,class (:foreground ,monokai-comments
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-comments
                                    :weight normal))))

   `(org-block
     ((,class (:foreground ,monokai-emph
                           :background ,monokai-gray))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :background ,terminal-monokai-gray))))

   `(org-block-background
     ((,class (:background ,monokai-gray))
      (,terminal-class (:background ,terminal-monokai-gray))))

   `(org-block-begin-line
     ((,class (:foreground ,monokai-comments
                           :background ,monokai-gray-d
                           :slant italic))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :background ,terminal-monokai-gray-d
                                    :slant italic))))

   `(org-block-end-line
     ((,class (:foreground ,monokai-comments
                           :background ,monokai-gray-d
                           :slant italic))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :background ,terminal-monokai-gray-d
                                    :slant italic))))

   `(org-checkbox
     ((,class (:background ,monokai-bg
                           :foreground ,monokai-fg
                           :box (:line-width 1 :style released-button)))
      (,terminal-class (:background ,terminal-monokai-bg
                                    :foreground ,terminal-monokai-fg
                                    :box (:line-width 1 :style released-button)))))

   `(org-code
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(org-date
     ((,class (:foreground ,monokai-blue
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :underline t))))

   `(org-done
     ((,class (:weight bold
                       :foreground ,monokai-green))
      (,terminal-class (:weight bold
                                :foreground ,terminal-monokai-green))))

   `(org-ellipsis
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(org-formula
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(org-headline-done
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(org-hide
     ((,class (:foreground ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-bg))))

   `(org-level-1
     ((,class (:inherit ,monokai-pitch
                        :height ,monokai-height-plus-4
                        :foreground ,monokai-orange))
      (,terminal-class (:inherit ,monokai-pitch
                                 :height ,monokai-height-plus-4
                                 :foreground ,terminal-monokai-orange))))

   `(org-level-2
     ((,class (:inherit ,monokai-pitch
                        :height ,monokai-height-plus-3
                        :foreground ,monokai-green))
      (,terminal-class (:inherit ,monokai-pitch
                                 :height ,monokai-height-plus-3
                                 :foreground ,terminal-monokai-green))))

   `(org-level-3
     ((,class (:inherit ,monokai-pitch
                        :height ,monokai-height-plus-2
                        :foreground ,monokai-blue))
      (,terminal-class (:inherit ,monokai-pitch
                                 :height ,monokai-height-plus-2
                                 :foreground ,terminal-monokai-blue))))

   `(org-level-4
     ((,class (:inherit ,monokai-pitch
                        :height ,monokai-height-plus-1
                        :foreground ,monokai-yellow))
      (,terminal-class (:inherit ,monokai-pitch
                                 :height ,monokai-height-plus-1
                                 :foreground ,terminal-monokai-yellow))))

   `(org-level-5
     ((,class (:inherit ,monokai-pitch
                        :foreground ,monokai-cyan))
      (,terminal-class (:inherit ,monokai-pitch
                                 :foreground ,terminal-monokai-cyan))))

   `(org-level-6
     ((,class (:inherit ,monokai-pitch
                        :foreground ,monokai-green))
      (,terminal-class (:inherit ,monokai-pitch
                                 :foreground ,terminal-monokai-green))))

   `(org-level-7
     ((,class (:inherit ,monokai-pitch
                        :foreground ,monokai-red))
      (,terminal-class (:inherit ,monokai-pitch
                                 :foreground ,terminal-monokai-red))))

   `(org-level-8
     ((,class (:inherit ,monokai-pitch
                        :foreground ,monokai-blue))
      (,terminal-class (:inherit ,monokai-pitch
                                 :foreground ,terminal-monokai-blue))))

   `(org-link
     ((,class (:foreground ,monokai-blue
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :underline t))))

   `(org-sexp-date
     ((,class (:foreground ,monokai-violet))
      (,terminal-class (:foreground ,terminal-monokai-violet))))

   `(org-scheduled
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(org-scheduled-previously
     ((,class (:foreground ,monokai-cyan))
      (,terminal-class (:foreground ,terminal-monokai-cyan))))

   `(org-scheduled-today
     ((,class (:foreground ,monokai-blue
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :weight normal))))

   `(org-special-keyword
     ((,class (:foreground ,monokai-comments
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-comments
                                    :weight bold))))

   `(org-table
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(org-tag
     ((,class (:weight bold))
      (,terminal-class (:weight bold))))

   `(org-time-grid
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(org-todo
     ((,class (:foreground ,monokai-red
                           :weight bold)))
     ((,terminal-class (:foreground ,terminal-monokai-red
                                    :weight bold))))

   `(org-upcoming-deadline
     ((,class (:foreground ,monokai-yellow
                           :weight normal
                           :underline nil))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight normal
                                    :underline nil))))

   `(org-warning
     ((,class (:foreground ,monokai-orange
                           :weight normal
                           :underline nil))
      (,terminal-class (:foreground ,terminal-monokai-orange
                                    :weight normal
                                    :underline nil))))

   ;; org-habit (clear=blue, ready=green, alert=yellow, overdue=red. future=lower contrast)
   `(org-habit-clear-face
     ((,class (:background ,monokai-blue-lc
                           :foreground ,monokai-blue-hc))
      (,terminal-class (:background ,terminal-monokai-blue-lc
                                    :foreground ,terminal-monokai-blue-hc))))

   `(org-habit-clear-future-face
     ((,class (:background ,monokai-blue-lc))
      (,terminal-class (:background ,terminal-monokai-blue-lc))))

   `(org-habit-ready-face
     ((,class (:background ,monokai-green-lc
                           :foreground ,monokai-green))
      (,terminal-class (:background ,terminal-monokai-green-lc
                                    :foreground ,terminal-monokai-green))))

   `(org-habit-ready-future-face
     ((,class (:background ,monokai-green-lc))
      (,terminal-class (:background ,terminal-monokai-green-lc))))

   `(org-habit-alert-face
     ((,class (:background ,monokai-yellow
                           :foreground ,monokai-yellow-lc))
      (,terminal-class (:background ,terminal-monokai-yellow
                                    :foreground ,terminal-monokai-yellow-lc))))

   `(org-habit-alert-future-face
     ((,class (:background ,monokai-yellow-lc))
      (,terminal-class (:background ,terminal-monokai-yellow-lc))))

   `(org-habit-overdue-face
     ((,class (:background ,monokai-red
                           :foreground ,monokai-red-lc))
      (,terminal-class (:background ,terminal-monokai-red
                                    :foreground ,terminal-monokai-red-lc))))

   `(org-habit-overdue-future-face
     ((,class (:background ,monokai-red-lc))
      (,terminal-class (:background ,terminal-monokai-red-lc))))

   ;; latest additions
   `(org-agenda-dimmed-todo-face
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(org-agenda-restriction-lock
     ((,class (:background ,monokai-yellow))
      (,terminal-class (:background ,terminal-monokai-yellow))))

   `(org-clock-overlay
     ((,class (:background ,monokai-yellow))
      (,terminal-class (:background ,terminal-monokai-yellow))))

   `(org-column
     ((,class (:background ,monokai-highlight-line
                           :strike-through nil
                           :underline nil
                           :slant normal
                           :weight normal
                           :inherit default))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :strike-through nil
                                    :underline nil
                                    :slant normal
                                    :weight normal
                                    :inherit default))))

   `(org-column-title
     ((,class (:background ,monokai-highlight-line
                           :underline t
                           :weight bold))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :underline t
                                    :weight bold))))

   `(org-date-selected
     ((,class (:foreground ,monokai-red
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :inverse-video t))))

   `(org-document-info
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(org-document-title
     ((,class (:foreground ,monokai-emph
                           :weight bold
                           :height ,monokai-height-plus-4))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :weight bold
                                    :height ,monokai-height-plus-4))))

   `(org-drawer
     ((,class (:foreground ,monokai-cyan))
      (,terminal-class (:foreground ,terminal-monokai-cyan))))

   `(org-footnote
     ((,class (:foreground ,monokai-magenta
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-magenta
                                    :underline t))))

   `(org-latex-and-export-specials
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(org-mode-line-clock-overrun
     ((,class (:inherit mode-line))
      (,terminal-class (:inherit mode-line))))

   ;; outline
   `(outline-1
     ((,class (:inherit org-level-1))
      (,terminal-class (:inherit org-level-1))))

   `(outline-2
     ((,class (:inherit org-level-2))
      (,terminal-class (:inherit org-level-2))))

   `(outline-3
     ((,class (:inherit org-level-3))
      (,terminal-class (:inherit org-level-3))))

   `(outline-4
     ((,class (:inherit org-level-4))
      (,terminal-class (:inherit org-level-4))))

   `(outline-5
     ((,class (:inherit org-level-5))
      (,terminal-class (:inherit org-level-5))))

   `(outline-6
     ((,class (:inherit org-level-6))
      (,terminal-class (:inherit org-level-6))))

   `(outline-7
     ((,class (:inherit org-level-7))
      (,terminal-class (:inherit org-level-7))))

   `(outline-8
     ((,class (:inherit org-level-8))
      (,terminal-class (:inherit org-level-8))))

   ;; parenface
   `(paren-face
     ((,terminal-class (:foreground ,monokai-comments))))

   ;; perspective
   `(persp-selected-face
     ((,class (:foreground ,monokai-blue
                           :weight bold))))

   ;; pretty-mode
   `(pretty-mode-symbol-face
     ((,class (:foreground ,monokai-yellow
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight normal))))

   ;; popup
   `(popup-face
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-fg))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-fg))))

   `(popup-isearch-match
     ((,class (:background ,monokai-green))
      (,terminal-class (:background ,terminal-monokai-green))))

   `(popup-menu-face
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-fg))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-fg))))

   `(popup-menu-mouse-face
     ((,class (:background ,monokai-blue
                           :foreground ,monokai-fg))
      (,terminal-class (:background ,terminal-monokai-blue
                                    :foreground ,terminal-monokai-fg))))

   `(popup-menu-selection-face
     ((,class (:background ,monokai-magenta
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-magenta
                                    :foreground ,terminal-monokai-bg))))

   `(popup-scroll-bar-background-face
     ((,class (:background ,monokai-comments))
      (,terminal-class (:background ,terminal-monokai-comments))))

   `(popup-scroll-bar-foreground-face
     ((,class (:background ,monokai-emph))
      (,terminal-class (:background ,terminal-monokai-emph))))

   `(popup-tip-face
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-fg))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-fg))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face
     ((,class (:foreground ,monokai-violet))
      (,terminal-class (:foreground ,terminal-monokai-violet))))

   `(rainbow-delimiters-depth-2-face
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(rainbow-delimiters-depth-3-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(rainbow-delimiters-depth-4-face
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(rainbow-delimiters-depth-5-face
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(rainbow-delimiters-depth-6-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(rainbow-delimiters-depth-7-face
     ((,class (:foreground ,monokai-violet))
      (,terminal-class (:foreground ,terminal-monokai-violet))))

   `(rainbow-delimiters-depth-8-face
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(rainbow-delimiters-depth-9-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(rainbow-delimiters-depth-10-face
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(rainbow-delimiters-depth-11-face
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(rainbow-delimiters-depth-12-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(rainbow-delimiters-unmatched-face
     ((,class (:foreground ,monokai-fg
                           :background ,monokai-bg
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :background ,terminal-monokai-bg
                                    :inverse-video t))))

   ;; rhtm-mode
   `(erb-face
     ((,class (:foreground ,monokai-emph
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :background ,terminal-monokai-bg))))

   `(erb-delim-face
     ((,class (:foreground ,monokai-cyan
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :background ,terminal-monokai-bg))))

   `(erb-exec-face
     ((,class (:foreground ,monokai-emph
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :background ,terminal-monokai-bg))))

   `(erb-exec-delim-face
     ((,class (:foreground ,monokai-cyan
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :background ,terminal-monokai-bg))))

   `(erb-out-face
     ((,class (:foreground ,monokai-emph
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :background ,terminal-monokai-bg))))

   `(erb-out-delim-face
     ((,class (:foreground ,monokai-cyan
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :background ,terminal-monokai-bg))))

   `(erb-comment-face
     ((,class (:foreground ,monokai-emph
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :background ,terminal-monokai-bg))))

   `(erb-comment-delim-face
     ((,class (:foreground ,monokai-cyan
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :background ,terminal-monokai-bg))))

   ;; rst-mode
   `(rst-level-1-face
     ((,class (:background ,monokai-yellow
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-yellow
                                    :foreground ,terminal-monokai-bg))))

   `(rst-level-2-face
     ((,class (:background ,monokai-cyan
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-cyan
                                    :foreground ,terminal-monokai-bg))))

   `(rst-level-3-face
     ((,class (:background ,monokai-blue
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-blue
                                    :foreground ,terminal-monokai-bg))))

   `(rst-level-4-face
     ((,class (:background ,monokai-violet
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-violet
                                    :foreground ,terminal-monokai-bg))))

   `(rst-level-5-face
     ((,class (:background ,monokai-magenta
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-magenta
                                    :foreground ,terminal-monokai-bg))))

   `(rst-level-6-face
     ((,class (:background ,monokai-red
                           :foreground ,monokai-bg))
      (,terminal-class (:background ,terminal-monokai-red
                                    :foreground ,terminal-monokai-bg))))

   ;; rpm-mode
   `(rpm-spec-dir-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(rpm-spec-doc-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(rpm-spec-ghost-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(rpm-spec-macro-face
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(rpm-spec-obsolete-tag-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(rpm-spec-package-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(rpm-spec-section-face
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(rpm-spec-tag-face
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(rpm-spec-var-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   ;; sh-mode
   `(sh-quoted-exec
     ((,class (:foreground ,monokai-violet
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-violet
                                    :weight bold))))

   `(sh-escaped-newline
     ((,class (:foreground ,monokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight bold))))

   `(sh-heredoc
     ((,class (:foreground ,monokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight bold))))

   ;; smartparens
   `(sp-pair-overlay-face
     ((,class (:background ,monokai-highlight-line))
      (,terminal-class (:background ,terminal-monokai-highlight-line))))

   `(sp-wrap-overlay-face
     ((,class (:background ,monokai-highlight-line))
      (,terminal-class (:background ,terminal-monokai-highlight-line))))

   `(sp-wrap-tag-overlay-face
     ((,class (:background ,monokai-highlight-line))
      (,terminal-class (:background ,terminal-monokai-highlight-line))))

   `(sp-show-pair-enclosing
     ((,class (:inherit highlight))
      (,terminal-class (:inherit highlight))))

   `(sp-show-pair-match-face
     ((,class (:foreground ,monokai-green
                           :background ,monokai-bg
                           :weight normal
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :background ,terminal-monokai-bg
                                    :weight normal
                                    :inverse-video t))))

   `(sp-show-pair-mismatch-face
     ((,class (:foreground ,monokai-red
                           :background ,monokai-bg
                           :weight normal
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :background ,terminal-monokai-bg
                                    :weight normal
                                    :inverse-video t))))

   ;; show-paren
   `(show-paren-match
     ((,class (:foreground ,monokai-green
                           :background ,monokai-bg
                           :weight normal
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :background ,terminal-monokai-bg
                                    :weight normal
                                    :inverse-video t))))

   `(show-paren-mismatch
     ((,class (:foreground ,monokai-red
                           :background ,monokai-bg
                           :weight normal
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :background ,terminal-monokai-bg
                                    :weight normal
                                    :inverse-video t))))

   ;; mic-paren
   `(paren-face-match
     ((,class (:foreground ,monokai-green
                           :background ,monokai-bg
                           :weight normal
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :background ,terminal-monokai-bg
                                    :weight normal
                                    :inverse-video t))))

   `(paren-face-mismatch
     ((,class (:foreground ,monokai-red
                           :background ,monokai-bg
                           :weight normal
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :background ,terminal-monokai-bg
                                    :weight normal
                                    :inverse-video t))))

   `(paren-face-no-match
     ((,class (:foreground ,monokai-red
                           :background ,monokai-bg
                           :weight normal
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :background ,terminal-monokai-bg
                                    :weight normal
                                    :inverse-video t))))

   ;; SLIME
   `(slime-repl-inputed-output-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   ;; speedbar
   `(speedbar-button-face
     ((,class (:inherit ,monokai-pitch
                        :foreground ,monokai-comments))
      (,terminal-class (:inherit ,monokai-pitch
                                 :foreground ,terminal-monokai-comments))))

   `(speedbar-directory-face
     ((,class (:inherit ,monokai-pitch
                        :foreground ,monokai-blue))
      (,terminal-class (:inherit ,monokai-pitch
                                 :foreground ,terminal-monokai-blue))))

   `(speedbar-file-face
     ((,class (:inherit ,monokai-pitch
                        :foreground ,monokai-fg))
      (,terminal-class (:inherit ,monokai-pitch
                                 :foreground ,terminal-monokai-fg))))

   `(speedbar-highlight-face
     ((,class (:inherit ,monokai-pitch
                        :background ,monokai-highlight-line))
      (,terminal-class (:inherit ,monokai-pitch
                                 :background ,terminal-monokai-highlight-line))))

   `(speedbar-selected-face
     ((,class (:inherit ,monokai-pitch
                        :foreground ,monokai-yellow
                        :underline t))
      (,terminal-class (:inherit ,monokai-pitch
                                 :foreground ,terminal-monokai-yellow
                                 :underline t))))

   `(speedbar-separator-face
     ((,class (:inherit ,monokai-pitch
                        :background ,monokai-blue
                        :foreground ,monokai-bg
                        :overline ,monokai-cyan-lc))
      (,terminal-class (:inherit ,monokai-pitch
                                 :background ,terminal-monokai-blue
                                 :foreground ,terminal-monokai-bg
                                 :overline ,terminal-monokai-cyan-lc))))

   `(speedbar-tag-face
     ((,class (:inherit ,monokai-pitch
                        :foreground ,monokai-green))
      (,terminal-class (:inherit ,monokai-pitch
                                 :foreground ,terminal-monokai-green))))

   ;; sunrise commander headings
   `(sr-active-path-face
     ((,class (:background ,monokai-blue
                           :foreground ,monokai-bg
                           :height ,monokai-height-plus-1
                           :weight bold))
      (,terminal-class (:background ,terminal-monokai-blue
                                    :foreground ,terminal-monokai-bg
                                    :height ,monokai-height-plus-1
                                    :weight bold))))

   `(sr-editing-path-face
     ((,class (:background ,monokai-yellow
                           :foreground ,monokai-bg
                           :weight bold
                           :height ,monokai-height-plus-1))
      (,terminal-class (:background ,terminal-monokai-yellow
                                    :foreground ,terminal-monokai-bg
                                    :weight bold
                                    :height ,monokai-height-plus-1))))

   `(sr-highlight-path-face
     ((,class (:background ,monokai-green
                           :foreground ,monokai-bg
                           :weight bold
                           :height ,monokai-height-plus-1))
      (,terminal-class (:background ,terminal-monokai-green
                                    :foreground ,terminal-monokai-bg
                                    :weight bold
                                    :height ,monokai-height-plus-1))))

   `(sr-passive-path-face
     ((,class (:background ,monokai-comments
                           :foreground ,monokai-bg
                           :weight bold
                           :height ,monokai-height-plus-1))
      (,terminal-class (:background ,terminal-monokai-comments
                                    :foreground ,terminal-monokai-bg
                                    :weight bold
                                    :height ,monokai-height-plus-1))))

   ;; sunrise commander marked
   `(sr-marked-dir-face
     ((,class (:inherit dimonokai-red-marked))
      (,terminal-class (:inherit dimonokai-red-marked))))

   `(sr-marked-file-face
     ((,class (:inherit dimonokai-red-marked))
      (,terminal-class (:inherit dimonokai-red-marked))))

   `(sr-alt-marked-dir-face
     ((,class (:background ,monokai-magenta
                           :foreground ,monokai-bg
                           :weight bold))
      (,terminal-class (:background ,terminal-monokai-magenta
                                    :foreground ,terminal-monokai-bg
                                    :weight bold))))

   `(sr-alt-marked-file-face
     ((,class (:background ,monokai-magenta
                           :foreground ,monokai-bg
                           :weight bold))
      (,terminal-class (:background ,terminal-monokai-magenta
                                    :foreground ,terminal-monokai-bg
                                    :weight bold))))

   ;; sunrise commander fstat
   `(sr-directory-face
     ((,class (:inherit dimonokai-red-directory
                        :weight normal))
      (,terminal-class (:inherit dimonokai-red-directory
                                 :weight normal))))

   `(sr-symlink-directory-face
     ((,class (:inherit dimonokai-red-directory
                        :slant italic
                        :weight normal))
      (,terminal-class (:inherit dimonokai-red-directory
                                 :slant italic
                                 :weight normal))))

   `(sr-symlink-face
     ((,class (:inherit dimonokai-red-symlink
                        :slant italic
                        :weight normal))
      (,terminal-class (:inherit dimonokai-red-symlink
                                 :slant italic
                                 :weight normal))))

   `(sr-broken-link-face
     ((,class (:inherit dimonokai-red-warning
                        :slant italic
                        :weight normal))
      (,terminal-class (:inherit dimonokai-red-warning
                                 :slant italic
                                 :weight normal))))

   ;; sunrise commander file types
   `(sr-compressed-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(sr-encrypted-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(sr-log-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(sr-packaged-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(sr-html-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(sr-xml-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   ;; sunrise commander misc
   `(sr-clex-hotchar-face
     ((,class (:background ,monokai-red
                           :foreground ,monokai-bg
                           :weight bold))
      (,terminal-class (:background ,terminal-monokai-red
                                    :foreground ,terminal-monokai-bg
                                    :weight bold))))

   ;; syslog-mode
   `(syslog-ip-face
     ((,class (:background unspecified
                           :foreground ,monokai-yellow))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-yellow))))

   `(syslog-hour-face
     ((,class (:background unspecified
                           :foreground ,monokai-green))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-green))))

   `(syslog-error-face
     ((,class (:background unspecified
                           :foreground ,monokai-red
                           :weight bold))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-red
                                    :weight bold))))

   `(syslog-warn-face
     ((,class (:background unspecified
                           :foreground ,monokai-orange
                           :weight bold))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-orange
                                    :weight bold))))

   `(syslog-info-face
     ((,class (:background unspecified
                           :foreground ,monokai-blue
                           :weight bold))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-blue
                                    :weight bold))))

   `(syslog-debug-face
     ((,class (:background unspecified
                           :foreground ,monokai-cyan
                           :weight bold))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-cyan
                                    :weight bold))))

   `(syslog-su-face
     ((,class (:background unspecified
                           :foreground ,monokai-magenta))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-magenta))))

   ;; table
   `(table-cell
     ((,class (:foreground ,monokai-fg
                           :background ,monokai-highlight-line))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :background ,terminal-monokai-highlight-line))))

   ;; term
   `(term-color-black
     ((,class (:foreground ,monokai-bg
                           :background ,monokai-highlight-line))
      (,terminal-class (:foreground ,terminal-monokai-bg
                                    :background ,terminal-monokai-highlight-line))))

   `(term-color-red
     ((,class (:foreground ,monokai-red
                           :background ,monokai-red-d))
      (,terminal-class (:foreground ,terminal-monokai-red
                                    :background ,terminal-monokai-red-d))))

   `(term-color-green
     ((,class (:foreground ,monokai-green
                           :background ,monokai-green-d))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :background ,terminal-monokai-green-d))))

   `(term-color-yellow
     ((,class (:foreground ,monokai-yellow
                           :background ,monokai-yellow-d))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :background ,terminal-monokai-yellow-d))))

   `(term-color-blue
     ((,class (:foreground ,monokai-blue
                           :background ,monokai-blue-d))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :background ,terminal-monokai-blue-d))))

   `(term-color-magenta
     ((,class (:foreground ,monokai-magenta
                           :background ,monokai-magenta-d))
      (,terminal-class (:foreground ,terminal-monokai-magenta
                                    :background ,terminal-monokai-magenta-d))))

   `(term-color-cyan
     ((,class (:foreground ,monokai-cyan
                           :background ,monokai-cyan-d))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :background ,terminal-monokai-cyan-d))))

   `(term-color-white
     ((,class (:foreground ,monokai-emph
                           :background ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :background ,terminal-monokai-fg))))

   `(term-default-fg-color
     ((,class (:inherit term-color-white))
      (,terminal-class (:inherit term-color-white))))

   `(term-default-bg-color
     ((,class (:inherit term-color-black))
      (,terminal-class (:inherit term-color-black))))

   ;; tooltip. (NOTE: This setting has no effect on the os widgets for me
   ;; zencoding uses this)
   `(tooltip
     ((,class (:background ,monokai-green-l
                           :foreground ,monokai-bg
                           :inherit ,monokai-pitch))))

   ;; tuareg
   `(tuareg-font-lock-governing-face
     ((,class (:foreground ,monokai-magenta
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-magenta
                                    :weight bold))))

   `(tuareg-font-lock-multistage-face
     ((,class (:foreground ,monokai-blue
                           :background ,monokai-highlight-line
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :background ,terminal-monokai-highlight-line
                                    :weight bold))))

   `(tuareg-font-lock-operator-face
     ((,class (:foreground ,monokai-emph))
      (,terminal-class (:foreground ,terminal-monokai-emph))))

   `(tuareg-font-lock-error-face
     ((,class (:foreground ,monokai-yellow
                           :background ,monokai-red
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :background ,terminal-monokai-red
                                    :weight bold))))

   `(tuareg-font-lock-interactive-output-face
     ((,class (:foreground ,monokai-cyan))
      (,terminal-class (:foreground ,terminal-monokai-cyan))))

   `(tuareg-font-lock-interactive-error-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   ;; undo-tree
   `(undo-tree-visualizer-default-face
     ((,class (:foreground ,monokai-comments
                           :background ,monokai-bg))
      (,terminal-class (:foreground ,terminal-monokai-comments
                                    :background ,terminal-monokai-bg))))

   `(undo-tree-visualizer-unmodified-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(undo-tree-visualizer-current-face
     ((,class (:foreground ,monokai-blue
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :inverse-video t))))

   `(undo-tree-visualizer-active-branch-face
     ((,class (:foreground ,monokai-emph
                           :background ,monokai-bg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :background ,terminal-monokai-bg
                                    :weight bold))))

   `(undo-tree-visualizer-register-face
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   ;; volatile highlights
   `(vhl/default-face
     ((,class (:background ,monokai-green-lc
                           :foreground ,monokai-green-hc))
      (,terminal-class (:background ,terminal-monokai-green-lc
                                    :foreground ,terminal-monokai-green-hc))))

   ;; w3m
   `(w3m-anchor
     ((,class (:inherit link))
      (,terminal-class (:inherit link))))

   `(w3m-arrived-anchor
     ((,class (:inherit link-visited))
      (,terminal-class (:inherit link-visited))))

   `(w3m-form
     ((,class (:background ,monokai-bg
                           :foreground ,monokai-fg))
      (,terminal-class (:background ,terminal-monokai-bg
                                    :foreground ,terminal-monokai-fg))))

   `(w3m-header-line-location-title
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-yellow))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-yellow))))

   `(w3m-header-line-location-content

     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-fg))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-fg))))

   `(w3m-bold
     ((,class (:foreground ,monokai-emph
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :weight bold))))

   `(w3m-image-anchor
     ((,class (:background ,monokai-bg
                           :foreground ,monokai-cyan
                           :inherit link))
      (,terminal-class (:background ,terminal-monokai-bg
                                    :foreground ,terminal-monokai-cyan
                                    :inherit link))))

   `(w3m-image
     ((,class (:background ,monokai-bg
                           :foreground ,monokai-cyan))
      (,terminal-class (:background ,terminal-monokai-bg
                                    :foreground ,terminal-monokai-cyan))))

   `(w3m-lnum-minibuffer-prompt
     ((,class (:foreground ,monokai-emph))
      (,terminal-class (:foreground ,terminal-monokai-emph))))

   `(w3m-lnum-match
     ((,class (:background ,monokai-highlight-line))
      (,terminal-class (:background ,terminal-monokai-highlight-line))))

   `(w3m-lnum
     ((,class (:underline nil
                          :bold nil
                          :foreground ,monokai-red))
      (,terminal-class (:underline nil
                                   :bold nil
                                   :foreground ,terminal-monokai-red))))

   `(w3m-session-select
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(w3m-session-selected
     ((,class (:foreground ,monokai-emph
                           :bold t
                           :underline t))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :bold t
                                    :underline t))))

   `(w3m-tab-background
     ((,class (:background ,monokai-bg
                           :foreground ,monokai-fg))
      (,terminal-class (:background ,terminal-monokai-bg
                                    :foreground ,terminal-monokai-fg))))

   `(w3m-tab-selected-background
     ((,class (:background ,monokai-bg
                           :foreground ,monokai-fg))
      (,terminal-class (:background ,terminal-monokai-bg
                                    :foreground ,terminal-monokai-fg))))

   `(w3m-tab-mouse
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-yellow))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-yellow))))

   `(w3m-tab-selected
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-emph
                           :bold t))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-emph
                                    :bold t))))

   `(w3m-tab-unselected
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-fg))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-fg))))

   `(w3m-tab-selected-retrieving
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-red))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-red))))

   `(w3m-tab-unselected-retrieving
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-orange))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-orange))))

   `(w3m-tab-unselected-unseen
     ((,class (:background ,monokai-highlight-line
                           :foreground ,monokai-violet))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :foreground ,terminal-monokai-violet))))

   ;; web-mode
   `(web-mode-builtin-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(web-mode-comment-face
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   `(web-mode-constant-face
     ((,class (:foreground ,monokai-blue
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :weight bold))))

   `(web-mode-current-element-highlight-face
     ((,class (:underline unspecified
                          :weight unspecified
                          :background ,monokai-highlight-line))
      (,terminal-class (:underline unspecified
                                   :weight unspecified
                                   :background ,terminal-monokai-highlight-line))))

   `(web-mode-css-at-rule-face
     ((,class (:foreground ,monokai-violet
                           :slant italic))
      (,terminal-class (:foreground ,terminal-monokai-violet
                                    :slant italic))))

   `(web-mode-css-pseudo-class-face
     ((,class (:foreground ,monokai-green
                           :slant italic))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :slant italic))))

   `(web-mode-doctype-face
     ((,class (:foreground ,monokai-comments
                           :slant italic
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-comments
                                    :slant italic
                                    :weight bold))))

   `(web-mode-folded-face
     ((,class (:underline t))
      (,terminal-class (:underline t))))

   `(web-mode-function-name-face
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(web-mode-html-attr-name-face
     ((,class (:foreground ,monokai-blue
                           :slant normal))
      (,terminal-class (:foreground ,terminal-monokai-blue
                                    :slant normal))))

   `(web-mode-html-attr-value-face
     ((,class (:foreground ,monokai-cyan
                           :slant italic))
      (,terminal-class (:foreground ,terminal-monokai-cyan
                                    :slant italic))))

   `(web-mode-html-tag-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(web-mode-keyword-face
     ((,class (:foreground ,monokai-yellow
                           :weight normal))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :weight normal))))

   `(web-mode-preprocessor-face
     ((,class (:foreground ,monokai-yellow
                           :slant normal
                           :weight unspecified))
      (,terminal-class (:foreground ,terminal-monokai-yellow
                                    :slant normal
                                    :weight unspecified))))

   `(web-mode-string-face
     ((,class (:foreground ,monokai-cyan))
      (,terminal-class (:foreground ,terminal-monokai-cyan))))

   `(web-mode-type-face
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(web-mode-variable-name-face
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(web-mode-warning-face
     ((,class (:inherit font-lock-warning-face))
      (,terminal-class (:inherit font-lock-warning-face))))

   `(web-mode-block-attr-name-face
     ((,class (:inherit web-mode-html-attr-name-face))
      (,terminal-class (:inherit web-mode-html-attr-name-face))))

   `(web-mode-block-attr-value-face
     ((,class (:inherit web-mode-html-attr-value-face))
      (,terminal-class (:inherit web-mode-html-attr-value-face))))

   `(web-mode-block-comment-face
     ((,class (:inherit web-mode-comment-face))
      (,terminal-class (:inherit web-mode-comment-face))))

   `(web-mode-block-control-face
     ((,class (:inherit font-lock-preprocessor-face))
      (,terminal-class (:inherit font-lock-preprocessor-face))))

   `(web-mode-block-face
     ((,class (:background unspecified))
      (,terminal-class (:background unspecified))))

   `(web-mode-block-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-comment-keyword-face
     ((,class (:box 1
                    :weight bold))
      (,terminal-class (:box 1
                             :weight bold))))

   `(web-mode-css-color-face
     ((,class (:inherit font-lock-builtin-face))
      (,terminal-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-function-face
     ((,class (:inherit font-lock-builtin-face))
      (,terminal-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-priority-face
     ((,class (:inherit font-lock-builtin-face))
      (,terminal-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-property-name-face
     ((,class (:inherit font-lock-variable-name-face))
      (,terminal-class (:inherit font-lock-variable-name-face))))

   `(web-mode-css-selector-face
     ((,class (:inherit font-lock-keyword-face))
      (,terminal-class (:inherit font-lock-keyword-face))))

   `(web-mode-css-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-javascript-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-json-context-face
     ((,class (:foreground ,monokai-violet))
      (,terminal-class (:foreground ,terminal-monokai-violet))))

   `(web-mode-json-key-face
     ((,class (:foreground ,monokai-violet))
      (,terminal-class (:foreground ,terminal-monokai-violet))))

   `(web-mode-json-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-param-name-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(web-mode-part-comment-face
     ((,class (:inherit web-mode-comment-face))
      (,terminal-class (:inherit web-mode-comment-face))))

   `(web-mode-part-face
     ((,class (:inherit web-mode-block-face))
      (,terminal-class (:inherit web-mode-block-face))))

   `(web-mode-part-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-symbol-face
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(web-mode-whitespace-face
     ((,class (:background ,monokai-red))
      (,terminal-class (:background ,terminal-monokai-red))))

   ;; whitespace-mode
   `(whitespace-space
     ((,class (:background unspecified
                           :foreground ,monokai-comments
                           :inverse-video unspecified
                           :slant italic))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-comments
                                    :inverse-video unspecified
                                    :slant italic))))

   `(whitespace-hspace
     ((,class (:background unspecified
                           :foreground ,monokai-emph
                           :inverse-video unspecified))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-emph
                                    :inverse-video unspecified))))

   `(whitespace-tab
     ((,class (:background unspecified
                           :foreground ,monokai-red
                           :inverse-video unspecified
                           :weight bold))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-red
                                    :inverse-video unspecified
                                    :weight bold))))

   `(whitespace-newline
     ((,class(:background unspecified
                          :foreground ,monokai-comments
                          :inverse-video unspecified))
      (,terminal-class(:background unspecified
                                   :foreground ,terminal-monokai-comments
                                   :inverse-video unspecified))))

   `(whitespace-trailing
     ((,class (:background unspecified
                           :foreground ,monokai-orange-lc
                           :inverse-video t))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-orange-lc
                                    :inverse-video t))))

   `(whitespace-line
     ((,class (:background unspecified
                           :foreground ,monokai-magenta
                           :inverse-video unspecified))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-magenta
                                    :inverse-video unspecified))))

   `(whitespace-space-before-tab
     ((,class (:background ,monokai-red-lc
                           :foreground unspecified
                           :inverse-video unspecified))
      (,terminal-class (:background ,terminal-monokai-red-lc
                                    :foreground unspecified
                                    :inverse-video unspecified))))

   `(whitespace-indentation
     ((,class (:background unspecified
                           :foreground ,monokai-yellow
                           :inverse-video unspecified
                           :weight bold))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-yellow
                                    :inverse-video unspecified
                                    :weight bold))))

   `(whitespace-empty
     ((,class (:background unspecified
                           :foreground ,monokai-red-lc
                           :inverse-video t))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-red-lc
                                    :inverse-video t))))

   `(whitespace-space-after-tab
     ((,class (:background unspecified
                           :foreground ,monokai-orange
                           :inverse-video t
                           :weight bold))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-monokai-orange
                                    :inverse-video t
                                    :weight bold))))

   ;; wanderlust
   `(wl-highlight-folder-few-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(wl-highlight-folder-many-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(wl-highlight-folder-path-face
     ((,class (:foreground ,monokai-orange))
      (,terminal-class (:foreground ,terminal-monokai-orange))))

   `(wl-highlight-folder-unread-face
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(wl-highlight-folder-zero-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(wl-highlight-folder-unknown-face
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(wl-highlight-message-citation-header
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(wl-highlight-message-cited-text-1
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(wl-highlight-message-cited-text-2
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(wl-highlight-message-cited-text-3
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(wl-highlight-message-cited-text-4
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(wl-highlight-message-header-contents-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(wl-highlight-message-headers-face
     ((,class (:foreground ,monokai-red))
      (,terminal-class (:foreground ,terminal-monokai-red))))

   `(wl-highlight-message-important-header-contents
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(wl-highlight-message-header-contents
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(wl-highlight-message-important-header-contents2
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(wl-highlight-message-signature
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   `(wl-highlight-message-unimportant-header-contents
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(wl-highlight-summary-answemonokai-red-face
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(wl-highlight-summary-disposed-face
     ((,class (:foreground ,monokai-fg
                           :slant italic))
      (,terminal-class (:foreground ,terminal-monokai-fg
                                    :slant italic))))

   `(wl-highlight-summary-new-face
     ((,class (:foreground ,monokai-blue))
      (,terminal-class (:foreground ,terminal-monokai-blue))))

   `(wl-highlight-summary-normal-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(wl-highlight-summary-thread-top-face
     ((,class (:foreground ,monokai-yellow))
      (,terminal-class (:foreground ,terminal-monokai-yellow))))

   `(wl-highlight-thread-indent-face
     ((,class (:foreground ,monokai-magenta))
      (,terminal-class (:foreground ,terminal-monokai-magenta))))

   `(wl-highlight-summary-refiled-face
     ((,class (:foreground ,monokai-fg))
      (,terminal-class (:foreground ,terminal-monokai-fg))))

   `(wl-highlight-summary-displaying-face
     ((,class (:underline t
                          :weight bold))
      (,terminal-class (:underline t
                                   :weight bold))))

   ;; weechat
   `(weechat-error-face
     ((,class (:inherit error))
      (,terminal-class (:inherit error))))

   `(weechat-highlight-face
     ((,class (:foreground ,monokai-emph
                           :weight bold))
      (,terminal-class (:foreground ,terminal-monokai-emph
                                    :weight bold))))

   `(weechat-nick-self-face
     ((,class (:foreground ,monokai-green
                           :weight unspecified
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-monokai-green
                                    :weight unspecified
                                    :inverse-video t))))

   `(weechat-prompt-face
     ((,class (:inherit minibuffer-prompt))
      (,terminal-class (:inherit minibuffer-prompt))))

   `(weechat-time-face
     ((,class (:foreground ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments))))

   ;; which-func-mode
   `(which-func
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   ;; window-number-mode
   `(window-number-face
     ((,class (:foreground ,monokai-green))
      (,terminal-class (:foreground ,terminal-monokai-green))))

   ;; yascroll
   `(yascroll:thumb-text-area
     ((,class (:foreground ,monokai-comments
                           :background ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments
                                    :background ,terminal-monokai-comments))))

   `(yascroll:thumb-fringe
     ((,class (:foreground ,monokai-comments
                           :background ,monokai-comments))
      (,terminal-class (:foreground ,terminal-monokai-comments
                                    :background ,terminal-monokai-comments))))

   ;; zencoding
   `(zencoding-preview-input
     ((,class (:background ,monokai-highlight-line
                           :box ,monokai-emph))
      (,terminal-class (:background ,terminal-monokai-highlight-line
                                    :box ,terminal-monokai-emph)))))

  (custom-theme-set-variables
   'monokai
   `(ansi-color-names-vector [,monokai-bg ,monokai-red ,monokai-green ,monokai-yellow
                                          ,monokai-blue ,monokai-magenta ,monokai-cyan ,monokai-fg])

   ;; compilation
   `(compilation-message-face 'default)

   ;; fill-column-indicator
   `(fci-rule-color ,monokai-highlight-line)

   ;; magit
   `(magit-diff-use-overlays nil)

   ;; highlight-changes
   `(highlight-changes-colors '(,monokai-magenta ,monokai-violet))

   ;; highlight-tail
   `(highlight-tail-colors
     '((,monokai-highlight-line . 0)
       (,monokai-green-lc . 20)
       (,monokai-cyan-lc . 30)
       (,monokai-blue-lc . 50)
       (,monokai-yellow-lc . 60)
       (,monokai-orange-lc . 70)
       (,monokai-magenta-lc . 85)
       (,monokai-highlight-line . 100)))

   ;; pos-tip
   `(pos-tip-foreground-color ,monokai-bg)
   `(pos-tip-background-color ,monokai-green)

   ;; vc
   `(vc-annotate-color-map
     '((20 . ,monokai-red)
       (40 . "#CF4F1F")
       (60 . "#C26C0F")
       (80 . ,monokai-yellow)
       (100 . "#AB8C00")
       (120 . "#A18F00")
       (140 . "#989200")
       (160 . "#8E9500")
       (180 . ,monokai-green)
       (200 . "#729A1E")
       (220 . "#609C3C")
       (240 . "#4E9D5B")
       (260 . "#3C9F79")
       (280 . ,monokai-cyan)
       (300 . "#299BA6")
       (320 . "#2896B5")
       (340 . "#2790C3")
       (360 . ,monokai-blue)))
   `(vc-annotate-very-old-color nil)
   `(vc-annotate-background nil)

   ;; weechat
   `(weechat-color-list
     (unspecified ,monokai-bg ,monokai-highlight-line
                  ,monokai-red-d ,monokai-red
                  ,monokai-green-d ,monokai-green
                  ,monokai-yellow-d ,monokai-yellow
                  ,monokai-blue-d ,monokai-blue
                  ,monokai-magenta-d ,monokai-magenta
                  ,monokai-cyan-d ,monokai-cyan
                  ,monokai-fg ,monokai-emph))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'monokai)

;; Local Variables:
;; no-byte-compile: t
;; fill-column: 95
;; End:

;;; monokai-theme.el ends here
