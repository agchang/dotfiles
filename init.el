(load-theme 'wombat)
;; open in fullscreen
(set-frame-parameter nil 'fullscreen 'fullboth)
(setq mac-command-modifier 'meta)
(setq inhibit-startup-screen t)
(defalias 'yes-or-no-p 'y-or-n-p)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(require 'ansi-color)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

;; allow tab to expand a subtree
(use-package dired-subtree :ensure t
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))


;; melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(blacken dired-subtree smart-compile flycheck elpy company slime magit ##)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Bindings (from Steve Yegge)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key (kbd "C-c m") 'smart-compile)

(setq inferior-lisp-program "/opt/homebrew/bin/sbcl")

;; python
(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  (setenv "WORKON_HOME" "~/.pyenv/versions/")
  )

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
;; Use IPython for REPL
(setq python-shell-completion-native-disabled-interpreters '("ipython"))
(add-hook 'elpy-mode-hook (lambda ()
                            (add-hook 'before-save-hook
                                      'elpy-black-fix-code nil t)))

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; `a` to replace current buffer in dired instead of creating a new buffer when opening a new directory
(put 'dired-find-alternate-file 'disabled nil)
