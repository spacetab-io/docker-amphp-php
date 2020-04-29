<p align="center">
    <img src="https://raw.githubusercontent.com/docker-library/docs/c350af05d3fac7b5c3f6327ac82fe4d990d8729c/docker/logo.png" alt="Docker">
</p>

<p align="center">
Docker image configured for [amphp](https://amphp.org/) in production use.
</p> 

## Docker images

* `spacetabio/amphp-alpine:7.4-base-1.0.0` – Simple image with PHP and pre-installed extensions. <br>
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/spacetabio/amphp-alpine/7.4-base-1.0.0?style=flat-square)
![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/spacetabio/amphp-alpine/7.4-base-1.0.0?style=flat-square)
* `spacetabio/amphp-alpine:7.4-wkhtmltopdf-1.0.0` – Image where installed `wkhtmltopdf` and `wkhtmltoimage` to create PDF's and Images from HTML or URI. Non-blocking PHP wrapper available at the [link](https://github.com/spacetab-io/wkhtmltopdf-php).   
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/spacetabio/amphp-alpine/7.4-wkhtmltopdf-1.0.0?style=flat-square)
![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/spacetabio/amphp-alpine/7.4-wkhtmltopdf-1.0.0?style=flat-square)

## Basic usage

```Dockerfile
FROM spacetabio/amphp-alpine:7.4-base-1.0.0

COPY * /app

# cli commands should be created in the responsible service. 
CMD ["bin/service", "run"]
```

## Extensions

As default php-extensions are pre-installed:

 * `opcache`
 * `pnctl`
 * `php-uv`
 * `yaml`
 * `intl`


## Version format

`{phpVersion}-{imageType}-{semverImageVersion}`
 
## Changelog

* [Base docker image](base/CHANGELOG.md)
* [Wkhtmltopdf docker image](wkhtmltopdf/CHANGELOG.md)

## License

The MIT License

Copyright © 2020 spacetab.io, Inc. https://spacetab.io

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

