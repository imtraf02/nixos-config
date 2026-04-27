{ config, ... }: {
  config.var = {
    hostname = "laptop";

    # Upgrade/GC opt-ins
    autoUpgrade = false;
    autoGarbageCollector = true;

    # Locale & Keyboard
    location = "Vietnam";
    timeZone = "Asia/Ho_Chi_Minh";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";
    keyboardLayout = "us";
  };

}
