;;FONTS
(set-face-attribute 'default nil
  :font "JetBrainsMono Nerd Font-13"
  :weight 'medium)
(set-face-attribute 'variable-pitch nil
  :font "Ubuntu Nerd Font-12"
  :weight 'medium)
(set-face-attribute 'fixed-pitch nil
  :font "JetBrainsMono Nerd Font-13"
  :weight 'medium)
(set-face-attribute 'font-lock-comment-face nil
  :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
  :slant 'italic)

(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-13"))

;; Uncomment the following line if line spacing needs adjusting.
;;(setq-default line-spacing 0.12)


;; ALL-THE_ICONS
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :hook (dired-mode . (lambda () (all-the-icons-dired-mode t))))

(provide 'fonts-module)
