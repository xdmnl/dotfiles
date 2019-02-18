#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../utils.sh"

# Close any open `System Preferences` panes in order to
# avoid overriding the preferences that are being changed.

./close_system_preferences_panes.applescript

###############################################################################
# General UI/UX                                                               #
###############################################################################

print_in_purple "\n • UI & UX\n\n"

execute "sudo pmset -a standbydelay 86400" \
  "Set standby delay to 24 hours"

execute "sudo nvram SystemAudioVolume=\" \"" \
  "Disable the sound effects on boot"

execute "defaults write NSGlobalDomain AppleInterfaceStyle -string 'Dark'" \
  "Enable Dark mode"

execute "for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
          sudo defaults write \"\${domain}\" dontAutoLoad -array \
            '/System/Library/CoreServices/Menu Extras/User.menu' \
            '/System/Library/CoreServices/Menu Extras/Battery.menu' \
            '/System/Library/CoreServices/Menu Extras/Clock.menu'
         done \
          && sudo defaults write com.apple.systemuiserver menuExtras -array \
            '/System/Library/CoreServices/Menu Extras/TimeMachine.menu' \
            '/System/Library/CoreServices/Menu Extras/Volume.menu' \
            '/System/Library/CoreServices/Menu Extras/Bluetooth.menu' \
            '/System/Library/CoreServices/Menu Extras/AirPort.menu'
      " \
  "Configure menu bar icons"

execute "defaults write NSGlobalDomain AppleShowScrollBars -string 'WhenScrolling'" \
  "Show scrollbars when scrolling"

execute "defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true && \
         defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true" \
  "Expand save panel by default"

execute "defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true && \
         defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true" \
  "Expand print panel by default"

execute "defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1" \
  "Check for software updates daily, not just once per week"

execute "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string 'xdmnl' && \
         sudo scutil --set ComputerName 'xdmnl' && \
         sudo scutil --set HostName 'xdmnl' && \
         sudo scutil --set LocalHostName 'xdmnl'" \
  "Set computer name"

###############################################################################
# Screen                                                                      #
###############################################################################

print_in_purple "\n • Screen\n\n"

execute "defaults write com.apple.screensaver askForPassword -int 1 && \
         defaults write com.apple.screensaver askForPasswordDelay -int 0"\
  "Require password immediately after into sleep or screen saver mode"

execute "defaults write com.apple.screencapture location -string '$HOME/Desktop'" \
  "Save screenshots to the Desktop"

execute "defaults write com.apple.screencapture type -string 'png'" \
  "Save screenshots as PNGs"

# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
execute "defaults write NSGlobalDomain AppleFontSmoothing -int 1" \
  "Enable subpixel font rendering on non-Apple LCDs"

###############################################################################
# Trackpad, keyboard, Bluetooth accessories, and input                        #
###############################################################################

print_in_purple "\n • Trackpad, Keyboard & Sound\n\n"

execute "defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false" \
  "Disable press-and-hold in favor of key repeat"

execute "defaults write NSGlobalDomain KeyRepeat -int 1 && \
         defaults write NSGlobalDomain InitialKeyRepeat -int 10" \
  "Set a blazingly fast keyboard repeat rate"

execute "defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false" \
  "Disable automatic capitalization"

execute "defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false" \
  "Disable automatic correction"

execute "defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false" \
  "Disable automatic period substitution"

execute "defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false" \
  "Disable smart dashes"

execute "defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false" \
  "Disable smart quotes"

execute "defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false" \
  "Disable “natural” scrolling"

execute "defaults write com.apple.BluetoothAudioAgent 'Apple Bitpool Min (editable)' -int 40" \
  "Increase sound quality for Bluetooth headphones/headsets"

execute "defaults write com.apple.BezelServices kDim -bool true" \
  "Automatically illuminate built-in MacBook keyboard in low light"

execute "defaults write com.apple.BezelServices kDimTime -int 300" \
  "Turn off keyboard illumination when computer is not used"

###############################################################################
# Finder                                                                      #
###############################################################################

print_in_purple "\n • Finder\n\n"

execute "defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'" \
  "Search the current directory by default"

execute "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false" \
  "Disable warning when changing a file extension"

execute "defaults write com.apple.finder FXPreferredViewStyle -string 'clmv'" \
  "Use column view in all Finder windows by default"

execute "defaults write com.apple.finder NewWindowTarget -string 'PfLo' && \
         defaults write com.apple.finder NewWindowTargetPath -string 'file://$HOME/'" \
  "Set 'Home' as the default location for new Finder windows"

execute "defaults write com.apple.finder ShowRecentTags -bool false" \
  "Do not show recent tags"

execute "defaults write NSGlobalDomain AppleShowAllExtensions -bool true" \
  "Show all filename extensions"

execute "defaults write com.apple.finder ShowStatusBar -bool true" \
  "Show status bar"

execute "defaults write NSGlobalDomain com.apple.springing.enabled -bool true && \
         defaults write NSGlobalDomain com.apple.springing.delay -float 0" \
  "Enable fast spring loading for directories"

execute "chflags nohidden ~/Library" \
  "Show the ~/Library folder"

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

print_in_purple "\n • Dock\n\n"

execute "defaults write com.apple.dock autohide -bool true" \
  "Automatically hide/show the Dock"

execute "defaults write com.apple.dock autohide-delay -float 0" \
  "Disable the hide Dock delay"

execute "defaults write com.apple.dock mru-spaces -bool false" \
  "Do not automatically rearrange spaces based on most recent use"

execute "defaults write com.apple.dock persistent-apps -array" \
  "Wipe all app icons"

execute "defaults write com.apple.dock show-process-indicators -bool true" \
  "Show indicator lights for open applications"

execute "defaults write com.apple.dock showhidden -bool true" \
  "Make icons of hidden applications translucent"

execute "defaults write com.apple.dock tilesize -int 36" \
  "Set icon size"

execute "defaults write com.apple.dashboard mcx-disabled -bool true" \
  "Disable Dashboard"

execute "defaults write com.apple.dock dashboard-in-overlay -bool true" \
  "Don’t show Dashboard as a Space"

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
execute "defaults write com.apple.dock wvous-tl-corner -int 1 && \
         defaults write com.apple.dock wvous-tl-modifier -int 1048576" \
  "Hot corner: Top left → noop"

execute "defaults write com.apple.dock wvous-tr-corner -int 1 && \
         defaults write com.apple.dock wvous-tr-modifier -int 1048576" \
  "Hot corner: Top right → noop"

execute "defaults write com.apple.dock wvous-bl-corner -int 4 && \
         defaults write com.apple.dock wvous-bl-modifier -int 0" \
  "Hot corner: Bottom left → Desktop"

execute "defaults write com.apple.dock wvous-br-corner -int 1 && \
         defaults write com.apple.dock wvous-br-modifier -int 1048576" \
  "Hot corner: Bottom right → noop"

###############################################################################
# TextEdit                                                                    #
###############################################################################

print_in_purple "\n • TextEdit\n\n"

execute "defaults write com.apple.TextEdit PlainTextEncoding -int 4 && \
         defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4" \
  "Open and save files as UTF-8 encoded"

execute "defaults write com.apple.TextEdit RichText 0" \
  "Use plain text mode for new documents"

###############################################################################
# Photos                                                                      #
###############################################################################

print_in_purple "\n • Photos\n\n"

execute "defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true" \
  "Prevent Photos from opening automatically when devices are plugged in"

###############################################################################
# Time Machine                                                                #
###############################################################################

print_in_purple "\n • Time Machine\n\n"

execute "defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true" \
  "Prevent Time Machine from prompting to use new hard drives as backup volume"

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" \
	"cfprefsd" \
	"Dock" \
	"Finder" \
	"Photos" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done
