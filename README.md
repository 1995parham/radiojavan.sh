# radiojavan.sh

**Music is Fun**

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/1995parham/radiojavan.sh/lint.yaml?label=lint&logo=github&style=flat-square&branch=main)

## Introduction

[Radiojavan](https://www.radiojavan.com/) is an Iranian music website (like Spotify), and sometimes you want
to download a music from it. In these times you can use this script. Please consider copyright of downloaded music.
This script tries the following CDN of Radiojavan to find your given music, maybe they are changed in the future.

## In Action

```bash
./radiojavan.sh moein-z pedar-khandeh
```

## Bulk Download

Create file with followin structure and named it `urls`. each line must have only one music URL.

```
https://www.radiojavan.com/mp3s/mp3/Bahram-Intro-(Sokoot)
```

then run following bash command.

```bash
for url in $(cat urls); do
    ./radiojavan.sh -o ~/Downloads $url
done
```
