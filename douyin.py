import time
import json
import urllib.request

total = count = 0

# clear the file to store the comments
open('comments.txt', 'w').close()

while True:
    awe_id = input("Please input the id of the video (q to quit): ")

    start = time.time()

    if awe_id == 'q':
        break

    sub_total = 0
    cursor = 0

    # load all the comments
    while True:
        url = ('https://aweme.snssdk.com/aweme/v2/comment/list/?cursor='
            + str(cursor) + '&aweme_id=' + awe_id + '&count=50')
        ##print(url)
        cursor += 50

        # open the url
        http_res = urllib.request.urlopen(url, timeout=1)

        # load the data in format json
        data = json.load(http_res)

        # write to the file
        ##with open('comments.txt', 'a+') as fobj:
        for d in data['comments']:
            sub_total += 1
            total += 1

            # the comments contain the following words
            if ('美' in d['text'] or '漂亮' in d['text'] or '好看' in d['text'] or '可爱' in d['text']):
                    ##print(sub_total)
                count += 1

                # write to file in desired format: index text like_number
                ##fobj.write(str(sub_total) + ' ' + d['text'])
                ##fobj.write(' ' + str(d['digg_count']) + '\n')

            # if there is no comment anymore
        if (data['has_more'] == 0 or total >= 200):
            ##fobj.write('\n')
            break

    print('--- %s seconds ---' % (time.time() - start))

try:
    print('Analyzed total of ' + str(total) + ' comments')
    print('The words disered appeared in ' + str(count) + ' comments')
    percentage = str(round((count/total)*100, 4)) + '%'
    print('Percentage of appearance: ' + percentage)
except Exception:
    pass
