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
				mapping = {
				  "<C-Space>" = "cmp.mapping.complete()";
				  "<C-d>" = "cmp.mapping.scroll_docs(-4)";
				  "<C-e>" = "cmp.mapping.close()";
				  "<C-f>" = "cmp.mapping.scroll_docs(4)";
				  "<CR>" = "cmp.mapping.confirm({ select = true })";
				  "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
				  "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";	
				};
				sources = [
					{
						name = "codeium";
					}
				];
			};
		};
	};
    };
  };
}
