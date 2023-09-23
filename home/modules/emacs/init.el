;;; IMPORTS
;; Add a path
(add-to-list 'load-path "~/.config/emacs/ptc-modules/")

;; Require modules
(require 'elpaca-module)
(require 'fonts-module)
(require 'org-module)
(require 'buffer_move-module)
(require 'keys-module)
(require 'dired-module)
(require 'dashboard-module)
(require 'looks-module)
(require 'whichkey-module)
(require 'vertico_plus-module)
;;(require 'vterm-module)

;;; Basic DEFAULTS
(global-auto-revert-mode t)  ;; Automatically show changes if the file has changed
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(delete-selection-mode 1)    ;; You can select text and delete it by typing.
(electric-indent-mode -1)    ;; Turn off the weird indenting that Emacs does by default.
(electric-pair-mode 1)       ;; Turns on automatic parens pairing
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
(setq backup-directory-alist '((".*" . "~/.local/share/Trash/files")))

;;(use-package pdf-tools)

;; MAGIT
(use-package magit)

;; PROJECTILE
(use-package projectile
  :config
  (projectile-mode 1))

;; RAINBOWS
(use-package rainbow-delimiters
  :hook ((prog-mode . rainbow-delimiters-mode)))

(use-package rainbow-mode
  :diminish
  :hook org-mode prog-mode)

;; SUDO EDIT
(use-package sudo-edit)

;; CUSTOM ADDED
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" default))
 '(package-selected-packages '(dired-preview)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
