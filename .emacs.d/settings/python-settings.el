(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (setq elpy-rpc-python-command "python3")
  (add-to-list 'process-coding-system-alist '("python3" . (utf-8 . utf-8)))
  (setq python-shell-interpreter "python3"
        python-shell-interpreter-args "-i")
  (use-package jedi
    :ensure t
    :config
    (add-hook 'python-mode-hook 'jedi:setup)
    (setq jedi:complete-on-dot t)                 ; optional
    )
  )

(use-package pyenv-mode
  :ensure t
  )

(provide 'python-settings)
