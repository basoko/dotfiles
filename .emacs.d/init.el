;;; Install these packages ;;;
;; color-theme
;; solarized-theme
;; yasnippet
;; auto-complete
;; magit
;; nav
;; flymake
;; flymake-cursor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package repos
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; Detect requiered packages and install them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-bindings
                      starter-kit-lisp
                      starter-kit-js
                      auto-complete
                      yasnippet
                      flymake
                      flymake-cursor
                      flymake-jshint
                      flymake-coffee
                      coffee-mode
                      zenburn-theme
                      solarized-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
