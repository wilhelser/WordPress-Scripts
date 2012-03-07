WordPress Scripts
=====================

Some scripts to help speed up some of the more tedious tasks of WordPress development

Usage
=============

For the rakefile, the tasks are broken into namespaces ( db, uploads, plugins, theme, mu)

Each namespace has to functions: push and pull ( example: rake uploads:pull -- this will sync local directory with the remote directory )


Notes
=============

Right now, the operations in the theme namespace uses the --delete option with Rsync, so it will delete from the destination directory any files or directories that don't exist in the source directory. You can remove that if you don't want it.

I've included an example exclude.txt file for files/directories that you don't want to be synced ( like a .gitignore but for Rsync)