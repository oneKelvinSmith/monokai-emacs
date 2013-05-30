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
accessable to a newcomer.

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

# Bugs & Improvements

Please, report any problems that you find on the projects integrated
issue tracker. If you've added some improvements and you want them
included upstream please send a pull request.

Thank you,<br\>
Kelvin

=============
