# gdtoml_steamdeck
Building gdtoml for the Steam Deck

# Project setup

 - gdtoml is a git submodule of this repo, and it has its own submodules. Run `git submodule update --init --recursive` from project root.
 - Build the Docker container with: `docker build -t gdtoml-steamdeck .`

# Update before building
Pull the latest from gdtoml using `git submodule update --remote`.
