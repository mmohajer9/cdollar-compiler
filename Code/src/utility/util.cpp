#include "util.hpp"


void yyerror(const char *s) {
	fprintf(stderr,"Syntex Error in line number : %d : %s\n", yylineno, s);
}


int find_free_register(int* array , int size)
{
	for(int i = 0;i < size;i++)
	{
		if(array[i] == 0)
		{
			array[i] = 1;
			return i;
		}
	}
	return -1;
}

void showstack(stack <int> s) 
{ 
    while (!s.empty()) 
    { 
        cout << '\t' << s.top(); 
        s.pop(); 
    } 
    cout << '\n'; 
} 


int calculate(int token , int leftVal , int rightVal)
{
    switch (token)
    {
		case OP_PLUS:
			return (leftVal + rightVal);
			break;
		case OP_MINUS:
			return (leftVal - rightVal);
			break;
		case OP_MULTIPLY:
			return (leftVal * rightVal);
			break;
		case OP_DIVIDE:
			if(rightVal == 0)
			{
				yyerror("Division by Zero");
				exit(1);
			}
			return (leftVal / rightVal);
			break;
		case OP_LESS:
			return (leftVal < rightVal);
			break;
		case OP_LESS_EQUAL:
			return (leftVal <= rightVal);
			break;
		case OP_EQUAL:
			return (leftVal == rightVal);
			break;
		case OP_NOT_EQUAL:
			return (leftVal != rightVal);
			break;
		case OP_GREATER:
			return (leftVal > rightVal);
			break;
		case OP_GREATER_EQUAL:
			return (leftVal >= rightVal);
			break;
		case OP_LOGICAL_OR:
			return (leftVal || rightVal);
			break;
		case OP_LOGICAL_AND:
			return (leftVal && rightVal);
			break;
		case OP_BITWISE_OR:
			return (leftVal | rightVal);
			break;
		case OP_BITWISE_AND:
			return (leftVal & rightVal);
			break;
		case OP_BITWISE_XOR:
			return (leftVal ^ rightVal);
			break;
		case OP_LOGICAL_NOT:
			return (!leftVal);
			break;
		
    }
	return 0;
}