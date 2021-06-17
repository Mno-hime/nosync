prefix = /usr/local
libdir = $(prefix)/lib
OBJS = fsync.o open.o
CFLAGS = -O2 -g

nosync.so: $(OBJS)
	$(CC) -shared -fPIC -ldl -lpthread $(CFLAGS) -o $@ $+

%.o: %.c
	$(CC) -c -fPIC $(CFLAGS) -o $@ $+

install: nosync.so
	install -p nosync.so $(libdir)

clean:
	@rm -f $(OBJS) nosync.so
