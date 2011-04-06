;;; Archivo de configuración de emacs para jdee, git-emacs y ecb
;;;
;;; 2009-2011 juanger
;;;
;;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d/site/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site/git-emacs"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site/jdee/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site/cedet-1.0pre7/common"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site/elib"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site/cedet-1.0pre7/semantic"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site/cedet-1.0pre7/speedbar"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site/cedet-1.0pre7/eieio"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site/cedet-1.0pre7/ede"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site/ecb-2.40"))

(load-file (expand-file-name "~/.emacs.d/site/cedet-1.0pre7/common/cedet.el"))

(require 'git-emacs)
(require 'jde)
(require 'ecb)

(defvar mvn-command-history nil
  "Maven command history variable")

(defun mvn(&optional args)
  "Runs maven in the current project. Starting at the directory where the file being visited resides, a search is
   made for pom.xml recsurively. A maven command is made from the first directory where the pom.xml file is found is then displayed
  in the minibuffer. The command can be edited as needed and then executed. Errors are navigate to as in any other compile mode"
  (interactive)
  (let ((fn (buffer-file-name)))
    (let ((dir (file-name-directory fn)))
      (while (and (not (file-exists-p (concat dir "/pom.xml")))
                  (not (equal dir (file-truename (concat dir "/..")))))
        (setf dir (file-truename (concat dir "/.."))))
      (if (not (file-exists-p (concat dir "/pom.xml")))
          (message "No pom.xml found")
        (compile (read-from-minibuffer "Command: "
                                       (concat "mvn -f " dir "/pom.xml") nil nil 'mvn-command-history))))))

(defun run-mvn()
  (interactive)
  (progn
    (mvn)
    (bsh-exit)
    (jde-load-all-project-files)))

;;;;;;;;;
;;;;;
;;;;; Custom variables
;;;;;
;;;;;;;;;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(before-save-hook (quote (delete-trailing-whitespace)))
 '(ecb-auto-activate t)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-tip-of-the-day nil)
 '(indent-tabs-mode nil)
 '(paren-match-face (quote paren-face-match-light))
 '(paren-sexp-mode t)
 '(show-paren-mode t)
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
