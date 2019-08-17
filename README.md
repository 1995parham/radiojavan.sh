# radiojavan.sh
**Music is Fun**

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/63c110382c8941c99539da3c103a7185)](https://www.codacy.com/app/1995parham/radiojavan.sh?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=1995parham/radiojavan.sh&amp;utm_campaign=Badge_Grade)

## Introduction
[Radiojavan](https://www.radiojavan.com/) is an Iranian music website (like Spotify), and sometimes you want
to download a music from it. In these times you can use this script. Please consider copyright of downloaded music.
This script tries the following CDN of Radiojava to find your given music, maybe they are changed in the future.

host1.rjmusicmedia.com
host2.rjmusicmedia.com
host3.rjmusicmedia.com

## Bulk Download
Create file with followin structure and named it `urls`. each line must have only one music url.

```
https://www.radiojavan.com/mp3s/mp3/Bahram-Intro-(Sokoot)
```

then run following bash command.

```bash
for url in $(cat urls); do
    ./radiojavan.sh -o ~/Downloads $url
done
```
