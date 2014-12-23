; Cmd as Meta key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

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


;;; 多重起動禁止
(require 'server)
(unless (server-running-p) ;; 複数サーバ起動を防ぐ
  (server-start))
(setq ns-pop-up-frames nil) ;;複数ウィンドウを開かないようにする
 
;;; Uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; メニューバーにファイルパスを表示する
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; パッケージリスト
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/")) ;; add Melpa
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")) ;; Marmalade
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/")) ;;
(package-initialize) ;; init

;; パッケージ情報の更新
(package-refresh-contents)

;;; helm
;; インストールするパッケージ
(defvar my/favorite-packages
  '(
;;;; helm
    helm
    ))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))

;;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;;; helm
(helm-mode 1)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-r")     'helm-recentf)

(require 'recentf-ext)
(recentf-mode 1)

(setq recentf-max-saved-items 2000)
(setq recentf-exclude '(".recentf"))
(setq recentf-auto-cleanup 10)
(setq recentf-auto-save-timer
      (run-with-idle-timer 30 t 'recentf-save-list))
