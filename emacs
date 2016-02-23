; mode
(display-time)
(column-number-mode 1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-font-lock-mode t)
(setq font-lock-maximum-size nil)

; color
(set-foreground-color "dark grey")
(set-background-color "black")

; tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)

; plugins
(add-hook 'dired-load-hook (function (lambda () (load "dired-x"))))
(setq dired-omit-files-p t)

; backup
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
(setq delete-old-versions t)
(setq kept-new-versions 4)
(setq kept-old-versions 4)
(setq version-control t)

; yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

; RET      
(global-set-key (kbd "RET") 'newline-and-indent)

; c mode
(add-hook 'c-mode-hook 'linux-c-mode)
(add-hook 'c++-mode-hook 'linux-cpp-mode)
(setq imenu-sort-function 'imenu--sort-by-name)
(defun linux-c-mode()
  (define-key c-mode-map [return] 'newline-and-indent)
  (interactive)
  (c-set-style "K&R")
  (c-toggle-auto-state)
  (c-toggle-hungry-state)
  (setq c-basic-offset 4)
  (imenu-add-menubar-index)
  (which-function-mode)
)
(defun linux-cpp-mode()
  (define-key c++-mode-map [return] 'newline-and-indent)
  (define-key c++-mode-map [(control c) (c)] 'compile)
  (interactive)
  (c-set-style "K&R")
  (c-toggle-auto-state)
  (c-toggle-hungry-state)
  (setq c-basic-offset 4)
  (imenu-add-menubar-index)
  (which-function-mode)
)

; cscope
(require 'xcscope)
(setq cscope-do-not-update-database t)
;;(define-key global-map [f3] 'cscope-find-this-symbol)
;;(define-key global-map [f4] 'cscope-find-global-definition)
;;(define-key global-map [f6] 'cscope-pop-mark)
;;(define-key global-map [f7] 'cscope-prev-symbol)
;;(define-key global-map [f8] 'cscope-next-symbol)

; ctags
;;(global-set-key [f9] (read-kbd-macro "C-u M-."))

; highlight
;;(add-to-list 'load-path "~/.emacs.d/")
;;(require 'highlight-symbol)
;;(global-set-key [(control f3)] 'highlight-symbol-at-point)
;;(global-set-key [f3] 'highlight-symbol-next)
;;(global-set-key [(shift f3)] 'highlight-symbol-prev)
;;(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

; bookmark
(setq bookmark-save-flag 1)
