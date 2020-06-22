# rsync action

Copy files to another host over a remote shell.

## Inputs

### `deploy-key`

**Required** The SSH deployment key used to authenticate at the destination host.

### `from`

**Required** Workspace relative path from which you want to copy files from.

### `to`

**Required** Destination path including in the usual rsync format USER@HOST:DEST.

### `delete`

_Optional_ Delete extraneous files from destination.

### `exclude`

_Optional_ Exclude files matching the pattern.

## Example usage

```yaml
uses: domonda/actions-rsync@v1
with:
  deploy-key: ${{ secrets.DEPLOY_KEY }}
  from: dist
  to: john@example.com:/srv/example.com
```

# License

The scripts and documentation in this project are released under the [ISC license](LICENSE).
