
I have only been successful with the Docker image method of building ZMK. There is literally Gigabytes of dependencies and source code.

1. Clone the entire ZMK repo with `git clone git@github.com:zmkfirmware/zmk.git`
3. Install [Dev Containers - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) Extension and Docker Desktop.
1. Open the ZMK repo in VSCode, then re-open it in a dev container. `code .`
2. In VSCode, in the dev container remote instance, in the terminal run:

		west init -l app/
		west update

4. Close VSCode and stop all docker zmk containers. (List containers with `docker ps` stop with `docker stop CONTAINER_ID`). Then set the default location of your own config repo:

		docker container prune
		docker volume rm zmk-config
		docker volume create --driver local -o o=bind -o type=none -o device="/full/path/to/your/zmk-config/" zmk-config

1. Reopen VSCode in the zmk repo: `code .` and click the notification to reopen in the Dev Container. Open the terminal. Check the correct config files are in `/workspaces/zmk-config`. This folder is a live connection to the actual folder on your pc.
3. Now you can finally build your files for the first time into the `build/left/zephr/` directory.

		cd /workspaces/zmk/app/
		west build -d build/left -b nice_nano_v2 -- -DSHIELD=kyria_left -DZMK_CONFIG="/workspaces/zmk-config/config -p 
		west build -d build/right -b nice_nano_v2 -- -DSHIELD=kyria_left -DZMK_CONFIG="/workspaces/zmk-config/config -p 

4. For future builds, simply run 

		cd /workspaces/zmk/app/
		west build -d build/left
		west build -d build/right


