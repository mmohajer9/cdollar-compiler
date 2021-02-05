#ifndef SYMBOL_H
#define SYMBOL_H

#include <iostream>
using namespace std;

extern const int MAX;

class Node
{
public:

	string identifier, scope, type, reg, address;
	int lineNo;
	Node *next;
	int value;

	Node()
	{
		next = NULL;
	}

	Node(string identifier, string scope, string type, int lineNo, string reg, string address, int value)
	{
		this->identifier = identifier;
		this->scope = scope;
		this->type = type;
		this->lineNo = lineNo;
		this->reg = reg;
		this->address = address;
		this->value = value;
		next = NULL;
	}

	void print()
	{
		cout << "Identifier's Name:" << identifier
			 << "\nType:" << type
			 << "\nScope: " << scope
			 << "\nLine Number: " << lineNo
			 << "\nRegister: " << reg
			 << "\nAddress: " << address
			 << "\nValue: " << value 
			 << "\n-----------------" << endl;
	}
	friend class SymbolTable;
};

class SymbolTable
{
	Node *head[1000];

public:
	SymbolTable()
	{
		for (int i = 0; i < MAX; i++)
			head[i] = NULL;
	}

	int hashf(string id); // hash function
	bool insert(string id, string scope,
				string Type, int lineno, string reg, string address , int value);

	Node *find(string id, string scope);

	bool deleteRecord(string id);

	bool modify(string id, string scope,
				string Type, int lineno, string reg, string address , int value);
};

#endif