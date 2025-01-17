# 2.0.0

* Support for multiple tab sharing. Any tab opened in the window of a sharing section will be synced across to the partner.
* Killing some views in favour of Atom's Notifications API.
* Support for autocomplete/snippets. Previously it would cause clients becoming out of sync.
* Automatic copying of session ID to the clipboard

####1.1.6

Replaces deprecated jQuery event listeners on views with Atom command registry events.

####1.1.5

Removes css id attribute of editor only if there is an active editor. 
Added little x to close view panels.

####1.1.4

Ensures there are no references to a destroyed editor within the package.

####1.1.3

* Package now ensures an active editor.
* Package only registers customPaste command if user is in a pairing session.

####1.1.1

* Fixed issue with Slack invite

### 1.1.0

* Removed deprecated calls ahead of Atom version 1.0.0.
* Fixed issues with the package swallowing escape key.
* Resolved issues where package mistakenly says you are in a pairing session.

### 1.0.1

* Package load time has dropped by around 100ms to around 21ms.

## 1.0.0
* Uses package settings page for app configuration instead of a new config menu
* Has Slack invitations added
* Handles large deletions and insertions

# Pre 1.0.0

* Text synchronization
* File-sharing
* HipChat invitations
* Synchronized syntax highlighting
* Collaborator visibility.
