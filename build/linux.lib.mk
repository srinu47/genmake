ifeq (${CC},g++)
	OBJS=$(SRCS:.cpp=.o)
else
	OBJS=$(SRCS:.c=.o)
endif

PROG=lib${LIB}.so
CFLAGS+=${EXTRA_CFLAGS} ${LDADD}
all:${PROG}
${PROG}:${OBJS} 
	$(CC)  -shared ${LDFLAGS} ${CFLAGS} $^  -o $@ ${LIBS} 
ifeq (${CC},g++)
%.o:%.cpp
	$(CC) -fPIC ${CFLAGS}  -c $^
else
%.o:%.c
	$(CC) -fPIC ${CFLAGS}  -c $^
endif

.PHONY:clean
clean:
	${RM} ${OBJS} ${PROG}
