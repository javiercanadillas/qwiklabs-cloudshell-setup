#!/bin/false
# shellcheck shell=bash
# shellcheck disable=SC2317

# Legacy editor setup
theia_editor_setup() {
  _info "Setting up Theia basic configuration..."
  local -r theia_config_dir="$HOME/.theia"
  # Theia dir may not exist if Theia hasn't been launched yet for the first time
  [[ -d "$theia_config_dir" ]] || {
    mkdir -p "$theia_config_dir"
    cat <<EOF > "$theia_config_dir/settings.json"
{}
EOF
  }
  # Add basic configuration to Theia
  jq '. += {
            "workbench.colorTheme": "Default Dark+",
            "editor.tabSize": 2,
            "editor.fontSize": 14,
            "terminal.integrated.fontSize": 14
            }' "$theia_config_dir/settings.json" > "$theia_config_dir/settings.json.enhanced"
  cp -- "$theia_config_dir/settings.json"{,.backup}
  cp -- "$theia_config_dir/settings.json"{.enhanced,}
}

# Install Pyenv
install_pyenv() {
  _info "Installing Pyenv..."
  curl https://pyenv.run | bash || _error "Couldn't install Pyenv"
  # Preinstall Python 3.12.2
  "$HOME/.pyenv/bin/pyenv" install 3.12.2
}

# Install Python Dependency Manager
install_pmd() {
  _info "Installing Python Dependency Manager..."
  curl -sSL https://pdm-project.org/install-pdm.py | python3 - || _error "Couldn't install Python Dependency Manager"
}

# Install Code OSS extensions
code_oss_extensions_setup() {
  _info "Installing Code OSS extensions..."
  #code_oss_loc="/google/devshell/editor/code-oss-for-cloud-shell/bin/remote-cli/codeoss"
  declare -g code_oss_extensions_list=(
    "timonwong.shellcheck"
    "zhuangtongfa.material-theme"
    "ms-python.vscode-pylance"
    "ms-python.debugpy"
    "mhutchie.git-graph"
    "ms-azuretools.vscode-docker"
    "davidanson.vscode-markdownlint"
  )

  for extension in "${code_oss_extensions_list[@]}"; do
    codeoss --install-extension "$extension" || _error "Couldn't install extension"
  done
}

# Install Code OSS basic configuration
code_oss_main_setup() {
  _info "Setting up Code OSS basic configuration..."
  codeoss_settings_dest="$HOME/.codeoss/data/Machine/settings.json"
  # shellcheck disable=SC2154
  envsubst < "$config_dir/${file_names[codeoss_settings]}" > "${codeoss_settings_dest}"
}

main() {
  install_pyenv
  theia_editor_setup
  code_oss_extensions_setup
  code_oss_main_setup
}

main "$@"
