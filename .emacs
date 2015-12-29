;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Version check.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (< emacs-major-version 24)
  (error "This setup requires Emacs v24, or higher. You have: v%d" emacs-major-version))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Packaging setup.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(package-initialize)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

(defvar my-packages '(ace-jump-mode
		      auto-complete
		      cider
		      elscreen
		      evil
		      evil-leader
		      evil-paredit
		      evil-surround
		      evil-tabs
		      flycheck
		      helm helm-descbinds
		      highlight
		      key-chord
		      magit
		      markdown-mode
		      nrepl-eval-sexp-fu
		      paredit
		      puppet-mode
		      rainbow-delimiters
		      recentf
		      smart-mode-line
		      smartparens
		      solarized-theme
		      )
  "A list of packages to check for and install at launch.")

(defun my-missing-packages ()
  (let (missing-packages)
    (dolist (package my-packages (reverse missing-packages))
      (or (package-installed-p package)
	  (push package missing-packages)))))

(defun ensure-my-packages ()
  (let ((missing (my-missing-packages)))
    (when missing
      ;; Check for new packages (package versions)
      (package-refresh-contents)
      ;; Install the missing packages
      (mapc (lambda (package)
              (when (not (package-installed-p package))
                (package-install package)))
            missing)
      ;; Close the compilation log.
      (let ((compile-window (get-buffer-window "*Compile-Log*")))
        (if compile-window
          (delete-window compile-window))))))

(ensure-my-packages)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Early requirements.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-complete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Basic Vim Emulation.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-mode t)
(global-evil-tabs-mode 1)

(evil-ex-define-cmd "Exp[lore]" 'dired-jump)
(evil-ex-define-cmd "color[scheme]" 'customize-themes)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Nice-to-haves...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-auto-complete-mode t)
(global-evil-leader-mode)
(global-evil-surround-mode t)

(helm-mode t)
(helm-descbinds-mode t)
(recentf-mode t)

(evil-leader/set-key
  "]" 'save-buffer
  "b" 'switch-to-buffer
  "e" 'find-file
  "g" 'magit-status
  "k" 'kill-buffer
  )

(if after-init-time
  (sml/setup)
  (add-hook 'after-init-hook 'sml/setup))

(evil-define-key 'normal global-map
                 "\C-p" 'helm-mini
                 "\M-x" 'helm-M-x
                 "\C-x\C-f" 'helm-find-files
                 "q:" 'helm-complex-command-history
                 "\\\\w" 'evil-ace-jump-word-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Filetype-style hooks.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun standard-lisp-modes ()
  (require 'nrepl-eval-sexp-fu)
  (rainbow-delimiters-mode t)
  (require 'evil-paredit)
  (paredit-mode t)
  (evil-paredit-mode t)
  (local-set-key (kbd "RET") 'newline-and-indent))

;;; Emacs Lisp
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (standard-lisp-modes)))

(evil-define-key 'normal emacs-lisp-mode-map
                 "\M-q" 'paredit-reindent-defun
                 ;"\C-c\C-c" 'eval-defun
                 "K" '(lambda ()
                        (interactive)
                        (describe-function (symbol-at-point))))

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(load-theme 'solarized-dark)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
