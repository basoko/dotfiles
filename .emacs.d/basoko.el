;; My configuration file

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; START DISPLAY SECTION ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fullscreen (F11)
(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(defun maximize (&optional f)
       (interactive)
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
;; (maximize)

;; Use the filename for the frame title
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

;; Indicate empty lines
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; Remove unused UI elements
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-startup-message t)

;; Solarized theme
(load-theme 'zenburn t)

;; Line numbers
(global-linum-mode t)

;; Column numbers
(column-number-mode 1)

;; No blink cursor
(blink-cursor-mode 0)

;; Highlight current line
(global-hl-line-mode 1)

;; Font and font size
(condition-case nil
    (set-default-font "DejaVu Sans Mono-9")(modify-frame-parameters nil '((wait-for-wm . nil)))
    (error (condition-case nil
               (set-default-font "Cousine")
             (error (condition-case nil
                        (set-default-font "Monaco")
                      (error nil))))))
;; Emacs daemon
(setq default-frame-alist '((font . "DejaVu Sans Mono-9")))
;;;;;;;;;;;;;;;;;;;;;;;;;
;; END DISPLAY SECTION ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GENERAL EDIT CONFIGURATION SECTION ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Backup files directory
(setq backup-directory-alist `(("." . "~/emacs.d/.saves")))
;; Disable backup files
;;(setq make-backup-files nil)

;; Change TABS to 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Electric pair mode
(electric-pair-mode t)

;; Highlight parentheses
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;; Auto revert mode
(global-auto-revert-mode t)

;; Ediff help buffer in the same frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; Ediff spit horizontally
(setq ediff-split-window-function 'split-window-horizontally)

;; case sensitivity is important when finding matches
;;(setq ac-ignore-case nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; END GENERAL EDIT CONFIGURATION SECTION ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;
;; START KEY BINDINGS ;;
;;;;;;;;;;;;;;;;;;;;;;;;
;; Key bindings
(global-set-key [f11] 'toggle-fullscreen)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "RET") 'newline-and-indent)
;; END KEY BINDINGS SECTION ;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; START UTILITIES SECTION ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Yasnippets
(require 'yasnippet)
;; Snippets dirs
(setq yas-snippet-dirs '(
                         ;; personal snippets
                         "~/.emacs.d/snippets"
                         ))
(yas-global-mode 1)

;; Ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Auto-complete
;; Load the default configuration
(require 'auto-complete-config)
(setq-default ac-sources
              '(ac-source-abbrev ac-source-dictionary
                                 ac-source-words-in-same-mode-buffers))
;; Custom dictionaries
;; (add-to-list 'ac-dictionary-directiories "~/.dict")
(global-auto-complete-mode t)
;; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
;; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

;; Zencoding
;;(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; END UTILITIES SECTION ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;
;; START LANGUAGE HOOKS ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; END LANGUAGE HOOKS ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;
