for each in /etc/{conf,init}.d/* ; do \
  qfile "$each" >/dev/null || \
    echo $each: '!!! ORPHAN !!!' ; \
done
