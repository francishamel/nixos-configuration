(setq inhibit-startup-message t)  ; Disable startup message

(scroll-bar-mode -1)              ; Disable visible scrollbar
(tool-bar-mode -1)                ; Disable the toolbar
(tooltip-mode -1)                 ; Disable tooltips
(menu-bar-mode -1)                ; Disable menu bar

(setq visible-bell t)             ; Enable visible bell

(set-face-attribute 'default nil :font "Fira Code Nerd Font" :height 120)

;; Show column number in the modeline
(column-number-mode)

;; Enable line numbers
(global-display-line-numbers-mode t)

;; Disable line numbers for certain modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-outrun-electric t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0))

; TODO setup ivy + ivy-rich
; TODO setup counsel
; TODO setup helpful
; TODO setup general (keybindings)
; TODO setup hydra
