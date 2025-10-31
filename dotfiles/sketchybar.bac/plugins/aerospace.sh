#!/usr/bin/env bash

# Ensure it's executable:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

# DEFAULT_ICONS=(":code:" ":discord:" ":spotify:" ":arc:")
FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

update_workspace_icon() {
	local workspace_id=$1

	local APP_ICONS=$(aerospace list-windows --workspace $workspace_id |
		awk -F '|' '{print $2}' |
		while read -r app_name; do
			$CONFIG_DIR/icon_map.sh "$app_name"
		done | tr '\n' ' ')

	if [ -z "$APP_ICONS" ]; then
		APP_ICONS="⏺︎"
	fi

	if [ "$workspace_id" == "$FOCUSED_WORKSPACE" ]; then
		sketchybar --set $NAME label="⏺︎" background.drawing=on
	else
		sketchybar --set $NAME label="⏺︎" background.drawing=off
	fi
}

update_workspace_icon $1i
