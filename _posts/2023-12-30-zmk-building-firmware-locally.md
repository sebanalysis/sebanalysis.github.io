
I have only been successful with the Docker image method of building ZMK. There is literally Gigabytes of dependencies and source code.

1. Install Docker Desktop.
2. Clone the entire ZMK repo with `git clone git@github.com:zmkfirmware/zmk.git`. 
3. Open the ZMK repo in VSCode with `code .`
4. Install [Dev Containers - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) Extension then click on the bottom left blue square and then 'Reopen in Container'. 
6. In the dev container remote instance, in the terminal run, which will take about 15 mins:

		west init -l app/
		west update

4. Close VSCode and check the zmk containers is stopped. (List containers with `docker ps` stop with `docker stop CONTAINER_ID`, or do it in Docker Desktop). Then set the default location of your own config repo, in windows CMD:

		docker container prune
		docker volume rm zmk-config

1. replace `[path_to]` in the following and run:  

		docker volume create --driver local -o o=bind -o type=none -o device="C:/Users/[path_to]/zmk-config/" zmk-config


1. Reopen VSCode in the zmk repo: `code .` and click the notification to reopen in the Dev Container. Open the terminal. Check the correct config files are in `/workspaces/zmk-config`. This folder is a live connection to the actual folder on your pc.
3. Now you can finally build your files for the first time into the `build/left/zephr/` directory.

		cd /workspaces/zmk/app/
		west build -p -d build/left -b nice_nano_v2 -- -DSHIELD=kyria_left -DZMK_CONFIG="/workspaces/zmk-config/config"
		west build -p -d build/right -b nice_nano_v2 -- -DSHIELD=kyria_right -DZMK_CONFIG="/workspaces/zmk-config/config" 

4. For future builds, simply run:

		cd /workspaces/zmk/app/
		west build -d build/left
		west build -d build/right

1. Copy out the `/workspaces/zmk/app/build/left/zephyr/zmk.uf2` file to the local disk and drag onto the keyboard.

