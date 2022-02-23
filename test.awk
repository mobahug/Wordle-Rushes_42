#!/usr/bin/env awk -f

awk -f - words5.txt << '__END__'
    BEGIN {
        tags["ab"] = ""
        tags["elb"] = ""
        tags["eipalloc"] = ""
    }
    { for (i=1; i <= NF; i++) {
          n = split($i, a, /-/)
          if (a[1] in tags)
              tags[a[1]] = tags[a[1]] $i " "
      }
    }
    END {
        for (item in tags)
            print tags[item]
    }

__END__