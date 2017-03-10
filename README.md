# pack.sh

Pack Chrome Extensions as versioned zips for deploying on the Web Store. Works on any machine with bash. Optionally also bump up version number in `manifest.json`

```bash
$ ./pack [bump]
```

## Install
Get the script and keep in your Chrome Extension project: [pack.sh](https://raw.githubusercontent.com/ShivanKaul/pack.sh/master/pack.sh)

## Usage
Create a directory named `extension/` and put all the code you want packaged as your Chrome Extension inside it. The `manifest.json` should be immediately inside (one folder below) `extension/`. Keep this `pack.sh` script one directory above `manifest.json` (i.e. same directory level as `extension/`), along with dev stuff like `.git`, screen-shots, `README.md`, etc. For example, the [PrettyPrintGmail](https://chrome.google.com/webstore/detail/pretty-print-gmail/gdanfldekhdgkbmdoeapbgbcpfglkflg?hl=en) Chrome Extension folder structure looks like this (every two dashed lines represents one tree level):

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


The script checks the current version from the manifest file, and repacks the source code into a new version-numbered zip, deleting the previous versioned zip if it exists. 

Note: Removes .DS_Stores before packaging, if on Mac.

If you want to bump up the version number in the `manifest.json` before packing, pass in `bump` as an argument to the script. Note that it is assumed that you've versioned your extension in the [{major}.{minor}.{patch}](http://semver.org/) way.

```bash
$ ./pack bump
```

This will increment the version in the manifest and package the extension with the new version number.

