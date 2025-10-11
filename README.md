# Introduction

Command line tools to use AI coding agents and LLms to generate git commits.

Two different approaches are implemented:
1. Using Claude Code in headless model
2. Using LLMs to generate commit messages

# Claude Code based approach

## Dependencies

You need to install Claude Code and log in to your Claude account.

After you clone the repo, you can move the `gccl.sh` file to a directory in your PATH, e.g. `/usr/local/bin`.
You can also create a symlink to the file:

```
ln -s /path/to/gccl.sh /usr/local/bin/gccl
```

Then, under a git repo, after you stage your changes, you can run `gccl` to generate commit messages.

For lazygit users, you can add the following to your [config file](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md):

```yml
- key: <c-c>
  description: Generate commit message using Claude Code
  command: gccl
  context: global
  loadingText: "Generating commit message..."
  output: popup
```

## How to use

# LLM based approach

Inspired by https://gist.github.com/karpathy/1dd0294ef9567971c1e4348a90d69285 and https://github.com/jesseduffield/lazygit/issues/3212#issuecomment-2161436126.

## Dependencies

- OpenAI API key
- [llm](https://github.com/simonw/llm): a command line tool to interface with LLMs
- [fzf](https://github.com/junegunn/fzf): a command line tool to fuzzy search through text, for interactive selection of commits

## How to use

After you clone the repo, you can move (or create a symlink to) the `gclm.sh` file to a directory in your PATH, e.g. `/usr/local/bin`.
You can also create a symlink to the file:

```
ln -s /path/to/gclm.sh /usr/local/bin/gclm
```

Then, under a git repo, after you stage your changes, you can run `gclm` to generate commit messages.

For lazygit users, you can add the following to your [config file](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md):

```yml
customCommands:
- key: <c-a>
  description: Pick AI commit
  command: gclm
  context: global
  output: terminal
```

This allows you to generate commit messages with `Ctrl-a` after you stage your changes.

## Mechanism

The `gclm.sh` script is a shell script that uses `llm` to generate commit messages.

It provides the git diff as context to the LLM, and instructions on how to format the output.
Finally, it uses `fzf` to let you select one of the generated commit messages and apply it.
You can modify the prompt to change the behavior of the LLM.
