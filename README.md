# How to use this overlay

## with local overlays

[Local overlays](https://wiki.gentoo.org/wiki/Overlay/Local_overlay) should be managed via `/etc/portage/repos.conf/`.
To enable this overlay make sure you are using a recent Portage version (at least `2.2.14`), and create an `/etc/portage/repos.conf/macbook-overlay.conf` file containing precisely:

```
[macbook-overlay]
location = /usr/local/portage/macbook-overlay
sync-type = git
sync-uri = https://github.com/stefan-langenmaier/macbook-overlay.git
priority=9999
```

Afterwards, simply run `emerge --sync`, and Portage should seamlessly make all our ebuilds available.


## with layman

Invoke the following:

	layman -f -a macbook-overlay
	
Or read the instructions on the [Gentoo Wiki](http://wiki.gentoo.org/wiki/Layman#Adding_custom_overlays).

# Installation

After performing those steps, the following should work:

	sudo emerge -av sys-apps/macbook12-spi-driver
