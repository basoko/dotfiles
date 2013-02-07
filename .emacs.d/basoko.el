;; Fullscreen (F11)
(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))
(global-set-key [f11] 'toggle-fullscreen)
(toggle-fullscreen)

;; Remove unused UI elements
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-startup-message t)

;; No blink cursor
(blink-cursor-mode 0)

;; Highlight current line
(global-hl-line-mode 1)

;; Line numbers
(global-linum-mode t)

;; Column numbers
(column-number-mode 1)

;; Font and font size
(condition-case nil
    (set-default-font "DejaVu Sans Mono-10")(modify-frame-parameters nil '((wait-for-wm . nil)))
    (error (condition-case nil
               (set-default-font "Cousine")
             (error (condition-case nil
                        (set-default-font "Monaco")
                      (error nil))))))


;; Solarized theme
(load-theme 'solarized-dark t)

;; Auto revert mode
(global-auto-revert-mode t)

;; Change TABS to 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
;; Trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; case sensitivity is important when finding matches
;;(setq ac-ignore-case nil)

;; Ediff help buffer in the same frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; Ediff spit horizontally
(setq ediff-split-window-function 'split-window-horizontally)

;; Yasnippets
(require 'yasnippet)
;; Snippets dirs
(setq yas-snippet-dirs '(
                         ;; personal snippets
                         "~/.emacs.d/snippets"
                         ))

(yas-global-mode 1)

;; Auto-complete
; Load the default configuration
(require 'auto-complete-config)
(setq-default ac-sources
              '(ac-source-abbrev ac-source-dictionary
                                 ac-source-words-in-same-mode-buffers))
;; Custom dictionaries
;; (add-to-list 'ac-dictionary-directiories "~/.dict")

(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

;; Zencoding
;;(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes

;;;;; JAVASCRIPT
;; From: http://blog.deadpansincerity.com/2011/05/setting-up-emacs-as-a-javascript-editing-environment-for-fun-and-profit/
;; Code Folding ( Hide-> C-c @ C-h | Show ->  C-c @ C-s)
(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))

;;; flymake jshint
;(add-to-list 'load-path "~/.emacs.d/jshint-mode")
;(require 'flymake-jshint)
;; (add-hook 'js-mode-hook
;;           (lambda () (flymake-mode 1)))

;;; COFEESCRIPT
;; Output JS files
(setq coffee-js-directory "./build/")
;; Coffescript mode hooks
;; Key binding
(defun map-coffee-keys ()
  (local-set-key (kbd "C-c C-c b") 'coffee-compile-buffer)
  (local-set-key (kbd "C-c C-c f") 'coffee-compile-file))
(add-hook 'coffee-mode-hook 'map-coffee-keys)
;; Compile on save
;;(add-hook 'after-save-hook
;;          (lambda ()
;;            (when (string-match "\.coffee$" (buffer-name))
;;              (coffee-compile-buffer))))

;; Flymake
(add-hook 'coffee-mode-hook 'flymake-coffee-load)
;; Ido-mode ???
(ido-mode t)
