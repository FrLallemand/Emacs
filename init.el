;; Add melpa package repository
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; start fullscreen
(push '(fullscreen . maximized) default-frame-alist)

(tool-bar-mode -1)    ; Hide the tool bar
(scroll-bar-mode -1)  ; Hide the scroll bar
(menu-bar-mode -1)  ; Hide the menu scroll bar

;; Remove the window decoration
(add-to-list 'default-frame-alist '(undecorated . t))
;; Display the line number to the left
(global-display-line-numbers-mode t)
;; Enable a modern tab bar
(global-tab-line-mode t)
;; enable Monokai theme
(load-theme 'monokai t)

;; Line annotation for changed and saved lines.
(global-line-reminder-mode t)
(setq line-reminder-show-option 'indicators)

;; Set the banner
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-startup-banner 'logo)

;; Highlight the current line when scrolling
(beacon-mode 1)
(electric-pair-mode t)

;; Enable TypeScript Interactive Development Environment for Emacs
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
;; if you use typescript-mode
(add-hook 'typescript-mode-hook #'setup-tide-mode)
;; if you use treesitter based typescript-ts-mode (emacs 29+)
(add-hook 'typescript-ts-mode-hook #'setup-tide-mode)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-ts-mode))

(require 'prettier-js)
(defun maybe-use-prettier ()
"Enable `prettier-js-mode' if an rc file is located."
(if (locate-dominating-file default-directory ".prettierrc")
(prettier-js-mode +1)))
(add-hook 'js-ts-mode-hook 'maybe-use-prettier)
(add-hook 'typescript-mode-hook 'maybe-use-prettier)
(add-hook 'typescript-ts-mode-hook 'maybe-use-prettier)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(beacon dashboard)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
