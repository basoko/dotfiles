(use-package yasnippet
  :ensure t
  :init
  (progn
    (yas-global-mode 1)
    (use-package
      yasnippet-snippets
      :ensure t)
    )
  )

(provide 'yasnippet-settings)



