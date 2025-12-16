PATH=/Users/edowning/bin:/Users/edowning/java/jdk-25.jdk/Contents/Home/bin:/usr/local/bin:$PATH
JAVA_HOME=/Users/edowning/java/jdk-25.jdk/Contents/Home
alias python=python3

# Load the vcs_info module
autoload "-Uz" vcs_info add-zsh-hook

# Define how the Git info should be formatted
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:git:*' actionformats '(%b | %a)'
zstyle ':vcs_info:*' enable git # Explicitly enable git svn hg

# Hook into the precmd function to update git info before each prompt
update_vcs_info() {
  unset vcs_info_msg_string
  vcs_info
}

add-zsh-hook precmd update_vcs_info
# Enable prompt substitution
setopt PROMPT_SUBST


PROMPT=$'[%*][%n@%ms] %~ 
${vcs_info_msg_0_}->'
