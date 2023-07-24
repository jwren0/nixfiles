{
    enable = true;
    settings = {
        # Force dark theme
        "browser.theme.content-theme" = 0;
        "browser.theme.toolbar-theme" = 0;
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";

        # Disable smooth scrolling
        "general.smoothScroll" = false;

        # Disable some clipboard settings
        "clipboard.autocopy" = false;
        "middlemouse.paste" = false;

        # Disable IPv6
        "network.dns.disableIPv6" = true;

        # Limit cross-origin referrers
        "network.http.referer.XOriginPolicy" = 2;

        # Change "Logins and Passwords" settings
        "signon.firefoxRelay.feature" = "disabled";
        "signon.management.page.breach-alerts.enabled" = false;
        "signon.rememberSignons" = true;

        # Strict default permissions
        "permissions.default.camera" = 2;
        "permissions.default.desktop-notification" = 2;
        "permissions.default.geo" = 2;
        "permissions.default.microphone" = 2;
        "permissions.default.xr" = 2;
        "privacy.donottrackheader.enabled" = true;

        # Disable bookmarks on new tabs/pages
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;

        # Make the browser more usable
        "privacy.clearOnShutdown.cookies" = false;
        "privacy.clearOnShutdown.downloads" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.sanitize.sanitizeOnShutdown" = false;
        "privacy.resistFingerprinting.autoDeclineNoUserInputCanvasPrompts" = true;
    };
}
