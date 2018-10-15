ifeq (${CC},g++)
	OBJS=$(SRCS:.cpp=.o)
else
	OBJS=$(SRCS:.c=.o)
endif
CFLAGS+=${EXTRA_CFLAGS} ${LDADD}
all:${PROG}
${PROG}:${OBJS}
	$(CC)  ${CFLAGS} ${OBJS} -o ${PROG} ${LIBS} ${LDFLAGS}
ifeq (${CC},g++)
%.o:%.cpp ${DEPS}
	$(CC) ${CFLAGS} -c $<
else
%.o:%.c ${DEPS}
	$(CC) ${CFLAGS} -c $< 
endif
.PHONY:clean
clean:
	${RM} ${OBJS} ${PROG}	
	
	
	
