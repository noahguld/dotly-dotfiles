#!/bin/bash

function install {
    if [ $OS = "OSX" ]; then
	# Ask for the administrator password upfront
	sudo -v

	###############################################################################
	# MISC                                                                        #
	###############################################################################

	# Create the Screenshots folder if it does not exist
	mkdir -p "$HOME/Screenshots"

	# Save screenshots to the ~/Screenshots folder
	defaults write com.apple.screencapture location -string "$HOME/Screenshots"

	# Disable the 'Are you sure you want to open this application?' dialog
	defaults write com.apple.LaunchServices LSQuarantine -bool false

	###############################################################################
	# General UI/UX                                                               #
	###############################################################################

	 # Enable Dark Mode
	/usr/bin/defaults write NSGlobalDomain AppleInterfaceStyle -string Dark

	# Show the ~/Library folder.
	chflags nohidden ~/Library

	# Always open everything in Finder's list view. This is important.
	defaults write com.apple.Finder FXPreferredViewStyle Nlsv

	# Expand save panel by default
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

	# Save to disk (not to iCloud) by default
	defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

	# Disable automatic capitalization as it’s annoying when typing code
	defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

	###############################################################################
	# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
	###############################################################################

	# Trackpad: enable tap to click for this user and for the login screen
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

	# Trackpad: speed up the trackpad
	defaults write NSGlobalDomain com.apple.trackpad.scaling -int 4

	# Enable full keyboard access for all controls
	# (e.g. enable Tab in modal dialogs)
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

	# Disable press-and-hold for keys in favor of key repeat
	defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

	# Set a blazingly fast keyboard repeat rate
	defaults write NSGlobalDomain KeyRepeat -int 2
	defaults write NSGlobalDomain InitialKeyRepeat -int 15


	###############################################################################
	# Finder                                                                      #
	###############################################################################

	# Finder: show hidden files by default
	defaults write com.apple.finder AppleShowAllFiles -bool true

	# Finder: show all filename extensions
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true

	 # Search Current Folder by Defaults
	/usr/bin/defaults write com.apple.finder FXDefaultSearchScope 'SCcf'

	# Finder: show status bar
	defaults write com.apple.finder ShowStatusBar -bool true

	# Finder: show path bar
	defaults write com.apple.finder ShowPathbar -bool true

	# Expand the following File Info panes:
	# “General”, “Open with”, and “Sharing & Permissions”
	defaults write com.apple.finder FXInfoPanesExpanded -dict \
		General -bool true \
		Name -bool true \
		OpenWith -bool true \
		Privileges -bool false 

	# Enable spring-loading directories and decrease default delay.
	  /usr/bin/defaults write NSGlobalDomain com.apple.springing.enabled -bool  true
	/usr/bin/defaults write NSGlobalDomain com.apple.springing.delay -float 0.2

	# Always open everything in Finder's list view
	defaults write com.apple.Finder FXPreferredViewStyle Nlsv

	# Save to disk by default, instead of iCloud
	defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

	###############################################################################
	# Dock, Dashboard, and hot corners                                            #
	###############################################################################

	# Don’t group windows by application in Mission Control
	# (i.e. use the old Exposé behavior instead)
	#defaults write com.apple.dock expose-group-by-app -bool false 

	# Disable Dashboard
	defaults write com.apple.dashboard mcx-disabled -bool true

	# Don’t show Dashboard as a Space
	defaults write com.apple.dock dashboard-in-overlay -bool true

	# Don’t automatically rearrange Spaces based on most recent use
	defaults write com.apple.dock mru-spaces -bool false

	# Hot corners
	# Possible values:
	#  0: no-op
	#  2: Mission Control
	#  3: Show application windows
	#  4: Desktop
	#  5: Start screen saver
	#  6: Disable screen saver
	#  7: Dashboard
	# 10: Put display to sleep
	# 11: Launchpad
	# 12: Notification Center
	# Top left screen corner
	defaults write com.apple.dock wvous-tl-corner -int 2
	defaults write com.apple.dock wvous-tl-modifier -int 0
	# Top right screen corner
	defaults write com.apple.dock wvous-tr-corner -int 0
	defaults write com.apple.dock wvous-tr-modifier -int 0
	# Bottom left screen corner
	defaults write com.apple.dock wvous-bl-corner -int 4
	defaults write com.apple.dock wvous-bl-modifier -int 0
	# Bottom right screen corner
	defaults write com.apple.dock wvous-br-corner -int 11
	defaults write com.apple.dock wvous-br-modifier -int 0
    else
	err "Mac defaults can only be installed on OSX ;)"
    fi
}
