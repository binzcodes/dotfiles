# Binaries

This directory contains general-purpose binaries for use within the lab and other projects.

## Deleting GitHub Deployments

Deactivate and delete GitHub deployments for a given repository and environment. 
It uses the GitHub CLI and `jq` to interact with the GitHub API.

### Usage

You can run the script with the repository and environment as arguments:

```bash
./gh-rm-deployment.sh org/repo environment
```

If you don't provide any arguments, the script will prompt you to enter them.

### Dependencies

- [GitHub CLI](https://cli.github.com/)
- [`jq`](https://stedolan.github.io/jq/)

