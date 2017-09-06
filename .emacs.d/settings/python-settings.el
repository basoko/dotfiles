; enable elpy
(package-initialize)
(elpy-enable)
(setq elpy-test-pytest-runner-command '("pytest"))
(elpy-set-test-runner 'elpy-test-pytest-runner)


(provide 'python-settings)

