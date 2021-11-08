;; Set path to load settings files
(add-to-list 'load-path "~/.emacs.d/settings")

;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)

;; Define and initialise package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

;; Define the packages to install
(setq package-list '(
                     use-package
                     ))


; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; use-package always ensure (auto-install packages)
(setq use-package-always-ensure t)

;; define various custom functions
(require 'custom-functions)

;; configure general settings
(require 'general-settings)

;; auto-complete
(require 'auto-complete-settings)

;; yasnippet
(require 'yasnippet-settings)

;; helm
(require 'helm-settings)

;; magit
(require 'magit-settings)

;; projectile
(require 'projectile-settings)

;; editorconfig
(require 'editorconfig-settings)

;; jetbrains darcula theme
;;(require 'jetbrains-darcula-theme-settings)
;; zenburn theme
(require 'zenburn-theme-settings)

;; python
(require 'python-settings)

;; python
(require 'golang-settings)

;; yaml
(require 'yaml-settings)

;; markdown
(require 'markdown-settings)

