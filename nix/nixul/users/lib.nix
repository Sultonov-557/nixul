{ config, ... }:
{
  isPrimary = user: user.name == config.nixul.primaryUser;
}
