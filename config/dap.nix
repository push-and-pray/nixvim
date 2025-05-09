{_, ...}: {
  plugins = {
    dap.enable = true;
    dap-ui.enable = true;
    dap-virtual-text.enable = true;
  };

  extraConfigLua = ''
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>dd";
      action.__raw = ''
        function()
          require("dapui").toggle()
        end
      '';
      options.desc = "Toggle debugger UI";
    }
    {
      mode = "n";
      key = "<leader>dc";
      action.__raw = ''
        function()
          require("dap").continue()
        end
      '';
      options.desc = "Start or continue debugger";
    }
    {
      mode = "n";
      key = "<leader>dr";
      action.__raw = ''
        function()
          require("dap").repl.toggle()
        end
      '';
      options.desc = "Toggle debugger REPL";
    }
    {
      mode = "n";
      key = "<leader>db";
      action.__raw = ''
        function()
          require("dap").toggle_breakpoint()
        end
      '';
      options.desc = "Toggle breakpoint";
    }
    {
      mode = "n";
      key = "<leader>dl";
      action.__raw = ''
        function()
          require("dap").set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
        end
      '';
      options.desc = "Set logpoint";
    }
    {
      mode = "n";
      key = "<leader>do";
      action.__raw = ''
        function()
          require("dap").step_over()
        end
      '';
      options.desc = "Step over";
    }
    {
      mode = "n";
      key = "<leader>di";
      action.__raw = ''
        function()
          require("dap").step_into()
        end
      '';
      options.desc = "Step into";
    }
    {
      mode = "n";
      key = "<leader>de";
      action.__raw = ''
        function()
          require("dap").run_to_cursor()
        end
      '';
      options.desc = "Run to cursor";
    }
    {
      mode = "n";
      key = "<leader>dt";
      action.__raw = ''
        function()
          require("dap").terminate()
        end
      '';
      options.desc = "Terminate";
    }
  ];
}
