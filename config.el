;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "xvs"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "DejaVuSansMono" :size 17 :weight 'normal))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Keybindings
;; (map! :after cc-mode
;;       :after bazel
;;       :map c++-mode-map
;;       "SPC f b" #'bazel-find-build-file)

;; company
;; (define-key company-active-map 'company-complete-common nil)
(setq company-minimum-prefix-length 2)

;; snippets
(map! :after yasnippet
      :map yas-minor-mode-map
      :ei "C-s" #'yas-expand)
(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))

;; (after! yasnippet
;;   (after! company
;;     (defun do-yas-expand ()
;;       (let ((yas-fallback-behavior 'return-nil))
;;         (yas/expand)))

;;     (defun tab-indent-or-complete ()
;;       (interactive)
;;       (cond
;;        ((minibufferp)
;;         (minibuffer-complete))
;;        (t
;;         (indent-for-tab-command)
;;         (if (or (not yas-minor-mode)
;;                 (null (do-yas-expand)))
;;             (if (check-expansion)
;;                 (progn
;;                   (company-manual-begin)
;;                   (if (null company-candidates)
;;                       (progn
;;                         (company-abort)
;;                         (indent-for-tab-command)))))))))

;;     (defun tab-complete-or-next-field ()
;;       (interactive)
;;       (if (or (not yas-minor-mode)
;;               (null (do-yas-expand)))
;;           (if company-candidates
;;               (company-complete-selection)
;;             (if (check-expansion)
;;                 (progn
;;                   (company-manual-begin)
;;                   (if (null company-candidates)
;;                       (progn
;;                         (company-abort)
;;                         (yas-next-field))))
;;               (yas-next-field)))))

;;     (defun expand-snippet-or-complete-selection ()
;;       (interactive)
;;       (if (or (not yas-minor-mode)
;;               (null (do-yas-expand))
;;               (company-abort))
;;           (company-complete-selection)))

;;     (defun abort-company-or-yas ()
;;       (interactive)
;;       (if (null company-candidates)
;;           (yas-abort-snippet)
;;         (company-abort)))

;;     (global-set-key [tab] 'tab-indent-or-complete)
;;     (global-set-key (kbd "TAB") 'tab-indent-or-complete)
;;     (global-set-key [(control return)] 'company-complete-common)

;;     (define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
;;     (define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)

;;     (define-key yas-minor-mode-map [tab] nil)
;;     (define-key yas-minor-mode-map (kbd "TAB") nil)

;;     (define-key yas-keymap [tab] 'tab-complete-or-next-field)
;;     (define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
;;     (define-key yas-keymap [(control tab)] 'yas-next-field)
;;     (define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)))

;; c++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;;(setq c-default-style
;;  '((cc-mode . "google")))
;;(google-set-c-style)
;;(after! google-c-style
;;  (setq c-default-style "google"))
(after! lsp
  (setq lsp-clangd-binary-path "/usr/local/bin/clangd")
  (setq lsp-clients-clangd-args '("-j=4"
                                  "--background-index"
                                  "--all-scopes-completion"
                                  "--clang-tidy"
                                  "--completion-style=detailed"
                                  "--header-insertion=iwyu"
                                  "--header-insertion-decorators=1"
                                  "--suggest-missing-includes"
                                  "--index"))
  (setq lsp-pyls-plugins-autopep8-enabled nil)
  (setq lsp-pyls-plugins-yapf-enabled nil)
  (setq lsp-clients-clangd-executable "/usr/local/bin/clangd"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))
(after! lsp
  (setq-hook! 'cc-mode-hook +format-with-lsp nil))
(setq clang-format-style "file")
(setq-hook! 'cc-mode-hook +format-with :clang-format)


;;
;; (@* "Keys" )
;;

(defun jcs-toggle-c-comment-style ()
  "Toggle comment style between /* */ and //."
  (interactive)
  (when (memq major-mode '(c-mode c++-mode))
    (if (string= comment-start "// ")
        (setq comment-start "/*"
              comment-start-skip "/\\*+[ \t]*"
              comment-end "*/"
              comment-end-skip "[ \t]*\\*+/")
      (setq comment-start "// "
            comment-end ""))))

;;
;; (@* "Commenting" )
;;

(defun jcs-use-cc-mutliline-comment ()
  "Fixed multiline comment."
  (require 'typescript-mode)
  (setq-local indent-line-function 'typescript-indent-line)
  (setq c-comment-prefix-regexp "//+\\|\\**"
        c-paragraph-start "$"
        c-paragraph-separate "$"
        c-block-comment-prefix "* "
        c-line-comment-starter "//"
        c-comment-start-regexp "/[*/]\\|\\s!"
        comment-start-skip "\\(//+\\|/\\*+\\)\\s *")
  (let ((c-buffer-is-cc-mode t))
    (make-local-variable 'paragraph-start)
    (make-local-variable 'paragraph-separate)
    (make-local-variable 'paragraph-ignore-fill-prefix)
    (make-local-variable 'adaptive-fill-mode)
    (make-local-variable 'adaptive-fill-regexp)
    (c-setup-paragraph-variables)))

;;
;; (@* "Document String" )
;;

(defvar jcs--class-desc-string "Class description here.."
  "Class description string.")
(defvar jcs--struct-desc-string "Struct description here.."
  "Struct description string.")
(defvar jcs--define-desc-string "Define description here.."
  "Define description string.")
(defvar jcs--enum-desc-string "Enum description here.."
  "Enum description string.")

(defun jcs-c++--ts-docstr-after (node data)
  "Local hook `ts-docstr-after-insert-hook' for C++."
  (when-let ((name (plist-get data :name)))
    (ts-docstr-with-insert-indent
      (cl-case (tsc-node-type node)
        (preproc_def
         (insert "@def " name "\n")
         (insert "* @brief " jcs--define-desc-string))
        (class_specifier
         (insert "@class " name "\n")
         (insert "* @brief " jcs--class-desc-string))
        (struct_specifier
         (insert "@struct " name "\n")
         (insert "* @brief " jcs--struct-desc-string))
        (enum_specifier
         (insert "@enum " name "\n")
         (insert "* @brief " jcs--enum-desc-string)))
      (setq restore-point (point)))))

;; python
(setq sphinx-doc-include-types t)
(setenv "WORKON_HOME" "/home/xvs/anaconda3/envs")
(defvar-local my/flycheck-local-cache nil)

(defun my/flycheck-checker-get (fn checker property)
  (or (alist-get property (alist-get checker my/flycheck-local-cache))
      (funcall fn checker property)))

(advice-add 'flycheck-checker-get :around 'my/flycheck-checker-get)

(add-hook 'lsp-managed-mode-hook
          (lambda ()
            (when (derived-mode-p 'python-mode)
              ;;(setq my/flycheck-local-cache '((lsp . ((next-checkers . (python-mypy python-pylint)))))))))
              (setq my/flycheck-local-cache '((python-mypy . ((next-checkers . (python-mypy python-pylint)))))))))

;; shell
(setq shell-file-name "bash")
(setq shell-command-switch "-ic") ;; projectile fails with -i
;;(setq shell-command-switch "") ;; projectile fails with -i

;; treemacs
;; (setq doom-themes-treemacs-theme "doom-colors")
(setq doom-themes-treemacs-theme "all-the-icons")

;; (after! 'treemacs
;;   (defun treemacs-ignore-def (absolute-path)
;;     (or (string-prefix-p "/home/xvs/gits/tbd/bazel" absolute-path)
;;         (string-prefix-p "/home/xvs/gits/tbd/.cache" absolute-path)))
;;  (add-to-list 'treemacs-ignored-file-predicates #'treemacs-ignore-def))

;; keylog myself
(after! keyfreq
  (require 'keyfreq)
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

;; gerrit
(use-package gerrit
  :custom
  (gerrit-host "http://100.102.33.116:8080/")  ;; is needed for REST API calls
  :config
  (progn
    (add-hook 'magit-status-sections-hook #'gerrit-magit-insert-status t)
    (global-set-key (kbd "C-x i") 'gerrit-upload-transient)
    (global-set-key (kbd "C-x o") 'gerrit-download)))
