import sys
import json
import urllib.request

total = count = 0

# clear the file to store the comments
open('comments.txt', 'w').close()

del sys.argv[0]

while True:
    awe_id = input("Please input the id of the video (q to quit): ")
    if awe_id == 'q':
        break

    sub_total = 0
    cursor = 0

    # load all the comments
    while True:
        url = ('https://aweme.snssdk.com/aweme/v2/comment/list/?cursor='
            + str(cursor) + '&aweme_id=' + awe_id + '&count=50')
        print(url)
        cursor += 50

        # open the url
        http_res = urllib.request.urlopen(url, timeout=1)

        # load the data in format json
        data = json.load(http_res)

        #write to the file
        with open('comments.txt', 'a+') as fobj:
            for d in data['comments']:
                sub_total += 1
                total += 1
                flag = 0

                # check if the comments contain the desired words
                for arg in sys.argv:
                    if arg in d['text']:
                        flag = 1

                # the comments contain the desired words
                if flag:
                    print(sub_total)
                    count += 1

                # write to file in desired format: index text like_number
                fobj.write(str(sub_total) + ' ' + d['text'])
                fobj.write(' ' + str(d['digg_count']) + '\n')

            # if there is no comment anymore
            if (data['has_more'] == 0):
                fobj.write('\n')
                break

try:
    print('Analyzed total of ' + str(total) + ' comments')
    print('The words desired appeared in ' + str(count) + ' comments')
    percentage = str(round((count/total)*100, 4)) + '%'
    print('Percentage of appearance: ' + percentage)
except Exception:
    pass
