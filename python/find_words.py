def word_find(line,words):
    return list(set(line.strip().split()) & set(words))

def main(file,words):
    with open('file') as f:
        for i,x in enumerate(f, start=1):
            common = word_find(x,words)
            if common:
                print i, "".join(common)

if __name__ == '__main__':
    main('file', words)
