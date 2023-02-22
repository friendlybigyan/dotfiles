#!/bin/sh

kitty @ set-spacing padding=-30
nvim $*
kitty @ set-spacing padding=default
