;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "arifian rahardianda"
      user-mail-address "arifian.rahardianda@zeniuseducation.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-monokai-pro)
;; (setq doom-theme 'doom-tomorrow-night)
;;(load-theme 'doom-tomorrow-day)
;;(load-theme 'doom-tomorrow-night)

(load-theme 'doom-one-light t)
;;(load-theme 'doom-monokai-pro t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Notes/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (global-set-key (kbd "M-y") 'neotree-toggle)

(require 'ergoemacs-mode)
(require 'cider)
(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "us")
(ergoemacs-mode 1)

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; (map! (:prefix ("J" . "neo")
;;        :desc "neo-toggle" "b" #'neotree-toggle))

(map! (:prefix "C-c"
       :desc "neo toggle"
       "b" #'neotree-toggle))

(require 'es-mode)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((elasticsearch . t)))

;; plantuml
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))

(defun start-cider-repl-with-profile ()
  (interactive)
  (letrec ((profile (read-string "Enter profile name: "))
           (profile-params (concat "with-profile +" profile " repl :headless")))
    (message "lein-params set to: %s" profile-params)
    (set-variable 'cider-clojure-clj-aliases profile)
    (cider-jack-in '())))

;; accept completion from copilot and fallback to company
(require 'copilot)

;;(add-load-path! "/Users/arifianrahardianda/.emacs.d/.local/straight/repos/")

(use-package! copilot
  :hook (prog-mode . copilot-mode)
  ;; :bind (:map copilot-completion-map
  ;;             ("<tab>" . 'copilot-accept-completion)
  ;;             ("TAB" . 'copilot-accept-completion)
  ;;             ("C-TAB" . 'copilot-accept-completion-by-word)
  ;;             ("C-<tab>" . 'copilot-accept-completion-by-word))
  )

(load! "/Users/arifianrahardianda/.emacs.d/.local/straight/repos/copilot.el/copilot-balancer.el")
(load! "/Users/arifianrahardianda/.emacs.d/.local/straight/repos/copilot.el/copilot.el")

(map! (:prefix "C-c"
       :desc "copilot-accept-completion"
       "TAB" #'copilot-accept-completion))

(setq copilot-node-executable "/Users/arifianrahardianda/.nvm/versions/node/v18.19.1/bin/node")

;; (add-to-list 'es-default-headers '("Authorization" . "Basic nk0QnRn1rGtEapQwKp91"))

;;  (map! "M-y" #'neotree-toggle)

;; (global-set-key (kbd "M-y") 'neotree-toggle)

