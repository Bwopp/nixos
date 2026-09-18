{
  idle = {
    behavior_order = [
      "lock"
      "screen-off"
      "lock-and-suspend"
    ];
    pre_action_fade_seconds = 2.0;
    behavior.lock = {
      action = "lock";
      command = "";
      enabled = false;
      resume_command = "";
      timeout = 600.0;
    };
    behavior."lock-and-suspend" = {
      action = "lock_and_suspend";
      command = "";
      enabled = false;
      resume_command = "";
      timeout = 900.0;
    };
    behavior."screen-off" = {
      action = "screen_off";
      command = "";
      enabled = true;
      resume_command = "";
      timeout = 660.0;
    };
  };
}