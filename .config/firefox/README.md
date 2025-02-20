# Custom files for Firefox
There are 2 ways to config Firefox: using `about:config` or using js preference files.
Firefox uses 2 files for configuration: `pref.js`(created and managed by Firefox) and `user.js`, with `user.js` takes precendence. Any custom settings should be made through `user.js`.

**IMPORTANT:** when Firefox runs and a `user.js` file is detected, the changes set by `user.js` will be applied to `pref.js`; if a setting is deleted from the `pref.js` file, the same change won't be applied to `pref.js` and will need to be updated manually through `about:config`.

## Instructions
### `user.js`: Copy the file to the directory of the profile currently in use
1. Enter `about:profiles` in the address bar.
2. Look for the profile currently in use, by default it would be `default-release`.
3. In the row for `Root Directory`, select `Open Folder` and paste the `user.js` file in the folder just opened.
4. Restart Firefox to apply the changes.
