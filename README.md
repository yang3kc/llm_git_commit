# Introduction

Command line tools to use LLM to generate git commits.

Inspired by https://gist.github.com/karpathy/1dd0294ef9567971c1e4348a90d69285 and https://github.com/jesseduffield/lazygit/issues/3212#issuecomment-2161436126.

# Dependencies

- OpenAI API key
- [llm](https://github.com/simonw/llm): a command line tool to interface with LLMs
- [fzf](https://github.com/junegunn/fzf): a command line tool to fuzzy search through text, for interactive selection of commits

# How to use

After you clone the repo, you can move (or create a symlink to) the `gclm.sh` file to a directory in your PATH, e.g. `/usr/local/bin`.

Then, under a git repo, after you stage your changes, you can run `gclm` to generate commit messages.

For lazygit users, you can add the following to your [config file](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md):

```yml
customCommands:
  - key: <c-a>
    description: Pick AI commit
    command: gclm
    subprocess: true
```

This allows you to generate commit messages with `Ctrl-a` after you stage your changes.