;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;;;

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(setq comp-speed 2)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jacob Jenkins"
      user-mail-address "me@jacobejenkins.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
       doom-variable-pitch-font (font-spec :family "IBM Plex Sans"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;https://raw.githubusercontent.com/hlissner/emacs-doom-themes/master/themes/doom-dracula-theme.el; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)
;; (setq doom-sourcerer-brighter-modeline t)

;; (use-package modus-themes
;;   :ensure
;;   :init
;;   ;; Add all your customizations prior to loading the themes
;;   (setq modus-themes-slanted-constructs t
;;         modus-themes-bold-constructs nil)

;;   ;; Load the theme files before enabling a theme
;;   (modus-themes-load-themes)
;;   :config
;;   ;; Load the theme of your choice:
;;   (modus-themes-load-vivendi) ;; OR (modus-themes-load-vivendi)
;;   :bind ("<f5>" . modus-themes-toggle))


(doom-themes-org-config)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/Org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))



;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keysn
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Custom org mode config
;; Turn off indentation causing issues
(add-hook! org-mode (electric-indent-local-mode -1))

;; Use org-super-agenda
(use-package! org-super-agenda
  :after org-agenda
  :config
  (setq org-super-agenda-groups '((:auto-outline-path t)))
  (org-super-agenda-mode))

;; Use mu4e for e-mail in emacs
(setq mail-user-agent 'mu4e-user-agent)
(setq mu4e-maildir "/Users/jacob/.mail/")
(setq
 mu4e-get-mail-command "mbsync -A"
 mu4e-update-interval 300
 mu4e-view-show-images t
 mu4e-use-fancy-chars t
 mu4e-view-show-addresses t)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; use kubernetes package
(use-package! kubernetes
  :commands (kubernetes-overview))

;; If you want to pull in the Evil compatibility package.
(use-package! kubernetes-evil
  :after kubernetes)

;; IVY popup config
(after! ivy-posframe
  (setq ivy-posframe-display-functions-alist
        '((swiper          . nil)
          (complete-symbol . ivy-posframe-display-at-point)
          (counsel-M-x     . ivy-posframe-display-at-frame-top-center)
          (counsel-rg      . ivy-posframe-display-at-frame-top-center)
          (t               . ivy-posframe-display-at-frame-top-center))
        ivy-posframe-border-width 1
        ivy-posframe-parameters '((min-width . 90)
                                  (min-height . 10)
                                  (left-fringe . 8)
                                  (right-fringe . 8))))

;; Deft config
(use-package! deft
  :config
  (setq deft-default-extension "org"
        deft-extensions '("org")
        deft-directory "~/Dropbox/Org"
        deft-recursive t
        deft-use-filename-as-title nil
        deft-use-filter-string-for-filename t))

;; Use rjsx for tsx files
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . rjsx-mode))
