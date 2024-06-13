# Favorite apps for dock
apps=(
	"google-chrome.desktop"
	"org.gnome.Terminal.desktop"
	"dev.warp.Warp.desktop"
	"code.desktop"
	"telegram.desktop"
	"spotify.desktop"
	"typora.desktop"
	"pinta_pinta.desktop"
	"com.github.xournalpp.xournalpp.desktop"
	"org.gnome.Settings.desktop"
	"org.gnome.Nautilus.desktop"
)

# Array to hold installed favorite apps
installed_apps=()

# Directory where .desktop files are typically stored
desktop_dirs=(
	"/usr/share/applications"
	"/usr/local/share/applications"
	"$HOME/.local/share/applications"
)

# Check if a .desktop file exists for each app
for app in "${apps[@]}"; do
	for dir in "${desktop_dirs[@]}"; do
		if [ -f "$dir/$app" ]; then
			installed_apps+=("$app")
			break
		fi
	done
done

# Convert the array to a format suitable for gsettings
favorites_list=$(printf "'%s'," "${installed_apps[@]}")
favorites_list="[${favorites_list%,}]"

# Set the favorite apps
gsettings set org.gnome.shell favorite-apps "$favorites_list"
# Set default pinned applications (funny installer name to ensure it runs after all app installations!)
