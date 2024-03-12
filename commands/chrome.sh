#!/bin/sh

# Usage Guide
#
# Pass the profile number and url (optional):
# ```
# ./chrome.sh 1 https://google.com
# ```

profile_number=$1
url=''

if [ $# -gt 1 ]; then
	url=$2
fi

eval "chromium --args --profile-directory='Profile $profile_number' $url > /dev/null 2>&1 & disown"
