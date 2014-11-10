(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/")) ;; add Melpa
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")) ;; Marmalade
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/")) ;;
(package-initialize) ;; init

; Japanese (UTF-8)
(setq default-input-method "MacOSX")
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
; create no backup
(setq make-backup-files nil)
; remove auto saves
(setq delete-auto-save-files)
; set default directory as ~/
(setq default-directory "~/")
(setq command-line-default-directory "~/")
; Cmd as Meta key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

(helm-mode 1)
(define-key global-map (kbd "M-x") 'helm-M-x)
