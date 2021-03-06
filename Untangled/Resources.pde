
public static class Resources {

    public static PFont gentleTouch;

    public static final String validCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-_";

    public static final String[] logos = {
        "UntangledLogoPortrait_360.png", // 1280x720
        "UntangledLogoPortrait_384.png", // 1366x768
        "UntangledLogoPortrait_450.png", // 1600x900
        "UntangledLogoPortrait_540.png", // 1920x1080
        "UntangledLogoPortrait_720.png", // 2560x1440
        "UntangledLogoPortrait_1080.png", // 3840x2160
    };

    public static String currentLogo() {
        return Resources.logos[Dimen.currentResolution];
    }

    public static String[] bgImages = {
        "GameBackground_1280.png", // 1280x720
        "GameBackground_1366.png", // 1366x768
        "GameBackground_1600.png", // 1600x900
        "GameBackground_1920.png", // 1920x1080
        "GameBackground_2560.png", // 2560x1440
        "GameBackground_3840.png", // 3840x2160
    };

    public static String currentBgImagePath() {
        return Resources.bgImages[Dimen.currentResolution];
    }

    public static PImage currentBgImage;

}