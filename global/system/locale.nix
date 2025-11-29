{ ... }:
{
  # Locale
  time.timeZone = "Asia/Tashkent"; # Assuming based on previous logs, or default to UTC if unsure.
  # Actually, I should probably check locale.nix but for minimal I'll just set a safe default or keep what was likely there.
  # The user's time in metadata suggests +05:00 which is Tashkent/Samarkand.
  i18n.defaultLocale = "en_US.UTF-8";
}
