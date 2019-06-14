;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(magit . "melpa-stable") t)


;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)
(setq mac-command-modifier 'control)
;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; Define he following variables to remove the compile-log warnings
;; when defining ido-ubiquitous
;; (defvar ido-cur-item nil)
;; (defvar ido-default-item nil)
;; (defvar ido-cur-list nil)
;; (defvar predicate nil)
;; (defvar inherit-input-method nil)

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-completing-read+

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")


;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
;; (load "setup-js.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("14de8f58ad656af5be374086ae7ab663811633fc1483a02add92f7a1ff1a8455" default)))
 '(electric-pair-mode t)
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (helm-projectile tern-auto-complete company-tern company-lsp company lsp-mode dumb-jump tide evil-nerd-commenter evil-commentary evil aggressive-indent autopair smartparens nord-theme moe-theme rjsx-mode xref-js2 js2-refactor js2-mode kaolin-themes dracula-theme add-node-modules-path prettier-js web-mode solarized-theme magit tagedit rainbow-delimiters projectile smex ido-completing-read+ cider clojure-mode-extra-font-locking clojure-mode paredit exec-path-from-shell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; load solarized dark theme
;; (load-theme 'solarized-dark t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (load-theme 'dracula t)
(load-theme 'nord t)
;; (require 'kaolin-themes)
;; (load-theme 'kaolin-ocean t)


;; save desktop files
(desktop-save-mode 1)

;; START: JS/WEB config for JS/web related stuffs
;; ref: https://emacs.cafe/emacs/javascript/setup/2017/04/23/emacs-setup-javascript.html
;; ref: https://gist.github.com/CodyReichert/9dbc8bd2a104780b64891d8736682cea
;; (add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode)) ;; auto-enable for .js/.jsx files
(require 'js2-mode)
(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook #'add-node-modules-path))

;; (add-to-list 'auto-mode-alist '("\\.jsx?$" . js2-mode)) ;; auto-enable for .js/.jsx files
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
;; (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(require 'js2-refactor)
(require 'xref-js2)

(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(defun js2-mode-init-hook ()
  "Hooks for js2 mode.  Adjust indent."
  (setq web-mode-markup-indent-offset 2)
  (add-node-modules-path)
  (add-hook 'js2-mode-hook #'visual-line-mode))


(add-hook 'js2-mode-hook  'js2-mode-init-hook)
(setq js2-strict-missing-semi-warning nil)
(setq js2-missing-semi-one-line-override t)
(setq js2-mode-show-strict-warnings nil)

;; duplicate a whole line
;; ref: https://stackoverflow.com/questions/88399/how-do-i-duplicate-a-whole-line-in-emacs
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

;; START: setup prettier minor mode
(require 'prettier-js)
;; (add-hook 'js2-mode-hook 'prettier-js-mode)
(defun maybe-use-prettier ()
  "Enable prettier-js-mode if an rc file is located."
  (if (locate-dominating-file default-directory ".prettierrc")
      (prettier-js-mode +1)))

(add-hook 'js2-mode-hook 'maybe-use-prettier)

;; END: PRETTIER

;; autocomplete paired brackets
(electric-pair-mode 1)



;; (require 'autopair)
;; (autopair-global-mode)

;; enable autopair in all buffers

;; on new line auto indent
;; (define-key global-map (kbd "RET") 'newline-and-indent)

(require 'smartparens-config)

;; (add-hook 'js-mode-hook #'smartparens-strict-mode)
;; (add-hook 'rjsx-mode-hook #'smartparens-mode)


;; ref: https://github.com/Fuco1/smartparens/issues/80#issuecomment-18910312
;; (sp-local-pair 'rjsx-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))
;; (defun my-create-newline-and-enter-sexp (&rest _ignored)
;;   "Open a new brace or bracket expression, with relevant newlines and indent. "
;;   (newline)
;;   (indent-according-to-mode)
;;   (forward-line -1)
;;   (indent-according-to-mode)

;; enable projectile bindings
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-s C-d") 'projectile-command-map)
;;; set helm mode?
(setq projectile-completion-system 'helm)

;; (setq helm-projectile-fuzzy-match nil)
(require 'helm-projectile)
(helm-projectile-on)

;; change evil mode line color
;; change mode-line color by evil state
(evil-mode t)
(if evil-mode 
    (lexical-let ((default-color (cons (face-background 'mode-line)
                                        (face-foreground 'mode-line))))
        (add-hook 'post-command-hook
        (lambda ()
            (let ((color (cond ((minibufferp) default-color)
                            ((evil-insert-state-p) '("#4c566a" . "#d8dee9"))
                            ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                            ((evil-visual-state-p)  '("#333333" . "#ffffff"))
                            ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                            (t default-color))))
            (set-face-background 'mode-line (car color))
            (set-face-foreground 'mode-line (cdr color))))))
)

;;; evil nerd commenter enabling
(evilnc-default-hotkeys)

;;; enable tern
;;; ref: http://ternjs.net/doc/manual.html#emacs
;;; (add-to-list 'load-path "/Users/Arun/play/just/tern/emacs")
;;; (autoload 'tern-mode "tern.el" nil t)

;;; company lsp
(require 'company-lsp)
(push 'company-lsp company-backends)
;;; enable company mode in all buffers???
(add-hook 'after-init-hook 'global-company-mode)
;;; enable lsp mode for rjsx
(require 'lsp-mode)
(add-hook 'rjsx-mode-hook #'lsp)
;;; disable flymake/flycheck for now
(setq lsp-prefer-flymake :none)

;;; TERM related stuffs
;; (require 'company)
;; (require 'company-tern)

;; (add-to-list 'company-backends 'company-tern)
;; (add-hook 'rjsx-mode-hook 'tern-mode) 
;; (add-hook 'rjsx-mode-hook 'company-tern) 
;; (add-hook 'rjsx-mode-hook 'company-lsp) 

;;; set company backends for rjsx
;;; complete files and langauage specific stuffs with lsp
(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq-local company-backends '((company-files company-lsp)))))
