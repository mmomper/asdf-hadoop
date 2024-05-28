# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

# TODO: adapt this
asdf plugin test hadoop https://github.com/mmomper/asdf-hadoop.git "hadoop --help"
```

Tests are automatically run in GitHub Actions on push and PR.
