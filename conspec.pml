/* Subhajit Sidhanta for verifying a given session trace against a ConSpec formula
 * determines if a given session trace satisfies a given consistency model corresponding +
 * to the specified ConSpec formula.
 */
int c, nl, nw, nc;
mtype = { valid, invalid, blank, read, write, x, y };
typedef Op {
		mtype optype;
		mtype var;
		int val;
}

typedef Ser {
		Op op;
		mtype status;
}
Op st[4];
Ser ser[4];
chan STDIN;
proctype checker(int size){
	printf("size =%d\n", size);
	int i, j;
	byte counter;
	atomic {
		counter = 0;
		do
		:: counter <= size ->
		if
		:: (counter != 0) -> i = st[i-1].val; j = st[i].val;
		:: (counter == 0) -> i = st[i].val; j = st[i].val;
		fi	
		counter ++
		:: counter > size ->
			break
		assert(i == j);
		od
	}
}

init {	
	int size = 4;
	
	st[0].optype = write;
	st[0].var = x;
	st[0].val = 1;
	st[1].optype = write;
	st[1].var = x;
	st[1].val = 2;
	st[2].optype = read;
	st[2].var = x;
	st[2].val = 2;
	st[3].optype = read;
	st[3].var = x;
	st[3].val = 1;
	
	bool inword = false;

       do
       :: STDIN?c ->
                  if
                  :: c == 1 ->
                          break /* EOF */
                  :: c == '\n' ->
                          nc++;
                          nl++
                  :: else ->
                          nc++
                  fi;
                  if
                  :: c == ' '
			  skip
                  :: else ->
                          if
                          :: !inword ->
                                  nw++;
                          :: else /* do nothing */
                          fi
                  fi
         od;
	run checkser(size);
	
}