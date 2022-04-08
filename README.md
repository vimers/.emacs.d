# Summary
The simplest emacs setting for org usage

# Usage
1. First clone the repo to emacs user dir. `~/.emacs.d` in linux `USER/Roaming/.emacs.d` in windows

   ```shell
   git clone https://github.com/vimers/.emacs.d.git
   ```
2. Set font using following script in `custom.el`

    ```emacs-lisp
    (set-face-attribute 'default nil :font "Noto Sans 18")
    ```
3. Open the emacs and package installing will be done automatically

# Attension
* Make sure `.emacs` not exists in home direcotry, otherwise all config files in `.emacs.d` will not be loaded.
* If you use proxy, just add following config to custom.el.

  ```elisp
  (setq url-proxy-services '(("no_proxy" . "localhost")
                             ("http" . "http://user:pass@proxy.url:port")))
  ```

# Shortcut description

| Key | Desc |
|:--|:--|
|C-c a| org-agenda |
|C-c c| org-capture |
|C-x g| magit-status |
|C-= | expand-region |
