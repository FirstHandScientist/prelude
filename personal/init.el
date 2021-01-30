;; Disable guru-mode (I like using arrows :p)
(setq prelude-guru nil)
;; Disable whitespace-mode
(setq prelude-whitespace nil)

;;region color settting
;;(set-face-attribute 'region nil :background "#666")
;;(set-face-attribute 'region nil :background "#006666" :foreground "#ffffff")


;; LaTeX configuration
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)


(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) 
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

(setq TeX-output-view-style
      (quote
       (("^pdf$" "." "evince -f %o")
        ("^html?$" "." "iceweasel %o"))))

;; Setting up writegood-mode
(require 'writegood-mode)
(global-set-key "\C-cg" 'writegood-mode)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)

;; (add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode

;; Setting up matlab-mode
;; (add-to-list 'load-path "~/.emacs.d/personal/matlab-emacs")
;; (load-library "matlab-load")
;; (custom-set-variables
;; '(matlab-shell-command-switches '("-nodesktop -nosplash")))
;; (add-hook 'matlab-mode-hook 'auto-complete-mode)
;; (setq company-dabbrev-downcase nil)
;; (setq auto-mode-alist
;;     (cons
;;      '("\\.m$" . matlab-mode)
;;      auto-mode-alist))

;; Setting up the highlight mode
;; (require 'highlight-symbol)
;; ;;(global-set-key [(control f3)] 'highlight-symbol)
;; (global-set-key [(control f3)] 'highlight-symbol-mode)
;; (global-set-key [f3] 'highlight-symbol-next)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)


;; Setting up for message mode

;;(setq mail-user-agent 'message-user-agent)
;; (setq user-mail-address "doli@kth.se"
;;        user-full-name "Dong")
;; (setq send-mail-function    'smtpmail-send-it
;;         smtpmail-smtp-server  "smtp.kth.se"
;;          smtpmail-stream-type  'starttls
;;          smtpmail-smtp-service 587)

;; (require 'ein)
;; (require 'ein-loaddefs)
;; (require 'ein-notebook)
;; (require 'ein-subpackages)

;; set background color 
;;(defun on-after-init ()
;;  (unless (display-graphic-p (selected-frame))
;;    (set-face-background 'default "unspecified-bg" (selected-frame))))

;;(add-hook 'window-setup-hook 'on-after-init)

;; setting the iBuffer configuration

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("tex" (mode . latex-mode))
               ("org" (mode . org-mode))
               ("code" (or
                        (mode . matlab-mode)
                        (mode . python-mode)
                        (mode . mail-mode)
                        (name . "^\\.sh$")
                        (name . "^\\.newsrc-dribble")))))))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))
(setq dired-listing-switches "-alh")

;; set the global font setting
(set-face-attribute 'default nil :height 180)

;; key-chord setting
(key-chord-define-global "jk" nil)

;; set default python interpreter
(setq python-shell-interpreter "python3")

;; (global-set-key "\C-h" 'delete-backward-char)

;; ;; overrides mark-whole-buffer
;; (global-set-key "\C-xh" 'help-command)

;; Translate C-h to DEL
(define-key key-translation-map [?\C-h] [?\C-?])
;; Define M-h to help  ---  please don't add an extra ' after help!
(global-set-key "\C-ch" 'help-command)
(normal-erase-is-backspace-mode 1)

;; Chinese Input Method pyim
(require 'pyim)
(require 'pyim-basedict) ; 拼音词库设置，五笔用户 *不需要* 此行设置
(pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设置
;; (setq default-input-method "pyim")
