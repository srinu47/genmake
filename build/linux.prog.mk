OBJS=$(SRCS:.c=.o)

CFLAGS+=${EXTRA_CFLAGS} ${LDADD}
${PROG}:${OBJS}
	$(CC)  ${CFLAGS} ${OBJS} -o ${PROG} ${LIBS} ${LDFLAGS}
%.o:%.c
	$(CC) ${CFLAGS} -c $< 

.PHONY:clean
clean:
	${RM} ${OBJS} ${PROG}	
	
	
	
