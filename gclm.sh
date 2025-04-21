llm "Please suggest 3 git commit messages, given the following diff:

\`\`\`diff
$(git diff --cached)
\`\`\`

**Instructions:**

1. Generate commit messages that accurately describe these changes, ensuring they are helpful to someone reading the project's history.
2. If multiple changes are present, make sure you capture them all in each commit message.
3. Format: Each commit message must follow the conventional commits format, which is \`<emoji><type>(<scope>): <description>\`.
4. Relevance: Avoid mentioning a module name unless it's directly relevant to the change.

**Commit Message Examples for Reference:**

🐛 fix(app): add password regex pattern
🧪 test(unit): add new test cases
💄 style: remove unused imports

Write your 3 commit messages below in the required format. Each commit message should be on a new line. Return only the commit messages, no other text or formatting." \
    | fzf --height 100% --border --ansi --preview "echo {}" --preview-window=up:wrap \
    | xargs -I {} git commit -m "{}"
