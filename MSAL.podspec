{
  "name": "MSAL",
  "version": "0.2.4",
  "summary": "Microsoft Access Layer POD.",
  "description": "The MSAL library preview for iOS gives your app the ability to begin using the Microsoft Cloud by supporting Microsoft Azure Active Directory and Microsoft Accounts in a converged experience using industry standard OAuth2 and OpenID Connect. The library also supports Microsoft Azure B2C for those using our hosted identity management service.\n\nThe source is branched from MSAL official master 0.1.1 at time of speaking. The pod version is just an internal version.\n\nNote that for the preview, only iOS is supported with this pod.",
  "homepage": "https://github.com/barger27/microsoft-authentication-library-for-objc.git",
  "license": {
    "type": "MIT",
    "file": "LICENSE"
  },
  "authors": {
    "shuurai": "Ryan@Barger.com"
  },
  "source": {
    "git": "https://github.com/barger27/microsoft-authentication-library-for-objc.git",
    "tag": "0.1.1"
  },
  "platforms": {
    "ios": "9.3"
  },
  "prefix_header_file": "MSAL/AzureSource/MSAL/src/MSAL.pch",
  "public_header_files": [
    "MSAL/AzureSource/MSAL/src/public/MSALResult.h",
    "MSAL/AzureSource/MSAL/src/public/MSALUIBehavior.h",
    "MSAL/AzureSource/MSAL/src/public/MSALUser.h",
    "MSAL/AzureSource/MSAL/src/public/MSALTelemetry.h",
    "MSAL/AzureSource/MSAL/src/public/MSALError.h",
    "MSAL/AzureSource/MSAL/src/public/MSALPublicClientApplication.h",
    "MSAL/AzureSource/MSAL/src/public/MSAL.h",
    "MSAL/AzureSource/MSAL/src/public/MSALLogger.h",
    "MSAL/Classes/*.h"
  ],
  "source_files": [
    "MSAL/AzureSource/MSAL/src/**/*.{h,m}",
    "MSAL/Classes/*.{h,m}"
  ],
  "exclude_files": [
    "MSAL/AzureSource/MSAL/src/**/mac/*",
    "MSAL/AzureSource/MSAL/src/cache/mac/*",
    "MSAL/AzureSource/MSAL/src/public/mac/*",
    "MSAL/AzureSource/MSAL/src/ui/mac/*"
  ],
  "xcconfig": {
    "OTHER_LDFLAGS": "-ObjC"
  },
  "prepare_command": "git submodule update --init --recursive"
}