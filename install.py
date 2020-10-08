import time
import os 

VIMRC_PATH = f".vimrc"
BASH_PROFILE_PATH = f".bash_profile"
SLATE_PATH = f".slate"
GIT_CONFIG_PATH = f".gitconfig"
INPUTRC_PATH = f".inputrc"

home = os.path.expanduser("~")
HOME_VIMRC_PATH = f"{home}/{VIMRC_PATH}"
HOME_BASH_PROFILE_PATH = f"{home}/{BASH_PROFILE_PATH}"
HOME_SLATE_PATH = f"{home}/{SLATE_PATH}"
HOME_GIT_CONFIG_PATH = f"{home}/{GIT_CONFIG_PATH}"
HOME_INPUTRC_PATH = f"{home}/{INPUTRC_PATH}"

profile = os.path.dirname(os.path.realpath(__file__))
PROFILE_VIMRC_PATH = f"{profile}/{VIMRC_PATH}"
PROFILE_BASH_PROFILE_PATH = f"{profile}/{BASH_PROFILE_PATH}"
PROFILE_SLATE_PATH = f"{profile}/{SLATE_PATH}"
PROFILE_GIT_CONFIG_PATH = f"{profile}/{GIT_CONFIG_PATH}"
PROFILE_INPUTRC_PATH = f"{profile}/{INPUTRC_PATH}"

replace = False

def backup(path):
    bu_path = f"{path}.old.{int(time.time()*1000)}"
    print(f"Backing up {path} to {bu_path}")
    os.rename(path, bu_path)

if replace:
    backup(VIMRC_PATH)
    backup(BASH_PROFILE_PATH)
    backup(SLATE_PATH)
    backup(GIT_CONFIG_PATH)

def writelines(f, lines):
    f.writelines(["\n"] + list(map(lambda line: f"{line}\n", lines)))

with open(HOME_VIMRC_PATH, "a") as vimrc:
    print(f"Updating {HOME_VIMRC_PATH}")
    writelines(vimrc, [f"source {PROFILE_VIMRC_PATH}"])

with open(HOME_BASH_PROFILE_PATH, "a") as bash_profile:
    print(f"Updating {HOME_BASH_PROFILE_PATH}")
    writelines(bash_profile, [f"source {PROFILE_BASH_PROFILE_PATH}"])

with open(HOME_SLATE_PATH, "a") as slate:
    print(f"Updating {HOME_SLATE_PATH}")
    writelines(slate, [f"source {PROFILE_SLATE_PATH} ifexists"])

with open(HOME_GIT_CONFIG_PATH, "a") as git_config:
    print(f"Updating {HOME_GIT_CONFIG_PATH}")
    writelines(
        git_config,
        [
            "[include]",
            f"\tpath = {PROFILE_GIT_CONFIG_PATH}"
        ]
    )

with open(HOME_INPUTRC_PATH, "a") as inputrc:
    print(f"Updating {HOME_INPUTRC_PATH}")
    writelines(inputrc, [f"$include {PROFILE_INPUTRC_PATH}"])
