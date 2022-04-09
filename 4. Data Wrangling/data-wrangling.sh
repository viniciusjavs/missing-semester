#2.a
egrep --invert-match "'s$" /tmp/words | awk -F'a|A' '{ if (NF-1 >= 3) print $0 }' | wc -l

#2.b
egrep --invert-match "'s$" /tmp/words | awk -F'a|A' '{ if (NF-1 >= 3) print $0 }' | egrep -o ..$ | sort | uniq -c | sort -rnk1,1 | head -n 3

#2.c
egrep --invert-match "'s$" /tmp/words | awk -F'a|A' '{ if (NF-1 >= 3) print $0 }' | egrep -o ..$ | sort | uniq -c | sort -rnk1,1 | wc -l

#2.d challenge
diff <(egrep --invert-match "'s$" /tmp/words | awk -F'a|A' '{ if (NF-1 >= 3) print $0 }' | egrep -o ..$ | sort | uniq -c | sort -rnk1,1 | awk '{print $2}' | sort) <(python -c 'import itertools
import string
for x in ["".join(x) for x in itertools.product(string.ascii_lowercase,  repeat=2)]:
    print(x)
') | egrep '^>' | cut -d' ' -f 2

#3
sed -E "s/'s$/*/"  --in-place=.bak /tmp/words

#4
journalctl -o short-unix --since='7 days ago' | tr '\n' ' ' | grep -o -P '(?<=kernel: Linux version).*?(?=Startup finished)' | sed -nE 's/.* ([0-9]{10})\.[0-9]{6} qonos kernel: Command line: .* ([0-9]{10})\.[0-9]{6} .*$/\2-\1/p' | head -n 10 | bc | R --slave -e 'x <- scan(file="stdin", quiet=TRUE); summary(x)'

#5
{ journalctl -o short-unix -b -1; journalctl -o short-unix -b -2; journalctl -o short-unix -b -3; } | cut -d ' ' -f 2- | sort | uniq -c | awk '{ if ($1 < 3) print($0)}' | cut -b 9-

#6
curl --output-dir /tmp --remote-name https://raw.githubusercontent.com/fivethirtyeight/data/master/airline-safety/airline-safety.csv
less /tmp/airline-safety.csv | tr '\r\n' '\n' | sed '1d' | cut -d ',' -f 3,6 > /tmp/airline-safety

less /tmp/airline-safety | cut -d ',' -f 1 | R --slave -e 'x <- scan(file="stdin", quiet=TRUE); min(x); max(x)' | cut -d ' ' -f 2 | paste -sd ','

less /tmp/airline-safety | tr ',' ' ' | R --slave -e 'x <- scan(file="stdin", quiet=TRUE); mid = length(x) / 2; sum(x[1:mid-1]) - sum(x[mid:length(x)])' | cut -d ' ' -f 2
