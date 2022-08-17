# Export

A shell script for exporting a database dump from an [Ecosyste.ms](https://ecosyste.ms) service running on dokku and publishing to s3.

## Usage

```shell
./export.sh service_name bucket_name
```

## Example

```shell
./export.sh packages ecosystems-data
```

### cron

Example to run on a monthly basis:

```
PATH=/bin:/usr/bin:/usr/local/bin
0 0 1 * * deploy /home/deploy/export.sh
```

## Dependencies

- https://github.com/dokku/dokku
- https://github.com/dokku/dokku-postgres
- https://github.com/aws/aws-cli 

## Contribute

Please do! The source code is hosted at [GitHub](https://github.com/ecosyste-ms/export). If you want something, [open an issue](https://github.com/ecosyste-ms/export/issues/new) or a pull request.

If you need want to contribute but don't know where to start, take a look at the issues tagged as ["Help Wanted"](https://github.com/ecosyste-ms/export/issues?q=is%3Aopen+is%3Aissue+label%3A%22help+wanted%22).

You can also help triage issues. This can include reproducing bug reports, or asking for vital information such as version numbers or reproduction instructions. 

Finally, this is an open source project. If you would like to become a maintainer, we will consider adding you if you contribute frequently to the project. Feel free to ask.

For other updates, follow the project on Twitter: [@ecosyste_ms](https://twitter.com/ecosyste_ms).

### Note on Patches/Pull Requests

 * Fork the project.
 * Make your feature addition or bug fix.
 * Add tests for it. This is important so we don't break it in a future version unintentionally.
 * Send a pull request. Bonus points for topic branches.

### Vulnerability disclosure

We support and encourage security research on Ecosyste.ms under the terms of our [vulnerability disclosure policy](https://github.com/ecosyste-ms/export/security/policy).

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](https://github.com/ecosyste-ms/.github/blob/main/CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

## Copyright

Code is licensed under [GNU Affero License](LICENSE) © 2022 [Andrew Nesbitt](https://github.com/andrew).

Data from the API is licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).