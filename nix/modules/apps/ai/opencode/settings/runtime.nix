{
  compaction = {
    auto = true;
    prune = true;
    reserved = 10000;
  };

  watcher.ignore = [
    ".git/**"
    "node_modules/**"
    "result/**"
  ];
}
