# pack.sh
---

## WHAT:
Pack Chrome Extensions as version-ed zips for deploying on the Web Store. Works on any machine with bash. Simply call:

```bash
$ ./pack
```

## HOW:
Keep this script in top-level of Chrome Extension project, right above the folder where you keep the extension's `manifest.json`. The top level can contain the stuff you need for development, but shouldn't be packaged into the final deployable zip, like your `.git` folder, screen-shots, build scripts, `README.md` etc. I usually call the folder to be packaged `extension/`, and then place `manifest.json`, `src`, `lib` etc. under it. For example, the [PrettyPrintGmail](https://chrome.google.com/webstore/detail/pretty-print-gmail/gdanfldekhdgkbmdoeapbgbcpfglkflg?hl=en) Chrome Extension folder structure looks like this (every two dashed lines represents one tree level):

```
   |--CHANGELOG.md
   |--README.md
   |--pack.sh
   |--screenshots/
   |----screenshot1.png
   |----...
   |--extension/
   |----manifest.json
   |----assets/
   |------icon-128.png
   |------...
   |----lib/
   |------helper.js
   |----src/
   |------background.js
   |------print.js
   |------...
```


The script checks the current version from the manifest file, and repacks the source code into a new version-numbered zip, deleting the previous version-ed zip if it exists. 

Note: Removes .DS_Stores before packaging, if on Mac.

If you want to bump up the version number in the `manifest.json` before packing, pass in `bump` as an argument to the script:

```bash
$ ./pack bump
```

This will increment the version in the manifest and package the extension with the new version number.

