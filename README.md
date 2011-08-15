Configuración de Emacs
========

Primero descarga éste repositorio en tu home:

     $ cd
     $ git clone git://github.com/cs-fcunam/emacs.d.git .emacs.d

Para instalar éste paquete pon sólo la siguiente línea al inicio de tu .emacs así:

     (load-file (expand-file-name "~/.emacs.d/init.el")


Configura jde y ecb desde emacs:

      M-x customize-variable
      ecb-source-path

      M-x customize-variable
      jde-jdk-registry

En ambos casos, debes guardar tus cambios para futuras sesiones.
