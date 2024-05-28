<div align="center">

# asdf-hadoop [![Build](https://github.com/mmomper/asdf-hadoop/actions/workflows/build.yml/badge.svg)](https://github.com/mmomper/asdf-hadoop/actions/workflows/build.yml) [![Lint](https://github.com/mmomper/asdf-hadoop/actions/workflows/lint.yml/badge.svg)](https://github.com/mmomper/asdf-hadoop/actions/workflows/lint.yml)

[hadoop](https://hadoop.apache.org/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add hadoop
# or
asdf plugin add hadoop https://github.com/mmomper/asdf-hadoop.git
```

hadoop:

```shell
# Show all installable versions
asdf list-all hadoop

# Install specific version
asdf install hadoop latest

# Set a version globally (on your ~/.tool-versions file)
asdf global hadoop latest

# Now hadoop commands are available
hadoop --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/mmomper/asdf-hadoop/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Moritz Momper](https://github.com/mmomper/)
