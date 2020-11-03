from database import *

query = "select bookid,genre,photo from books"
result = Fetchall(query)
print(result)
bookstitle = []
bookdata = []
for row in result:
    if not bookstitle:
        bookstitle.append(row[1])
        dist = {}
        dist['bookid'] = row[0]
        dist['photo'] = row[2]
        dist['genre'] = row[1]
        bookdata.append(dist)
    elif row[1] in bookstitle:
        pass
    else:
        bookstitle.append(row[1])
        dist = {}
        dist['bookid'] = row[0]
        dist['photo'] = row[2]
        dist['genre'] = row[1]
        bookdata.append(dist)

print(bookstitle)
print(bookdata)
