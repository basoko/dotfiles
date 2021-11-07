(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(terraform-indent-level 2))

; color theme
;(add-to-list 'custom-theme-load-path (make-plugin-path "color-theme-solarized"))
;(load-theme 'solarized 1)

                                        ;(setq solarized-termcolors 256)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Remove trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Shortcuts
;; rgrep
(global-set-key (kbd "C-c s") 'rgrep)

;; undo/redo
(global-set-key (kbd "C-z") 'undo)

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame (load-theme 'material t))))
  (load-theme 'material t))

(require 'faces)
(if (system-is-mac)
    (set-face-attribute 'default nil
			:foundry "apple"
			:family "DejaVu_Sans_Mono"))

(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)
