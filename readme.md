# Homebrew TUIODO

This repository contains the Homebrew formula for [TUIODO](https://github.com/spmfte/tuiodo), a modern terminal task manager with extensive customization.

## Installation

```bash
# Add the tap
brew tap spmfte/tuiodo

# Install TUIODO
brew install tuiodo
```

## Development

To update the formula:

1. Update the version number in `tuiodo.rb`
2. Update the SHA256 sum if needed
3. Test the formula locally:
   ```bash
   brew install --build-from-source ./tuiodo.rb
   ```
4. Commit and push changes

## License

MIT License - see the [LICENSE](https://github.com/spmfte/tuiodo/blob/master/LICENSE) file for details.
