{
  default_agent = "orchestrator";

  agent = {
    orchestrator = {
      description = "Coordinate planning, implementation, and review subagents";
      mode = "primary";
      permission.task = {
        "*" = "deny";
        "planner" = "allow";
        "explorer" = "allow";
        "implementer" = "allow";
        "reviewer" = "allow";
      };
    };

    planner = {
      description = "Create concrete implementation plans with constraints";
      mode = "subagent";
      tools = {
        edit = false;
        write = false;
        patch = false;
        bash = false;
      };
    };

    explorer = {
      description = "Fast repository exploration and codebase discovery";
      mode = "subagent";
      tools = {
        edit = false;
        write = false;
        patch = false;
      };
    };

    implementer = {
      description = "Implement approved changes following project conventions";
      mode = "subagent";
    };

    reviewer = {
      description = "Review edits for correctness, risk, and style";
      mode = "subagent";
      tools = {
        edit = false;
        write = false;
        patch = false;
      };
    };
  };
}
