
;; http://www.jesshamrick.com/2012/09/18/emacs-as-a-python-ide/
;; https://github.com/jhamrick/emacs

;; path where settings files are kept

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/settings")
;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")

;; define various custom functions
(require 'custom-functions)

;; configure general settings
(require 'general-settings)

;; install dependencies with el-get
(require 'el-get-settings)

;---------------;
;;; Utilities ;;;
;---------------;

;; Git
(include-plugin "magit")
(require 'magit)

;; Popup
(include-elget-plugin "popup")
(require 'popup)

;; yasnippet
(require 'yasnippet-settings)

;; Auto complete
(require 'auto-complete-settings)

;; Camelcase functions
(require 'camelcase-settings)

;; Helm
(require 'helm-settings)


;-----------;
;;; Modes ;;;
;-----------;

;; Ido mode
(require 'ido)
(ido-mode 1)

;; MuMaMo
;(require 'mumamo-settings)

;; Markdown mode
(require 'markdown-settings)

;; elpy
(require 'python-settings)

;; LaTeX and Auctex
(require 'latex-settings)

;; SCSS Mode
(require 'scss-settings)

;; Matlab mode
(require 'matlab-settings)

;; Javascript
(require 'js-settings)

;; YAML mode
(require 'yaml-settings)

;; Nyancat mode!
;;(nyan-mode 1)

;---------------------------------------------------------------------
;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load 
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)









