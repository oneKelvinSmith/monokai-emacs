[![MELPA](http://melpa.org/packages/monokai-theme-badge.svg)](http://melpa.org/#/monokai-theme)
[![MELPA Stable](http://stable.melpa.org/packages/monokai-theme-badge.svg)](http://stable.melpa.org/#/monokai-theme)

# About

Monokai for Emacs is a port of the popular TextMate theme
[Monokai](http://www.monokai.nl/blog/2006/07/15/textmate-color-theme/)
by Wimer Hazenberg. The inspiration for the theme came from Bozhidar Batsov and
his [Zenburn](https://github.com/bbatsov/zenburn-emacs) port and
[Sublime Text 2](http://www.sublimetext.com/2) which defaults to this color scheme.

I like the colors and I like Emacs. This followed.

The theme uses built-in theming support available Emacs 24 and later.

I recommend using [Prelude](http://batsov.com/prelude/) in conjunction with
this theme. Bozhidar Batsov has done some awesome work in making Emacs beautiful and
accessible to a newcomer.

# Installation

## Manual

Download `monokai-theme.el` to the directory `~/.emacs.d/themes/`. Add this to your
`.emacs`:

```lisp
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
```

Now you can load the theme with the interactive function `load-theme` like this:

`M-x load-theme RET monokai`

## Package.el

Monokai is available in both [Marmalade](http://marmalade-repo.org)
and [MELPA](http://melpa.milkbox.net).
Keep in mind the fact the version in the Marmalade repo may not always
be up-to-date.

You can install `monokai` with the following command:

`M-x package-install monokai-theme`

To load it automatically on Emacs startup add this to your init file:

```lisp
(load-theme 'monokai t)
```

# Customization

Please see full list of variables in the `defcustom` section.

You can override specific core colors using this in your `init.el` or equivalent file:

```lisp
  (setq ;; foreground and background
        monokai-foreground     "#ABB2BF"
        monokai-background     "#282C34"
        ;; highlights and comments
        monokai-comments       "#F8F8F0"
        monokai-emphasis       "#282C34"
        monokai-highlight      "#FFB269"
        monokai-highlight-alt  "#66D9EF"
        monokai-highlight-line "#1B1D1E"
        monokai-line-number    "#F8F8F0"
        ;; colours
        monokai-blue           "#61AFEF"
        monokai-cyan           "#56B6C2"
        monokai-green          "#98C379"
        monokai-gray           "#3E4451"
        monokai-violet         "#C678DD"
        monokai-red            "#E06C75"
        monokai-orange         "#D19A66"
        monokai-yellow         "#E5C07B")
```

## `org-mode` headers

If you would like to change the font size of your `org-mode` headers you can do so with:

```lisp
  (setq monokai-height-minus-1 0.8
        monokai-height-plus-1 1.1
        monokai-height-plus-2 1.15
        monokai-height-plus-3 1.2
        monokai-height-plus-4 1.3)
```

## Variable pitch

If you would like to use `variable-pitch-mode` you can enable it with:

```lisp
  (setq monokai-user-variable-pitch t)
```

This used to be enabled by default but broke the principle of least surprise which resulted in a couple of issues. See [#62](https://github.com/oneKelvinSmith/monokai-emacs/issues/62) & [#56](https://github.com/oneKelvinSmith/monokai-emacs/issues/56).


## Windows

If your're experiencing font issues using `org-mode` on Windows with emacs 25 try add this to
your `init.el` or equivalent file:

```lisp
    (add-hook 'after-init-hook '(lambda () (load-theme 'monokai t)))

    ;; FIX: Invalid font in org-mode on Windows
    (when (and sys/win32p (> emacs-major-version 24))
      (add-hook 'window-setup-hook '(lambda () (load-theme 'monokai t))))
```
For more info check the thread in [#56](https://github.com/oneKelvinSmith/monokai-emacs/issues/56)

# Bugs & Improvements

Please, report any problems that you find on the projects integrated
issue tracker. If you've added some improvements and you want them
included upstream please send a pull request.

Thank you,<br\>
Kelvin

=============
