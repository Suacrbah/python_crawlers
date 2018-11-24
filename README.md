# Python Crawlers

Some Python crawlers I wrote for practice

## Douyin comments Crawler

this simple crawler collects the comments below a specific video on Douyin andanalyse whether they contain the desired words, the words are entered in the terminal by the user.

### Demonstration on how to use.

First, if you don't have `json` and `urllib` module, open the command prompt and type in the following commands:

```
pip install urllib
pip install json
```

Once you finished installing, direct cmd to the crawler files to execute the crawler:

```
python douyin.py [words] [words] ...
```

The program should ask you recursively for the id of the video:

```
Please input the id of the video (q to quit): [video id]
```

If input is finished, press `q` and enter to quit. The final output may be

```
Analyzed total of [number] comments
The words disered appeared in [number] comments
Percentage of appearance: [number]%
```

The program may generate a file named 'comments.txt' to store the comments analysed.
