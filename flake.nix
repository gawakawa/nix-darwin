{
	description = "Darwin system flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		nix-darwin = {
			url = "github:LnL7/nix-darwin";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }:
	{
		# Build darwin flake using:
		# $ darwin-rebuild build --flake ".#mac" --impure
		darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
			system = "aarch64-darwin";
			modules = [ 
				./configuration.nix 
				# home-manager
				home-manager.darwinModules.home-manager
				{
					home-manager = {
						backupFileExtension = "backup";
						useGlobalPkgs = true;
						useUserPackages = true;
						users.kawa = import /Users/kawa/.config/nix-darwin/home.nix;
					};
				}
			];
			
			specialArgs = { inherit (inputs) self nixpkgs; };
		};

		# Expose the package set, including overlays, for convenience.
		darwinPackages = self.darwinConfigurations."mac".pkgs;
	};
}
