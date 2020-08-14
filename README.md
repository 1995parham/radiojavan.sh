# radiojavan.sh
**Music is Fun**

## Introduction
[Radiojavan](https://www.radiojavan.com/) is an Iranian music website (like Spotify), and sometimes you want
to download a music from it. In these times you can use this script. Please consider copyright of downloaded music.
This script tries the following CDN of Radiojava to find your given music, maybe they are changed in the future.

1. host1.rjmusicmedia.com
2. host2.rjmusicmedia.com
3. host3.rjmusicmedia.com

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
