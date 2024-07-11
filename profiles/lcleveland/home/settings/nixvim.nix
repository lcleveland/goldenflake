{ inputs, settings, ... }: {
  home-manager.users.${settings.username} = {
    imports = [
      inputs.nixvim.homeManagerModules.nixvim
    ];
    programs.nixvim = {
    	enable = true;
	defaultEditor = true;
	vimAlias = true;
	colorschemes.nightfox = {
		enable = true;
		flavor = "carbonfox";
	};
	plugins = {
		codeium-nvim = {
			enable = true;
		};
		cmp = {
			enable = true;
			settings = {
				sources = [
					"codeium"
				];
			};
		};
	};
    };
  };
}
