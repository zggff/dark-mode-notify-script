#!/bin/zsh

THEMES_CHANGER_ALACRITTY=/Users/maxgiga/.yarn/bin/alacritty-themes
THEMES_CHANGER_KITTY=/opt/homebrew/bin/kitty
DARK_ALACRITTY=ayu-mirage
DARK_KITTY=One\ Half
# DARK_WEZTERM=OneHalfDark
DARK_WEZTERM=Ayu\ Mirage
LIGHT_ALACRITTY=ayu-light
LIGHT_KITTY=One\ Half\ Light
# LIGHT_WEZTERM=OneHalfLight
LIGHT_WEZTERM=ayu_light
TMUX_CONF=/Users/maxgiga/.tmux.conf
TMUX_LIGHT=.tmux.theme.light.conf
TMUX_DARK=.tmux.theme.dark.conf


if [[ "$DARKMODE" == 1 ]]; then
   $THEMES_CHANGER_ALACRITTY $DARK_ALACRITTY
   $THEMES_CHANGER_KITTY +kitten themes --reload-in=all $DARK_KITTY
   sed -i .bak "s/color_scheme = \"[^][]*\"/color_scheme = \"$DARK_WEZTERM\"/" ~/.config/wezterm/wezterm.lua
   sed -i .bak "s/$TMUX_LIGHT/$TMUX_DARK/g" $TMUX_CONF
    tmux source $TMUX_CONF
else
    $THEMES_CHANGER_ALACRITTY $LIGHT_ALACRITTY
   $THEMES_CHANGER_KITTY +kitten themes --reload-in=all $LIGHT_KITTY
   sed -i .bak "s/color_scheme = \"[^][]*\"/color_scheme = \"$LIGHT_WEZTERM\"/" ~/.config/wezterm/wezterm.lua
   sed -i .bak "s/$TMUX_DARK/$TMUX_LIGHT/g" $TMUX_CONF
    tmux source $TMUX_CONF
fi
