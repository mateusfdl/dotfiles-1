;; -*- lexical-binding: t; -*-

(add-to-list 'load-path "~/.config/doom")
(add-to-list 'load-path "~/.emacs.d/.local/straight/build-27.2/tree-sitter-langs/bin")

(setq user-full-name "João Fernandes"
      user-mail-address "joaofnds@joaofnds.com"

      make-backup-files nil

      initial-frame-alist '((width . 120)
                            (height . 50)
                            (ns-transparent-titlebar t))

      frame-title-format '("%b")

      tab-width 2
      indent-tabs-mode nil
      +format-with-lsp nil

      visual-fill-column-width 120
      visual-fill-column-center-text t

      display-line-numbers t
      display-line-numbers-type 'relative
      display-line-numbers-current-absolute t


      jf/font/fixed-family    "Iosevka SS08"
      jf/font/cursive-family  "CMU Classical Serif"
      jf/font/variable-family "Iosevka Aile"
      jf/font/size (if IS-MAC 18 16)

      doom-theme 'doom-solarized-dark
      doom-themes-enable-bold t
      doom-themes-enable-italic t
      doom-font (font-spec :family jf/font/fixed-family :size jf/font/size)
      doom-variable-pitch-font (font-spec :family jf/font/variable-family)
      doom-big-font-increment 6

      projectile-project-search-path '("~/code/")
      projectile-enable-caching nil

      +ivy-project-search-engines '(ag)

      dired-dwim-target t)

(setq-hook! 'ruby-mode-hook +format-with-lsp t)

(after! elfeed
  (setq-default elfeed-search-filter "+unread")
  (map! :map elfeed-search-mode-map
        :n "g r" #'elfeed-update))

(map!
 "C-s" #'swiper
 :leader
 "o e" #'elfeed)


(defalias 'forward-evil-word 'forward-evil-symbol)

(add-hook 'typescript-mode-hook #'prettier-js-mode)

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode t)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(defun jf/reload-known-projects ()
  (-each
      (-concat
       '("~/notes" "~/code/dotfiles" "~/code/exercism")
       (f-directories "~/code/melhor-envio"))
    'projectile-add-known-project))

(defun jf/restore-frame-size ()
  (set-frame-size
   (selected-frame)
   (alist-get 'width initial-frame-alist)
   (alist-get 'height initial-frame-alist)))

(defun jf/download-exercism-exercise ()
  (interactive)
  (let* ((track-dir (read-directory-name "track: " "~/code/exercism"))
         (track (f-filename track-dir))
         (exercise (read-string "exercise: "))
         (command (s-concat "exercism download --exercise=" exercise " --track=" track))
         (should-run (y-or-n-p (s-concat "Should run '" command "'?"))))
    (when should-run (shell-command command))))

(setq default-cider-options "-M:lib/cider-nrepl"
      cider-options-with-rebl "-M:lib/cider-nrepl:inspect/rebl:middleware/nrebl")

(defun clj/toggle-cider-rebl ()
  (if (string= cider-clojure-cli-global-options default-cider-options)
      (setq cider-clojure-cli-global-options cider-options-with-rebl)
    (setq cider-clojure-cli-global-options default-cider-options)))

(after! neotree
  (load! "neotree-config"))

(after! org
  (load! "org-config"))

(defun after-doom-loaded ()
  (tmux-pane-mode t)
  (evil-lion-mode t))

(add-hook 'emacs-startup-hook #'after-doom-loaded)
