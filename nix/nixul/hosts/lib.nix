{ lib, ... }:
{
  hasTag = tag: host: lib.elem tag host.tags;
}
