{ lib, config, ... }:
{
  hasTag = tag: user: lib.elem tag user.tags;
  isPrimary = user: user.name == config.nixul.primaryUser;
}
