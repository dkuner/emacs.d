;; coding
(define-coding-system-alias 'UTF-8 'utf-8)

;; amx
(setq amx-mode t)

;;yasnippet
(yas-global-mode t)

;; Edit
(electric-pair-mode t)

;; default
(require 'undo-tree)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-j") 'newline)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-p") 'mark-paragraph)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "M-SPC") 'linum-mode)
(global-set-key (kbd "C-x /") 'comment-or-uncomment-region)

;; hideshow
(global-set-key (kbd "C-c h") 'hs-minor-mode)
(global-set-key (kbd "C-c a") 'hs-hide-all)
(global-set-key (kbd "C-c A") 'hs-show-all)
(global-set-key (kbd "C-c b") 'hs-hide-block)
(global-set-key (kbd "C-c B") 'hs-show-block)
(global-set-key (kbd "C-c t") 'hs-toggle-hiding)
(global-set-key (kbd "C-c l") 'hs-hide-leve)

;; shell
(setq flymake-mode t)
(add-hook 'sh-mode-hook 'flymake-shellcheck-load)

;; c
(defun linux-c-mode ()
        "C mode with adjusted defaults for use with the Linux kernel."
	(interactive)
	(c-mode)
	(c-set-style "K&R")
	(setq tab-width 8)
	(setq indent-tabs-mode t)
	(setq c-basic-offset 8)
        (semantic-mode)
	(global-set-key (kbd "M-n") 'semantic-ia-complete-symbol)
	;;(require 'ascope)
	)
(setq auto-mode-alist (cons '("/.*\\.[ch]$" . linux-c-mode) auto-mode-alist))
;; ascope
;;(global-set-key (kbd "C-c s i") 'ascope-init)
;;(global-set-key (kbd "C-c s g") 'ascope-find-global-definition)
;;(global-set-key (kbd "C-c s s") 'ascope-find-this-symbol)
;;(global-set-key (kbd "C-c s t") 'ascope-find-this-text-string)
;;(global-set-key (kbd "C-c s c") 'ascope-find-functions-calling-this-function)
;;(global-set-key (kbd "C-c s C") 'ascope-find-called-functions)
;;(global-set-key (kbd "C-c s f") 'ascope-find-files-including-file)
;;(global-set-key (kbd "C-c s S") 'ascope-all-symbol-assignments)
;;(global-set-key (kbd "C-c s o") 'ascope-clear-overlay-arrow)
;;(global-set-key (kbd "C-c s p") 'ascope-pop-mark)

;; go
(add-to-list 'load-path "~/go/pkg/mod/github.com/dougm/goflymake@v0.0.0-20140731161037-3b9634ef394a")
(ac-config-default)
(require 'go-flymake)
(require 'auto-complete-config)
(require 'go-autocomplete)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'flymake-mode-hook (lambda() (local-set-key (kbd "C-c C-e n") 'flymake-goto-next-error)))
(add-hook 'flymake-mode-hook (lambda() (local-set-key (kbd "C-c C-e p") 'flymake-goto-prev-error)))
(add-hook 'flymake-mode-hook (lambda() (local-set-key (kbd "C-c C-e m") 'flymake-popup-current-error-menu)))
(global-set-key (kbd "M-.") 'godef-jump)
(global-set-key (kbd "M-*") 'pop-tag-mark)
(global-set-key (kbd "C-c C-g p") 'godoc-at-point)
(provide 'yunky-init)
