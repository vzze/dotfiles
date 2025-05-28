#!/bin/sh

xrdb ~/.Xresources

exec dbus-launch $@
